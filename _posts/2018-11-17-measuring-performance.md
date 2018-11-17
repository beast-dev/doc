---
title: "Measuring BEAST performance"
author: Andrew Rambaut
categories: release
permalink: measuring-beast-performance.html
tags: [news]
---

When running BEAST it reports the time taken to calculate a certain number of states (e.g., minutes/million states). It is obviously tempting to compare this time between runs as a measure of performance.
However, unless you are testing the performance of the *same XML file* on different hardware or for different parallelization options, this will never be a reliable measure and may lead you astray.

The MCMC algorithm in BEAST picks operators (transition kernels or 'moves') from the list of potential operators proportional
to their given `weight`. 
Some operators change a single parameter value, some change multiple parameters and others will alter the tree. 
BEAST tries to only recalculate the likelihood of the new state for the bits of the state that have changed. 
Thus some operators will only produce a modest amount of recomputation (e.g., changing a bit of the tree may only require the likelihood at a few nodes to be recalculated) whereas others will require a lot of computation (e.g., changing the evolutionary rate will require the recalculation of absolutely everything). 
Thus if the computationally heavy operators are given more `weight` then the average time per operation over the course of the chain will go up. 
But this is not necessarily a bad thing.
         
{% include note.html content="This posting is primarily about improving the statistical performance of BEAST irrespective of the hardware being used. For a discussion of improving the computational performance on various types of hardware, [see this page](performance)."  %}         
                             
### Efficient sampling and ESSs
                                                                        
The ultimate aim of an MCMC analysis is to get the maximum amount effectively independent samples from the posterior as possible (as measured by effective sample size, ESS). 
Ideally, we would aim to get the same ESS for all parameters in the model but we are often less interested in some parameters than others and we could allow a lower ESS for those. 
A high ESS is more important the more we are interested in the tails of the distribution of a parameter. 
So some parameters, in particular those that are part of the substitution model such as the transition-transversion ratio `kappa` are down weighted. 
Changing these is computationally expensive, requiring a complete recalculation of the likelihood for the partition, but we are rarely interested in the value. 
We simply want to marginalize our other parameters over their distributions. 
So we can accept a lower ESS for `kappa` as the cost of focusing on other parameters. 

{% include note.html content="In most cases, substitution model parameters easily achieve high ESS values, which is why they are typically updated less often than for example clock and coalescent model parameters."  %}

To demonstrate this we can look at an example BEAST run. 
This is a data set of 62 carnivore mitochondrial genome coding sequences giving a total of about 5000 site patterns. 
The model was an `HKY+gamma`, `strict molecular clock`, `constant size coalescent` ([the XML file is available here](/files/carnivores.HKYG.SC.CPC.classic.xml.zip)).
The data was run on [BEAST v1.10.4](installing) on an Dell server for 10M steps for a total run time of **4.08 hours**.

> Data: Carnivores mtDNA 62 taxa, 10869bp, 5565 unique site patterns
> Model: HKY+G, Strict clock, Constant size coalescent
> Machine: Dell Precision 3.10GHz Intel Xeon CPU E5-2687

You can see the effect of different operators by looking at the operator table reported at the end of the run:

> **Table 1**
> ```
> Operator                                          Tuning  Count      Time     Time/Op  Pr(accept) 
> scale(kappa)                                      0.913   92847      548576   5.91     0.2322      
> frequencies                                       0.01    92528      547586   5.92     0.2355      
> scale(alpha)                                      0.939   92835      548560   5.91     0.2317      
> scale(nodeHeights(treeModel))                     0.927   277983     1651622  5.94     0.2329      
> subtreeSlide(treeModel)                           0.013   2778288    2415749  0.87     0.2315      
> Narrow Exchange(treeModel)                                2778497    1936405  0.7      0.0091      
> Wide Exchange(treeModel)                                  277044     206821   0.75     0.0002      
> wilsonBalding(treeModel)                                  277574     355560   1.28     0.0002      
> scale(treeModel.rootHeight)                       0.262   277733     72405    0.26     0.2391      
> uniform(nodeHeights(treeModel))                           2777648    2650767  0.95     0.1207      
> scale(constant.popSize)                           0.474   277023     2697     0.01     0.2375      
> ```

The operators on the substitution model (`kappa`, `frequencies` and `alpha`) are amongst the most computationally expensive taking on average 5.9 milliseconds per operation. 
Although they are not selected very often relative to the others (only about 3% of the time) their total contribution to the runtime is over 15% of the total.
On the other hand the 7 operators that alter the tree generally have low cost (about 0.4 milliseconds per operation) and making up 85% of the total runtime because they are picked 95% of the time. 
The population size parameter is very cheap so comprises a tiny fraction of runtime even though it is called quite a lot. 

By default the operators on each of the sustitution model parameters have a `weight` of 1, the sum of all tree operators has a `weight` of 102 and the population size operator has a `weight` of 3  (see the `operators` panel in BEAUti for the weights for each operator).

### Mixing

A further complication is that different choices of operators, priors etc., can effect the efficiency of `mixing` of the MCMC (how fast it converges and explores the parameter space). 
This is reflected in a higher ESS perhaps even at the cost of more computation per step - what matters is that the gain in ESS is proportionally higher than the computational cost. 

If we load the resulting log file into `Tracer` we can calculate the ESS for these parameters (with a 10% burnin removed):

> **Table 2**
> 
> | Parameter           | mean value |      ESS |
> |---|--:|--:|
> | kappa               |      27.18 |     1503 |
> | frequencies1        |      0.390 |     1954 |
> | frequencies2        |      0.305 |     2590 |
> | frequencies3        |      0.082 |     2927 |
> | frequencies4        |      0.223 |     2286 |
> | alpha               |      0.235 |     4355 |
> | constant.popSize    |      1.997 |     8617 |
> | treeModel.rootHeight|      0.506 |     1790 |
> | treeLength          |      8.146 |     1620 |
> | treeLikelihood      |    -1.93E5 |     3944 |


You can see that all of the ESSs are quite high. The two parameters that relate to the tree, `treeModel.rootHeight` and `treeLength` (the sum of all the branch lengths - not technically a parameter but a metric) show ESSs of >1000.
These values are not necessarily indicative of how well the tree is mixing overall so we cal also look at the 'ESS' for the `likelihood` (the likelihood of the data given the tree). 
This is a probability density not a parameter but looking at how (un)correlated the values are will be another indication of how well the tree has been mixing.

The ESSs for the substitution model parameters are high suggesting that we could afford to down-weight their operators to reduce their contribution to the total runtime. 

### Optimising efficiency

To measure the overall efficiency of BEAST -- i.e., the number of independent samples being generated per unit time (or per kWh of electricity) -- it is probably best to consider ESS/hour for the parameters of interest. 

> **Table 3**
> 
> | Parameter                |  ESS   | ESS/hour |
> |---|--:|--:|
> | kappa                    | 1503   |      368 |
> | constant.popSize         | 8617   |     2109 |
> | treeModel.rootHeight     | 1790   |      438 |
> | treeLength               | 1620   |      396 |
> | treeLikelihood           | 3944   |      965 |

Focusing on `kappa` as a representitive of the substitution model, `rootHeight`, `treeLength` and `treeLikelihood` to represent the tree and `constant.popSize` the coalescent model, wr can calculate the ESS/hour for the above run.
 
If we reduce the `weight` of the `kappa`, `alpha` and `frequencies` operators by a factor of 10 (this can be done in BEAUti's operator table or by editing the XML), the total runtime goes down to **3.73 hours** – about a 10% saving. 

*Which is nice.*

The ESSs for `kappa` (and the other down-weighted operators) predictably goes down but is still reasonable:  

> **Table 4**
> 
> | Parameter            | mean value |     ESS |
> |---|--:|--:|
> | kappa                |      27.14 |     515 |
> | constant.popSize     |      1.994 |    9001 |
> | treeModel.rootHeight |      0.506 |    1090 |
> | treeLength           |      8.140 |     922 |
> | treeLikelihood       |    -1.93E5 |    2793 |

Note that the ESSs for `treeModel.rootHeight`, `treeLength` and `treeLikelihood` have also gone down (but not by as greater degree as `kappa`) and `constant.popSize` has actually gone up in ESS (to the maximum where every sample is independent). 
Another thing to see is that the mean values are pretty much identical as before (looking at each parameter individually in [Tracer](tracer), the distributions for the runs are indistinguishable). 

> **Table 5**
> 
> | Parameter                |  ESS    |   ESS/hour |
> |---|--:|--:|
> | kappa	            	 |    515  |        138 |
> | constant.popSize    	 |   9001  |       2414 |
> | treeModel.rootHeight	 |   1090  |        292 |
> | treeLength          	 |    922  |        247 |
> | treeLikelihood      	 |   2793  |        749 |

So by down-weighting the substitution model operators we have reduced the ESS/hour across the board (with the exception of the coalescent prior).
It is still possible that the tree topology is mixing better but we aren't measuring that directly.

We could look at reducing the `weight` of the `constant.popSize` operator by a factor of 3 (returning the substitution model operators back to their original weights). 
The total run time goes up to **4.16 hours** because we are doing fewer cheap moves and more expensive ones -- but the ESS/hour for all the other parameters goes up:

> **Table 6**
>
> | Parameter                 | ESS     |  ESS/hour |
> |---|--:|--:|
> | kappa	            	  |  1708   |       410 |
> | constant.popSize    	  |  6992   |      1679 |
> | treeModel.rootHeight	  |  1751   |       421 |
> | treeLength          	  |  1812   |       435 |
> | treeLikelihood      	  |  4219   |      1013 |

### Operator acceptance rates

One other thing to note here is the `Pr(accept)` column in the operator analysis, **Table 1**, above. 
This records how often a proposed operation is actually accepted according to the Metropolis-Hastings algorithm. 
A rule of thumb is that a move should be accepted about 23% of the time to be optimally efficient (this is an analytical result for certain continuous moves but we assume it also approximately applies for tree moves). 
Operators are generally 'tuned' to achieve this ratio by adjusting the `size` of the move (how big a change is made to the parameter – big moves will be accepted less often than small ones). 
Some moves (`Narrow Exchange`, `Wide Exchange` and `WilsonBalding`) are not tunable and you can see they have a very small acceptance probability. 
This means they are acting inefficiently at exploring the tree-space but consume considerable computational time. 
On the other hand they may be important for convergence initially where large moves are favoured. 

We can try reweighting these operators down by a factor of 10 and see the effect. 

Firstly the total runtime is **4.33 hours** – more than 6% slower than our original run. 
However, if we look at the `ESS` and `ESS/hour` values:

> **Table 7**
> 
> | Parameter                 | ESS     |   ESS/hour |
> |---|--:|--:|
> | kappa	            	  |  2455   |        567 |
> | constant.popSize    	  |  7138   |       1650 |
> | treeModel.rootHeight	  |  2586   |        598 |
> | treeLength          	  |  2719   |        628 |
> | treeLikelihood      	  |  4873   |       1126 |

We are generally doing much better than before with the `ESS/hour` up over the previous runs (the only looser is `constant.popSize` but it is still higher than all the others).

### Concluding remarks

* Don't use time/sample as a comparative measure of performance for different data or sampling regimes.

* A better measure of BEAST performance than the average time per million steps would be the average time per effectively independent sample (i.e., ESS/hour). In the example above, the `treeLength` measure goes from 396 independent values per hour to 628, nearly doubling.

* Choosing operator weights to achieve better performance (as ESS/hour) is a difficult balancing act and may need multiple runs and examination of operator analyses and ESSs. It may usually be better to be conservative about these and worry about getting statistically correct results more than saving a few hours of runtime.

* Because of the stochastic nature of the algorithm BEAST will be quite variable from run to run both in the total total runtime (because of variability in the operators picked and their computational cost) and the ESS of parameters. For example three independent runs on the same hardware for the first treatment took **4.29**, **4.38**, and **4.08 hours**, respectively.

* The optimal weights for operators will also vary considerably by data set meaning it is difficult to come up with reliable rules.  

* We are currently working on improving the operators and weights to achieve a reliable increase in statistical performance. More on this soon ... 

{% include note.html content="The operator weights that BEAUti generates by default are intended to be robust (we want to try to ensure convergence) and may not be optimal in all circumstances. Adjustment of these might achieve significant improvements in ESS/hour but caution should be exercised and the results examined closely to ensure that that convergence has been achieved. As always we strongly recommend that at least 2 replicate runs are performed and the results compared."  %}


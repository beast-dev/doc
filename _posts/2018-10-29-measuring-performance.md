---
title:  "Measuring BEAST performance"
categories: release
permalink: measuring-beast-performance.html
tags: [news]
---

When running BEAST it reports the time taken to calculate a certain number of states 
(e.g., minutes/million states). It is obviously tempting to compare this time between
runs as a measure of performance.

Unless you are testing the performance of the *same XML file* on different hardware or for
different parallelization options, this will never be a reliable measure.

The MCMC algorithm in BEAST picks operators (transition kernels or 'moves') from the list of potential operators proportional
to their `weight`. Some operators change a single parameter value, some change multiple parameters
and others will alter the tree. BEAST tries to only recalculate the likelihood of the new state
for the bits of the state that have changed. Thus some operators will only produce a modest amount 
of recomputation (e.g., changing a bit of the tree may only require the likelihood at a few nodes
to be recalculated) whereas others will require a lot of computation (e.g., changing the evolutionary
rate will require the recalculation of absolutely everything). Thus if the computationally heavy
operators are given more `weight` then the average time per operation over the course of the chain
will go up. But this is not necessarily a bad thing.
         
{% include note.html content="This posting is primarily about improving the statistical performance of BEAST irrespective of the hardware being used. For a discussion of improving the computational performance on various types of hardware, [see this page](performance)."  %}
         
                             
### Efficient sampling and ESSs
                                                                        
The ultimate aim of an MCMC analysis is to get the maximum amount effectively independent samples from the 
posterior as possible (as measured by effective sample size, ESS). Ideally, we would aim to get 
the same ESS for all parameters in the model but we are often less interested in some parameters
than others and we could allow a lower ESS for those. A high ESS is more important the more we are
interested in the tails of the distribution of a parameter. So some parameters, in particular those
that are part of the substitution model such as the transition-transversion ratio `kappa` are down 
weighted. Changing these is computationally expensive, requiring a complete recalculation of the 
likelihood for the partition, but we are rarely interested in the value. We simply want to marginalize 
our other parameters over their distributions. So we can accept a lower ESS for `kappa` as the cost of 
focusing on other parameters. 

{% include note.html content="In most cases, substitution model parameters easily achieve high ESS values, which is why they are typically updated less often than for example clock and coalescent model parameters."  %}

To demonstrate this we can look at an example BEAST run. This is a data set of 62 carnivore mitochondrial
genome coding sequences giving a total of about 5000 site patterns. The model was an `HKY+gamma`, 
`strict molecular clock`, `constant size coalescent` 
([the XML file is available here](/files/carnivores.HKYG.SC.CPC.classic.xml.zip)).
The data was run on [BEAST v1.10.3](installing) on an iMac Pro for 10M steps for a total run time of
**3.12 hours** (**187.2 minutes**).

You can see the effect of different operators by looking at the operator table reported at the end of the run:

```
Operator                                          Tuning  Count      Time     Time/Op  Pr(accept) 
scale(kappa)                                      0.913   92847      548576   5.91     0.2322      
frequencies                                       0.01    92528      547586   5.92     0.2355      
scale(alpha)                                      0.939   92835      548560   5.91     0.2317      
scale(nodeHeights(treeModel))                     0.927   277983     1651622  5.94     0.2329      
subtreeSlide(treeModel)                           0.013   2778288    2415749  0.87     0.2315      
Narrow Exchange(treeModel)                                2778497    1936405  0.7      0.0091      
Wide Exchange(treeModel)                                  277044     206821   0.75     0.0002      
wilsonBalding(treeModel)                                  277574     355560   1.28     0.0002      
scale(treeModel.rootHeight)                       0.262   277733     72405    0.26     0.2391      
uniform(nodeHeights(treeModel))                           2777648    2650767  0.95     0.1207      
scale(constant.popSize)                           0.474   277023     2697     0.01     0.2375      
```

The operators on the substitution model (`kappa`, `frequencies` and `alpha`) are amongst the most computationally expensive taking on average 5.9 milliseconds per operation. 
Although they are not selected very often relative to the others (only about 3% of the time) their total contribution to the runtime is over 15% of the total.
On the other hand the 7 operators that alter the tree generally have low cost (about 0.4 milliseconds per operation) and making up 85% of the total runtime because they are picked 95% of the time. The population size parameter is very cheap so comprises a tiny fraction of runtime. 

### Mixing

A further complication is that different choices of operators, priors etc., can effect the efficiency of `mixing` of the MCMC (how fast it converges and explores the parameter space). 
This is reflected in a higher ESS perhaps even at the cost of more computation per step - what matters is that the gain in ESS is proportionally higher than the computational cost. 

If we load the resulting log file into `Tracer` we can calculate the ESS for these parameters (10% burnin):

```
Parameter               mean    ESS
kappa	                27.169	    1772
frequencies1	        0.39	    2075
frequencies2	        0.305	    2782
frequencies3	        0.082	    2974
frequencies4	        0.223	    2527
alpha	                0.235	    3879
```

You can see that all of the ESSs are quite high. 
The ESSs for the substitution model parameters are still very high suggesting that we could afford to down-weight their operators to reduce their contribution to the total runtime. 
If we down-weight them by a factor of 10, the total runtime goes down to **169.8 minutes** – about a 10% saving. 
The ESSs for these parameters all predictably go down but are still reasonable:  

```
Parameter               mean    ESS
kappa	                27.178	475	
frequencies1	        0.39	281	
frequencies2	        0.305	272	
frequencies3	        0.082	357	
frequencies4	        0.223	367	
alpha	                0.235	722	
```

The two parameters that relate to the tree, `treeModel.rootHeight` and `treeLength` (the sum of all the branch lengths - not technically a parameter but a metric) show ESSs of >1000. 
These are not necessarily indicative of how well the tree is mixing overall. 
We call also look at the 'ESS' for the probability densities:

```
Parameter       mean        ESS
joint	        -1.934E5	3892
prior	        -107.542	5783
likelihood	    -1.933E5	3782
```

These are not really ESSs as we they are not parameters we are sampling but they are a measure of howuncorrelated the values are over the run which will be an indication of mixing. 
The `likelihood` value is the probability density of the data given the tree which will be another indication of how well the tree has been mixing. 
The `prior` contains the coalescent density along with all the parameters priors and `joint` is the sum. 
All of these indicate good mixing.

Overall this implies that we are in a reasonably good shape here with reasonable balance in the mixing of the different aspects of the model. 

One other thing to note here is the `Pr(accept)` column in the operator analysis, above. 
This records how often a proposed operation is actually accepted according to the Metropolis-Hastings algorithm. 
A rule of thumb is that a move should be accepted about 23% of the time to be optimally efficient (this is an analytical result for certain continuous moves but we assume it also applies for tree moves). 
Operators are generally 'tuned' to achieve this ratio by adjusting the `size` of the move (how big a change is made to the parameter – big moves will be accepted less often than small ones). 
Some moves (`Narrow Exchange`, `Wide Exchange` and `WilsonBalding`) are not tunable and you can see they have a very small acceptance probability. 
This means they are acting inefficiently at exploring the tree-space but consume considerable computational time. 
On the other hand they may be important for convergence initially where large moves are favoured. 

We can try reweighting these operators down by a factor of 10 (this can be done in BEAUti's operator table or by editing the XML) and see the effect. 
Firstly the total runtime is **143.34 minutes** – more than a 30% speed up from our original run. 
However, we need to check that this hasn't been  at the cost of getting a good posterior sample of the parameters. 
Looking at the ESS values in Tracer:

```
Parameter               mean        ESS
joint	                -1.934E5	2646	
prior	                -107.531	2291	
likelihood	            -1.933E5	2708	
treeModel.rootHeight	0.506	    1199	
treeLength	            8.146	    1116	
constant.popSize	    1.996	    9001	
kappa	                27.175	    381	
frequencies1	        0.39	    234	
frequencies2	        0.305	    263	
frequencies3	        0.081	    381
frequencies4	        0.223	    352
alpha	                0.235	    645
``` 

The first thing to note is that the mean values are pretty much identical as before (looking at each parameter 
individually, the distributions for the runs are indistinguishable). 

Therefore we have achieved a significant 
improvement in runtime with no cost to the quality of the results. Furthermore, the ESSs are all significantly higher 
meaning that we are obtaining more effectively independent samples in considerably less time, a double win. 
The reason for this is that we have removed most of the moves that were not being accepted so in our 10 million moves, 
more of them were useful for exploring tree space. The relative weighting of substitution model moves to tree moves 
also went up, increasing the ESSs of these - but remember these are expensive moves so perhaps should be down-weighted. 

The `constant.popSize` now has an ESS of 9001 which means every sample after burnin is independent - suggesting we could 
down-weight this operator significantly. 
However, it is a very cheap move so down-weighting this relative to tree moves may actually increase runtime.


### Concluding remarks

* Don't use time/sample as a comparative measure of performance for different data or sampling regimes.

* A better measure of BEAST performance than the average time per million steps would be the average time per effectively independent sample (i.e., ESS/hour). In the example above, the `treeLength` measure goes from 752 independent values per hour to 1407, nearly doubling.

* Choosing operator weights to achieve better performance (as ESS/hour) is a difficult balancing act and may need multiple runs and examination of operator analyses and ESSs. It may usually be better to be conservative about these and worry about getting statistically correct results more than saving a few hours of runtime.

* The optimal weights for operators will also vary considerably by data set meaning it is difficult to come up with reliable rules.  

* We are currently working on improving the operators and weights to achieve a reliable increase in statistical performance. More on this soon ... 

{% include note.html content="The operator weights that BEAUti generates by default are intended to be robust (we want to try to ensure convergence) and may not be optimal in all circumstances. Adjustment of these might achieve significant improvements in ESS/hour but caution should be exercised and the results examined closely to ensure that that convergence has been achieved. As always we strongly recommend that at least 2 replicate runs are performed and the results compared."  %}


---
title:  "Measuring BEAST performance"
categories: release
permalink: measuring-beast-performance.html
tags: [news]
---

## Measuring BEAST performance

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
to be recalculated) where as others will require a lot of computation (e.g., changing the evolutionary
rate will require the recalculation of absolutely everything). Thus if the computationally heavy
operators are given more `weight` then the average time per operation over the course of the chain
will go up. But this is not necessarily a bad thing.
                             
### Efficient sampling and ESSs
                                                                        
The ultimate aim of an MCMC is to get the maximum amount effectively independent samples from the 
posterior as possible (as measured by effective sample size, ESS). Ideally, we would aim to get 
the same ESS for all parameters in the model but we are often less interested in some parameters
than others and we could allow a lower ESS for those. A high ESS is more important the more we are
interested in the tails of the distribution of a parameter. So some parameters, in particular those
that are part of the substition model such as the transition-transversion ratio `kappa` are down 
weighted. Changing these is computationally expensive, requiring a complete recalculation of the 
likelihood for the partition, but we are rarely interested in the value. We simply want to marginalize 
our other parameters over their distributions. So we can accept a lower ESS for `kappa` as the cost of 
focusing on other parameters. 

To demonstrate this we can look at an example BEAST run. This is a data set of 64 carnivore mitochondrial
genome coding sequences giving a total of about 5000 site patterns. The model was an `HKY+gamma`, 
`strict molecular clock`, `constant size coalescent` 
([the XML file is available here](/files/carnivores.HKYG.SC.CPC.classic.xml)).
The data was run on [BEAST v1.10.3](installing) on an iMac Pro for 10M steps for a total run time of
**1.42 hours** (**85.2 minutes**).

You can see the effect of different operators by looking at the operator table reported at the end of the run:

```
Operator                                          Tuning   Count      Time     Time/Op  Pr(accept) 
scale(kappa)                                      0.917   13290      30329    2.28     0.2333      
frequencies                                       0.006   13402      30563    2.28     0.2327      
scale(alpha)                                      0.908   13326      30334    2.28     0.2326      
scale(nodeHeights(treeModel))                     0.937   398137     923568   2.32     0.2322      
subtreeSlide(treeModel)                           0.012   1991165    843785   0.42     0.2317      
Narrow Exchange(treeModel)                                1994715    666209   0.33     0.0091      
Wide Exchange(treeModel)                                  398074     130448   0.33     0.0001      
wilsonBalding(treeModel)                                  397933     227020   0.57     0.0002      
scale(treeModel.rootHeight)                       0.204   398220     91373    0.23     0.2392      
uniform(nodeHeights(treeModel))                           3982487    1836198  0.46     0.1206      
scale(constant.popSize)                           0.439   399251     4137     0.01     0.2371      
```

The operators on the substitution model (`kappa`, `frequencies` and `alpha`) are amongst the
most computationally expensive taking on average 2.3 milliseconds per operation. However, they
have been down-weighted relative to the others so their total contribution to the run time is
relatively small – about 2% of total runtime for all three – because they are not called very often.
On the other hand the 7 operators that alter the tree generally have low cost (about 0.4 milliseconds
per operation) but make up 98% of the total runtime (the population size parameter is very cheap
so comprises a tiny fraction of runtime). 

### Mixing

A further complication is that different choices of operators, priors etc., can effect the efficiency
of `mixing` of the MCMC (how fast it converges and explores the parameter space). This is reflected in
a higher ESS perhaps even at the cost of more computation per step - what matters is the gain in ESS is 
proportionally higher than the computational cost. 

If we load the resulting log file into `Tracer` we can calculate the ESS for each parameter (10% burnin):

```
Parameter               mean    ESS
treeModel.rootHeight	  0.506  1095
treeLength              8.142	 1068
constant.popSize        1.994	 7885
kappa	                  27.16  531
frequencies1	          0.39   321
frequencies2	          0.305  417
frequencies3	          0.082  523
frequencies4	          0.223  415
alpha	                  0.235	 960
```

You can see that all of the ESSs are quite high. The ESSs for the substitution model parameters, which 
we down-weighted considerably, are quite reasonable. The two parameters that relate to the tree, 
`treeModel.rootHeight` and `treeLength` (the sum of all the branch lengths - not technically a parameter
but a metric) show ESSs of >1000. These are not necessarily indicative of how well the tree is mixing
overall. We call also look at the 'ESS' for the probability densities:


```
Parameter   mean        ESS
joint	    -1.934E5	2852
prior	    -107.529	2958
likelihood  -1.933E5	2897
```

These are not really ESSs as we they are not parameters we are sampling but they are a measure of how
uncorrelated the values are over the run which will be an indication of mixing. The `likelihood` value
is the probability density of the data given the tree which will be another indication of how well the 
tree has been mixing. The `prior` is the contains the coalescent density and `joint` is the sum. All of
these indicate good mixing.

Overall this implies that we are in a reasonably good shape here with reasonable balance in the mixing
of the different aspects of the model. 

One other thing to note here is `Pr(accept)` column, above. This records how often an proposed operation
is actually accepted according to the Metropolis-Hastings algorithm. A rule of thumb is that a move
should be accepted about 23% of the time to be optimally efficient (this is an analytical result for
certain continuous moves but we assume it also applies for tree moves). Operators are generally 'tuned'
to achieve this ratio by adjusting the `size` of the move (how big a change is made to the parameter – 
big moves will be accepted less often than small). Some moves (`Narrow Exchange`, `Wide Exchange` and
`WilsonBalding`) are not tunable and you can see they have a very small acceptance probability. This means
they are acting inefficiently at exploring the tree-space but consume considerable computational time.
On the other hand they may be important for convergence initially where large moves are favoured. 

We can try reweighting these operators down by a factor of 10 (this can be done in BEAUti's operator
table or by editing the XML) and see the effect. Firstly the total runtime is **54 minutes** (down
from 85 minutes) meaning a considerable speed up. However, we need to check that this hasn't been 
at the cost of getting a good posterior sample of the parameters. Looking at the ESS values in Tracer:

```
Parameter               mean        ESS
joint	                -1.934E5    4124
prior	                -107.52	    3507
likelihood              -1.933E5    4188
treeModel.rootHeight	0.506	    1401
treeLength              8.14	    1267
constant.popSize        1.995	    9001
kappa	                27.154	    795
frequencies1	        0.39	    621
frequencies2	        0.305	    771
frequencies3	        0.082	    771
frequencies4	        0.223	    816
alpha	                0.235	    1411
``` 

The first thing to note is that the mean values are pretty much identical to before (looking at each parameter individually, the distributions for the two runs are indistinguishable). Therefore we have achieved a significant improvement in runtime with no cost to the quality of the results. Furthermore, the ESSs are all significantly higher meaning that we are obtaining more effectively independent samples in considerably less time, a double win. The reason for this is that we have removed most of the moves that were not being accepted so in our 10,000,000 moves, more of them were useful for exploring tree space. The relative weighting of substitution model moves to tree moves also went up, increasing the ESSs of these - but remember these are expensive moves so perhaps should be down-weighted. `constant.popSize` now has an ESS of 9001 which means every sample after burnin is independent - suggesting we could down-weight this operator significantly. However, it is a cheap move so down-weighting this relative to tree moves will actually increase runtime (but increase ESS of tree-related parameters).

A few summary points:

* Don't use time/sample as a comparative measure of performance for different data or sampling regimes.

* A better measure of BEAST performance than the average time per million steps would be the average time per effectively independent sample (i.e., ESS/hour). In the example above, the `treeLength` measure goes from 752 independent values per hour to 1407, nearly doubling.

* Choosing operator weights to achieve better performance (as ESS/hour) is a difficult balancing act and may need multiple runs and examination of operator analyses and ESSs. It may usually be better to be conservative about these and worry about getting statistically correct results more than saving a few hours of runtime.

* We are currently working on improving the operators and weights to achieve a reliable increase in statistical performance. More soon on this... 

{% include note.html content="The operator weights that BEAUti generates by default are intended to be robust (we want to try to ensure convergence) and may not be optimal in all circumstances. Adjustment of these might achieve significant improvements in ESS/hour but caution should be exercised and the results examined closely to ensure that that convergence has been achieved. As always we strongly recommend that at least 2 replicate runs are performed and the results compared."  %}

<!--
As an aside to this, I tried to run the same model in BEAST2 v2.5. I generated the same model for the same data in BEAUti and adjusted a few things to ensure that the operator schedule and priors were the same. Running this for the same number of steps on the same computer resulted in a total runtime of 2.10 hours (126.3 minutes), thus running at 67% of the speed of BEAST1. This surprised me as both programs use the same algorithm and the same BEAGLE library to calculate the likelihood. 

Looking at the operator analysis also shows a possible reason for

```Operator                                                         Tuning    #accept    #reject      Pr(m)  Pr(acc|m)
   ScaleOperator(KappaScaler.s:carnivores)                         0.77092        891      12430    0.00133    0.06689 Try setting scaleFactor to about 0.878
   DeltaExchangeOperator(FrequenciesExchanger.s:carnivores)        0.01280       1897      11366    0.00133    0.14303 
   ScaleOperator(gammaShapeScaler.s:carnivores)                    0.82372       1050      12045    0.00133    0.08018 Try setting scaleFactor to about 0.908
   ScaleOperator(CoalescentConstantTreeScaler.t:carnivores)        0.89269      46061     352024    0.03984    0.11571 
   ScaleOperator(CoalescentConstantTreeRootScaler.t:carnivores)    0.86420      38899     359216    0.03984    0.09771 Try setting scaleFactor to about 0.93
   Uniform(CoalescentConstantUniformOperator.t:carnivores)               -     479531    3506150    0.39841    0.12031 
   SubtreeSlide(CoalescentConstantSubtreeSlide.t:carnivores)       0.07237      74797    1916944    0.19920    0.03755 Try decreasing size to about 0.036
   Exchange(CoalescentConstantNarrow.t:carnivores)                       -      25205    1967173    0.19920    0.01265 
   Exchange(CoalescentConstantWide.t:carnivores)                         -         77     398187    0.03984    0.00019 
   WilsonBalding(CoalescentConstantWilsonBalding.t:carnivores)           -         44     397367    0.03984    0.00011 
   ScaleOperator(PopSizeScaler.t:carnivores)                       0.48241     102445     296202    0.03984    0.25698 
```
-->

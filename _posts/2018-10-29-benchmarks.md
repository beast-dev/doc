---
title:  "Benchmarks"
categories: release
permalink: benchmarks.html
tags: [news]
---

Data: Carnivores mtDNA 62 taxa, 10869bp, 5565 unique site patterns
Model: HKY+G, Strict clock, Constant size coalescent
Machine: iMac Pro

### Classic operator mix:

```
Operator        Weight  Parameter
scaleOperator	1	    kappa
deltaExchange	1	    frequencies
scaleOperator	1	    alpha
scaleOperator	3	    treeModel.allInternalNodeHeights
subtreeSlide	30	    treeModel
narrowExchange	30	    treeModel
wideExchange	3	    treeModel
wilsonBalding	3	    treeModel
scaleOperator	3	    treeModel.rootHeight
uniformOperator	30	    treeModel.internalNodeHeights
scaleOperator	3	    constant.popSize
```

> Time: 3.124 hours / 187.4 minutes

```
Operator analysis
Operator                        Tuning  Count      Time     Time/Op  Pr(accept) 
scale(kappa)                    0.913   92847      548576   5.91     0.2322      
frequencies                     0.01    92528      547586   5.92     0.2355      
scale(alpha)                    0.939   92835      548560   5.91     0.2317      
scale(nodeHeights(treeModel))   0.927   277983     1651622  5.94     0.2329      
subtreeSlide(treeModel)         0.013   2778288    2415749  0.87     0.2315      
Narrow Exchange(treeModel)              2778497    1936405  0.7      0.0091      
Wide Exchange(treeModel)                277044     206821   0.75     0.0002      
wilsonBalding(treeModel)                277574     355560   1.28     0.0002      
scale(treeModel.rootHeight)     0.262   277733     72405    0.26     0.2391      
uniform(nodeHeights(treeModel))         2777648    2650767  0.95     0.1207      
scale(constant.popSize)         0.474   277023     2697     0.01     0.2375      
```

```
Parameter               Mean        ESS
kappa	                27.169	    1772	
frequencies1	        0.39	    2075	
frequencies2	        0.305	    2782	
frequencies3	        8.154E-2	2974
frequencies4	        0.223	    2527	
alpha	                0.235	    3879	
treeModel.rootHeight	0.506	    1567	
treeLength	            8.146	    1634	
constant.popSize	    1.997	    8545	

joint	                -1.934E5	3892
prior	                -107.542	5783
likelihood	            -1.933E5	3782
```

### Reweighting 1

```
Operator        Weight  Parameter
scaleOperator	0.1	    kappa
deltaExchange	0.1	    frequencies
scaleOperator	0.1	    alpha
scaleOperator	3	    treeModel.allInternalNodeHeights
subtreeSlide	30	    treeModel
narrowExchange	30	    treeModel
wideExchange	3	    treeModel
wilsonBalding	3	    treeModel
scaleOperator	3	    treeModel.rootHeight
uniformOperator	30	    treeModel.internalNodeHeights
scaleOperator	3	    constant.popSize
``` 

> Time: 2.832 hours / 169.9 minutes   

```
Operator analysis
Operator                        Tuning  Count      Time     Time/Op  Pr(accept) 
scale(kappa)                    0.932   9560       57490    6.01     0.2324      
frequencies                     0.007   9652       57917    6.0      0.2364      
scale(alpha)                    0.931   9662       58037    6.01     0.2345      
scale(nodeHeights(treeModel))   0.926   284487     1718791  6.04     0.2328      
subtreeSlide(treeModel)         0.012   2849409    2521732  0.89     0.2318      
Narrow Exchange(treeModel)              2850208    2024798  0.71     0.0092      
Wide Exchange(treeModel)                284461     216048   0.76     0.0002      
wilsonBalding(treeModel)                285074     371436   1.3      0.0001      
scale(treeModel.rootHeight)     0.357   283996     74833    0.26     0.2396      
uniform(nodeHeights(treeModel))         2848841    2771549  0.97     0.1206      
scale(constant.popSize)         0.557   284650     2824     0.01     0.2382        
```

```
Parameter               Mean        ESS
kappa	                27.178	    475	
frequencies1	        0.39	    281	
frequencies2	        0.305	    272	
frequencies3	        8.166E-2	357	
frequencies4	        0.223	    367	
alpha	                0.235	    722	
treeModel.rootHeight	0.507	    976	
treeLength	            8.153	    906	
constant.popSize	    1.998	    8619

joint	                -1.934E5	2472
prior	                -107.593	2389
likelihood	            -1.933E5	2492
```

### Reweighting 2

```
Operator        Weight  Parameter
scaleOperator	0.1	    kappa
deltaExchange	0.1	    frequencies
scaleOperator	0.1	    alpha
scaleOperator	3	    treeModel.allInternalNodeHeights
subtreeSlide	62.4	treeModel
narrowExchange	3	    treeModel
wideExchange	0.3	    treeModel
wilsonBalding	0.3	    treeModel
scaleOperator	3	    treeModel.rootHeight
uniformOperator	30	    treeModel.internalNodeHeights
scaleOperator	3	    constant.popSize
```     

> Time: 2.389 hours / 143.3 minutes

```
Operator                         Tuning  Count      Time     Time/Op  Pr(accept) 
scale(kappa)                     0.928   9541       48509    5.08     0.2328      
frequencies                      0.007   9542       48595    5.09     0.2409      
scale(alpha)                     0.942   9495       48206    5.08     0.2312      
scale(nodeHeights(treeModel))    0.954   284242     1451817  5.11     0.2315      
subtreeSlide(treeModel)          0.01    5925330    4271462  0.72     0.2316      
Narrow Exchange(treeModel)               284787     165281   0.58     0.0099      
Wide Exchange(treeModel)                 28741      18028    0.63     0.0003      
wilsonBalding(treeModel)                 28645      30591    1.07     0.0003      
scale(treeModel.rootHeight)      0.401   285013     60433    0.21     0.2398      
uniform(nodeHeights(treeModel))          2850109    2256418  0.79     0.1203      
scale(constant.popSize)          0.462   284555     1696     0.01     0.2377      
```
        
```
Parameter               Mean        ESS
kappa	                27.175	    381	
frequencies1	        0.39	    234	
frequencies2	        0.305	    263	
frequencies3	        8.157E-2	381	
frequencies4	        0.223	    352	
alpha	                0.235	    645	
treeModel.rootHeight	0.506	    1199
treeLength	            8.146	    1116
constant.popSize	    1.996	    9001

joint	                -1.934E5	2646
prior	                -107.531	2291
likelihood	            -1.933E5	2708
```        

### New tree operators STL + STJ

```
Operator        Weight  Parameter
scaleOperator	0.1	    kappa
deltaExchange	0.1	    frequencies
scaleOperator	0.1	    alpha
scaleOperator	3	    treeModel.allInternalNodeHeights
subtreeLeap	    96	    treeModel
subtreeJump	    3	    treeModel
scaleOperator	3	    constant.popSize
```

> Time: 2.583 hours / 155.0 minutes
      
```
Operator                        Tuning  Count      Time     Time/Op  Pr(accept) 
scale(kappa)                    0.914   9711       49301    5.08     0.2348      
frequencies                     0.01    9479       48061    5.07     0.235       
scale(alpha)                    0.925   9581       48627    5.08     0.2321      
scale(nodeHeights(treeModel))   0.942   284678     1453137  5.1      0.2329      
subtreeLeap(treeModel)          0.01    9117481    7158296  0.79     0.2317      
subtreeJump(treeModel)          NaN     284092     314342   1.11     0.0005      
scale(constant.popSize)         0.438   284978     1824     0.01     0.2374      
```

```
Parameter               Mean        ESS
kappa	                27.166	    387	
frequencies1	        0.39	    226	
frequencies2	        0.306	    363	
frequencies3	        8.156E-2	406	
frequencies4	        0.223	    294	
alpha	                0.235	    671	
treeModel.rootHeight	0.506	    1201
treeLength	            8.145	    1163
constant.popSize	    1.998	    8666

joint	                -1.934E5	3153
prior	                -107.552	2718
likelihood	            -1.933E5	3207
```
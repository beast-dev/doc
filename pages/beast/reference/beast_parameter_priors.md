---
title: Parameter Priors
permalink: parameter_priors.html
sidebar: beast_sidebar
tags: [reference, help]
keywords: software, parameter prior, beast
last_updated: July 25, 2018
summary: "Parameter Priors"
toc: true
folder: beast
---

{% include warning.html content="This page unfinished." %}


## Introduction 
 
BEAST offers a wide range of prior distributions that can be used for the parameters used in its models.
This page provides a description of and the rationale behind the default priors on each parameter of those standard models in BEAUti, with the goal of providing every parameter with a proper and reasonable prior. 

Complementing the parameter priors described here, we also provide a [page on coalescent priors](tree_priors), which offers possible choices to put a prior on the underlying tree and its branch lengths.


### Relative rate parameters in BEAST v1.10

As of version 1.10, BEAST makes use of a re-parameterisation of the between partition relative rates parameter. 
The old parameterisation - default in versions before 1.10 - is called ```mu```, the new parameterisation is called ```nu``. 

The reason for this change is to allow the use of a Dirichlet prior on the relative rates. 
This, in turn, is to provide a proper prior so that the marginal likelihood estimation (MLE) can work on these models (previously, with ```mu```, an improper uniform prior [0,Inf[ was used). 

The difference between ```mu``` and ```nu``` is that ```mu``` is weighted by partition size so it is a per-site relative rate and if multiplied by the clock rate, will give the absolute rate of a site in that partition. 
```nu``` is a per-partition rate; this allows the delta exchange transition kernel to maintain a mean of 1 and thus be suitable for the Dirichlet prior. 

As of BEAST 1.10, the ```nu``` parameters are what are operated on and they have the Dirichlet prior in the priors table in BEAUti. 
To make things more comparable with older versions of BEAST, the ```mu``` values are also calculated and logged. 
In future versions we will keep logging both ```nu``` and ```mu``` for completeness. 

You can switch this to the old formulation (i.e. BEAST v1.8.4 and older) by checking the "Use classic priors/operators" at the top of the Priors table in BEAUti. 



{% include links.html %}
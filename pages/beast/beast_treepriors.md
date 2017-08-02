---
title: Tree Priors
permalink: treepriors.html
sidebar: beast_sidebar
tags: [reference, help]
keywords: software, coalescent, tree prior, beast
last_updated: July 23, 2017
summary: "Tree Priors"
toc: true
folder: beast
---

## Introduction 
 
BEAST offers a range of prior distributions to model population size changes through time (i.e., demography).
These are **coalescent** priors, where the effective population size \\(N_e\\) varies through time according to a certain function \\(N_e(t) \\).

Other, non-coalescent priors such as the Yule and birth-death processes are available in BEAST, but these are not covered here.

## Parametric tree priors

[INSERT MAC SCREENSHOT of Tree priors tab in BEAUTI]

### Constant population size

This model assumes that the population has remained constant through time, at size \\( N \\):

$$ N_e (t) = N$$

This population size hyperparameter can be given a prior and estimated from the data.

[A sentence showing when this might be appropriate ]
 
 
### Exponential growth

The exponential model has two parameters: the initial population size \\( N_0 \\) and the growth rate \\( r \\).
The assumption is that population grew exponentially since the time to the most recent common ancestor (tMRCA):

$$ N_e(t) = N_0 \exp(-rt) $$

[A sentence showing when this might be appropriate ]


{% include image.html file="coalescent/pop_size_coalescent.png" indent="64px" width="640px" alt="parametric coalescent" caption="Illustration of parametric coalescent priors. Reproduced from Volz et al. (2013)." %}

## Non-parametric models

Sometimes it is desirable to take a flexible approach to demographic modelling.
BEAST offers non-parametric coalescent priors that are very flexible and allow for the estimation of complicated demographic trajectories.

The main idea is to have piece-wise process which models population size changes between coalescent events (inter-coalescent intervals). 

### Skyride

### Skygrid

These priors are parameter-rich and their use is preferable when the data are strongly informative about population history.

## A note on hyperprior choices

All of these demographic models are parametric priors on the ages of nodes in the tree, which can and often are affected by priors on the hyperparameters ( \\( N \\), \\( r\\), \\(\tau \\), etc).

## References

Kingman, J. F. C. (1982). The coalescent. Stochastic processes and their applications, 13(3), 235-248.

Griffiths, R. C., & Tavare, S. (1994). Sampling theory for neutral alleles in a varying environment. Philosophical Transactions of the Royal Society of London B: Biological Sciences, 344(1310), 403-410.

Minin, V. N., Bloomquist, E. W., & Suchard, M. A. (2008). Smooth skyride through a rough skyline: Bayesian coalescent-based inference of population dynamics. Molecular biology and evolution, 25(7), 1459-1471.

Volz, E. M., Koelle, K., & Bedford, T. (2013). Viral phylodynamics. PLoS computational biology, 9(3), e1002947.

Gill, M. S., Lemey, P., Faria, N. R., Rambaut, A., Shapiro, B., & Suchard, M. A. (2012). Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Molecular biology and evolution, 30(3), 713-724.

{% include links.html %}
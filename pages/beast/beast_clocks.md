---
title: Molecular Clocks
permalink: clocks.html
sidebar: beast_sidebar
tags: [reference]
keywords: software, molecular clocks, strict, relaxed, beast
last_updated: July 24, 2017
summary: "Molecular Clocks"
toc: true
folder: beast
---

## Molecular Clocks

BEAST is a cross-platform program for Bayesian analysis of molecular sequences using MCMC. 
It is entirely orientated towards rooted, time-measured phylogenies inferred using strict or relaxed molecular clock models. 

Apart from a strict molecular clock, a variety of models for relaxing the molecular clock assumption have been developed and implemented in BEAST.
These are accessible in the 'Clocks' panel in BEAUti:

{% include image.html file="clocks/clockModels.png" indent="64px" width="640px" alt="beast clock models" caption="" %}

### Strict clock

A strict clock model assumes that every branch in a phylogenetic tree evolves according to the same evolutionary rate.
This is hence a 1-parameter model, the parameter of which represents the conversion rate between branch lengths and evolutionary time.

{% include image.html file="clocks/strictClock.png" indent="64px" width="480px" alt="strict clock model" caption="Under the strict clock model, evolution occurs at the same rate across every branch." %}

Upon selecting this model, a single parameter will be estimated and will be equipped with a proper CTMC reference prior (Ferreira and Suchard, 2008).

### Uncorrelated relaxed clock



{% include image.html file="clocks/uncorrelatedClock.png" indent="64px" width="480px" alt="uncorrelated relaxed clock model" caption="Under the uncorrelated relaxed clock model, the evolutionary rate at each branch is drawn from an underlying distribution." %}

{% include image.html file="clocks/relaxedClockBeauti.png" indent="64px" width="480px" alt="strict clock model" caption="" %}



### Fixed local clock

{% include image.html file="clocks/localClock.png" indent="64px" width="480px" alt="strict clock model" caption="Under the fixed local clock model, a shift in evolutionary rate occurs at the TMRCA of each defined taxon set." %}


### Random local clock





## References

M. A. R. Ferreira and M. A. Suchard (2008) Bayesian analysis of elapsed times in continuous‐time Markov chains. Canadian Journal of Statistics, 36(3), 355-368.

A. J. Drummond, S. Y. W. Ho, M. J. Phillips and A. Rambaut (2006) Relaxed phylogenetics and dating with confidence. PLoS Biology 4(5): e88.

{% include links.html %}
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

{% include image.html file="clocks/strictClock.png" indent="64px" width="640px" alt="strict clock model" caption="Under the strict clock model, evolution occurs at the same rate across every branch." %}



### Uncorrelated relaxed clock


### Random local clock


### Fixed local clock



## References



{% include links.html %}
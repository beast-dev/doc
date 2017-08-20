---
title: Estimating Rates and Dates Tutorial
keywords: rates, dates, mcmc, tutorial
last_updated: August 20, 2017
tags: [tutorial]
summary: "Estimating rates and dates from time-stamped sequences."
sidebar: beast_sidebar
permalink: estimating_rates.html
folder: beast
---

## Estimating rates and dates from time-stamped sequences: a hands-on tutorial

This tutorial provides a step-by-step tutorial for analyzing a set of virus sequences which have been isolated at different points in time (heterochronous data). 
The data are 71 sequences from the prM/E gene of yellow fever virus (YFV) from Africa and the Americas with isolation dates ranging from 1940-2009. 
The sequences represent a subset of the data set analyzed by Bryant et al. (Bryant JE, Holmes EC, Barrett ADT, 2007 Out of Africa: A Molecular Perspective on the Introduction of Yellow Fever Virus into the Americas. PLoS Pathog 3(5): e75. doi:10.1371/journal.ppat.0030075).

The most commonly cited hypothesis of the origin of yellow fever virus (YFV) in the Americas is that the virus was introduced from Africa, along with Aedes aegypti mosquitoes, in the bilges of sailing vessels during the slave trade. 
Although the hypothesis of a slave trade introduction is often repeated prior to paper by Bryant et al. (2007), it had not been subject to rigorous examination using gene sequence data and modern phylogenetic techniques for estimating divergence times. 
The aim of this exercise is to obtain an estimate of the rate of molecular evolution, an estimate of the date of the most recent common ancestor and to infer the phylogenetic relationships with appropriate measures of statistical support.

The first step will be to convert a NEXUS file with a DATA or CHARACTERS block into a BEAST XML input file. 
This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). 
This is a user-friendly program for setting the evolutionary model and options for the MCMC analysis. 
The second step is to actually run BEAST using the input file that contains the data, model and settings. 
The final step is to explore the output of BEAST in order to diagnose problems and to summarize the results.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

Prior to BEAST analysis of the YFV data, it is advisable to confirm that the sequences contain sufficient 'temporal signal' for reliable estimation of evolutionary rates and divergence times. 
This can be achieved using a simple exploratory regression approach as implemented in [TempEst](http://tree.bio.ed.ac.uk/software/tempest/) (Rambaut et al., 2016). 
TempEst takes as input a 'non-clock' phylogeny, which can be estimated using a standard neighbour-joining, maximum likelihood or Bayesian approach.

[This link will take you to the first part of this tutorial](rates_and_dates).



## Evaluating rate variation (using model selection)




{% include links.html %}
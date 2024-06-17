---
title: Effective Sample Size (ESS)
keywords: ess, reference
last_updated: July 6, 2017
tags: [reference, help]
summary: "About the Effective Sample Size (ESS) and how to increase it."
sidebar: beast_sidebar
permalink: ess_tutorial.html
toc: false
folder: beast
redirect_from: "/Increasing-ESSs"
---

## What is an ESS?
The Effective Sample Size (ESS) of a parameter sampled from an MCMC (such as BEAST) is the number of effectively independent draws from the posterior distribution that the Markov chain is equivalent to.

### How do I calculate an ESS?
The simplest way is to load your BEAST log files into Tracer.

### Why do I need to increase it?
If the ESS of a parameter is small then the estimate of the posterior distribution of that parameter will be poor. In Tracer you can calculate the standard deviation of the estimated mean of a parameter. If the ESS is small then the standard deviation will be large. This is exactly the same as the sample size of an experiment consisting of measurements.

### What size ESS is adequate?
The larger the better. Tracer flags up ESSs < 100 but this may be liberal and > 200 would be better. On the other hand chasing ESSs > 10000 may be a waste of computational resources.

### Do I need adequate ESSs for all my parameters?
Possibly not. Really low ESSs may be indicative of poor mixing but if a couple of parameters that you are not interested in are a little low it probably doesn't matter. The likelihoods (both of the tree and coalescent model) should have decent ESSs.

### Is the ESS important if I am interested in the sample of trees?
Definitely. At the moment we don't have anyway of directly examining the ESS of the tree or the clade frequencies. Therefore, it is important that the continuous parameters and likelihoods have adequate ESS to demonstrate good mixing of the MCMC.

## How do I increase the ESS of a parameter?
Here are some ways of increasing the ESS of a parameter:

### Increase the sampling frequency.
The ESS is calculated by measuring the correlation between sampled states in the chain (i.e., the entries in the log file). If the sampling frequency is very low these will be uncorrelated. This will be indicated by the ESS being approximately equal to the number of states in the log file (minus the burn-in). If this is the case, then it may be that you can improve the ESSs by increasing the sampling frequency until the samples in the log file begin to be autocorrelated. Sampling too frequently will not affect the ESSs but will increase the size of the log file and the time it takes to analyse it.

### Combine the results of multiple independent chains.
It is a good idea to do multiple independent runs of your analyses and compare the results to check that the chains are converging and mixing adequately. If this is the case then each should be sampling from the same distribution and the results could be combined (having removed a suitable burn-in from each). The continuous parameters in the log file can be analysed and combined using Tracer. The tree files will currently have to be combined manually using a text editor. An advantage of this approach is that the different runs can be performed simultaneously on different computers (say in a computer lab or nodes on a Linux cluster) or on different processors in a multi-processor machine.

### Increase the chain length.
This is the most straight-forward way of increasing the ESS. This obviously requires more computer resources and may not be practical.

{% include links.html %}

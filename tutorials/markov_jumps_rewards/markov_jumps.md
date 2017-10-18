---
title: Markov Jumps and Rewards
keywords: CTMC, Markov jumps, Markov rewards
last_updated: October 18, 2017
tags: [tutorial]
summary: "Obtaining Markov jump counts and Markov rewards."
sidebar: beast_sidebar
permalink: markov_jumps.html
folder: beast
---

## Markov jumps and rewards tutorial

A process of discrete state transitioning in evolutionary history is generally modelled using a continuous-time Markov chain (CTMC) model. 
This is the case for both sequence evolution and discrete trait evolution, e.g. for location traits in phylogeographic inference.
Fitting a CMTC process to discrete data results yields model parameter estimates, but the realisation of the process cannot be observed. 
This realisation includes the transitions (Markov jumps) between states along phylogenetic branches and the time (Markov rewards) spent in the states between two transitions.
This tutorial discusses how to estimate such quantities using stochastic mapping techniques in BEAST. 
It builds on the discrete diffusion analysis of bat rabies in the Americas that is set up as part of the workshop tutorial on discrete phylogeographic diffusion.


## References


{% include links.html %}
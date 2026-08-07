---
title: TreeTracer
permalink: treetracer.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, treetracer, beast
last_updated: August 7, 2026
toc: false
folder: beast/programs
---

{% include icon-callout.html file='icons/treetracer-icon.png' content='TreeTracer is a graphical tool for visualization and diagnostics of posterior tree space.' %}

TreeTracer (now at version {{ site.treetracer_version }}) is a software package for visualising and analysing the MCMC tree trace files generated through Bayesian phylogenetic inference. 
TreeTracer computes phylogenetic distances between posterior trees to enable projections into a multi-dimensional scaling (MDS) space, enabling the visualization of the posterior tree topology distribution to assess key topological properties, including the presence of multiple topological modes, and the convergence of multiple chains to the same regions of tree space.
TreeTracer v{{ site.treetracer_version }} can read output files from [MrBayes](http://mrbayes.csit.fsu.edu/), [BEAST](https://github.com/beast-dev/beast-mcmc), [BEAST2](https://www.beast2.org/) and possibly other MCMC programs from other domains.

### Downloading

You can download TreeTracer v{{ site.treetracer_version }} from here: [https://github.com/beast-dev/treetracer/releases](https://github.com/beast-dev/treetracer/releases)

We are currently in the process of obtaining a digital certificate signature for TreeTracer on **macOS** and **Windows**. Until that time, you may receive a notification / warning upon downloading and / or running TreeTracer. On **Windows**, you may have to bypass Smart App Control or run in developer mode; on **macOS**, you may have to go to System Settings and choose "Open Anyway" or clear quarantine flags via Terminal.

### Using TreeTracer

A tutorial is available describing [how to use (Tree)Tracer to analyse the output from BEAST](analysing_beast_output).

Another tutorial focuses on [how to identify convergence problems using (Tree)Tracer](tracer_convergence).

### Citing TreeTracer

The recommended citation for this program is:

Hong SL, Brusselmans M, Klaps J, Carvalho LM, Magee AF, Suchard MA, Rambaut A and Baele G (2026) Tree convergence and mixing in Bayesian phylogenetics Using TreeTracer. *In preparation*.

{% include links.html %}
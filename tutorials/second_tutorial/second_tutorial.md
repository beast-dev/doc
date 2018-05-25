---
title: Second Tutorial
keywords: beast, tutorial
last_updated: May 24, 2018
tags: [getting-started, tutorial]
summary: "This is the second introductory tutorial to BEAST. Here we will continue the analysis from the first tutorial looking at the output, diagnosing problems and summarising the results. This tutorial will introduce some of the utilities packaged with BEAST, logcombiner and treeannotator, as well as the external applications, Tracer and FigTree."
sidebar: beast_sidebar
permalink: second_tutorial.html
folder: beast
redirect_from: "/tutorial-2"
---

{% include warning.html content="This page is being written." %}

In the [first introductory tutorial](first_tutorial) we looked at importing data into [BEAUti](beauti), setting up a model and analysis, and running this analysis in [BEAST](beast).
In this second tutorial, we will analyse the output of that analysis by examining its output file in Tracer and by building a consensus tree and visualising it in FigTree.
But first, we explain how to combine the output files of multiple independent replicates (i.e. running the same BEAST XML using different starting seeds).
Such a setup can be useful when achieving a good [effective sample size](ess_tutorial) for each parameter is computationally cumbersome for example, and multiple hardware resources are available to run independent replicates in parallel.


## Combining results from multiple replicates
[LogCombiner](logcombiner) is distributed as part of the BEAST package and allows you to combine multiple output files into a single output file, which can make for easier post-processing of your analysis.
Note that to combine these output files, you'll have to run [LogCombiner](logcombiner) twice, once to combine the .log files and once more to combine the .trees files.
More information on how to use [LogCombiner](logcombiner) can be found on its [dedicated page](logcombiner).
For the remainder of this tutorial, we will assume the presence of a single .log file and a single .trees file.


## Inspecting the performance of the transition kernels
A step that's often forgotten/neglected is to quickly inspect the behavior and/or performance of the various transition kernels (or operators as they're called in BEAST).
At the end of an analysis, a .ops file will typically be created that contains important aspects of the parameter and tree estimation process.
For the analysis that we set up during the [first tutorial](first_tutorial), an apes.ops file is created that will contain content similar to this:

```
Operator analysis
Operator                                          Tuning   Count      Time     Time/Op  Pr(accept) 
scale(kappa)                                      0.289   9642       130      0.01     0.2385      
frequencies                                       0.062   9717       155      0.02     0.2409      
subtreeSlide(treeModel)                           0.02    289099     2280     0.01     0.2313      
Narrow Exchange(treeModel)                                288345     2668     0.01     0.0549      
Wide Exchange(treeModel)                                  28842      150      0.01     0.0109      
wilsonBalding(treeModel)                                  28874      172      0.01     0.0057      
scale(treeModel.rootHeight)                       0.131   28831      242      0.01     0.241       
uniform(nodeHeights(treeModel))                           287901     2710     0.01     0.3851      
scale(yule.birthRate)                             0.2     28749      103      0.0      0.2399  
```

Typically, the acceptance ratio of a transition kernel will be around 0.234 or higher, depending on the type of operation.
Note that it is known to not be the case for certain tree transition kernels, especially so here given the small number of taxa that we're analysing.
The most important thing here is to ascertain that none of the standard transition kernels have an acceptance rate of zero.


## Summarizing parameter estimates



{% include image.html file="tracer.png" prefix="/tutorials/second_tutorial/" %}<br />



## Building an MCC tree



## Visualising the MCC tree in FigTree



 
{% include links.html %}

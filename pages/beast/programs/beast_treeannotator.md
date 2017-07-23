---
title: TreeAnnotator
permalink: treeannotator.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, treeannotator, beast
last_updated: July 13, 2017
summary: "TreeAnnotator"
toc: true
folder: beast/programs
---

## TreeAnnotator

This program assists in summarizing the information from a sample of trees produced by BEAST onto a single “target” tree. 
The summary information includes the posterior probabilities of the nodes in the target tree, the posterior estimates and HPD limits of the node heights and (in the case of a relaxed molecular clock model) the rates.

### BurnIn

This option allows you to select the amount of burn-in, i.e., the number of samples that will be discarded at the start of the run, so that you are only analysing the part of the trace that is in equilibrium.

### Posterior probability limit

This is the same as specifying a a limit for bootstrapping in PAUP*. 
Posterior summaries will only be calculated for the nodes in the target tree that have a posterior probability greater than the specified limit.

### Target tree type

If you select the “Maximum clade credibility” option then the node height and rate statistics will be summarized on the tree in the posterior sample that has the maximum sum of posterior probabilities on its n − 2 internal nodes. 
This tree is not necessarily the majority-rule consensus tree. 
If you select the “User target tree” then the tree statistics will be summarized on a user-specified tree. 
This could, for example, be a majority-rule consensus tree constructed from the posterior tree sample using PAUP*.

### Node heights

This option allows you select how the node heights are summarised on the target tree. 
You can choose to keep the heights that the target tree has, or rescale it to reflect the posterior mean/median node heights for the clades contained in the target tree.

### Target tree file

This option allows you to select and input the target tree. 
This option will only be available if you have selected “User target tree” from the “Target tree type” combo menu.

### Input tree file

This option allows you to select the input tree file (the tree file produced by a BEAST analysis).

### Output file

This option allows you to select or create a file that the summarized tree data will be saved to.

Once you click run, TreeAnnotator will start to summarize the tree data produced by BEAST. 
In the JAVA window, TreeAnnotator will state the number of trees that have been read, will find the best fit tree specified under the “Target tree type”. 
The progress of this will be monitored by the * symbols moving across the screen. 
TreeAnnotator will also give you a clade support statistic before writing the annotated tree to file. 
This file can then be analysed in FigTree.

### Appendix

Nexus Meta Comment Format: [http://code.google.com/p/beast-mcmc/wiki/NexusMetacommentFormat]

{% include links.html %}
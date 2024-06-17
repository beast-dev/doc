---
title: Summarizing Trees
keywords: trees, mcc, reference
last_updated: July 6, 2017
tags: [reference, help]
summary: "Approaches to summarizing trees."
sidebar: beast_sidebar
permalink: summarizing_trees.html
folder: beast
redirect_from: "/Summarizing-BEAST-trees"
redirect_from: "/summarizing-posterior-trees"
---

## 50% Majority consensus tree and extended majority consensus tree

The 50% majority consensus tree is a tree constructed so that it contains all of the clades that occur in at least 50% of the trees in the posterior distribution. In other words it contains only the clades that have a posterior probability of >= 50%. The extended majority tree is a fully resolved consensus tree where the remaining clades are selected in order of decreasing posterior probability, under the constraint that each newly selected clade be compatible with all clades already selected. It should be noted that it is quite possible for the majority consensus tree to be a tree topology that has never been sampled and in certain situations it might be a tree topology with relatively low probability, although it will have many features that have quite high probability.

## 'Maximum clade credibility' - MCC tree 

A natural candidate for a point estimate is the tree with the maximum product of the posterior clade probabilities. To the extent that the posterior probabilities of different clades are additive, this definition is an estimate of the total probability of the given tree topology (i.e. it provides a way of estimating the `maximum a posteriori` tree topology, see below). This is referred to as the `maximum clade credibility` or MCC tree. This is the summary tree produced by BEAST's `TreeAnnotator` tool.

## 'Maximum _a posteriori_' - MAP tree
The use of the term `maximum a posteriori` (MAP) tree has been often misused in the literature. It has sometimes been used to describe the tree associated with the sampled state in the MCMC chain that has the highest posterior probability density. This is problematic, because the sampled state with the highest posterior probability density may just happen to have extremely good branch lengths on an otherwise fairly average tree topology. A better definition of the MAP tree topology is the tree topology that has the greatest posterior probability, averaged over all branch lengths and substitution parameter values. For data sets that are very well resolved, or have a small number of taxa, this is easily calculated by just determining which tree topology has been sampled the most often in the chain. However for large data sets it is quite possible that every sampled tree has a unique topology. In this case, the estimated `maximum clade credibility` tree above can be used.

## Median tree
To define a median tree, you must first define a metric on tree space. This turns out to be quite a difficult thing to do, but there are number of candidate metrics described in the literature. If you can visualize the trees in your posterior sample as a cluster of points in a high-dimensional space, then the median tree is the tree in the middle of the cluster - the median tree has the shortest average distance to the other trees in the posterior distribution. With a metric defined (say the Robinson-Foulds distance), a candidate for the median tree would be the tree in your posterior sample that has the minimum mean distance to the other trees in the sample. (see http://en.wikipedia.org/wiki/Geometric_median).

## 95% Credible Set
For data sets that are very well resolved, you might consider reporting not a single tree, but the smallest set of all tree topologies that accounts for 95% of the posterior probability. This is known as the 95% credible set of tree topologies.
The Maximum Credible Tree criterion could also be used to obtain an approximate x% credible set for small x.

## Divergence times
Once you have the decided on the tree topology or topologies that best summarize(s) your Bayesian phylogenetic analysis, the next question is what divergence times (node heights) to report. One obvious solution is to report the mean (or median) node height for each of the clades in the summary tree. This is especially suitable for the majority consensus tree and the maximum clade credibility tree (however defined). For the median tree, it should be noted that some metrics (i.e. those that take account of branch lengths and topology) allow for a single tree in the sample to be chosen that has the median topology and branch lengths. Likewise, if the 'MAP' sampled state is the chosen tree topology, then the associated branch lengths of the chosen state can be reported.
It should be noted that for a given topology, the mean height of a node could be older than its ancestor's mean height resulting in negative branch lengths.

{% include links.html %}

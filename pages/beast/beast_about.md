---
title: About BEAST
keywords: beast, authors, developers
last_updated: July 4, 2017
tags: [getting-started]
summary:
sidebar: beast_sidebar
permalink: about.html
toc: false
folder: beast
---

BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees.

## What does BEAST do?
This is a list of some of the models and features in BEAST:

- **Constant rate molecular clock models** |
This is the default model. The tree can be calibrated by specifying a mutation rate.

- **Variable rate (relaxed) molecular clock models** |
Implements the uncorrelated relaxed clock models of Drummond, Ho, Phillips & Rambaut (2006, PLoS Biology) see below for full citation.

- **Divergence date estimates** |
Dates of divergence for specific most recent common ancestors (MRCA) can be estimated.

- **Non-contemporaneous sequences (TipDate) molecular clock models** |
When the differences in the dates associated with the sequences comprise a significant proportion of the age of the entire tree, these dates can be incorporated into the model providing a source of information about the rate of substitution.

- **Substitution model heterogeneity across sites** |
Different substitution models can be specified for different sets of sites. For example, each codon position can be allowed a different substitution matrix and gamma model of rate heterogeneity.

- **Flexible model specification** |
The model-specification file format allows considerable flexibility. For example, it is possible to specify that each codon position has a different rate, a different degree of rate heterogeneity but the same transition/transversion ratio.

- **Range of substitution models** |
Available substitution models include HKY and GTR for nucleotides, Blosum62, CPREV, JTT, MTREV, WAG and Dayhoff for amino acids and the model of Yang and Nielsen (1998) for codons.

- **Flexible choice of priors on parameters** |
Any parameter can be given a prior. For example, the age of the root of the tree can be given an exponential prior with a given mean.

- **Coalescent models of population size and growth** |
Various models of coalescent population growth can be used. At present, constant size and exponential growth are available but more will be added soon. These models basically act as priors on the ages of nodes in the tree but the parameters (population size and growth rate) can be sampled and estimated.

- **Multi-locus coalescent models** |
Two unlinked genes can be given the same coalescent population model but a different substitution process and tree, allowing the production of multi-locus coalescent inference.

- **Local clock molecular clock models** |
Allowing different clades in the tree to have different rates (or indeed, completely different substitution processes).

## Acknowledgements

### Developers

As an Open Source project, BEAST has been has has contributions and assistance from a large number of people over the years. In particular we would like to thank:

Alex Alekseyenko, Daniel Ayres, Guy Baele, Trevor Bedford, Peter Beerli, Filip Bielejec, Erik Bloomquist, Aaron Darling, Gytis Dudas, Roald Forsberg, Matthew Hall, Jess Hedge, Joseph Heled, Simon Ho, Sebastian Hoehna, Mark Holder, Denise Kuehnert, Philippe Lemey, Paul Lewis, Wai Lok Sibon Li, Gerton Lunter, Sam Lycett, Sidney Markowitz, Vladimir Minin, Michael Defoin Platel, Oliver Pybus, Tulio de Oliveira, Jayna Ragwani, Beth Shapiro, Korbinian Strimmer, David Swofford, Chieh-Hsi Wu, Walter Xie, Ziheng Yang

### Funding

BEAST has been supported at various times by:

ERC

NIH

The Wellcome Trust

BBSRC

The Royal Society of London

{% include image.html file="beast.png" url="http://beast-dev.github.io/doc" max-width="128px" alt="logo" caption="The BEAST logo is from a plate in Ernst Haeckel's Kunstformen der Natur (Artforms of nature) (1904)." %}

{% include links.html %}

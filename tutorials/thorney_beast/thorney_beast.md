---
title: Approaches for analyzing large phylogenetic datasets
keywords: Big data, SARS-CoV-2, COVID-19, tutorial
last_updated: January 7, 2021
tags: [tutorial]
summary: 'This tutorial offers a summary of approaches that can be used to more efficiently analyze large datasets with
an emphasis on methods targeted at SARS-CoV-2.'
sidebar: beast_sidebar
permalink: thorney_beast.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/thorney_beast/{% endcapture %}


## Introduction

The SARS-CoV-2 pandemic highlighted the importance and challenge of large-scale molecular epidemiology. Through 
Herculean effort, academic and public health labs over the world have undertaken genomic sequencing on a scale that 
dwarfs any previous outbreak response. The magnitude of the resulting dataset makes many standard phylogenetic
approaches impractical. Here, we highlight some recent modifications we have made to make the analysis of tens of thousand of 
taxa in BEAST feasible on a time-scale that can help inform public health responses.

Many of these improvements are based on re-implementations of approaches used in other phylogenetic software, and we
are grateful to the entire phylogenetic community. Incorporating these approaches allows us to leverage the full
suite of models already available in BEAST. While the model used here dates back to Zuckerkandl E, Pauling L. 1962, this 
implementation was inspired by [Didelot et al., 2018](https://doi.org/10.1093/nar/gky783).

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
All the analyses described here can be performed using the <a> BEASTX.5.betaXXXX </a>pre-release.
</div>

*NB: To the best of our knowledge Jeff Thorne and colleges work in [multidivtime](https://brcwebportal.cos.ncsu.edu/thorne/multidivtime.html) 
represents the first implementation of related approaches in a Bayesian framework.
In recognition of that work we colloquially refer to this approach as Thorney BEAST.*

### A note about efficiency 

The cost of an operation in a standard BEAST analysis is the product of how long that operation
takes, and how many times it is called. In any analysis calculating the likelihood of the sequence data over a tree (tree-data-likelihood) 
is the most computationally taxing step. BEAST mitigates this by delegating to the BEAGLE library, which limits this cost by
caching calculations on subtrees that remain unchanged between states, and computing the likelihood in parallel on high 
performance GPUs when available. These approaches reduce the number of times the full likelihood is calculated and
increase the speed of that calculation when it is needed. The analysis can be sped up further by fixing the substitution
model parameters and clock rate, if reasonable estimates exists, as sampling these parameters requires a full 
recalculation.

Although the cost of the tree-data-likelihood can be greatly reduced by fixing the parameters that govern the substitution model, 
estimates of the these parameters are not always transferable between datasets, even datasets from the same
pandemic. This is certainly true of SARS-CoV-2 where estimates of the rate can vary based on the time-scale and context of the 
data. Even when it is valid to fix these parameters, large datasets become challenging for a second reason. 
All GPUs have finite memory, and it is challenging if not impossible to find hardware configurations that 
can cope with alignments of tens of thousands of sequences. 

## An alternative likelihood function

Based on these challenges, we have implemented a more efficient likelihood based on 
a simple Poisson model commonly used in maximum likelihood methods that scale genetic phylogenies into time trees
(See [Didelot et al., 2020](https://doi.org/10.1093/molbev/msaa193) for a thorough discussion of these methods). 
Instead of an alignment, this likelihood takes a pre-estimated, rooted phylogeny with branch lengths that can be scaled to the 
number of expected substitutions/site. 

To get started, we will import a rooted, pre-estimated tree as a data partition in BEAUTI.
Select `Import Data` at the bottom of the partitions panel, select the `1K_SARS-CoV-2.nexus` file included with this tutorial,
 and when prompted to `Create tree-as-data partition` select yes. (Note this file is a nexus, but a newick tree will work as well).

<img src="{{ root_url }}images/tree-as-data-partition.png"/>

We should now see our tree listed as partition.
<img src="{{ root_url }}images/loaded-data.png"/>


From here most of the set up follows a standard BEAST analysis.

Under the Tips pannel, we can parse tip dates from these taxa labels.

<img src="{{ root_url }}images/taxa.png"/>

In this initial analysis we are not including a phylogeographic component, but we could add such an analysis by
importing trait data in the Traits pannel. Since we are just scaling a pre-estimated divergence tree  into time
we do not need a Sites model, and can skip right to the Clocks panel. 

In this case we are using a strict clock, but this approach is compatible with any non-hamiltonian clock model.
The gradients needed for HMC operators have not yet been implemented for this data type.

<img src="{{ root_url }}images/taxa.png"/>

The magic happens in the next panel  - Trees. Here we select both the tree prior and Thorney tree model.
For this analysis we will use the bayesian skygrid, with a cut off of three quarters of year, and nearly weekly gridpoints (39 parameters).

On the bottom half of the panel we select `ThorneyBEAST` as the 'Tree as data model', and set the scaler to 29903 - the length of the alignment used to build the tree. 
The number of mutation on each branch will be calculated by multiplying branchlengths in the input tree by this number and rounding to the nearest whole number.

<img src="{{ root_url }}images/tree.png"/>

We can then adjust priors an operators as we see fit in the Priors and Operators panel. 

*NB: the default ctmc reference prior for evolutionary rate can add some computational burden on large trees.
If a gamma(0.001,1000) distribution is appropriate, it may provide some computational speed ups on large datasets.*

<img src="{{ root_url }}images/priors.png"/>

## Operators

One of the advantages of this approach over fixed tree approach is that we are able to sample polytomy resolutions
from the posterior. Standard tree operators are used to do this, but they are constrained to respect the clades present
in the input tree. If the input tree is fully resolved these operators should be removed.


<img src="{{ root_url }}images/operators.png"/>


We can then generate and run the xml as usual.

<img src="{{ root_url }}images/mcmc.png"/>


## References
Zuckerkandl E , Pauling L. 1962. Molecular disease, evolution, and genic heterogeneity. In: Kasha M , Pullman B, editors. Horizons Biochem. New York: Academic Press. p. 189–222

[Xavier Didelot, Nicholas J Croucher, Stephen D Bentley, Simon R Harris, Daniel J Wilson, Bayesian inference of ancestral dates on bacterial phylogenetic trees, Nucleic Acids Research, Volume 46, Issue 22, 14 December 2018, Page e134](https://doi.org/10.1093/nar/gky783)

[Xavier Didelot, Igor Siveroni, Erik M Volz, Additive Uncorrelated Relaxed Clock Models for the Dating of Genomic Epidemiology Phylogenies, Molecular Biology and Evolution](https://doi.org/10.1093/molbev/msaa193)

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}

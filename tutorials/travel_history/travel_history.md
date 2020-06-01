---
title: Accommodating individual travel history in discrete phylogeographic diffusion
keywords: travel history, phylogeography, SARS-CoV-2, COVID-19, tutorial
last_updated: June 1, 2020
tags: [tutorial]
summary: 'This chapter provides a step-by-step tutorial on accommodating/including the travel history of individuals '
sidebar: beast_sidebar
permalink: travel_history.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/travel_history/{% endcapture %}

{% include warning.html content="The methodology discussed in this tutorial is currently under review. Further changes to the XML format may still occur." %}

## Introduction






## Data set

The example data set here consists of 9 SARS-CoV-2 sequences, sampled from 3 different locations: Australia (4), Italy (3) and Wuhan (2).
We refer to the pre-print (Lemey et al., 2020) for a large real-life analysis from the SARS-CoV-2 pandemic.

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> All the analyses described here can be performed using the following
<a href="{{ root_url }}files/beast_travel_history.jar"> BEAST 1.10.5 jar file</a>.
</div>
 

## Discrete phylogeographic inference

Discrete (trait) phylogeographic inference attempts to reconstruct an ancestral location-transition history along a phylogeny based on the discrete states associated with the sampled sequences.
This approach treats the phylogeny as random, which is critical to accommodate phylogenetic uncertainty.
Three different procedures listed below can be considered to perform this type of phylogeographic inference.

### Using only location of sampling

When the sampling location of a sequence is available, the tip state for that sequence in the phylogeny can be set to this location.
This corresponds to the classic discrete phylogeographic inference scenario (Lemey et al., 2009), and is typically used in the absence of travel (history) information.



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_sampled.xml"> can be downloaded from here</a>.
</div>




### Using the location from which an individual travelled

or the location from which the individual travelled  (assuming that this was the location from which the infection was acquired)





### Using location of sampling and travel history








## References
* [P. Lemey, A. Rambaut, A. J. Drummond, and M. A. Suchard. 2009. Bayesian phylogeography finds its roots. PLoS Computational Biology 5:e1000520.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000520)
* [P. Lemey, S. Hong, V. Hill, G. Baele, C. Poletto, V. Colizza, A. O'Toole, J. T. McCrone, K. G. Andersen, M. Worobey, M. I. Nelson, A. Rambaut, and M. A. Suchard. 2020. Accommodating individual travel history, global mobility, and unsampled diversity in phylogeography: a SARS-CoV-2 case study. Submitted.](still needs to be submitted)

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}




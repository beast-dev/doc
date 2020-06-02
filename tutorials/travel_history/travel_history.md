---
title: Accommodating individual travel history in discrete phylogeographic diffusion
keywords: travel history, phylogeography, SARS-CoV-2, COVID-19, tutorial
last_updated: June 2, 2020
tags: [tutorial]
summary: 'This chapter provides a step-by-step tutorial on accommodating/including the travel history of multiple individuals into discrete phylogeographic analysis.'
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

These approaches differ in the way that the sampling locations and travel history are being used/accommodated.
The other analysis specifications are however identical: an exponentially growing population size, a single substitution model across the entire alignment (HKY+G) and a strict molecular clock model.
The default prior on the growth rate of the coalescent model has been replaced by the following:

```xml
    <laplacePrior mean="0.0" scale="100.0">
        <parameter idref="exponential.growthRate"/>
    </laplacePrior>
```

In the following 3 subsections, we show how to specify 3 different discrete phylogeographic approaches and discuss how they impact inference results.


### Using only location of sampling

When the sampling location of a sequence is available, the tip state for that sequence in the phylogeny can be set to this location.
This corresponds to the classic discrete phylogeographic inference scenario (Lemey et al., 2009), and is typically used in the absence of travel (history) information.
As a result, only the 3 sampling locations are part of the location data type in the XML specification:

```xml
    <generalDataType id="loc.dataType">
        <state code="Australia"/>
        <state code="Italy"/>
        <state code="Wuhan"/>
    </generalDataType>
```

Such an analysis can be completely specified using the current version of BEAUti without requiring any manual XML editing.



{% include image.html file="sampling_location.png" width="80%" prefix=root_url %}



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_sampled.xml"> can be downloaded from here</a>.
</div>


### Using the location from which an individual travelled

or the location from which the individual travelled  (assuming that this was the location from which the infection was acquired)

{% include image.html file="travel_origin_location.png" width="80%" prefix=root_url %}



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_origin.xml"> can be downloaded from here</a>.
</div>


### Using location of sampling and travel history

Unfortunately, neither of the two previous options offers a satisfactory solution.
Using only the location of sampling ignores important information about the ancestral location of the sequence, whereas using the travel location together with the collection date represents a data mismatch and ignores the final transitions to the location of sampling.
These events are particularly important when the infected traveller then produces a productive transmission chain in the sampling location.

We propose to accommodate individuals' travel histories by augmenting the phylogeny with ancestral nodes that are associated with a location state (but not with a known sequence) and hence enforce that ancestral location at a particular, possibly random point in the past of a lineage (see figure below).

{% include image.html file="concept_travel_history.png" width="80%" prefix=root_url %}





{% include image.html file="travel_origin_location.png" width="80%" prefix=root_url %}



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_travelHistory.xml"> can be downloaded from here</a>.
</div>




## References
* [P. Lemey, A. Rambaut, A. J. Drummond, and M. A. Suchard. 2009. Bayesian phylogeography finds its roots. PLoS Computational Biology 5:e1000520.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000520)
* [P. Lemey, S. Hong, V. Hill, G. Baele, C. Poletto, V. Colizza, A. O'Toole, J. T. McCrone, K. G. Andersen, M. Worobey, M. I. Nelson, A. Rambaut, and M. A. Suchard. 2020. Accommodating individual travel history, global mobility, and unsampled diversity in phylogeography: a SARS-CoV-2 case study. Submitted.](still needs to be submitted)

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}



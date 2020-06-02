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

Spatiotemporal bias in genome sequence sampling can severely confound phylogeographic inference based on discrete trait ancestral reconstruction.
This has impeded our ability to accurately track the emergence and spread of SARS-CoV-2, which is the virus responsible for the COVID-19 pandemic.
Along with the unprecedented accumulation of genomic sequences from across the world comes a vast collection of metadata on individual patients, such as - in some cases - details on their recent movements while already having been infected without having developed any symptoms.
This information can be exploited, as we will show here, in order to yield more realistic reconstructions of virus spread, particularly when travelers from undersampled locations are included to mitigate sampling bias.


## Data set

The example data set here consists of 9 SARS-CoV-2 sequences, sampled from 3 different locations: Australia (4), Italy (3) and Wuhan (2).
We refer to the pre-print (Lemey et al., 2020) for a large(r) real-life analysis from the COVID-19 pandemic.
All analyses have been performed in a custom build of BEAST 1.10.5 (see below for the download link; Suchard et al., 2018).
Including an individual's travel history requires manual XML editing in order to specify the different model components.

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
        <!-- Number Of States = 3 -->
        <state code="Australia"/>
        <state code="Italy"/>
        <state code="Wuhan"/>
    </generalDataType>
```

Such an analysis can be completely specified using the current version of BEAUti without requiring any manual XML editing.
We refer to the following tutorial for more information on how to set up this type of analysis: [phylogeographic diffusion in discrete space](workshop_discrete_diffusion) 

{% include image.html file="sampling_location.png" width="75%" prefix=root_url %}

The result of this inference is shown in the figure above; the branch color reflects the modal state estimate at the child node.
Using sampling location only results in an unrealistic Australian ancestry and two transitions from Australia to Italy, likely because Australia is represented by the largest number of tips.


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_sampled.xml"> can be downloaded from here</a>.
</div>


### Using the location from which an individual travelled

In the previous approach/section, the tip location state for a sequence was set to the location of sampling.
However, when information on travel history is available, the tip location state for a sequence can also be set to the location from which the individual travelled (assuming that this was the location from which the infection was acquired). 
Such an approach constitutes a small variation of standard discrete phylogeographic inference, and we show some of the changes to the provided location information here:

````xml
<taxa id="taxa">
    ...
    <taxon id="Australia/VIC01/2020|EPI_ISL_406844|2020-01-25">
        <date value="2020.0655737704917" direction="forwards" units="years"/>
        <attr name="loc">
            Wuhan
            <!-- travel: Wuhan -->
            <!-- sampled: Australia -->
        </attr>
    </taxon>
    ...
    <taxon id="Italy/INMI1-cs/2020|EPI_ISL_410546|2020-01-31">
        <date value="2020.0819672131147" direction="forwards" units="years"/>
        <attr name="loc">
            Wuhan
            <!-- travel: Wuhan -->
            <!-- sampled: Italy -->				
        </attr>
    </taxon>
    ...
</taxa>
````

The XML file below shows all the changes that were made in the ```<taxa>...</taxa>``` block to incorporate information on travel origin location.
As a result of including these additional travel origin locations, the data type that describes the number of locations for this analysis now contains 5 locations:

```xml
    <generalDataType id="loc.dataType">
        <!-- Number Of States = 5 -->
        <state code="Australia"/>
        <state code="Italy"/>
        <state code="Iran"/>
        <state code="SEasia"/>
        <state code="Wuhan"/>
    </generalDataType>
```

Other than replacing the sampling locations for some of the sequences with the locations where these individuals were infected, and augmenting the number of possible locations in the data type accordingly, the rest of the XML file remains unchanged compared to the previous approach. 

{% include image.html file="travel_origin_location.png" width="75%" prefix=root_url %}

The result of this inference is shown in the figure above; the branch color reflects the modal state estimate at the child node.
Using the location of travel origin results in a reconstruction that better matches the one including travel history in terms of inferring an ancestry in Hubei, but misses transitions along four tip branches and differs from the reconstruction including travel history for the upper two Italian genomes.
Specifically it implies a transition from Hubei for the Italian patient that does not have travel history. 


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_origin.xml"> can be downloaded from here</a>.
</div>


### Using location of sampling and travel history

Unfortunately, neither of the two previous options offers a satisfactory solution.
Using only the location of sampling ignores important information about the ancestral location of the sequence, whereas using the travel location together with the collection date represents a data mismatch and ignores the final transitions to the location of sampling.
These events are particularly important when the infected traveller then produces a productive transmission chain in the sampling location.

We propose to accommodate individuals' travel histories by augmenting the phylogeny with ancestral nodes that are associated with a location state (but not with a known sequence) and hence enforce that ancestral location at a particular, possibly random point in the past of a lineage (see figure below).


```xml
    <generalDataType id="loc.dataType">
        <!-- Number Of States = 5 -->
        <state code="Australia"/>
        <state code="Italy"/>
        <state code="Iran"/>
        <state code="SEasia"/>
        <state code="Wuhan"/>
    </generalDataType>
```


{% include image.html file="concept_travel_history.png" width="75%" prefix=root_url %}





{% include image.html file="travel_origin_location.png" width="75%" prefix=root_url %}



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_travelHistory.xml"> can be downloaded from here</a>.
</div>




## References

* [P. Lemey, A. Rambaut, A. J. Drummond, and M. A. Suchard. 2009. Bayesian phylogeography finds its roots. PLoS Computational Biology 5:e1000520.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000520)
* [P. Lemey, S. Hong, V. Hill, G. Baele, C. Poletto, V. Colizza, A. O'Toole, J. T. McCrone, K. G. Andersen, M. Worobey, M. I. Nelson, A. Rambaut, and M. A. Suchard. 2020. Accommodating individual travel history, global mobility, and unsampled diversity in phylogeography: a SARS-CoV-2 case study. Submitted.](still needs to be submitted)
* [M. A. Suchard, P. Lemey, G. Baele, D. L. Ayres, A. J. Drummond, and A. Rambaut. 2018. Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution 4(1):vey016.](https://academic.oup.com/ve/article/4/1/vey016/5035211)


## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}




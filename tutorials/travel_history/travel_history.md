---
title: Accommodating individual travel history in discrete phylogeographic diffusion
keywords: travel history, phylogeography, SARS-CoV-2, COVID-19, tutorial
last_updated: June 2, 2020
tags: [tutorial]
summary: 'This tutorial provides a step-by-step explanation on accommodating/including the travel history of multiple individuals into discrete phylogeographic analysis.'
sidebar: beast_sidebar
permalink: travel_history.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/travel_history/{% endcapture %}


## Introduction

Spatiotemporal bias in genome sequence sampling can severely confound phylogeographic inference based on discrete trait ancestral reconstruction.
This has impeded our ability to accurately track the emergence and spread of SARS-CoV-2, which is the virus responsible for the COVID-19 pandemic.
Along with the unprecedented accumulation of genomic sequences from across the world comes a vast collection of metadata on individual patients, such as - in some cases - details on their recent movements while already having been infected without having developed any symptoms.
This information can be exploited, as we will show here, in order to yield more realistic reconstructions of virus spread, particularly when travelers from undersampled locations are included to mitigate sampling bias.


## Example data set

The small example data set here consists of 9 SARS-CoV-2 sequences, sampled from 3 different locations: Australia (4), Italy (3) and Wuhan (2).
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
Using the location of travel origin results in a reconstruction misses transitions along four tip branches and differs from the reconstruction including travel history for the upper two Italian genomes.
Specifically it implies a transition from Hubei for the Italian patient that does not have travel history. 


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_origin.xml"> can be downloaded from here</a>.
</div>


### Using location of sampling and travel history

Unfortunately, neither of the two previous approaches offers a satisfactory solution.
Using only the location of sampling ignores important information about the ancestral location of the sequence, whereas using the travel location together with the collection date represents a data mismatch and ignores the final transitions to the location of sampling.
These events are particularly important when the infected traveller then produces a productive transmission chain in the sampling location.

We propose to accommodate individuals' travel histories by augmenting the phylogeny with ancestral nodes that are associated with a location state (but not with a known sequence) and hence enforce that ancestral location at a particular, possibly random point in the past of a lineage.
Apart from the standard ```<taxa>...</taxa>``` block in the XML file, we hence need to provide the origin location of each individual's travel when available.
For our data set of 9 sequences, this additional XML block looks as follows:
 
```xml
<!-- Travel history: defining ancestral node taxa with their discrete trait state -->
    <taxa id="ancestralTaxa">
        <taxon id="Australia/NSW11/2020|EPI_ISL_413597|2020-03-02_ancestor_taxon">
            <attr name="loc">
                Iran
            </attr>
        </taxon>
        <taxon id="Australia/NSW09/2020|EPI_ISL_413595|2020-02-28_ancestor_taxon">
            <attr name="loc">
                SEasia
            </attr>
        </taxon>
        <taxon id="Australia/VIC01/2020|EPI_ISL_406844|2020-01-25_ancestor_taxon">
            <attr name="loc">
                Wuhan
            </attr>
        </taxon>
        <taxon id="Australia/QLD02/2020|EPI_ISL_407896|2020-01-30_ancestor_taxon">
            <attr name="loc">
                Wuhan
            </attr>
        </taxon>
        <taxon id="Italy/INMI1-cs/2020|EPI_ISL_410546|2020-01-31_ancestor_taxon">
            <attr name="loc">
                Wuhan
            </attr>
        </taxon>
    </taxa>
```

The combined collection of discrete locations (i.e. sampling location and origin location of each travelling individual) then make up the 5 possible states of the location data type:

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

The figure below illustrates the concept of introducing ancestral nodes associated with locations from which travellers returned.
The ancestral nodes are indicated by arrows for five cases relating them to the genomes sampled from the travellers, and are introduced at different times in the ancestral path of each sampled genome.

{% include image.html file="concept_travel_history.png" width="75%" prefix=root_url %}

When a sampled traveller returned from location of origin to her/his destination, we take note of the time when the traveller started the return journey to her/his destination. 
At this time point in the ancestral path of the tip (indicated with arrows for the 5 relevant tips), we introduce an ancestral node and associate it with the location of origin in order to inform the reconstruction that at this point in time the lineage was in that location.
The upper arrow in the figure above represents the information introduced for the traveller that returned from Hubei to Italy.
The same procedure is applied to the four genomes from travellers returning to Australian from Hubei, Iran, Southeast Asia and Hubei again (from top to bottom in the figure above). 

To specify this information in the XML, the standard ```<treeModel>``` is still defined and passed along to a new ```<ancestralTraitTreeModel>```:

```xml
<!-- Travel history: defining ancestral trait tree model: in this case times are defined since the tip height (relativeToTipHeight="true") -->
    <ancestralTraitTreeModel id="ancestralTraitTreeModel">
        <treeModel idref="treeModel"/>
        <ancestor>
            <taxon idref="Australia/NSW11/2020|EPI_ISL_413597|2020-03-02_ancestor_taxon"/>
            <parameter id="pseudoBranchLength1" value="0.000" lower="0.0"/>
            <ancestralPath relativeToTipHeight="true">
                <taxon idref="Australia/NSW11/2020|EPI_ISL_413597|2020-03-02"/>
                <parameter id="time1" lower="0.0" value="0.02739726"/>
            </ancestralPath>
        </ancestor>
        <ancestor>
            <taxon idref="Australia/NSW09/2020|EPI_ISL_413595|2020-02-28_ancestor_taxon"/>
            <parameter id="pseudoBranchLength2" value="0.000" lower="0.0"/>
            <ancestralPath relativeToTipHeight="true">
                <taxon idref="Australia/NSW09/2020|EPI_ISL_413595|2020-02-28"/>
                <parameter id="time2" lower="0.0" value="0.02739726"/>
            </ancestralPath>
        </ancestor>
        <ancestor>
            <taxon idref="Australia/VIC01/2020|EPI_ISL_406844|2020-01-25_ancestor_taxon"/>
            <parameter id="pseudoBranchLength3" value="0.000" lower="0.0"/>
            <ancestralPath relativeToTipHeight="true">
                <taxon idref="Australia/VIC01/2020|EPI_ISL_406844|2020-01-25"/>
                <parameter id="time3" lower="0.0" value="0.016438356"/>
            </ancestralPath>
        </ancestor>
        <ancestor>
            <taxon idref="Australia/QLD02/2020|EPI_ISL_407896|2020-01-30_ancestor_taxon"/>
            <parameter id="pseudoBranchLength4" value="0.000" lower="0.0"/>
            <ancestralPath relativeToTipHeight="true">
                <taxon idref="Australia/QLD02/2020|EPI_ISL_407896|2020-01-30"/>
                <parameter id="time4" lower="0.0" value="0.008219178"/>
            </ancestralPath>
        </ancestor>
        <ancestor>
            <taxon idref="Italy/INMI1-cs/2020|EPI_ISL_410546|2020-01-31_ancestor_taxon"/>
            <parameter id="pseudoBranchLength5" value="0.000" lower="0.0"/>
            <ancestralPath relativeToTipHeight="true">
                <taxon idref="Italy/INMI1-cs/2020|EPI_ISL_410546|2020-01-31"/>
                <parameter id="time5" lower="0.0" value="0.016438356"/>
            </ancestralPath>
        </ancestor>
    </ancestralTraitTreeModel>
```

Inserting the travel history for 5 individuals (which are referenced through their taxon ID) hence leads to 5 ```<ancestor>``` XML elements being created in the ```<ancestralTraitTreeModel>``` XML block.
In the XML code above, the travel history for an individual is specified using the ```<ancestralPath>``` XML element, with a node height (reflecting the travel time) relative to the sampling time for the inserted ancestral node without sequence data.
We note that the travel time can be treated as a random variable in case the time of travelling to the sampling location is not known (with sufficient precision).
We make use of this ability for the genomes associated with a travel location but without a clear travel time; in this particular example, we apply this approach to the first two Australian samples.
The other 3 samples are provided with the actual travel times, expressed as the number of days before these samples were taken: 6 and 3 days for the other 2 Australian samples, and 6 days for the Italian sample. 
Before we go into more detail, note that (again) instead of providing a reference to ```<treeModel>``` to the ```<ancestralTreeLikelihood>...</ancestralTreeLikelihood>```, we have to provide a reference to the constructed ```<ancestralTraitTreeModel>```:

```xml
    <ancestralTreeLikelihood id="loc.treeLikelihood" stateTagName="loc.states" useUniformization="true" saveCompleteHistory="false" logCompleteHistory="false">
        <attributePatterns idref="loc.pattern"/>
        <!-- Travel history: referring ancestral trait tree model instead of standard treeMdodel-->
        <ancestralTraitTreeModel idref="ancestralTraitTreeModel"/>
        <siteModel idref="loc.siteModel"/>
        <generalSubstitutionModel idref="loc.model"/>
        <strictClockBranchRates idref="loc.branchRates"/>
    </ancestralTreeLikelihood>
```

As mentioned before, in our Bayesian inference we specify normal prior distributions on the travel times, informed by an estimate of time of infection and truncated to be positive (back-in-time) relative to sampling date.
Specifically, we use a mean of 10 days before sampling based on a mean incubation time of 5 days (Lauer et al., 2020) and a constant ascertainment period of ​5 days between symptom onset and testing (Ferguson et al., 2020), and a standard deviation of 3 days to incorporate the uncertainty on the incubation time.
As mentioned before, we apply such a prior distribution to the travel times of the two first Australian samples as follows:

```xml
    <prior id="prior">
        ...
        <!-- Travel history: priors on two uncertain ancestral times; the mean corresponds to 10 days, the standard deviation to approximately 3 days -->
        <normalPrior mean="0.02739726" stdev="0.006989097">
            <parameter idref="time1"/>
        </normalPrior>
        <normalPrior mean="0.02739726" stdev="0.006989097">
            <parameter idref="time2"/>
        </normalPrior>
        ...
    </prior>
```

To complete the XML specification, we still need to add in transition kernels to estimate the travel times for the two Australian samples:

```xml
    <operators id="operators" optimizationSchedule="log">
    ...
    <!-- Travel history: sampling two uncertain ancestral times -->
        <scaleOperator scaleFactor="0.75" weight="0.05">
            <parameter idref="time1"/>
        </scaleOperator>
        <scaleOperator scaleFactor="0.75" weight="0.05">
            <parameter idref="time2"/>
        </scaleOperator>
    ...
    </operators>
```

The result of this inference is shown in the figure below; the branch color reflects the modal state estimate at the child node.
Incorporating travel history in discrete phylogeographic inference yields more realistic reconstructions of virus spread compared to currently available approaches.

{% include image.html file="sampling_location_travel_history.png" width="75%" prefix=root_url %}



<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The BEAST 1.10.5 XML file corresponding to this analysis
<a href="{{ root_url }}files/9seqs_travelHistory.xml"> can be downloaded from here</a>.
</div>


## Summarizing and visualizing phylogeographic estimates
In addition to the standard tools to summarize and visualizing Bayesian phylogeographic estimates (e.g. TreeAnnotator, FigTree, spreaD3), we also make available a tool as part of the BEAST distribution to summarize the spatial trajectories in the ancestral history of specific taxa (TaxaMarkovJumpHistoryAnalyzer) or the entire transition history (TreeMarkovJumpHistoryAnalyzer) based on tree distributions annotated with Markov jump histories.
To visualize the spatial trajectories in the ancestral history of specific taxa, a new R package (MarkovJumpR) is available at [here]: (https://github.com/beast-dev/MarkovJumpR). This package can be installed in R via devtools::install_github("beast-dev/MarkovJumpR").

## References

* [P. Lemey, A. Rambaut, A. J. Drummond, and M. A. Suchard. 2009. Bayesian phylogeography finds its roots. PLoS Computational Biology 5:e1000520.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000520)
* [P. Lemey, S. Hong, V. Hill, G. Baele, C. Poletto, V. Colizza, A. O'Toole, J. T. McCrone, K. G. Andersen, M. Worobey, M. I. Nelson, A. Rambaut, and M. A. Suchard. 2020. Accommodating individual travel history, global mobility, and unsampled diversity in phylogeography: a SARS-CoV-2 case study. Submitted.](still needs to be submitted)
* [M. A. Suchard, P. Lemey, G. Baele, D. L. Ayres, A. J. Drummond, and A. Rambaut. 2018. Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution 4(1):vey016.](https://academic.oup.com/ve/article/4/1/vey016/5035211)
* [S. A. Lauer, K. H. Grantz, Q. Bi, F. K. Jones, Q. Zheng, H. R. Meredith, A. S. Azman, N. G. Reich, and J. Lessler. 2020. The incubation period of coronavirus disease 2019 (COVID-19) from publicly reported confirmed cases: estimation and application. Annals of Internal Medicine 172:577-582.](https://www.acpjournals.org/doi/10.7326/M20-0504)
* [N. M. Ferguson, D. Laydon, G. Nedjati-Gilani, N. Imai, K. Ainslie, M. Baguelin, S. Bhatia, A. Boonyasiri, Z. Cucunubá, G. Cuomo-Dannenburg, A. Dighe, I. Dorigatti, H. Fu, K. Gaythorpe, W. Green, A. Hamlet, W. Hinsley, L. C. Okell, S. van Elsland, H. Thompson, R. Verity, E. Volz, H. Wang, Y. Wang, P. G. T. Walker, C. Walters, P. Winskill, C. Whittaker, C. A. Donnelly, Steven Riley, A. C. Ghani. 2020. Report 9: Impact of non-pharmaceutical interventions (NPIs) to reduce COVID-19 mortality and healthcare demand.](https://www.imperial.ac.uk/media/imperial-college/medicine/sph/ide/gida-fellowships/Imperial-College-COVID19-NPI-modelling-16-03-2020.pdf)


## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}




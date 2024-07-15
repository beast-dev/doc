---
title: Practical genomic epidemiology
keywords: phylodynamics, genomic epidemiology, nipah
last_updated: July 11, 2024
tags: [tutorial, workshop]
summary: "This tutorial presents an outbreak scenario at various timepoints and provides a step-by-step explanation on how to address the various unknowns using genome sequences and phylogenetics. The outbreak scenario starts with a small number of initial cases and we will initially identify the pathogen and perform some initial characterisation of the cases. Once the pathogen is known, we will get a curate an appropriate background set to contextualise The second timepoint brings us to later in the outbreak, with more cases reported and some local wildlife sampling carried out. We will determine the mode of transmission, identify any clusters that exist and estimate the growth rate and R0 of the outbreak."
sidebar: beast_sidebar
permalink: workshop_genomic_epidemiology.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/workshop_genomic_epidemiology/{% endcapture %}


## Introduction

Genomic epidemiology combines classical epidemiological methods with genome sequence data to track and monitor both endemic pathogens and the emergence and spread of novel pathogens. In this tutorial, we will follow an outbreak through different phases and use phylogenetic methods to answer questions pertinent to understanding and controlling the outbreak.

Disclaimer: this outbreak is a fictional scenario based on simulated data. It is not intended to be predictive or relate to any real-world outbreak, and any similarities are coincidental. 

To undertake this tutorial, you will need to download a number of software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> All the files needed for this tutorial
<a href="{{ root_url }}files/outbreak.zip"> can be downloaded from here</a>. 
If you download this zipped folder, there is no need to download other files/folders linked further in the tutorial.
</div>

## EXERCISE 1: A cluster of cases of unknown aetiology

{% include sitrep.html content='As of 30th June 2024, 20 cases of acute respiratory infections have been reported with 7 deaths. A subset of patients have presented with dizziness, fatigue and some more severe neurological symptoms. The infectious agent is currently unknown, however metagenomic sequencing of reported cases has been carried out. We await results from the bioinformatics team.
' %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>outbreak.seq_run_1.fasta</samp>' and <a href="{{ root_url }}files/outbreak.seq_run_1.fasta">can be downloaded from here</a>.</div>

### Quick identification of causative pathogen

{% include question.html content='How many sequences are in the `outbreak.seq_run_1.fasta` file?' %}


{% include tip.html content='Each sequence header in a FASTA file starts with the `>` character' %}

Navigate in a web browser to [NCBI BLAST](https://blast.ncbi.nlm.nih.gov/). You should see the following screen:

{% include image.html file="image1.png" prefix=root_url %}  <br /><br />

Click on the button for "Nucleotide BLAST". This will redirect you to the below webpage.

{% include image.html file="image2.png" prefix=root_url %}  <br /><br />


To load a query sequence set, simply select the `Choose file` option, or alternatively open the `outbreak.seq_run_1.fasta` file and copy and paste into the box.

Default settings should be fine in this first instance (this will search all non-redundant records on NCBI). Click `BLAST` to run the search. 

You may need to wait a few minutes, but results should show up automatically.

{% include image.html file="image3.png" prefix=root_url %}  <br /><br />


{% include question.html content='<br>
Questions<br>
1. What are the top BLAST hits for your query sequences? <br>
2. How confident are those hits? <br>
3. How similar are they to something in the NCBI database?' %}

### Contextualising the sequences

Given the BLAST hits, it seems likely that the sequences are Henipavirus nipahense (NiV) genomes. To confirm this, and to investigate how the samples fit into the context of known NiV diversity, we will need to acquire a background dataset. For this we will use the NCBI Virus resource, which is a community portal for viral data that is archived on Genbank. 

Navigate to [NCBI Virus](https://www.ncbi.nlm.nih.gov/labs/virus/) and click on `Search by virus name`.
{% include image.html file="image5.png" prefix=root_url %}  <br /><br />

You can begin typing in `Nipah` and the species name should appear. 
{% include image.html file="image4.png" prefix=root_url %}  <br /><br />

Click on the species name (`Henipavirus nipahense`) and this will redirect you to the NiV records.


{% include question.html content='<br>
Questions<br>
1. How many records are there? <br>
2. Would we want to download all of them? (Hint: look at the sequence lengths)' %}

These records can be filtered by length, completeness and a variety of other factors as shown below. 

{% include image.html file="image6.png" prefix=root_url %}  <br /><br />


For the purposes of this exercise, we have already prepared all the complete records available for NiV that had a date and location of collection. This background dataset has been curated and headers annotated with consistent fields:

{% include question.html content='<br>
`>Accession|Virus|Country|Host|CollectionDate`<br>
For example:<br>
`>MH523641|NiV|India|human|2018-05-21`'
 %}
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>NiV_background.with_outbreak.seq_run_1.fasta</samp>' and <a href="{{ root_url }}files/outbreak_seq_run_1.NiV_background.fasta">can be downloaded from here</a>. It will need to be decompressed before use.<br>
This file has both the initial case sequences and the background dataset combined into one file. If actually creating this dataset, you would need to combine these files yourself (either copy & paste, or through the command line).</div>

However, ordinarily you can download the dataset by clicking the Download button indicated below:

{% include image.html file="image7.png" prefix=root_url %}  <br /><br />


{% include tip.html content='<br>
The fields can be customised when Downloading from NCBI Virus, however it is always a good idea to curate the headers of your dataset. <br>
- Best practice for phylogenetics is to delimit the FASTA header fields with `|`<br>
- Ensure date formats are in ISO YYYY-MM-DD format, and best practice is to have them as the last field in the header<br>
- Do not put whitespace (spaces) into a FASTA ID. It is possible to annotate a FASTA file with a description, however this may be lost during phylogenetic analysis.<br>
- Avoid overly long FASTA sequence headers as they make it difficult to read a phylogeny. To shorten headers, remove redundant information and consider possible contractions (e.g. NiV instead of Henipavirus nipahense). <br>
- Avoid special characters in a FASTA sequence header. This includes but is not limited to: `,`, `;`, `(`, `)`, `[`,`]`, `&`. The reason for this is that many of these are characters used to write out a phylogenetic tree string and although many software will handle this, it may be a source of unexpected error!' %}


### Aligning the sequences

We now have our combined dataset, however before any trees can be built, we need to align them. Feel free to align with your preferred method, however this tutorial will use the MAFFT online version for alignment. [MAFFT](https://mafft.cbrc.jp/alignment/software/) has a variety of different algorithms, with varying speeds and precision. Today we'll just be using the AUTO option that selects the most appropriate for your input dataset. For full details about MAFFT and its models, see [Katoh et al 2002](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC135756/).

Navigate to the [MAFFT web server](https://mafft.cbrc.jp/alignment/server/). 

{% include image.html file="image8.png" prefix=root_url %}

We have provided the combined case genome sequences and NiV background set. Once you have decompressed the `NiV_background.with_outbreak.seq_run_1.fasta` file, select `Choose file` on the MAFFT web server and upload your file. We will run with the default AUTO mode (it may be useful to change the Title length field to 50, but not necessary), select `Submit`. 

When the alignment is complete the following screen will show:

When ready, return to the results page and click on `Fasta format` to download the alignment as a FASTA file. 


### Estimate a Maximum Likelihood tree

For the initial exploratory analysis, we want to quickly estimate a phylogeny to place our sequences into the known diversity of NiV. In order to do this, we will use IQTREE to estimate the phylogeny [Minh et al. 2020](https://academic.oup.com/mbe/article/37/5/1530/5721363?login=false). IQTREE2 can be run on the command line with more flexibility, but we will be using the web server in this tutorial [Trifinopoulos et al. 2016](https://academic.oup.com/nar/article/44/W1/W232/2499307?login=false).

To navigate to the web server, click the [W-IQTREE link](http://iqtree.cibiv.univie.ac.at/).

{% include image.html file="image13.png" prefix=root_url %}

#### Input data
Upload your alignment file to the server by clicking `Browse` and selecting the file. You can select DNA as the sequence type.

#### Substitution model options
We will bypass model selection for now, and just select the simple `HKY` substitution model. This is just a quick first look at the data.

#### Running IQTREE

All other parameters can be left as default. Scroll down and select `Submit job`. 

{% include image.html file="image14.png" prefix=root_url %}

Click `QUERY STATUS` to check on the run. When the job has finished the status bar on the left will say `Success`. 

{% include image.html file="image15.png" prefix=root_url %}


You can examine an ASCII version of the phylogeny in the Full Result tab, but to download the result, click `DOWNLOAD SELECTED JOBS` in the bottom left. Decompress the downloaded file and you'll see the contents contain the IQTREE log file, the result file and the treefile. 

{% include image.html file="image16.png" prefix=root_url %}


We will use `FigTree` to look at the treefile (the file ending in `.treefile`). 

Open the FigTree application and select to open the treefile, it will be displayed as arbitrarily rooted because we did not specify an outgroup during the quick run. Click on the `Tree` dropdown menu on the top bar and select `Midpoint Root`.

{% include image.html file="image18.png" prefix=root_url %}

This will re-root the phylogeny and provide a more balanced tree view in the absense of a known outgroup.

{% include tip.html content='You may notice IQTREE has modified the headers of the FASTA sequences and converted pipes (`|`) to underscores (`_`). This is fine for our exploratory purposes, but know that command-line IQTREE2 does not do this and be aware that the tip-labels in the tree will now be not exactly identical to the FASTA sequence headers.' %}

Examine the phylogeny.

{% include question.html content='
Questions:<br>
1. What does this phylogeny tell you about the cases? Do they cluster together?<br>
2. Is there good support for this?<br>
3. What can you say about the outbreak?
'%}

### When did this outbreak arise?

Even with just these few sequences it may be possible to ascertain some key information about this outbreak (such as when it likely began and how quickly it is spreading).

Use the [TempEst tutorial](https://beast.community/tempest_tutorial) as a guide to load the `outbreak.seq_run_1.fasta` file into `TempEst` to assess whether there is temporal signal in the data. Parse the tip dates by selecting `Parse dates` in the Sample Dates tab, and select `Best fitting root` in the top-left side of the application. 

Take a look at the root-to-tip and residual tabs.  
{% include image.html file="image19.png" prefix=root_url %}
{% include question.html content='
Questions:<br>
1. What does TempEst estimate the rate to be? Does this seem sensible?<br>
2. What is the estimated tMRCA?<br>
3. Is there good temporal signal?
'%}

Next, use BEAUTi to generate an XML file for BEAST to run. full step-by-step details can be found at 
in the [Rates and dates tutorial](https://beast.community/rates_and_dates). Add the `outbreak.seq_run_1.fasta` as a partition, in the `Tips` tab parse the dates from the tips and set an exponential growth model. It's a small dataset, with very little temporal signal, so on the `MCMC` tab set the chain length to a little longer (perhaps 100,000,000 states) and reduce logging frequency to every 10000 states. 
{% include image.html file="image20.png" prefix=root_url %}

When ready, click `Generate BEAST File...`. 

Run BEAST with your newly generated XML (detailed instructions on how to run BEAST can be found in the [First tutorial](https://beast.community/first_tutorial)). 

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> You can also access the precomputed BEAST output for this XML at <a href="{{ root_url }}files/outbreak.seq_run_1.beast_out.zip">this link</a>.</div>

Open `Tracer` and load the newly generated log file to assess the BEAST run (the [Rates and dates tutorial](https://beast.community/rates_and_dates) also includes some useful tips about importing into `Tracer` and interpreting the plots.). 


{% include tip.html content='If some statistics have very long tails, as is the case with the root age shown below, manually configure the range displayed in the chart by clicking `Setup...` or `Setup Chart`. The number of bins for the histogram can also be toggled.' %}


{% include image.html file="image21.png" prefix=root_url %}


{% include question.html content='
Questions:<br>
1. What is your assessment of the BEAST run?<br>
2. What is the root age estimate? How confident is this estimate? <br>
3. What is the clock rate estimate (and 95 HPD interval)? Does this make sense for NiV?
4. What would you suggest is needed for a better estimate?
'%}


Use `Tree Annotator` to produce a maximum clade credibility (MCC) tree from the `.trees` file and view in `FigTree`. Using the `FigTree` tutorial, set the Time Scale and display the 95 HPD for the height estimates on the nodes as shown below.

{% include image.html file="image23.png" prefix=root_url %}

{% include question.html content='
Questions:<br>
1. From the information available, what can you say about the origin of this outbreak?<br>'%}

## EXERCISE 2: Additional human cases spurs an investigation in animal population

{% include sitrep.html content='As of 12th July 2024, 60 human cases of Nipah have been reported. In additional to new cases, retrospective investigation has revealed a number of cases that had not previously been attributed to specific infectious agent. Liasing with the National Animal Health Agency has revealed a concurrent outbreak in NiV in livestock pigs. Of the cases in humans and pigs, a subset have been sent for targeted sequencing, however the results are not yet out. 
' %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data from the second sequencing run can be downloaded at <a href="{{ root_url }}files/outbreak.seq_run2.fasta.zip">this link</a>. The file will need to be decompressed.</div>

Download the provided FASTA alignment file and decompress. This FASTA file contains NiV genome sequences from both the initial sequencing run and a second sequencing run that contained both human and pig NiV samples. We will attempt to answer whether the human and animal outbreaks are linked and what is the source of these cases.

### Generate a maximum likelihood tree from the alignment

Using IQTREE as described above in EXERCISE 1, estimate a maximum likelihood phylogeny with the `outbreak.seq_run2.fasta` file. Inspect the phylogeny using `TempEst` (parse tip dates and select `best fitting root`). Note that the tips are labelled with host species. 
{% include image.html file="image23.png" prefix=root_url %}
{% include question.html content='
Questions:<br>
1. What does this phylogeny tell us about the human and pig outbreaks?<br>'%}

Examine the root-to-tip and residual plots. 
{% include image.html file="image24.png" prefix=root_url %}
{% include question.html content='
Questions:<br>
1. What is the estimated rate?<br>
2. What is the estimated tMRCA?<br>'%}

### Estimate a time tree and reconstruct ancestral host states

Launch BEAUTi and import the `outbreak.seq_run2.fasta` alignment.
{% include image.html file="image25.png" prefix=root_url %}<br><br>

Parse the tip dates on the `Tips` tab.
{% include image.html file="image26.png" prefix=root_url %}<br><br>

Navigate to the `Traits` tab and create a new trait called `host`. 
{% include image.html file="image27.png" prefix=root_url %}<br><br>

Select `Guess trait values` and indicate it is the fourth field in the pipe(`|`)-delimited header. 
{% include image.html file="image28.png" prefix=root_url %}<br><br>

Create a new partition with that trait called `host`. 
{% include image.html file="image29.png" prefix=root_url %}<br><br>

If you navigate back to the partitions tab, you'll see `host` has now appeared beneath the nucleotide partition.
{% include image.html file="image30.png" prefix=root_url %}<br><br>

Click on `host` in the Substitution model window (`Sites` tab) and keep the `Discrete Trait Substitution Model` as `Symmetric substitution model` but select the option to perform `BSSVS` (Infer social network with BSSVS). The symmetric substitution model specifies a discrete state ancestral reconstruction using a standard continuous-time Markov chain (CTMC), in which the transition rates between locations are reversible. Selecting the BSSVS option enables the Bayesian Stochastic Search Variable Selection procedure. This procedure will attempt to limit the number of rates (at least k-1, where k is the number of states) to only those that adequately explain the phylogenetic diffusion process.
{% include image.html file="image31.png" prefix=root_url %}<br><br>

In the `Trees` tab, we will set the `Tree Prior` to an Exponential Growth coalescent model.
{% include image.html file="image32.png" prefix=root_url %}<br><br>

Ensure under the `States` tab that the host partition is set to reconstruct the states of all ancestors (should be on by default). 
{% include image.html file="image33.png" prefix=root_url %}<br><br>

We are now ready to create the BEAST XML file. `Select Generate XML...`.  

Run `BEAST` using the newly generated XML as before.

Examine the output logfile in `Tracer`. 
{% include image.html file="image34.png" prefix=root_url %}<br><br>
{% include question.html content='
Questions:<br>
1. Has the increased sampling improved the BEAST run output?<br>
2. What is the estimated tMRCA? Look at the 95 HPD, has the confidence in the estimate improved with additional data?<br>
'%}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> You can also access the precomputed BEAST output for this XML at <a href="{{ root_url }}files/outbreak.seq_run_2.beast_out.zip">this link</a>.</div>


Combine the logged trees into a MCC tree using `TreeAnnotator`, check if the default burn in of 1,000,000 states is sufficient in `Tracer`. Vizualise the MCC tree in FigTree. Set the time scale on the X axis and toggle on the Node bars showing height 95 HPD.
{% include image.html file="image36.png" prefix=root_url %}<br><br>
{% include image.html file="image34.png" prefix=root_url %}<br><br>
{% include question.html content='
Questions:<br>
1. Has the root age HPD improved? Does it agree with the `TempEst` estimation?<br>
'%}

Colour the branches of the time tree by host. Look at the confidence values for that reconstruction.
{% include image.html file="image35.png" prefix=root_url %}<br><br>
{% include question.html content='
Questions:<br>
1. What does the reconstruction tell us?<br>
2. Does it make sense?<br>
3. What factors may have impacted this reconstruction?<br>
'%}

## References & Further Reading
- Drummond AJ, Rambaut A (2007) BEAST: Bayesian evolutionary analysis by sampling trees. BMC Evolutionary Biology 7: 214.
- Drummond AJ, Ho SYW, Phillips MJ & Rambaut A (2006) PLoS Biology 4, e88.
- Drummond AJ, Rambaut A & Shapiro B and Pybus OG (2005) Mol Biol Evol 22, 1185-1192.
- Drummond AJ, Nicholls GK, Rodrigo AG & Solomon W (2002) Genetics 161, 1307-1320.
- Dudas G, Carvalho LM, Rambaut A, Bedford T (2018) MERS-CoV spillover at the camel-human interface eLife 7:e31257.
- Ferreira, M. A. R. and M. A. Suchard. 2008. Bayesian analysis of elapsed times in continuous-time Markov chains. Can J Statistics, 36: 355–368. doi: 10.1002/cjs.5550360302
- Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
- Katoh K, Standley DM. MAFFT multiple sequence alignment software version 7: improvements in performance and usability. Mol Biol Evol. 2013 Apr;30(4):772-80. doi: 10.1093/molbev/mst010. Epub 2013 Jan 16. PMID: 23329690; PMCID: PMC3603318.
- Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
- Nguyen LT, Schmidt HA, von Haeseler A, Minh BQ. IQ-TREE: a fast and effective stochastic algorithm for estimating maximum-likelihood phylogenies. Mol Biol Evol. 2015 Jan;32(1):268-74. doi: 10.1093/molbev/msu300. Epub 2014 Nov 3. PMID: 25371430; PMCID: PMC4271533.
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.
- Smith GJD, Vijaykrishna D, Bahl J, Lycett SJ, Worobey M, Pybus OG, Ma SK, Cheung CL, Raghwani J, Bhatt S, Peiris JSM, Guan Y & Rambaut A (2009) Origins and evolutionary genomics of the 2009 swine-origin H1N1 influenza A epidemic. Nature 459, 1122-1125.
- Trifinopoulos J, Nguyen L, von Haeseler A, Minh B, W-IQ-TREE: a fast online phylogenetic tool for maximum likelihood analysis, Nucleic Acids Research, Volume 44, Issue W1, 8 July 2016, Pages W232–W235, https://doi.org/10.1093/nar/gkw256

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

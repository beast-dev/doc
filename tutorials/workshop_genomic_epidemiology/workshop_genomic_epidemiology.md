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

Genomic epidemiology combines classical epidemiological methods with genome sequence data to track and monitor both endemic pathogens and the emergence and spread of novel pathogens. In this tutorial, we will follow an outbreak through different phases and use phylogenetic methods to answer questions pertinent to containing the outbreak.

To undertake this tutorial, you will need to download a number of software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> All the files needed for this tutorial
<a href="{{ root_url }}files/influenzaTutorialFiles.zip"> can be downloaded from here</a>. 
If you download this zipped folder, there is no need to download other files/folders linked further in the tutorial.
</div>

## TIMEPOINT 1: A cluster of cases of unknown aetiology

{% include sitrep.html content='As of 30th June 2034, 20 cases of acute respiratory infections have been reported with 7 deaths. A subset of patients have presented with dizziness, fatigue and more severe neurological symptoms. The infectious agent is currently unknown, however metagenomic sequencing of reported cases has been carried out. We await results from the bioinformatics team.
' %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>initial_cases.fasta</samp>' and <a href="{{ root_url }}files/initial_cases.fasta">can be downloaded from here</a>.</div>

### Quick identification of causative pathogen

{% include question.html content='How many sequences are in the `initial_cases.fasta` file?' %}


{% include tip.html content='Each sequence header in a FASTA file starts with the `>` character' %}

Navigate in a web browser to [NCBI BLAST](https://blast.ncbi.nlm.nih.gov/). You should see the following screen:

{% include image.html file="image1.png" prefix=root_url %}  <br /><br />

Click on the button for "Nucleotide BLAST". This will redirect you to the below webpage.

{% include image.html file="image2.png" prefix=root_url %}  <br /><br />


To load a query sequence set, simply select the `Choose file` option, or alternatively open the `initial_cases.fasta` file and copy and paste into the box.

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


{% include question.html content='<br>
Questions<br>
1. How many records are there? <br>
2. Would we want to download all of them? (Hint: look at the sequence lengths)<br>
3. How many complete records are there?'
 %}

For the purposes of this exercise, we have already prepared all the complete records available for NiV that had a date and location of collection. This background dataset has been curated and headers annotated with consistent fields:

{% include question.html content='<br>
`>Accession|Virus|Country|Host|CollectionDate`<br>
For example:<br>
`>MH523641|NiV|India|human|2018-05-21`'
 %}
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>NiV_background.with_initial_cases.fasta</samp>' and <a href="{{ root_url }}files/NiV_background.with_initial_cases.fasta.zip">can be downloaded from here</a>. It will need to be decompressed before use.<br>
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

<!-- FFT-NS-2 (Fast Fourier Transform-Normalized Similarity-2) -->
{% include image.html file="image8.png" prefix=root_url %}

We have provided the combined case genome sequences and NiV background set. Once you have decompressed the `NiV_background.with_initial_cases.fasta` file, select `Choose file` on the MAFFT web server and upload your file. We will run with the default AUTO mode (it may be useful to change the Title length field to 50, but not necessary), select `Submit`. 

When the alignment is complete the following screen will show:

{% include image.html file="image9.png" prefix=root_url %}

Click `View` to see alignment viewing options:
{% include image.html file="image10.png" prefix=root_url %}

Click to start the MAFFT MSA viewer (any viewing option is also fine). 

{% include image.html file="image11.png" prefix=root_url %}

Toggle open the `Wheel mode` menu to select whether scrolling zooms, or pans horizontally or vertically. Explore the alignment by scrolling.
{% include image.html file="image12.png" prefix=root_url %}

{% include question.html content='Questions:<br>
1. Is this a good quality alignment?<br>
2. What can you say about case5?<br>'
 %}

When ready, return to the results page and click on `Fasta format` to download the alignment as a FASTA file. 


### Estimate a Maximum Likelihood tree

For the initial exploratory analysis, we want to quickly estimate a phylogeny to place our sequences into the known diversity of NiV. In order to do this, we will use IQTREE to estimate the phylogeny [Minh et al. 2020](https://academic.oup.com/mbe/article/37/5/1530/5721363?login=false). IQTREE2 can be run on the command line with more flexibility, but we will be using the web server in this tutorial [Trifinopoulos et al. 2016](https://academic.oup.com/nar/article/44/W1/W232/2499307?login=false).

To navigate to the web server, click the [W-IQTREE link](http://iqtree.cibiv.univie.ac.at/).

{% include image.html file="image13.png" prefix=root_url %}

#### Input data
Upload your alignment file to the server by clicking `Browse` and selecting the file. You can select DNA as the sequence type.

#### Substitution model options
We will bypass model selection for now, and just select the simple `HKY` substitution model. This is just a quick first look at the data.

#### Running IQTREE2

All other parameters can be left as default. Scroll down and select `Submit job`. 

{% include image.html file="image14.png" prefix=root_url %}

Click `QUERY STATUS` to check on the run. When the job has finished the status bar on the left will say `Success`. 

{% include image.html file="image15.png" prefix=root_url %}


You can examine an ASCII version of the phylogeny in the Full Result tab, but to download the result, click `DOWNLOAD SELECTED JOBS` in the bottom left. Decompress the downloaded file and you'll see the contents contain the iqtree log file, the result file and the treefile. 

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
3. What is your assessment of the outbreak?
'%}

### When did this outbreak arise?

Even with just these few sequences it may be possible to ascertain some key information about this outbreak (such as when it likely began and how quickly it is spreading).

**HERE WILL PUT IN EXP GROWTH MODEL AND ESTIMATE R0 OF THE CLUSTER**

## TIMEPOINT 2: Additional human cases spurs an investigation in animal population

{% include sitrep.html content='As of 12th July 2024, 60 human cases of Nipah have been reported. The Ministry of Health of Country X has commissioned sampling of local wildlife and livestock. NiV has been detected in samples from bats and domestic pigs. 
' %}

**HERE WILL PUT IN DTA**



## References **need to update**
- Drummond AJ, Rambaut A (2007) BEAST: Bayesian evolutionary analysis by sampling trees. BMC Evolutionary Biology 7: 214.
- Drummond AJ, Ho SYW, Phillips MJ & Rambaut A (2006) PLoS Biology 4, e88.
- Drummond AJ, Rambaut A & Shapiro B and Pybus OG (2005) Mol Biol Evol 22, 1185-1192.
- Drummond AJ, Nicholls GK, Rodrigo AG & Solomon W (2002) Genetics 161, 1307-1320.
- Ferreira, M. A. R. and M. A. Suchard. 2008. Bayesian analysis of elapsed times in continuous-time Markov chains. Can J Statistics, 36: 355–368. doi: 10.1002/cjs.5550360302
- Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
- Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.
- Smith GJD, Vijaykrishna D, Bahl J, Lycett SJ, Worobey M, Pybus OG, Ma SK, Cheung CL, Raghwani J, Bhatt S, Peiris JSM, Guan Y & Rambaut A (2009) Origins and evolutionary genomics of the 2009 swine-origin H1N1 influenza A epidemic. Nature 459, 1122-1125.

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

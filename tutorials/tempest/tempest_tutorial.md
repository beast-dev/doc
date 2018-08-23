---
title: TempEst Tutorial
keywords: tempest, tutorial
last_updated: Aug 23, 2018
tags: [tempest, tutorial]
summary: "This tutorial describes the use of TempEst to examine the temporal signal of a data set and to look for problematic or erroneous sequences."
sidebar: beast_sidebar
permalink: tempest_tutorial.html
folder: beast
---

In this tutorial, .

## Building a non-molecular clock tree

To examine the relationship between genetic divergence and time (temporal signal) we require a phylogenetic tree constructed without assuming a molecular clock. There is a wide range of suitable software packages (i.e., Phyml, RAXML, Garli) but for this tutorial we are going to use [IQ-Tree](http://www.iqtree.org) which i 

<div class="alert alert-success" role="alert"><div>The data for this tutorial was compiled for this paper: Worobey (2009) Phylogenetic Evidence against Evolutionary Stasis and Natural Abiotic Reservoirs of Influenza A Virus. <i>Journal of Virology</i>, <b>82</b>, 3769–3774. <a href="http://doi.org/10.1128/JVI.02207-07">DOI: 10.1128/JVI.02207-07</a>. This was a response to an earlier paper (Zhang et al (2006) <i>J Virol</i> <b>80</b>, 12229–12235 <a href="http://doi.org/10.1128/JVI.00986-06">DOI: 10.1128/JVI.00986-06</a> ) which claimed to have isolated and sequenced influenza viruses from glacial ice.</div> 

<br/><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses.fasta"><i class="fa fa-download fa-lg"></i> You can download the file, <code class="highlighter-rouge">ice_viruses.fasta</code>, here</a>.</div>
</div>

Install **IQ-Tree** using [the instructions on the website](http://www.iqtree.org) and open a command-line prompt, navigating to the directory containting the data file `ice_viruses.fasta`.

To build a maximum likelihood phylogenetic tree using the GTR+gamma model type:

```bash
iqtree -s ice_viruses.fasta -m GTR+G 
```

This will create a set of files in the directory containing various outputs and results:

```
ice_viruses.fasta.bionj
ice_viruses.fasta.ckp.gz
ice_viruses.fasta.iqtree
ice_viruses.fasta.log
ice_viruses.fasta.mldist
ice_viruses.fasta.treefile
ice_viruses.fasta.uniqueseq.phy
```

For our purposes we only need the maximum likelihood tree file `ice_viruses.fasta.treefile`. You can delete the other files if you like. 

## Running TempEst and loading the tree

{% include icon-callout.html file='icons/tempest-icon.png' content='Run <a href="tempest">TempEst</a> by double clicking on its icon. TempEst is an interactive graphical application for examining the temporal signal in a tree of time-stamped sequences by plotting the divergence of each tip from the root against the date of sampling (a root-to-tip plot).' %}


Once running, TempEst will look similar irrespective of which computer system it is running on. For this tutorial, the Mac OS X version will be shown but the Linux & Windows versions will have exactly the same layout and functionality.

When started, TempEst will immediately display a file selection dialog box in which you can select the tree that you made in the previous section.

{% include image.html prefix="/tutorials/tempest/" file="fig1_open_dialog.png" %}

Select `ice_viruses.fasta.treefile` and click `Open`.

## Parsing dates of sampling

Once the tree is loaded the main window will appear and look like this: 

{% include image.html prefix="/tutorials/tempest/" file="fig2_taxon_table.png" %}

Ignore the panel on the left for the moment. The first thing that needs doing is to give the date of sampling to each of the sequences. 

To inform BEAUti/BEAST about the sampling dates of the sequences, go to the Tips menu and select the “Use tip dates” option. By default all the taxa are assumed to have a date of zero (i.e. the sequences are assumed to be sampled at the same time; BEAST considers the present or most recent sampling time as time 0). In this case, the YFV sequences have been sampled at various dates going back to the 1940s. The actual year of sampling is given in the name of each taxon and we could simply edit the value in the Date column of the table to reflect these. However, if the taxa names contain the calibration information, then a convenient way to specify the dates of the sequences in BEAUti is to use the ``Guess Dates'' button at the top of the Data panel. Clicking this will make a dialog box appear:

{% include image.html prefix=root_url file="image4.png" %}

This operation attempts to guess what the dates are from information contained within the taxon names. It works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field (such as the some YFV sequences, above) then you can specify how to find the one that corresponds to the date of sampling. [See this page for details about the various options for setting dates in this panel](tip_dates). For the YFV sequences you can keep the default `Defined just by its order` and `Order: first` (but make sure that the `Parse as a number` option is selected).

When parsing a number, you can ask BEAUti to add a fixed value to each date which can be useful for [transforming a 2 digit year into a 4 digit year](tip_dates). Because all dates are specified in a four digit format in this case, no additional settings are needed.  So, we can press `OK`.

## The temporal signal and rooting

Tree shows blue for tips with +ve residuals, red for -ve.

## Finding and interpreting problematic sequences

{% include links.html %}

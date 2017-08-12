---
title: Construct a model in BEAUti
keywords: tracer, tutorial
last_updated: August 12, 2017
tags: [how-to]
summary: "This page discusses how to construct a phylogenetic model for your data using the graphical user interface in BEAUti."
sidebar: beast_sidebar
permalink: constructing_models.html
folder: beast
---

{% include warning.html content="This page unfinished." %}

**Data partitions** are the basic unit of data in BEAST. They are a collection of sequence data (DNA, amino acid or other), discrete traits, or continuous traits for each of a set of taxa that are connected by a tree and are assumed to have a shared evolutionary process. Each data partition has a tree, a site model, and a molecular clock model. Data partitions can share these models (their models are *linked*) or have their own models (their models are *unlinked*). You can link and unlink these model components in the `Partitions` panel of [BEAUti](beauti) --- see [Linking and unlinking models](#linking-and-unlinking-models), below. Even if partitions have unlinked model components, individual parameters of the models can be linked either directly --- see [Linking parameters](#linking-parameters) --- or as a hierarchical phylogenetic model (HPM) --- see [Hierarchical phylogenetic models](#hierarchical-phylogenetic-models), below and [this tutorial](hierarchical_models). 

## Importing data partitions

To load a sequence alignment, select the `Import Data...` option from the `File` menu. You can also click the `+` button at the bottom left of the window or just drag-and-drop the file into the main window. The data should be in either NEXUS or FASTA format. BEAUti will also import the data from a BEAST XML file (including all the data partitions, the dates of the tips, but not the models and settings).

### Importing multiple partitions from a NEXUS file

NEXUS files can define multiple partitions using the `charset` command. For example, the example file in the BEAST package: `/examples/Data/H1N1_HA.nex` (or [download from here](/tutorials/howtos/files/H1N1_HA.nex)) divides the sequences into two partitions (note the sequences have been truncated here for brevity):

```
#NEXUS
begin data;
dimensions ntax=12 nchar=898;
format datatype=dna interleave=no gap=-;
matrix
Tarsius_syrichta  AAGTTTCATTGGAGCCACCACT...
Lemur_catta       AAGCTTCATAGGAGCAACCATT...
Homo_sapiens      AAGCTTCACCGGCGCAGTCATT...
Pan               AAGCTTCACCGGCGCAATTATC...
Gorilla           AAGCTTCACCGGCGCAGTTGTT...
Pongo             AAGCTTCACCGGCGCAACCACC...
Hylobates         AAGCTTTACAGGTGCAACCGTC...
Macaca_fuscata    AAGCTTTTCCGGCGCAACCATC...
M_mulatta         AAGCTTTTCTGGCGCAACCATC...
M_fascicularis    AAGCTTCTCCGGCGCAACCACC...
M_sylvanus        AAGCTTCTCCGGTGCAACTATC...
Saimiri_sciureus  AAGCTTCACCGGCGCAATGATC...
;
end;

begin assumptions;
    charset firsthalf = 1-449;
    charset secondhalf = 450-898;
end;
```

When imported into BEAUti this results in two partitions in the `Partitions` panel:

{% include image.html file="models1.png" prefix="tutorials/howtos/" %}

The two partitions (called `firsthalf` and `secondhalf` by the NEXUS file) by default share the same substitution model, clock model and tree. You can see that the `Site model`, `Clock model` and `Partition tree` columns of the table have `firsthalf` for both partitions. This is because these model components have been named after the first partition.

As it stands this means the model specified is as if a single partition with all the data had been imported.
 
### Importing partitions from multiple files

The other way to load multiple partitions is simply to import them from different alignment files (NEXUS, FASTA or XML). The partitions will appear in the table named after the file they were loaded from. In most cases you should load partitions with exactly the same set of taxa (the names should be identical). If the partitions' set of taxa differ in anyway from each other then BEAUti will give them a different clock model and partition tree.

## Site models
                  
Site models specify the evolutionary process that describes how the data was generated on the tree. For example, for DNA sequences this could be an HKY model with discrete gamma rate heterogeneity amongst sites. If you switch to the `Sites` panel using the tabs at the top, you can specify the details of this model.
                 
### Codon partitions

## Molecular clock models

## Trees

## Linking and unlinking models

## Linking parameters

## Hierarchical phylogenetic models

{% include links.html %}

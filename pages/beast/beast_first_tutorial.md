---
title: First Tutorial
keywords: beast, tutorial
last_updated: July 6, 2017
tags: [getting-started, tutorial]
summary: "An introductory tutorial to getting started with BEAST."
sidebar: beast_sidebar
permalink: first_tutorial.html
folder: beast
---

## Running BEAST for the first time
Using sequences sampled at different points in time to estimate rates
This document provides a step-by-step tutorial to converting a NEXUS file with a DATA or CHARACTERS block into a BEAST XML file. This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). This is a user-friendly program for setting the evolutionary model and options for the MCMC.


Running BEAUti
The exact instructions for running BEAUti differs depending on which computer you are using. Please see the README text file that was distributed with the version you downloaded.

Once running, BEAUti will look similar irrespective of which computer system it is running on. For this tutorial, the Mac OS X version will be shown but the Linux & Windows versions will have exactly the same layout and functionality.


Loading the NEXUS file
To load a NEXUS format alignment, simply select the Import NEXUS... option from the File menu:

beauti0.png


The NEXUS alignment
The examples folder contains a file called Dengue4.env.nex. This file contains an alignment of 17 sequences from the env gene of Dengue-4 virus from various parts of the world with dates from 1956-1994. It starts out like this (the lines have been truncated):

```
#NEXUS

BEGIN DATA;
DIMENSIONS NTAX=17 NCHAR=1485;
FORMAT MISSING=? GAP=- DATATYPE=DNA;
MATRIX
D4Brazi82       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4ElSal83       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4ElSal94       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Indon76       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Indon77       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Mexico84      ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4NewCal81      ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Philip64      ATGCGATGCGTGGGAGTGGGGAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Philip56      ATGCGATGCGTGGGAGTGGGGAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Philip84      ATGCGATGCGTAGGAGTGGGGAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4PRico86       ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4SLanka78      ATGCGATGCGTGGGAGTGGGGAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Tahiti79      ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Tahiti85      ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTTTCAGGTGGAGCATGGGTC...
D4Thai63        ATGCGATGCGTAGGAGTGGGGAACAGGGACTTTGTGGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Thai78        ATGCGATGCGTAGGAGTGGGGAACAGAGACTTTGTAGAAGGAGTCTCAGGTGGAGCATGGGTC...
D4Thai84        ATGCGATGCGTAGGAGTAGGGAACAGAGACTTTGTAGAAGGAGTCTCAGGTGGAGCATGGGTC...
;
END;
```

Once loaded, the list of taxa and the actual alignment will be displayed in the main window:

 beauti1.png


Setting the dates of the taxa
By default all the taxa are assumed to have a date of zero. This will be correct if all the sequences were sampled at approximately the same point in time (at least on the time scale of their evolutionary history). In this case, the Dengue-4 virus have been sampled at various dates going back to the 1950s. The actual year of sampling is given in the name of each taxon and we could simply edit the value in the Date column of the table to reflect these. However it is more convenient to use the Guess Dates button at the top of the window. Clicking this will make the following dialog box appear:

 beauti2.png

This operation attempts to guess what the dates are from information contained within the taxon names. Generally this works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field (such as the Dengue-4 sequences, above) then you can specify how to find the one that corresponds to the date of sampling. You can either specify the order that the date field comes (e.g., first, last or various positions in between) or specify a prefix (some characters that come immediately before the date field in each name). For the Dengue-4 sequences you select last from the drop-down menu for the order. If you left it at first then all taxa would be given a date of "4" taken from the second character of each name.

In this dialog box, you can also get BEAUti to add a fixed value to each guessed date. In this case the value "1900" has been added to turn the dates from 2 digit years to 4 digit. Any dates in the taxon names given as "00" would thus become "1900". If these dates were actually referring to the year 2000 then selecting the next option would convert them correctly, adding 2000 to any date less than 07.

When you press OK the dates will appear in the appropriate column of the main window. You can then check these and edit them manually as required. At the top of the window you can set the units that the dates are given in (years, months, days) and whether they are specified relative to a point in the past (as would be the case for years such as 1984) or backwards in time from the present.


Translating the data into amino acid sequences
At the bottom of the main window is the option to translate the data into amino acid sequences. This will be done using the genetic code specified in the associated drop down menu. If the loaded sequence are not nucleotides then this option will be disabled.


Setting the evolutionary model
The next thing to do is to click on the Model tab at the top of the main window. This will reveal the evolutionary model settings for BEAST. Exactly which options appear depend on whether the data are nucleotides or amino acids (or nucleotides translated into amino acids). The settings that will appear after loading the Dengue-4 data set will be as follows:

 beauti3.png

Substitution Model

Select between the HKY and the GTR model for nucleotide sequences or a variety of common amino acid substitution models.

Site Heterogeneity Model

Select between gamma or invariant sites or both.

Number of Gamma Categories

The number of categories for the descrete approximation to the gamma distribution.

Partition into codon positions

For when the data are nucleotide sequences that have been aligned to the reading frame. This allows a separate substitution rate for each codon position.

If selected then the following options can also be used:

Unlink substition model across codon positions

Allows a different substitution model for each codon position. This means a separate kappa (for HKY) or rate matrix (for GTR).

Unlink rate heterogeneity model across codon positions

Allows a different rate heterogeneity model for each codon position. This means a separate alpha (for gamma) or Pinv (for invariant sites).

Fix mean substitution rate

When dates have been associated with the sequences, the substitution rate can be estimated on an absolute time scale. If this is on then the substitution rate is fixed to the value in the text field below otherwise it is estimated from the data.

Mean Substitution Rate

If there are no dates associated with the sequences than this can be used to specify an _a_priori_ substition rate that will be used to scale all the times in the tree to units of time. This can be used to calibrate the tree with an external rate. Doing this will mean abandoning any errors associated with this rate.

Coalescent Model

Choose between a constant population size, an exponentially growing population or a logistically growing population.

This tutorial assumes you are familiar with the evolutionary models available, however there are a couple of points to note:

Selecting the Partition into codon positions option assumes that the data are aligned as codons. This option will then estimate a separate rate of substitution for each codon position.
Selecting the Unlink substitution model across codon positions will specify that BEAST should estimate a separate transition-transversion ratio or general time reversible rate matrix for each codon position.
Selecting the Unlink rate heterogeneity model across codon positions will specify that BEAST should estimate set of rate heterogeneity parameters (gamma shape parameter and or proportion of invariant sites) for each codon position.
If you have specified dates of sampling for the sequences then you should select the Use dates associated with sequences option (this will be set by default if any taxa have dates that differ). You can then specify an initial estimate for the substitution rate. Setting this to be on the low side may help the MCMC reach equilibrium faster. If there are no dates for the sequences (they are contemporaneous) then you can specify a fixed over-all substitution rate obtained from another source. Setting this to 1.0 will result in the ages of the nodes of the tree being estimated in units of _substitutions per site_.

Setting the priors
The next tab allows priors to be specified for each parameter in the model:

 beauti4.png

In this tutorial, the default options will be used.


Setting up the operators
The next stage is to look at the operators for the MCMC. To do this select the Operators tab at the top of the main window. For the Dengue-4 dataset, with the model set up as shown in the screen shot above, you will see the following table:

 beauti5.png

Each parameter in the model has one or more "operators". The operators specify how the parameter changes as the MCMC runs. This table lists the parameters, their operators and the tuning settings for these operators. In the first column are the parameter names. These will be called things like hky1.kappa which means the HKY model's kappa parameter (the transition-transversion bias). The next column has the type of operators that are acting on each parameter. For example, the scale operator scales the parameter up or down by a proportion, the random walk operator adds or subtracts an amount to the parameter and the uniform operator simply picks a new value uniformally within a range. Some parameters relate to the tree or to the heights of the nodes of the tree and these have special operators.

The next column, labelled Tuning, gives a tuning setting to the operator. Some operators don't have any tuning settings so have n/a under this column. Changing the tuning setting will set how large a move that operator will make which will affect how often that change is accepted by the MCMC which will affect the efficency of the analysis. At the top of the window is an option called Auto Optimize which, when selected, will automatically adjust the tuning setting as the MCMC runs to try to achieve maximum efficiency. At the end of the run a table of the operators, their performance and the final values of these tuning settings will be displayed. These can then be used to set the starting tuning settings in order to minimize the amount of time taken to reach optimum performance in subsequent runs.

The next column, labelled Weight, specifies how often each operator is applied relative to each other. Some parameters have very little interaction with the rest of the model and as a result tend to be estimated very efficiently - an example is the kappaparameter - these parameters can have their operators down-weighted so that they are not changed as often.


Setting the MCMC options
The next tab, MCMC, provides settings to control the MCMC:

 beauti6.png

Firstly we have the Length of chain. This is the number of steps the MCMC will make in the chain before finishing. How long this should be depends on the size of the dataset, the complexity of the model and the quality of answer required. The default value of 10,000,000 is entirely arbitrary and should be adjusted according to the size of your dataset. In order examine whether a particular chain length is adequate, the resulting log file can be analysed using Tracer. The aim of setting the chain length is to achieve a reasonable Effective Sample Size (ESS). Ways of doing this are discussed in [another tutorial|Increasing ESSs].

The next options specify how often the current parameter values should be displayed on the screen and recorded in the log file. The screen output is simply for monitoring the programs progress so can be set to any value (although if set too small, the sheer quantity of information being displayed on the screen may actually slow the program down). For the log file, the value should be set relative to the total length of the chain. Sampling too often will result in very large files with little extra benefit in terms of the precision of the analysis. Sample too infrequently and the log file will not contain much information about the distributions of the parameters. You probably want to aim to store about 10,000 samples so this should be set to the chain length / 10,000.

For this dataset let's initially setting the chain length to 100,000 as this will run reasonably quickly on most modern computers.

The final two options give the file names of the log files for the parameters and the trees. These will be set to a default based on the name of the imported NEXUS file but feel free to change these.


Saving and Loading BEAUti files
If you select the Save option from the File menu this will save a document in BEAUti's own format. Note that although this is an XML document it is not in the format that BEAST understands (it is much simpler and specific to the user interface of BEAUti). The idea is that the settings and data in BEAUti can be saved and loaded at a later time. We suggest you save BEAUti files with the extension '.beauti'.


Generating the BEAST XML file
We are now ready to create the BEAST XML file. Select Generate BEAST File... from the File menu (or click the button at the bottom of the window) and save the file with an appropriate name (we usually end the filename with '.xml'). We are now ready to run the file through BEAST.


Running BEAST
Now run BEAST according to the instructions provided (look at the README text file included in the package you downloaded), providing your newly created XML file as input.

```
+-----------------------------------------------\
|             BEAST v1.3 2002-2006              ||
| Bayesian Evolutionary Analysis Sampling Trees ||
|     BEAST Library: Build 1.10 2003/09/03      ||
|       Alexei Drummond and Andrew Rambaut      ||
|              University of Oxford             ||
|      http://evolve.zoo.ox.ac.uk/Beast/        ||
\-----------------------------------------------\|
 \-----------------------------------------------\
 +-----------------------------------------------+
 | Components created by:                        |
 |       Alexei Drummond                         |
 |       Roald Forsberg                          |
 |       Oliver Pybus                            |
 |       Andrew Rambaut                          |
 | Thanks to (for use of their code):            |
 |       Korbinian Strimmer                      |
 |       Oliver Pybus                            |
 +-----------------------------------------------+

Read alignment:
  Sequences = 17
      Sites = 1485
   Datatype = nucleotide
Site patterns 'patterns1' created from positions 1-1485 of alignment 'alignment'
  only using every 3 site
  pattern count = 34
Site patterns 'patterns2' created from positions 2-1485 of alignment 'alignment'
  only using every 3 site
  pattern count = 17
Site patterns 'patterns3' created from positions 3-1485 of alignment 'alignment'
  only using every 3 site
  pattern count = 119
Native nucleotide likelihood core found
TreeLikelihood using native nucleotide likelihood core.
TreeLikelihood using native nucleotide likelihood core.
TreeLikelihood using native nucleotide likelihood core.
Pre-burnin...
state	likelihood	treeModel.rootHeight	treeLikelihood1	treeLikelihood2	treeLikelihood3	coalescent
0	-3,919.1283	159.9998		-995.1892	-838.3758	-1,989.881	-95.6820
1000	-3,806.6080	125.4206		-971.7499	-828.9929	-1,917.5387	-88.3264
2000	-3,784.8661	96.7894			-966.8750	-829.8393	-1,904.5461	-83.6057
.
.
.
Operator analysis
Operator                                      Pr(accept)  Performance suggestion
hky.kappa                             0.331   0.2007      good
siteModel1.mu                         0.442   0.2753      good
siteModel2.mu                         0.319   0.2594      good
siteModel3.mu                         0.658   0.2326      good
up:compoundParameter down:nodeHeights 0.885   0.1548      good
constant.popSize                      0.293   0.2561      good
treeModel.rootHeight                  0.697   0.1897      slightly low	Try setting scaleFactor to about 0.7461
nodeHeights                                   0.4338      high
subtreeSlide                          7.198   0.1951      slightly low	Try decreasing size to about 6.001352499826204
Narrow Exchange                               0.2655      good
Wide Exchange                                 0.0543      good
wilsonBalding                                 0.0139      slightly low

23.212 seconds
```

{% include links.html %}

---
title: Second Tutorial
keywords: beast, tutorial
last_updated: July 6, 2017
tags: [getting-started, tutorial]
summary: "An introductory tutorial to getting started with BEAST."
sidebar: beast_sidebar
permalink: second_tutorial.html
folder: beast
---

## Running BEAST for the second time
Estimating the divergence time of a monophyletic group using a known mutation rate
This tutorial describes the use of BEAUti and BEAST to analyse some primate sequences and estimate the date of divergence of humans and chimps when the mutation rate is known.


### Running BEAUti
The exact instructions for running BEAUti differs depending on which computer you are using. Please see the README text file that was distributed with the version you downloaded.

Once running, BEAUti will look similar irrespective of which computer system it is running on. For this tutorial, the Mac OS X version will be shown but the Linux & Windows versions will have exactly the same layout and functionality.

### Loading the NEXUS file

To load a NEXUS format alignment, simply select the Import NEXUS... option from the File menu:

tutorial2Beauti0.png


#### The NEXUS alignment

The examples folder contains a file called Primates.nex. This file contains an alignment of mitochondrial tRNA sequences from 6 primate species. It starts out like this (the lines have been truncated):

```
#NEXUS

BEGIN DATA;
	DIMENSIONS NTAX=6 NCHAR=768;
	FORMAT MISSING=? GAP=- DATATYPE=DNA;
	MATRIX
	human      AGAAATATGTCTGATAAAAGAGTTACTTTGATAGAGTAAATAATAGGAGC...
	chimp      AGAAATATGTCTGATAAAAGAATTACTTTGATAGAGTAAATAATAGGAGT...
	bonobo     AGAAATATGTCTGATAAAAGAATTACTTTGATAGAGTAAATAATAGGAGT...
	gorilla    AGAAATATGTCTGATAAAAGAGTTACTTTGATAGAGTAAATAATAGAGGT...
	orangutan  AGAAATATGTCTGACAAAAGAGTTACTTTGATAGAGTAAAAAATAGAGGT...
	siamang    AGAAATACGTCTGACGAAAGAGTTACTTTGATAGAGTAAATAACAGGGGT...
	;
END;
```

Once loaded, the list of taxa and the actual aligment will be displayed in the main window:

tutorial2Beauti1.png

### Setting the dates of the taxa

By default all the taxa are assumed to have a date of zero. This will be correct if, as in this case, all the sequences were sampled at approximately the same point in time (at least on the time scale of their evolutionary history).

### Setting the evolutionary model

The next thing to do is to click on the Model tab at the top of the main window. This will reveal the evolutionary model settings for BEAST. Exactly which options appear depend on whether the data are nucleotides or amino acids (or nucleotides translated into amino acids). The settings that will appear after loading the Primate data set will be as follows:

tutorial2Beauti2.png

This tutorial assumes you are familiar with the evolutionary models available, however there are a couple of points to note:

Selecting the Partition into codon positions option assumes that the data are aligned as codons. In this case the data are from mitochondrial tRNAs so this option is inappropriate.
In order to estimate dates of divergence, a previously estimated substitution rate can be specified.

### Priors

The next tab allows priors to be specified for each parameter in the model:

tutorial2Beauti3.png

In this tutorial, the default options will be used.

### MCMC operators

The next stage is to look at the operators for the MCMC. To do this select the Operators tab at the top of the main window. For the Primate dataset, with the model set up as shown in the screen shot above, you will see the following table:

tutorial2Beauti4.png

Each parameter in the model has one or more "operators". The operators specify how the parameter changes as the MCMC runs. This table lists the parameters, their operators and the tuning settings for these operators. In the first column are the parameter names. These will be called things like hky1.kappa which means the HKY model's kappa parameter (the transition-transversion bias). The next column has the type of operators that are acting on each parameter. For example, the scale operator scales the parameter up or down by a proportion, the random walk operator adds or subtracts an amount to the parameter and the _uniform operator_ simply picks a new value uniformally within a range. Some parameters relate to the tree or to the heights of the nodes of the tree and these have special operators.

The next column, labelled Initial, specifies the starting value for the parameter. Giving a reasonable guess for the parameters may help the MCMC reach equilibrium faster and trying different initial values for multiple runs can be useful for checking for convergence. The next column, labelled Tuning, gives a tuning setting to the operator. Some operators don't have any tuning settings so have n/a under this column. Changing the tuning setting will set how large a move that operator will make which will affect how often that change is accepted by the MCMC which will affect the efficency of the analysis. At the top of the window is an option called Auto Optimize which, when selected, will automatically adjust the tuning setting as the MCMC runs to try to achieve maximum efficiency. At the end of the run a table of the operators, their performance and the final values of these tuning settings will be displayed. These can then be used to set the starting tuning settings in order to minimize the amount of time taken to reach optimum performance in subsequent runs.

The next column, labelled Weight, specifies how often each operator is applied relative to each other. Some parameters have very little interaction with the rest of the model and as a result tend to be estimated very efficiently - an example is the kappaparameter - these parameters can have their operators down-weighted so that they are not changed as often.

### Setting the MCMC options

The next tab, MCMC, provides settings to control the MCMC:

tutorial2Beauti5.png

Firstly we have the Length of chain. This is the number of steps the MCMC will make in the chain before finishing. How long this should be depends on the size of the dataset, the complexity of the model and the quality of answer required. The default value of 10,000,000 is entirely arbitrary and should be adjusted according to the size of your dataset. In order examine whether a particular chain length is adequate, the resulting log file can be analysed using Tracer. The aim of setting the chain length is to achieve a reasonable Effective Sample Size (ESS). Ways of doing this are discussed in another tutorial.

The next options specify how often the current parameter values should be displayed on the screen and recorded in the log file. The screen output is simply for monitoring the programs progress so can be set to any value (although if set too small, the sheer quantity of information being displayed on the screen may actually slow the program down). For the log file, the value should be set relative to the total length of the chain. Sampling too often will result in very large files with little extra benefit in terms of the precision of the analysis. Sample too infrequently and the log file will not contain much information about the distributions of the parameters. You probably want to aim to store about 10,000 samples so this should be set to the chain length / 10,000.

For this dataset let's initially setting the chain length to 1,000,000 as this will run reasonably quickly on most modern computers.

The final two options give the file names of the log files for the parameters and the trees. These will be set to a default based on the name of the imported NEXUS file but feel free to change these.

### Saving and Loading BEAUti files

If you select the Save option from the File menu this will save a document in BEAUti's own format. Note that although this is an XML document it is not in the format that BEAST understands (it is much simpler and specific to the user interface of BEAUti). The idea is that the settings and data in BEAUti can be saved and loaded at a later time. We suggest you save BEAUti files with the extension '.beauti'.

### Generating the BEAST XML file

We are now ready to create the BEAST XML file. Select Generate XML... from the File menu and save the file with an appropriate name (we usually end the filename with '.xml'). We are now ready to run the file through BEAST.

## Running BEAST

Now run BEAST according to the instructions provided (look at the README text file included in the package you downloaded), providing your newly created XML file as input.

```
+-----------------------------------------------\
|            BEAST v1.1.2 2002-2004             |\
| Bayesian Evolutionary Analysis Sampling Trees ||
|     BEAST Library: Build 1.12 2004/08/27      ||
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
  Sequences = 6
      Sites = 768
   Datatype = nucleotide
Site patterns 'patterns' created from positions 1-768 of alignment 'alignment'
  pattern count = 69
TreeLikelihood using native nucleotide likelihood core.

Pre-burnin (10000 states)
0              25             50             75            100
|--------------|--------------|--------------|--------------|
*************************************************************

state	Likelihood  	Root Height 	L(tree)     	L(coalecent)
0	-1,836.8188 	16.9657     	-1,816.8341 	-19.9846
10000	-1,834.4612 	14.8862     	-1,814.4899 	-19.9713
20000	-1,834.4422 	13.6969     	-1,815.1315 	-19.3108
.
.
.
980000	-1,835.2411 	14.1121     	-1,815.4359 	-19.8052
990000	-1,836.8918 	17.5534     	-1,814.5603 	-22.3315
1000000	-1,835.6019 	13.2590     	-1,815.5852 	-20.0167

Operator analysis
Operator                              Pr(accept)  Performance suggestion
hky.kappa                     0.268   0.2583      good
constant.popSize              0.204   0.2645      good
treeModel.rootHeight          0.605   0.2392      good
nodeHeights                           0.3834      slightly high
subtreeSlide                  4.446   0.2559      good
Narrow Exchange                       0.0483      low
Wide Exchange                         0.0182      good
wilsonBalding                         0.0041      low

1.0085 minutes
```

This took 1 minute to run on a 2GHz G5 Macintosh. Clearly we would be able to run it for much longer. See the tutorial on analysing MCMC output to see how to improve this estimate.


### Estimating a divergence date
The next part of this tutorial involves editing the BEAST XML file in order to estimate the divergence date of a clade in the tree. By default the date of the root of the tree is written to the log file so if this is what we are interested in then we need only use Tracer to analyse the log file and look at the posterior density plot of the root time. If we wish to estimate the time of a particular clade then further steps must be taken. It is assumed that you followed the tutorial up until this point and have created a working BEAST XML file. This should then be opened in a text editor.

The first thing we must do is define the group of taxa that we want to estimate the divergence time of. We will add this new taxa block directly below the one that already exists in the XML file. In this case we are interested in the divergence between humans and chimps so the new taxa block will look like:

```xml
<taxa id="humanChimp">
    <taxon idref="human"/>
    <taxon idref="chimp"/>
    <taxon idref="bonobo"/>
</taxa>
```

Notice that idref is used rather than id to specify the taxon objects in this taxa block, because we want to refer to the previously defined taxon objects rather than creating new ones. The idref attribute is used to refer to a previously defined element, while id is used to give a unique name to a new element.

The next thing to do is create a tmrcaStatistic that will log the age of the most recent common ancestor (MRCA) of the humanChimp taxa. We do this by adding the following XML element after the treeModel element in the Primates.xml file:

```xml
<!-- A statistic that returns the time of the most recent common ancestor   -->
<!-- of the given set of taxa.                                              -->
<tmrcaStatistic id="humanChimpTMRCA" name="human/chimp">
    <mrca>
        <taxa idref="humanChimp"/>
    </mrca>
    <treeModel idref="treeModel"/>
</tmrcaStatistic>
```

We should also add this new statistic to the log so that we can obtain estimates of the mean and 95% HPD intervals after running the MCMC chain. We do this by adding the following line to the file and screen log elements:

```xml
<tmrcaStatistic idref="humanChimpTMRCA"/>
```

The <mcmc> element will now look like this:

```xml
	<mcmc id="mcmc" chainLength="1000000" autoOptimize="true">
		<compoundLikelihood id="likelihood">
			<coalescentLikelihood idref="coalescent"/>
			<treeLikelihood idref="treeLikelihood"/>
		</compoundLikelihood>
		<operators idref="operators"/>
		<log id="screenLog" logEvery="10000">
			<column label="Likelihood" dp="4" width="12">
				<compoundLikelihood idref="likelihood"/>
			</column>
			<column label="Root Height" sf="6" width="12">
				<parameter idref="treeModel.rootHeight"/>
				<tmrcaStatistic idref="humanChimpTMRCA"/>
			</column>
			<column label="L(tree)" dp="4" width="12">
				<treeLikelihood idref="treeLikelihood"/>
			</column>
			<column label="L(coalecent)" dp="4" width="12">
				<coalescentLikelihood idref="coalescent"/>
			</column>
		</log>
		<log id="fileLog" logEvery="100" fileName="Primates.log">
			<compoundLikelihood idref="likelihood"/>
			<parameter idref="constant.popSize"/>
			<parameter idref="hky.kappa"/>
			<parameter idref="treeModel.rootHeight"/>
			<tmrcaStatistic idref="humanChimpTMRCA"/>
			<treeLikelihood idref="treeLikelihood"/>
			<coalescentLikelihood idref="coalescent"/>
		</log>
		<logTree id="treeFileLog" logEvery="100" nexusFormat="true" fileName="Primates.trees">
			<treeModel idref="treeModel"/>
		</logTree>
	</mcmc>
```

When we run this in BEAST as before and when we examine the log file using Tracer we obtain the following estimates for the tMRCA of human/chimps:

tutorial2Tracer1.png

The mean estimate is 5 million years ago with a 95% HPD of (3.54, 6.70).

If there is considerable uncertainty in the phylogenetic relationships of the taxa, it may be desirable to enforce the monophyly of the clade. How to do this is described in another tutorial.

{% include links.html %}

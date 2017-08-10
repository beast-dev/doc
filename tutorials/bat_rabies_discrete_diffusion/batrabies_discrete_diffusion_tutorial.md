---
title: Phylogenetic diffusion in discrete space
keywords: phylogeography, rabies, bats, tutorial
last_updated: August 9, 2017
tags: [tutorial]
summary: "This chapter provides a step-by-step tutorial on reconstructing the spatial dispersal and cross-species dynamics of rabies virus (RABV) in North American bat populations based on a set of 372 nucleoprotein gene sequences (nucleotide positions: 594–1353). The data set comprises a total of 17 bat species sampled between 1997 and 2006 across 14 states in the United States (Streicker et al., Science, 2010, 329, 676-679). Following Faria et al. (Phil. Trans. Roy. Soc. B, 2013), two additional species that had been excluded from the original analysis owing to a limited amount of available sequences, Myotis austroriparius (Ma) and Parastrellus hesperus (Ph), are also included here. We also include a viral sequence with an unknown sampling date (accession no. TX5275, sampled in Texas from Lasiurus borealis), which will be adequately accommodated in our inference. The aim of this tutorial is to estimate the ancestral locations of the virus using a Bayesian discrete phylogeographic approach  and, at the same time, infer the history of host jumping using the same model approach. Using an extension of the discrete diffusion model, we will then test the factors that underly the host transition dynamics."
sidebar: beast_sidebar
permalink: batrabies_discrete_diffusion_tutorial.html
folder: beast
---

## Introduction

The first step will be to convert a NEXUS file with a DATA or CHARACTERS block into a BEAST XML input file. This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). This is a user-friendly program for setting the evolutionary model and options for the MCMC analysis. The second step is to actually run BEAST using the input file that contains the data, model and settings. The final step is to explore the output of BEAST in order to diagnose problems and to summarize the results.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include beagle_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

{% include spread3_callout.md %}

## EXERCISE 1: Host and location ancestral reconstruction

### Running BEAUti

The program BEAUti is a user-friendly program for setting the model parameters for BEAST. Run BEAUti by double clicking on its icon.

#### Loading the sequence data file 

To load a NEXUS format alignment, simply select the `Import Data...` option from the File menu:

{% include image.html file="01_ImportData.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}


<!--
##### The sequence alignment
-->

Select the file called batRABV.fas. This file contains an alignment of 372 nucleoprotein gene sequences of bat rabies viruses, 1353 nucleotides in length. Once loaded, the sequence data will be listed under Partitions as shown in the figure:

{% include image.html file="02_sequencePartition.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

<!--
Double-click on the row of the table (but not on Partition Name) to display the actual sequence alignment:

{% include image.html file="sequenceAlignment.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}
-->

#### Specifying the sampling date information 

By default all the taxa are assumed to have a date of zero (i.e. the sequences are assumed to be sampled at the same time). In this case, the RABV sequences have been sampled at various years going back to 1997. To set these dates switch to the `Tips` panel using the tabs at the top of the window.

<!--
{% include image.html file="fig3.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}
-->

Select the box labelled `Use tip dates`. The actual sampling time in years is encoded in the name of each taxon and we could simply edit the value in the ‘Date’ column of the table to reflect these. However, if the taxa names contain the calibration information, then a convenient way to specify the dates of the sequences in BEAUti is to use the `Guess Dates` button at the top of the `Data` panel. Clicking this will make a dialog box appear:

{% include image.html file="03_guessDates.png" prefix="tutorials/bat_rabies_discrete_diffusion/"  max-width="25%" align="center" caption="" %}

This operation attempts to guess what the dates are from information contained within the taxon names. It works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field then you can specify how to find the one that corresponds to the date of sampling. You can (1) specify the order that the date field comes (e.g., first, last or various positions in between) or (2) specify a prefix (some characters that come immediately before the date field in each name) and the order of the field, or (3) define a regular expression (REGEX).

When parsing a number, you can ask BEAUti to add a fixed value to each guessed date. For example, the value `1900` can be added to turn the dates from 2 digit years to 4 digit. Any dates in the taxon names given as `00` would thus become `1900`. However, if these `00` or `01`, etc. represent sequences sampled in 2000, 2001, etc., `2000` needs to be added to those. This can be achieved by selecting the `unless less than: ..` and `..in which case add:..` options adding for example 2000 to any date less than 10. These operations are not necessary in our case since the dates are fully specified at the end of the sequence names. There is also an option to parse calendar dates and one for calendar dates with various precisions. For the RABV sequences you can keep the default `Defined just by its order` and select `last` from the drop-down menu for the order and press `OK`. The dates will appear in the appropriate column of the main window.

{% include image.html file="04_datesSpecified.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

You can now check these and edit them manually as required. At the top of the window you can set the units that the dates are given in (years, months, days) and whether they are specified relative to a point in the past (as is the case for years such as 2005) or backwards in time from the present (as in the case of radiocarbon ages).

The `Height` column lists the ages of the tips relative to time 0 (in our case 2005.5). The `Precision` column allows specifying with what precision the sampling time is know. To include taxa only known up to the year of sampling for example, a precision of 1 year can be set and the age of those tips can be integrated over the time interval of 1 year using the Tip date sampling option at the bottom left of the Tips panel. A precision of one year could be specified for this RABV data set, but the imprecision is small relative to the time scale of this evolutionary history, so we will not use it for this analysis.

In our data set, the sampling date is unknown for one particular sequence (TX5275\_2002.5, the ‘2002.5’ is simply an arbitrary date that will be used as a starting value). To appropriately accommodate the uncertainty on the age of this tip, we will instruct BEAST to integrate over a particular sampling time interval for this tip. First, go back to the `Taxa` tab that we skipped, and make a taxon set for only that particular sequence. Press the small `plus` button at the bottom left of the panel; this creates a new taxon set. Rename it by double-clicking on the entry that appears (it will initially be called untitled1). Call it TX5275 and keep the default settings. Move TX5275\_2002.5 from the `Excluded Taxa` window to the `Included Taxa` window:

{% include image.html file="05_taxonSet.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

Go back to the `Tips` tab, and in the bottom left, select the `sampling with individual priors` as `Tip date sampling` option. Apply this to the TX5275 taxa set instead of the default All taxa option. We will set a prior on its age when we get to the `Priors` tab.

{% include image.html file="06_tipdateSampling.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}


#### Specifying the trait information

The next thing to do is to click on the `Traits` tab at the top of the main window. A trait can be any characteristic that is inherent to the specific taxon, for example, geographical location or host species. This step will assign a specific host and geographical location to each taxa. To associate the sequences with the these traits, we need to add a new trait under the `Traits` tab (click `Add trait`). This will open a new window to Create or Import Trait(s):

{% include image.html file="07_importTrait.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

Select `Import trait(s) from a mapping file` (the format of such a file can be shown). Browse to and load the batRABV\_hostLocation.txt tab-delimited file which contains the discrete host and location for each sequence. Note that the host species is specified using a two-character abbreviation (e.g. Ef for Eptesicus fuscus, three characters for Lbl) as shown for this snippet of the file:

	traits	host	state
	AZ4030\_2005.5	Ap	Arizona
	AZ1968\_2004.5	Ef	Arizona
	AZ7590\_2005.5	Ef	Arizona
	CA237\_2002.5	Ef	California
	CA29\_2002.5	Ef	California
	CA9242\_2002.5	Ef	California
	CAO120\_2002.5	Ef	California
	CA0253\_2003.5	Ef	California
	CA148\_2004.5	Ef	California
	CA6860\_2004.5	Ef	California
	CA0100\_2005.5	Ef	California
	GA31940\_2004.5	Ef	Georgia
		...
	TX3545\_2004.5	Tb	Texas

After clicking `OK`, select the host trait and click on `create partition from trait..`. This new partition will be shown under the `Partitions` tab. Do the same for the location trait (state), resulting in three partitions in the `Partitions` tab:

{% include image.html file="08_traitPartitions.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

#### Setting the sequence and trait evolutionary models

The next thing to do is to click on the `Sites` tab at the top of the main window. This will reveal the evolutionary model settings for BEAST. Exactly which options appear depend on whether the data are nucleotides, amino acids or traits. 

This tutorial assumes that you are familiar with the evolutionary models available, however there are a couple of points to note about selecting a model in BEAUti:

Selecting the `Partition into codon positions` option assumes that the data are aligned as codons. This option will then estimate a separate rate of substitution for each codon position, or for 1+2 versus 3, depending on the setting.

Selecting the `Unlink substitution model across codon positions` will specify that BEAST should estimate a separate transition-transversion ratio or general time reversible rate matrix for each codon position. 

Selecting the `Unlink rate heterogeneity model across codon positions` will specify that BEAST should estimate a set of rate heterogeneity parameters (gamma shape parameter and/or proportion of invariant sites) for each codon position. 

For the nucleotide model in this tutorial, keep the default HKY substitution model, set base frequencies to Empirical, and use Gamma-distributed rate variation among sites (with 4 discrete categories):

{% include image.html file="09_substModel.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

Click on 'host' in the `Substitution model` window and keep the `Discrete Trait Substitution Model` to Symmetric substitution model and select the option to perform BSSVS (Infer social network with BSSVS). The Symmetric substitution model specifies a discrete state ancestral reconstruction using a standard continuous-time Markov chain (CTMC), in which the transition rates between locations are reversible. The alternative Asymmetric substitution model specifies a discrete state ancestral reconstruction using a nonreversible CTMC. Selecting the BSSVS option enables the Bayesian Stochastic Search Variable Selection procedure. This procedure will attempt to invoke a limited number of rates (at least k-1, where k is the number of states) to adequately explain the phylogenetic diffusion process.

{% include image.html file="10_hostModel.png" prefix="tutorials/batRabies_discreteDiffusion/" caption="" %}

Apply the same discrete diffusion model settings to the spatial ‘state’ trait.

#### Setting the ‘molecular clock’ model

The ‘Molecular Clock Model’ options in the `Clocks` panel allows us to choose between a strict and a relaxed (uncorrelated lognormal or uncorrelated exponential) clock. We will perform our run using the default Strict clock model:

{% include image.html file="11_clockModel.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

We can also keep default settings for overall rate scalers in the host and location state transition processes.

Now move on to the `Trees` panel.

#### Setting the tree prior

This panel contains settings about the tree. Firstly the starting tree is specified to be ‘randomly generated’. The other main setting here is to specify the ‘Tree prior’ which describes how the population size is expected to change over time according to a coalescent model. The default tree prior is set to a constant size coalescent prior. In this tutorial, we will keep these default settings.

{% include image.html file="12_treePrior.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

#### The ancestral states settings

In the `States` panel, check that for the host and state partition the option to Reconstruct states at all ancestors is selected (by default).

{% include image.html file="13_statesPanel.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

#### Setting up the priors

Review the prior settings under the `Priors` tab. This panel has a table showing every parameter of the currently selected model and what the prior distribution is for each. A prior allows the user to ‘inform’ the analysis by selecting a particular distribution. Although some of the default priors may be improper, with sufficiently informative data the posterior becomes proper. If priors or not set, they will appear in red.

The default prior on the rate of evolution (clock.rate) is an approximation of a conditional reference prior (Approx. Reference Prior) (Ferreira and Suchard, 2008). The same is applied to the discrete host and location state rate. There is also a default uniform prior specification for the age of TX5275 (age(TX5275_2002.5) ). We will assume that the sampling time for this tip is bounded by the sampling time range for all taxa this data set, implying that it is sampled between 1997.5 and 2005.5. Click on the current uniform prior setting, set the Upper age to 8 years (reflecting the 1997.5 boundary) and click OK.

{% include image.html file="14_priors.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

#### Setting up the operators

Each parameter in the model has one or more “operators” (these are variously called moves, proposals or transition kernels by other MCMC software packages such as MrBayes and LAMARC). The operators specify how the parameters change as the MCMC runs. The ‘Operators’ tab in BEAUti has a table that lists the parameters, their operators and the tuning settings for these operators:

{% include image.html file="15_operators.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

In the first column are the parameter names. These will be called things like kappa which means the HKY model's kappa parameter (the transition-transversion bias). The next column has the type of operators that are acting on each parameter. For example, the scale operator scales the parameter up or down by a proportion, the random walk operator adds or subtracts an amount to the parameter and the uniform operator simply picks a new value uniformly within a range. Some parameters relate to the tree or to the divergence times of the nodes of the tree and these have special operators.

The next column, labelled `Tuning`, gives a tuning setting to the operator. Some operators don't have any tuning settings so have n/a under this column. The tuning parameter will determine how large a move each operator will make which will affect how often that change is accepted by the MCMC which will in turn affect the efficiency of the analysis. For most operators (like random walk and subtree slide operators) a larger tuning parameter means larger moves. However for the scale operator a tuning parameter value closer to 0.0 means bigger moves. At the top of the window is an option called ‘Auto Optimize’ which, when selected, will automatically adjust the tuning setting as the MCMC runs to try to achieve maximum efficiency. At the end of the run a table of the operators, their performance and the final values of these tuning settings will be written to standard output. 
<!--
These can then be used to set the starting tuning settings in order to minimize the amount of time taken to reach optimum performance in subsequent runs.
-->

The next column, labelled ‘Weight’, specifies how often each operator is applied relative to the others. Some parameters tend to be sampled very efficiently - an example is the kappa parameter - these parameters can have their operators down-weighted so that they are not changed as often. We will start by using the default settings for this analysis. As of BEAST v1.8.4, different options are available w.r.t. exploring tree space. In this tutorial, we will use the ‘classic operator mix’, which consists of of set of tree transition kernels that propose changes to the tree. There is also an option to fix the tree topology as well as a ‘new experimental mix’, which is currently under development with the aim to improve mixing for large phylogenetic trees. So, we can keep the default operator settings for the current analysis.


#### Setting the MCMC options

The `MCMC` tab in BEAUti provides settings to control the MCMC chain. Firstly we have the ‘Length of chain’. This is the number of steps the MCMC will make in the chain before finishing. How long this should be depends on the size of the dataset, the complexity of the model and the precision of the answer required. The default value of 10,000,000 is entirely arbitrary and should be adjusted according to the size of your dataset. We will see later how the resulting log file can be analysed using Tracer in order to examine whether a particular chain length is adequate.

{% include image.html file="16_mcmc.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

The next couple of options specify how often the current parameter values should be displayed on the screen and recorded in the log file. The screen output is simply for monitoring the program's progress so can be set to any value (although if set too small, the sheer quantity of information being displayed on the screen will slow the program down). For the log file, the value should be set relative to the total length of the chain. Sampling too often will result in very large files with little extra benefit in terms of the precision of the estimates. Sample too infrequently and the log file will not contain much information about the distributions of the parameters. You probably want to aim to store no more than 10,000 samples so this should be set to the chain length / 10,000. For this dataset let's initially set the chain length to 100,000 as this will run reasonably quickly on most modern computers. Although the suggestion above would indicate a lower sampling frequency, in this case set both the sampling frequencies to 100.

The next option allows the user to set the File stem name; if not set to ‘batRABV’ by default, you can type this in here. The next two options give the file names of the log files for the parameters and the trees. These will be set to based on the file stem name. You can also log the operator analysis to a file. An option is also available to sample from the prior only, which can be useful to evaluate how divergent our posterior estimates are when information is drawn from the data. Here, we will not select this option, but analyze the actual data. Finally, one can select to perform marginal likelihood estimation to assess model fit, which is not needed in this exercise. So, at this point we are ready to generate a BEAST XML file and to use this to run the Bayesian evolutionary analysis. To do this, either select the `Generate BEAST File...` option from the `File` menu or click the similarly labelled button at the bottom of the window. BContinue and choose a name for the file (for example, batRABV.xml by adding the xml extension to the file name stem) and save the file. For convenience, you can leave the BEAUti window open so that you can change the values and re-generate the BEAST file if necessary.

### Running BEAST

Once the BEAST XML file has been created the analysis itself can be performed using BEAST. The exact instructions for running BEAST depends on the computer you are using, but in most cases a dialog box will appear in which you select the XML file:

{% include image.html file="17_BEASTgui.png" prefix="tutorials/bat_rabies_discrete_diffusion/"  max-width="50%" align="center" caption="" %}

Press the ‘Choose File’ button and select the XML file you just created and press ‘Run’. When you have installed the BEAGLE library (https://github.com/beagle-dev/beagle-lib), you can use this in conjunction with BEAST to speed up the calculations. If not installed, unselect the use of the BEAGLE library. If the command line version of BEAST is being used then the name of the XML file is given after the name of the BEAST executable. The analysis will then be performed with detailed information about the progress of the run being written to the screen. When it has finished, the log file and the trees file will have been created in the same location as your XML file. 

### Analyzing the BEAST output

To analyze the results of running BEAST we are going to use the program Tracer. The exact instructions for running Tracer differs depending on which computer you are using. Double click on the Tracer icon; once running, Tracer will look similar irrespective of which computer system it is running on.

Select the `Import Trace File...` option from the `File` menu. If you have it available, select the log file that you created in the previous section (batRABV.log). Alternative, drag and drop your lof file into the Tracer window. The file will load and you will be presented with a window similar to the one below. Remember that MCMC is a stochastic algorithm so the actual numbers will not be exactly the same.

{% include image.html file="18_tracerShort.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

On the left hand side is the name of the log file loaded and the traces that it contains. There are traces for the posterior (this is the log of the product of the tree likelihood and the prior probabilities), and the continuous parameters. Selecting a trace on the left brings up analyses for this trace on the right hand side depending on tab that is selected. When first opened, the 'posterior' trace is selected and various statistics of this trace are shown under the `Estimates` tab.

In the top right of the window is a table of calculated statistics for the selected trace. The statistics and their meaning are described in the table below.

* Mean - The mean value of the samples (excluding the burn-in). 
* Stdev - The standard error of the mean. This takes into account the effective sample size so a small ESS will give a large standard error. 
* Median - The median value of the samples (excluding the burn-in). 
* 95% HPD Lower - The lower bound of the highest posterior density (HPD) interval. The HPD is the shortest interval that contains 95% of the sampled values. 
* 95% HPD Upper - The upper bound of the highest posterior density (HPD) interval. 
* Auto-Correlation Time (ACT) - The average number of states in the MCMC chain that two samples have to be separated by for them to be uncorrelated (i.e. independent samples from the posterior). The ACT is estimated from the samples in the trace (excluding the burn-in). 
* Effective Sample Size (ESS) - The effective sample size (ESS) is the number of independent samples that the trace is equivalent to. This is calculated as the chain length (excluding the burn-in) divided by the ACT.

Note that the effective sample sizes (ESSs) for all the traces are small (ESSs less than 100 are highlighted in red by Tracer and values > 100 but < 200 are in yellow). This is not good. A low ESS means that the trace contained a lot of correlated samples and thus may not represent the posterior distribution well. In the bottom right of the window is a frequency plot of the samples which is expected given the low ESSs is extremely rough. Inspecting the Trace of many continuous parameters  shows that the chain is still in the burn-in phase (the posterior values are still increasing over the entire chain), and this run does not allow us to summarize marginal posterior probability distributions for the parameters. 

The simple response to this situation is that we need to run the chain for longer. The example below was run for 200 million steps, sampling every 50,000th step, which means that 4,000 samples where stored in the log file. In this case, the MCMC run has reached stationarity, and almost all parameter traces still show satisfactory ESSs.

{% include image.html file="19_tracerLong.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

We can continue to summarize the annotated phylogeographic tree inferred with the BSSVS procedure and estimate the most significant rates of diffusion. If you are only interested in summarizing the Bayes Factor rates from the BSSVS analysis and not in summarizing the tree from your run, jump to the last section of this tutorial entitled 'Visualizing tree and calculating Bayes factor support for rates using SpreadD3'. If you are also interested in summarizing the tree, continue to next section. 

### Summarizing the trees

We have seen how we can diagnose our MCMC run using Tracer and produce estimates of the marginal posterior distributions of parameters of our model. However, BEAST also samples trees (either phylogenies or genealogies) at the same time as the other parameters of the model. These are written to a separate file called the 'trees' file. This file is a standard NEXUS format file. As such it can easily be loaded into other software in order to examine the trees it contains. One possibility is to load the trees into a program such as PAUP* and construct a consensus tree in a similar manner to summarizing a set of bootstrap trees. In this case, the support values reported for the resolved nodes in the consensus tree will be the posterior probability of those clades.

In this tutorial, however, we are going to use a tool that is provided as part of the BEAST package to summarize the information contained within our sampled trees. The tool is called TreeAnnotator and once running, you will be presented with a window like the one below.

{% include image.html file="20_treeAnnotator.png" max-width="50%" align="center" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

* TreeAnnotator takes a single 'target' tree and annotates it with the summarized information from the entire sample of trees. The summarized information includes the average node ages (along with the HPD intervals), the posterior support and the average rate of evolution on each branch (for relaxed clock models where this can vary). The program calculates these values for each node or clade observed in the specified 'target' tree. It has the following options:

* Burnin - This is the number of steps in the MCMC chain, Burnin (as states), or the number of trees, Burnin (as trees), that should be excluded from the summarization. For the example above, with a chain of 200,000,000 steps, a 10% burnin corresponds to 20,000,000 steps. Alternatively, sampling every 50,000 steps results in 4000 trees in the file, and to obtain at the same 10% burnin, the number of trees needs to be set to 400.

* Posterior probability limit - This is the minimum posterior probability for a node in order for TreeAnnotator to store the annotated information. The default is 0.0 so every node, no matter what its support, will have information summarized. Make sure this value remains 0.0 as every node will require location annotation for further visualization. 

* Target tree type - This has three options `Maximum clade credibility tree` or `User target tree` For the latter option, a NEXUS tree file can be specified as the Target Tree File, below. Select the first option, TreeAnnotator will examine every tree in the Input Tree File and select the tree that has the highest product of the posterior probabilities of all its nodes. 

* Node heights - This option specifies what node heights (times) should be used for the output tree. If the `Keep target heights` is selected, then the node heights will be the same as the target tree. Node heights can also be summarised as  a Mean or a Median over the sample of trees. Sometimes a mean or median height for a node may actually be higher than the mean or median height of its parental node (because particular ancestral-descendent relationships in the MCC tree may still be different compared to a large number of other tree sampled). This will result in artifactual negative branch  lengths, but can be avoided by the `Common Ancestor heights` option. Let’s use the default Median heights for our summary tree.

* Target Tree File - If the `User target tree` option is selected then you can use `Choose File...` to select a NEXUS file containing the target tree.

Input Tree File - Use the `Choose File...` button to select an input trees file. This will be the trees file produced by BEAST. 

* Output File - Select a name for the output tree file (e.g., batRABV.MCC.tre).

Once you have selected all the options, above, press the `Run` button. TreeAnnotator will analyse the input tree file and write the summary tree to the file you specified. This tree is in standard NEXUS tree file format so may be loaded into any tree drawing package that supports this. However, it also contains additional information that can only be displayed using the FigTree program.

### Viewing the annotated tree

<!--
edited up to here
-->

Run FigTree now and select the ‘Open...’ command from the ‘File’ menu. Select the tree file you created using TreeAnnotator in the previous section. The tree will be displayed in the FigTree window. On the left hand side of the window are the options and settings which control how the tree is displayed. In this case we want to display the posterior probabilities of each of the clades present in the tree and estimates of the age of each node. In order to do this you need to change some of the settings.

{% include image.html file="fig17.png" prefix="tutorials/bat_rabies_discrete_diffusion/" caption="" %}

First, re-order the node order by Increasing Node Order under the Tree Menu. Click on Branch Labels in the control panel on the left and open its section by clicking on the arrow on the left. Now select posterior under the Display option.

We now want to display bars on the tree to represent the estimated uncertainty in the date for each node. TreeAnnotator will have placed this information in the tree file in the shape of the 95% highest posterior density (HPD) intervals (see the description of HPDs, above). Select Node Bars in the control panel and open this section; select ‘height_95%_HPD’ to display the 95% HPDs of the node heights. We can also plot a time scale axis for this evolutionary history (select ‘Scale Axis’ and deselect ‘Scale bar’). For appropriate scaling, open the ‘Time Scale’ section of the control panel, set the ‘Offset’ to 2009.403, the scale factor to -1.0. and ‘Reverse Axis’ under ‘Scale Axis’.

Finally, open the Appearance panel and alter the Line Weight to draw the tree with thicker lines. None of the options actually alter the tree's topology or branch lengths in anyway so feel free to explore the options and settings. You can also save the tree and this will save most of your settings so that when you load it into FigTree again it will be displayed almost exactly as you selected. The tree can also be exported to a graphics file (pdf, eps, etc.).

### A quick how-to summary for Exercise 1

#### Run BEAUti.

Load a NEXUS format alignment by selecting the Import Data... option from the File menu. Select the file called H1N109.nex. 

In the Tips tab, select the box labelled Use tip dates and click the Guess Dates button. Keep the default Defined just by its order and select last from the drop-down menu for the order and press OK.

In the Sites tab, keep the default HKY substitution model for the nucleotide data and base frequencies as Estimated. Select ‘Gamma’ as ‘Site Heterogeneity Model’ (with 4 discrete categories) before proceeding to the ‘Clocks’ tab.

In the Clocks tab, keep a strict clock model.

In the Trees tab, set the option for Tree Prior to Coalescent: Exponential Growth..

In the MCMC tab, set the chain length to 1,00,000 and both the sampling frequencies to 100. Set the File name stem to H1N109 and generate the beast file (H1N109.xml).

#### Run BEAST and load the xml file.

Analyze the output using Tracer. Analyze the output file for the longer runs.

Calculate the growth rate for pandemic influenza H1N1 (see page 12 of this tutorial).

Summarize the trees of the longer run using treeAnnotator (burn-in = 500,000 states or 100 trees).

#### Visualize the tree in FigTree.

## References
Drummond AJ, Rambaut A (2007) BEAST: Bayesian evolutionary analysis by sampling trees. BMC Evolutionary Biology 7: 214.
Drummond AJ, Ho SYW, Phillips MJ & Rambaut A (2006) PLoS Biology 4, e88.
Drummond AJ, Rambaut A & Shapiro B and Pybus OG (2005) Mol Biol Evol 22, 1185-1192.
Drummond AJ, Nicholls GK, Rodrigo AG & Solomon W (2002) Genetics 161, 1307-1320.
Ferreira, M. A. R. and M. A. Suchard. 2008. Bayesian analysis of elapsed times in continuous-time Markov chains. Can J Statistics, 36: 355–368. doi: 10.1002/cjs.5550360302
Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.
Smith GJD, Vijaykrishna D, Bahl J, Lycett SJ, Worobey M, Pybus OG, Ma SK, Cheung CL, Raghwani J, Bhatt S, Peiris JSM, Guan Y & Rambaut A (2009) Origins and evolutionary genomics of the 2009 swine-origin H1N1 influenza A epidemic. Nature 459, 1122-1125.

## Help and documentation

The BEAST software download: http://beast-mcmc.googlecode.com/

The BEAST website: http://beast.bio.ed.ac.uk/

Tutorials: http://beast.bio.ed.ac.uk/Tutorials/

Frequently asked questions: http://beast.bio.ed.ac.uk/FAQ/

H1N1/09: http://tree.bio.ed.ac.uk/wiki/projects/influenza/

{% include links.html %}

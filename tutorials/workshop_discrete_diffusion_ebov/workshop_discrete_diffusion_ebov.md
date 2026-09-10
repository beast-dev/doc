---
title: 'Phylogeographic diffusion in discrete space: EBOV'
keywords: phylogeography, Ebola, EBOV, tutorial
last_updated: August 26, 2026
tags: [tutorial]
summary: 'This chapter provides a step-by-step tutorial on reconstructing the spatial dispersal of Ebola virus (EBOV) during the North Kivu/Ituri EBOV outbreak (2018-2020) in the Democratic Republic of the Congo (DRC). During this outbreak, a total of 3481 cases (3323 confirmed, 158 probable) were reported. Of these, 2299 people died and 1162 survived. At the time, it was the world’s second largest Ebola outbreak on record.
The data set comprises 836 genomes from 27 health zones in the DRC (<a href=\"https://doi.org/10.1038/s41591-021-01302-z\">Kinganda-Lusamaki et al., Nature Medicine, 2021, 27, 710-716</a>). The paper representing the original phylodynamic analyses also discusses how the genomic surveillance data informed response efforts and public health decision making.
The aim of this tutorial is to estimate the pattern of spatiotemporal EBOV spread and explore predictors of spread.'

sidebar: beast_sidebar
permalink: workshop_discrete_diffusion_ebov.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/workshop_discrete_diffusion_ebov/{% endcapture %}

## Introduction

The first step will be to convert an alignment file in fasta format into a BEAST XML input file. This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). This is a user-friendly program for setting the evolutionary model and options for the MCMC analysis. The second step is to actually run BEAST using the input file that contains the data, model and settings. The final step is to explore the output of BEAST in order to diagnose problems and to summarize the results.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include beagle_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

<!-- {% include spread3_callout.md %} -->
{% include spreadgl_callout.md %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> All the files needed for this tutorial
<a href="{{ root_url }}files/discreteTutorialFilesEBOV.zip"> can be downloaded from here</a>. 
If you download this zipped folder, there is no need to download other files/folders linked further in the tutorial.
</div>

## EXERCISE 1: discrete ancestral reconstruction

### Running BEAUti

{% include icon-callout.html file='icons/beauti-icon.png' content='Run <a href="beauti">BEAUti</a> by double clicking on its icon. ' %}

#### Loading the sequence data file 

The input file for this tutorial, <samp>EBOV_DRC_18-20.fas</samp>, can be [downloaded from here]({{ root_url }}files/EBOV_DRC_18-20.fas). This fasta formatted file contains an alignment of 836 EBOV genomes encompassing 18750 bp. 

To load the alignment, simply select the `Import Data...` option from the `File` menu. Select the <samp>EBOV_DRC_18-20.fas</samp> file. Alternatively, you can drag and drop the alignment file in the window under the `Partitions` menu.
Once loaded, the sequence data will be listed under `Partitions` as shown in the figure:

{% include image.html file="sequencePartition.png" prefix=root_url %}

#### Specifying the sampling date information 

By default all the taxa are assumed to have a date of zero (i.e. the sequences are assumed to be sampled at the same time). However, the EBOV sequences have been sampled over about a year. To set the sampling dates switch to the `Tips` panel using the tabs at the top of the window.

Select the box labelled `Use tip dates`. The EBOV sequences have their date of sampling encoded in their labels so use the `Parse Dates` button at the top of the `Tips` panel. Clicking this will make a dialog box appear:

{% include image.html file="parseDates.png" prefix=root_url width="80%" align="center" %}

This operation attempts to guess what the dates are from information contained within the taxon names. It works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field then you can specify how to find the one that corresponds to the date of sampling. [See this page for details about the various options for setting dates in this panel](tip_dates). For the EBOV sequences you can specify `Defined by a prefix its order`, `Order: last`, `Prefix: |` and `Parse calendar dates with variable precision`. The latter is needed because for 4 genomes, only the month of sampling is known. Press `OK`. A window should appear to indicate that some dates have less precision than others, offering to switch on `Sampling uniformly from precision`. Press `Yes`. The dates (`Date`) and their uncertainty (`Uncertainty`) will appear in the appropriate columns of the main window, and the `Tip date sampling` option at the bottom left of the `Tips` panel will be set to `Sampling uniformly from uncertainty`.

{% include tip.html content='<a href="tip_date_sampling">For more information about sampling tip dates, see this page</a>.' %}

{% include image.html file="datesSpecified.png" prefix=root_url %}

You can now check these dates (as fractional years) and edit them manually if that would be needed. At the top of the window you can set the units that the dates are given in (years, months, days) and whether they are specified relative to a point in the past (as is the case for years such as 2005) or backwards in time from the present (as in the case of radiocarbon ages).

The `Height` column lists the ages of the tips relative to time 0 (in our case, the most recent sampling date: 2019-08-03 or 2019.5863013698631). You can change the 'time 0' date by clicking the `Specify origin date:` option and specifying it in the respective window. 

#### Specifying the trait information

The next thing to do is to click on the `Traits` tab at the top of the main window. A trait can be any characteristic that is inherent to the specific taxon, for example, geographical location or host species. This step will assign a geographical location to each taxa based on the trait specification for each sequence in the <samp>taxa_HZ.txt</samp> file, which can be [downloaded from here]({{ root_url }}files/taxa_HZ.txt). To associate the sequences with the traits, we need to add a new trait under the `Traits` tab (click `Add trait`). This will open a new window to Create or Import Trait(s):

{% include image.html file="createImportTrait.png" width="80%" prefix=root_url %}

Select `Import trait(s) from a mapping file` (the format of such a file can be shown). Browse to and load the <samp>taxa_HZ.txt</samp> tab-delimited file. A window will appear asking you whether you want to create a traits partition: Press `Yes`. In the next window, set `Name trait partition:` to `HZ`(for health zone).
The HZ trait should now appear in the left window and clicking on it shows the health zone locations associated with the taxa. 

{% include image.html file="taxaTraits.png" width="80%" prefix=root_url %}

The new partition will also be shown under the `Partitions` tab, resulting in two partitions in the `Partitions` tab:

{% include image.html file="twoPartitions.png" prefix=root_url %}

#### Setting the sequence and trait evolutionary models

The next thing to do is to click on the `Sites` tab at the top of the main window. This will reveal the evolutionary model settings for BEAST. For the nucleotide model in this tutorial, we specify the `GTR` substitution model, we set base frequencies to `Empirical`, and use Gamma-distributed rate variation among sites (with 4 discrete categories, the `Gamma (equal weights)` option):

{% include image.html file="nucSubstModel.png" prefix=root_url %}

Next, click on 'HZ' in the `Substitution model` window and keep the `Forward-in-time CTMC` model as `Discrete Trait Substitution Model` and the `Symmetric substitution model` as `Forward-in-time Model Structure`, but select the option to perform BSSVS (`Infer social network with BSSVS`). The symmetric substitution model specifies a discrete state ancestral reconstruction using a standard continuous-time Markov chain (CTMC), in which the transition rates between locations are reversible. The alternative Asymmetric substitution model specifies a discrete state ancestral reconstruction using a nonreversible CTMC. Selecting the BSSVS option enables the Bayesian Stochastic Search Variable Selection procedure. This procedure will attempt to limit the number of rates (at least K-1, where K is the number of states) to only those that adequately explain the phylogenetic diffusion process.

{% include image.html file="traitModel.png" prefix=root_url %}<br /><br />

#### Setting the ‘molecular clock’ model

The ‘Molecular Clock Model’ options in the `Clocks` panel allows us to choose between a strict and a relaxed (uncorrelated lognormal or uncorrelated exponential) clock. For the nucleotide data (default), we will perform our run using the `Uncorrelated relaxed clock` model with the default `Lognormal` distribution as `Relaxed Distribution`:

{% include image.html file="clockModel.png" prefix=root_url %}

We can keep the default settings for overall rate scalar on the geographic <samp>HZ</samp> transition processes.

Now move on to the `Trees` panel.

#### Setting the tree prior

This panel contains settings about the tree. Firstly the starting tree is specified to be a `Random starting tree`. The other main setting here is to specify the `Tree prior` which describes how the population size is expected to change over time according to a coalescent model. The default tree prior is set to a constant size coalescent prior. In this tutorial, we will set the `Tree Prior:` to `Coalescent: Bayesian SkyGrid` with <samp>24</samp> population sizes (`Number of parameters:` 24) for a period of two years, so with `Time at last transition point:` <samp>2</samp>.

{% include image.html file="treePrior.png" prefix=root_url %}

#### The ancestral states settings

In the `States` panel, check that for HZ partition the option to Reconstruct states at all ancestors is selected (by default).

{% include image.html file="statesPanel.png" prefix=root_url %}

#### Setting up the priors

Now switch to the `Priors` tab. This panel has a table showing every parameter of the currently selected model and what the prior distribution is for each. A strong prior allows the user to ‘inform’ the analysis by selecting a particular distribution with a small variance. Alternatively we can select a weak (diffuse) prior to try to minimise the effect on the analysis. Note that a prior distribution must be specified for every parameter and whilst BEAUti provides default options these are not necessarily tailored to the problem and data being analyzed. 

The default prior on the rate of evolution (default.ucld.mean) is an approximation of a conditional reference prior (Approx. Reference Prior) (Ferreira and Suchard, 2008). The same is applied to the discrete location state (HZ) rate. Note the Poisson prior specification for the BSSVS procedure (Gao et al., 2023).

{% include image.html file="priorPanel.png" prefix=root_url %}

#### Setting up the operators

Each parameter in the model has one or more “operators” (these are variously called moves, proposals or transition kernels by other MCMC software packages such as MrBayes and LAMARC). The operators specify how the parameters change as the MCMC runs. The `Operators` tab in BEAUti has a table that lists the parameters, their operators and the tuning settings for these operators:

{% include image.html file="operatorPanel.png" prefix=root_url %}

We can keep the default operator settings for the current analysis.

#### Setting the MCMC options

The `MCMC` tab in BEAUti provides settings to control the MCMC chain and the log files that get produced.

For this dataset let's initially set the chain length to <samp>100,000</samp>, both the sampling frequencies to <samp>100</samp> and checkpointing frequency to <samp>10000</samp>. The `File name stem:` should already be set to <samp>EBOV_DRC_18-20</samp> but you can adjust this (perhaps add more indications about the analysis).

{% include image.html file="mcmcPanel.png" prefix=root_url %}

We are now ready to create the BEAST XML file. Select `Generate XML...` from the `File` menu (or the button at the bottom of the window). BEAUti will ask you to review the prior settings one more time before saving the file (and will indicate if any are improper). Continue and choose a name for the file --- it will offer the name you gave it in the MCMC panel and we usually end the filename with '.xml' (although on Windows machines you may want to give the file the extension '.xml.txt'). 

{% include tip.html content="For convenience, leave the BEAUti window open so that you can change the values and re-generate the BEAST file as required later in this tutorial." %}

### Running BEAST

Once the BEAST XML file has been created the analysis itself can be performed using BEAST. 

{% include icon-callout.html file='icons/beast-icon.png' content='Run <a href="beast">BEAST</a> by double-clicking on the BEAST icon.' %}

Once BEAST has started a dialog box will appear in which you select the XML file:

{% include image.html file="beastGUI.png" prefix=root_url  width="80%" align="center" %}

Press the `Choose File...` button and select the XML file you just created and press `Run`. The analysis will then be performed with detailed information about the progress of the run being written to the screen. When it has finished, the log file and the trees file will have been created in the same location as your XML file. 

[For more information about the other options in the BEAST dialog box see this page](beast).

### Analyzing the BEAST output using Tracer

To analyze the results of running BEAST we are going to use the program Tracer. The exact instructions for running Tracer differs depending on which computer you are using. Double click on the Tracer icon; once running, Tracer will look similar irrespective of which computer system it is running on.

Select the `Import Trace File...` option from the `File` menu. If you have the log file that you created in the previous section available, you could select this (<samp>EBOV_DRC_18-20.log</samp>). However, due to the data set size and discrete trait dimensionality, even the short chain will take some time to complete. So, if you do not wish to wait for this, you can go straight to selecting the log file from the longer run that has been made available (also <samp>EBOV_DRC_18-20.log</samp>).  
Instead of importing trace files, you can also drag and drop your log file into the Tracer window. The file will load and you will be presented with a window similar to the one below. Remember that MCMC is a stochastic algorithm so the actual numbers will not be exactly the same.

{% include image.html file="tracerShort.png" prefix=root_url %}

On the left hand side is the name of the log file loaded and the traces that it contains. There are traces for the posterior (<samp>joint</samp>, this is the log of the product of the tree likelihood and the prior probabilities), and the continuous parameters. Selecting a trace on the left brings up analyses for this trace on the right hand side depending on tab that is selected. When first opened, the 'posterior' trace is selected and various statistics of this trace are shown under the `Estimates` tab.

{% include callout.html content='For an explanation of the various summary statistics displayed, above, <a href="workshop_rates_and_dates#analysing-the-beast-output">see this section of the \'Estimating rates and dates from time-stamped sequences\' tutorial</a>.' %}

Note that the effective sample sizes (ESSs) for all the traces are very small. Select the `Trace` panel from the top of the window and inspecting the traces of the various parameters. You will see that the chain is still in the burn-in phase (the posterior values are still increasing over the entire chain), and this run does not allow us to summarize marginal posterior probability distributions for the parameters. 

The simple response to this situation is that we need to run the chain for longer. We have provided the results of a very long run --- 350 million steps, sampling every 100,000th step, resulting in [3,500 samples ]({{ root_url }}files/longRuns/SYM_BSSVS/EBOV_DRC_18-20.log). In this case, the MCMC run has reached stationarity, and almost all parameter traces still show satisfactory ESSs. Only for the indicator variables, ESSs may still be low, but ESSs do not have the same interpretation for binary variables as compared to continuous variables.

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The long runs can be found in the shared folder:<br />
<div style="margin: 16px"><code>Tutorials\Tutorial 4 - Discrete Phylogeography\longRuns\BSSVS</code></div>
</div>
-->

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The log and trees files for longer EBOV discrete phylogeography runs <a href="{{ root_url }}files/discreteTutorialFilesEBOV.zip"> are part of the zipped file</a>. </div>


You can load the long run log file (<samp>EBOV_DRC_18-20.log</samp>) into the same Tracer window for comparison to the short run. This gives this:

{% include image.html file="tracerLong.png" prefix=root_url %}

We can continue to summarize the annotated phylogeographic tree inferred with the BSSVS procedure and estimate the most significant rates of diffusion. If you are only interested in summarizing the Bayes Factor rates from the BSSVS analysis and not in summarizing the tree from your run, jump to the last section of this tutorial entitled [Visualizing tree and calculating Bayes factor support for rates using SPREAD4](#visualizing-mcc-trees-and-calculating-bayes-factor-support-for-rates-using-spread4).  

### Summarizing and visualizing the trees

At this point you can summarize the sampled trees using the [TreeAnnotator](treeannotator) utility. Note that the trees file provided in the zipped folder has been thinned to every 3rd sample (1,167 trees) to keep the download manageable, so TreeAnnotator will report fewer trees than the 3,500 samples in the log file.
 
{% include callout.html content='A detailed description of how to do this was introduced in the earlier <a href="workshop_rates_and_dates#analysing-the-beast-output">\'Estimating rates and dates from time-stamped sequences\' tutorial</a>.' %}

You can use either [FigTree](figtree) or [PearTree](peartree) to visualize a summary tree like a HIPSTR tree obtained with TreeAnnotator. 
{% include callout.html content='Separate tutorials are available for both <a href="workshop_figtree">FigTree</a> and <a href="peartree_tutorial">PearTree</a>.' %}

Here, we will use PearTree to show a tree colored according to the annotated health zone location estimate for each node and tip. 
Under `BRANCHES`, select `HZ` as `Colour by` and keep the default `Tableau` as `Palette`.

{% include image.html file="pearTree_branches.png" prefix=root_url width="50%" indent="25%" %}

Select the same `HZ` attribute for `Colour by` under `NODE SHAPES`: 

{% include image.html file="pearTree_nodes.png" prefix=root_url width="50%" indent="25%" %}

and under `TIP SHAPES`: 

{% include image.html file="pearTree_tips.png" prefix=root_url width="50%" indent="25%" %}

Finally, also show `HZ` under `LEGEND`:

{% include image.html file="pearTree_legend.png" prefix=root_url width="50%" indent="25%" %}

This should result in a similar visualization as this one:

{% include image.html file="pearTree_coloredTree.png" prefix=root_url width="100%" align="center" %}


### Visualizing the consensus tree <!--and calculating Bayes factor support for rates--> using SpreadGL

SpreadGL, i.e. Spatial Phylogenetic Reconstruction of EvolutionAry Dynamics built on kepler.gl, is a software to visualize the output from Bayesian phylogeographic analysis and constitutes a user-friendly application to analyze and visualize reconstructions resulting from Bayesian inference of sequence and trait evolutionary processes. SpreadGL allows to visualise spatial reconstructions on custom maps and is run entirely online in browsers such as Firefox, Safari and Chrome.

To place the health zones on a map, SpreadGL needs a coordinate for each of them. The centroid of every health zone in the analysis is provided in [`healthzone_centroids.csv`]({{ root_url }}files/healthzone_centroids.csv), a comma-separated file with one row per health zone and the columns `health_zone`, `longitude` and `latitude`.

<!--NT: removing this while Sam helps with BF issue in spread.gl
Some of the functions that relate to the discrete phylogeographic analysis include visualizing location-annotated MCC trees and identification of well-supported rates using a Bayes Factor test. The latter option takes as input the rate matrix file (<samp>batEBOV.state.rates.log</samp> for location states and <samp>batEBOV.host.rates.log</samp> for host states) generated under the analysis using the Bayesian Stochastic Search Variable Selection (BSSVS) procedure. This test aims at identifying frequently invoked rates to explain the diffusion process and, in case of locations, visualize them on a circle and on a globe or a map, which needs to be provided to SPREAD4. -->

<!--{% include callout.html content='A detailed tutorial for this particular step <a href="https://rega.kuleuven.be/cev/ecv/software/SpreaD3_tutorial#sectionFourTwo">is available here</a>. We have also provide a PDF version of the entire SpreaD3 tutorial <a href="files/SpreaD3Tutorial.pdf">for download</a>.' %}-->

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data files required for the analyses can be found in the shared folder:<br />
<div style="margin: 16px"><code>Tutorials\Tutorial 4 - Discrete Phylogeography\</code></div>
</div>
-->

<!-- 
To get started with SpreadGL, follow the instructions [here](https://beast.community/spreadgl.html).

To visualize an MCC tree, load the MCC tree, the most recent sampling date (2005.5) to 2005-07-02, and coordinates in the ‘<samp>locationStates_SPREADGL.txt</samp>’ file, which should look like this:

```
location,latitude,longitude 
Arizona,33.7712,-111.3877
California,36.17,-119.7462
Georgia,32.9866,-83.6487
Iowa,42.0046,-93.214
Michigan,43.3504,-84.5603
NewJersey,40.314,-74.5089
Virginia,37.43157,-78.656895
Washington,47.3917,-121.5708
Florida,27.8333,-81.717
Tennessee,35.7449,-86.7489
Texas,31.106,-97.6475
Idaho,44.2394,-114.5103
Indiana,39.8647,-86.2604
Mississippi,32.7673,-89.6812
```
 -->

<!-- The coordinates can be downloaded [here]({{ root_url }}files/locationStates.txt).-->

<!--This will load the locations and their lat/long coordinates. Set the most recent sampling date (2005.5) to 2005-07-02, and click `Start analysis`.

{% include image.html file="spread4_1_setupMCC.png" prefix=root_url %}

The analysis will first appear in the left-side tab `Queued` and then in the  `Completed Data Analysis`.

{% include image.html file="spread4_2_getLink.png" prefix=root_url %}

There is an option to load a custom map of the United States in GeoJSON format. Such a map is provided amongst the data files  --- <samp>gz_2010_us_040_00_500k.json</samp>. However, a default map is provided to visualize the results. Click `Copy` and open the [link](https://view.spreadviz.org/?output=fffe6230-51af-4413-99fc-11d7fcbdcda7/e23132db-f39d-4832-88a5-5920cdd9331e.json&maps=RU,MX,US,CA) in a new browser tab/window.

{% include image.html file="spread4_3_map.png" prefix=root_url %}

To summarise Bayes factor support for rates, select the `Discrete Rates` tab. Load the output BEAST file containing the spatial rates and rate indicators (batEBOV.state.rates.log) and the coordinates in the <samp>locationStates.txt</samp> file, and set an appropriate burn-in level. Click, `Start analysis`.

{% include image.html file="spread4_4_setupRates.png" prefix=root_url %}

The analysis will first appear in the left-side tab `Queued` and then in the `Completed Data Analysis`.
There is an option to load a custom map of the United States in GeoJSON format. Such a map is provided amongst the data files --- <samp>gz_2010_us_040_00_500k.json</samp>. However, a default map is provided to visualize the results. Click `Copy` and open the [link](https://view.spreadviz.org/?output=fffe6230-51af-4413-99fc-11d7fcbdcda7/8775fac9-4cc5-4e33-98e6-d9cad676891e.json&maps=RU,MX,US,CA) in a new browser tab/window. Note that a comma-separated value file with a ‘.csv’ extension containing the actual Bayes Factor values can be downloaded by clicking `Export to CSV`.

{% include image.html file="spread4_5_getLink_getCSV.png" prefix=root_url %}
-->
<!-- 
An example visualisation can be found below. Note that the visual aspects of the lines representing the branches and transitions can be modified. 
 -->

<!-- 
{% include image.html file="spreadgl_batrabies.png" prefix=root_url %}
 -->

<!-- and that the lines can also be filtered by a cut-off (under `Filters`  and `Attributes`).



<!--NT: spread4 does not allow for non-geographical mapping
We can obtain a similar summary for the host transition rates. Since these cannot be plotted on a map, we will organise them on a circle. Load the file containing the host rates and rate indicators (<samp>batEBOV.host.rates.log</samp>). In setting up the locations, select `Generate` and enter the number of unique host states ('17' in this case). If you want the names of the locations to be drawn rather than location1, location2, …, enter the names of each of the 17 locations (Ap, Ef, Lb, Lbl, Lc, Li, Ln, Ls, Lx, Ma, Mc, Ml, My, Nh, Ph, Ps, Tb). Click done when all the information has been entered and click on output under `Generate Output` and select a file name for the JSON file to be written. Finally, go to the `Rendering` panel in SPREAD4, load the JSON file you just saved, and click `Render to D3`.

{% include image.html file="24_spread3hostRates.png" prefix=root_url %}

{% include question.html content='Which rates receive the highest Bayes factor support?' %}
-->

## EXERCISE 2: Identifying predictors for the spatial dispersal process

### Background

This exercise builds on the previous analysis and aims at testing covariates associated with the spatiotemporal diffusion process. For this purpose, we adopt an extension of the discrete diffusion model that parameterizes the CTMC matrix as a generalized linear model (GLM), in which log CTMC rates are a log linear function of several potential predictors (most of the detail on the model can be found in Lemey et al., 2014). We explore a small set of relatively simple predictors: population size and geographic distance. Together, these can represent a so-called gravity model, which has been shown before as characteristic of EBOV spread (<a href="https://doi.org/10.1038/nature22040">Dudas et al., Nature, 2017, 544, 309–315</a>). 

### GLM-diffusion model specification

In case the BEAUti session from the previous exercise has not been closed yet, simply go back to the `Sites` panel. If it has been closed, repeat the first BEAUti steps up to specify the model settings up to those in the `Sites` panel. For the 'HZ' trait under `Substitution Model`, select `Generalized Linear Model`:

{% include image.html file="sitesGLM.png" prefix=root_url %}

Click on `Setup GLM` and a new window will pop up:

{% include image.html file="GLMemptySetup.png" prefix=root_url %}

This window allows specifying a set of GLM predictors or covariates by importing them through `Import Predictors...`. 
Start by loading the [population sizes]({{ root_url }}files/popSizes.csv) through `Import Predictors...`. This is a csv file with the following content:

```
	HZ,pop_2019
	Alimbongo,235304
	Ariwara,211050
	Beni,408065
	Biena,126776
	Bunia,281153
	Butembo,337394
	Goma,268616
	Kalunguta,212947
	Katwa,438943
	Kayna,374825
	Komanda,193793
	Kyondo,229589
	Lolwa,48003
	Lubero,284071
	Mabalako,198636
	Mambasa,100565
	Mandima,144909
	Manguredjipa,77297
	Masereka,189583
	Musienene,266100
	Mutwanga,264633
	Mwenga,142408
	Nyankunde,102707
	Nyiragongo,462362
	Oicha,358713
	Rwampara,140581
	Vuhovi,129673
```

Note that by default, location-specific values like population sizes are used to construct both an Origin and Destination predictor. For the Origin version, the origin values are used to populate a pairwise matrix, while the destination values are used to populate a pairwise matrix of the Destination version. By default, these values are also log-transformed and standardised. This is because the GLM-diffusion model parameterizes the log of the CTMC rates as a log linear function of the predictor and we grant the same variance to the predictors a priori.

Next, load the [geographic distances]({{ root_url }}files/distances.csv). This csv file contains pairwise great-circle distances between the centers of the health zones. As these already represent pairwise values, it is treated as a single covariate.

{% include image.html file="GLMcompleteSetup.png" prefix=root_url %}

Proceed with the next steps as in the previous exercise. Note that in the `Priors` panel, a normal prior with mean 0 and a standard deviation of 2 is specified on the log GLM coefficients ('HZ.coefficients'). We can again set up a short test run (e.g. 100,000 MCMC iterations), but proceed with diagnosing and summarising a long run. You can download the output of an MCMC analysis that has been run for 250 million iterations sampled every 50,000 generations:[here]({{ root_url }}files/longRuns/GLM/EBOV_DRC_18-20.HZ.glm.log).

### Analyzing the GLM-diffusion model output

The parameters of interest in this analysis are the indicators associated with the predictors ('HZ.coefIndicators1' to 'HZ.coefIndicators3') and the coefficient parameters or effect sizes ('HZ.coefficients1' to 'HZ.coefficients3'). Upon loading the log file ('EBOV_DRC_18-20.HZ.glm.log'), the mean of an indicator provides an estimate for the inclusion probability of that indicator. In this case, the mean indicator for 'HZ.coefIndicators1', which represents the origin population size, is 0.052 implying that this predictor is only rarely included in the model. In contrast, the destination population size predictor ('HZ.coefIndicators2') has a posterior inclusion probability of 0.908 implying that this predictor is included in over 90% of the posterior samples. The distance predictor ('HZ.coefIndicators3') achieves maximum posterior inclusion probability and is therefore also included in the analysis.

{% include image.html file="tracerGLMindicators.png" prefix=root_url %}

In order to assess the evidence provided by the data for a predictor inclusion, we need to take into account the prior probability for inclusion. By default, BEAUti specifies Bernoulli prior probability distributions on these indicators with a small prior probability on each predictor's inclusion, equivalent to a 50% prior probability on no predictors being included. 

{% include image.html file="binomialPrior.png" prefix=root_url %}

Based on both prior and posterior inclusion probabilities, we can calculate formal inclusion support in the form of Bayes Factors as these can be expressed as the ratio of the posterior odds over the prior odds for predictor inclusion. For an inclusion probability of 1, the Bayes factor is estimated as +infinity. In this case, it would be better to express the Bayes factor as being larger than X, where X would be the Bayes factor value if one sample had an indicator value of 1. For destinations population size, the posterior odds is 0.908/(1-0.908) = 9.870 while the prior odds is 0.206/(1-0.206) = 0.259; this results in a Bayes factor support value for the predictor inclusion of about 38. The origin population size predictor has a posterior inclusion probability smaller than its prior inclusion probability, so it will have Bayes factor < 1.

In order to assess the size of the contribution of predictors, we can use the estimates of the coefficients in log space. However, it is important to keep in mind that the estimates are critically dependent on the corresponding indicator value. If the indicator is 1, then the predictor is included in the model and the coefficient will be informed by the data (the predictor and the discrete states). If the indicator is 0, the predictor is not included and the coefficient value will be sampled from the prior. This is why posterior estimates of coefficients with very small inclusion probability will resemble the prior distribution (a normal distribution centered on 0 with a standard deviation of 2), as is the case for origin population size ('HZ.coefficients1'). This is demonstrated by the violin plot for this coefficient in Tracer:

{% include image.html file="tracerViolin.png" prefix=root_url %}

This may complicate the interpretation of coefficient estimates for predictors with intermediate inclusion probability. This is why applications have resorted to reporting the conditional effect size, that is the effect size when the predictor is included in the model (indicator = 1). In other words, this can be obtained by only summarising the coefficient estimates based on the samples for which the corresponding indicator values are 1. Alternatively, the predictor-specific product of the coefficient and indicator for all the samples can be summarised (these are logged as a statistic: HZ.coefficientsTimesIndicators1 to HZ.coefficientsTimesIndicators3). The violin plots for these statistics in Tracer look as follows:

{% include image.html file="tracerViolins.png" prefix=root_url %}

For geographic distance ('HZ.coefficientsTimesIndicators3'), the posterior density for this statistic is the same as for the actual coefficient ('HZ.coefficients3') because the associated indicator is always 1 for this predictor. The negative coefficient provides evidence for a higher intensity of dispersal  between nearby health zones. The posterior distribution for the statistic for destination population size ('HZ.coefficientsTimesIndicators2') shows most of its density on positive values but also a small density at 0, as expected for its inclusion probability. So, although this predictor does not yield maximum support as the geographic distances, it does suggest more intense dispersal towards more populated health zones.

## EXERCISE 3: discrete ancestral reconstruction using the BASTA structured coalescent approximation (SCA)

In this exercise, we aim to perform a similar discrete ancestral reconstruction as in EXERCISE 1 but with a different model, i.e. a structured coalescent approximation known as BASTA (De Maio et al., 2015). Recent developments in computational efficiency for this model (Shao et al., 2026) now enable employing BASTA on moderately-sized data sets. Note however that, due to its design, a BASTA analysis using a backward-in-time model will run markedly slower compared to using the model in EXERCISE 1. 

### Running BEAUti

If your BEAUti window is still open from going through Exercise 1 above, you can go back to the `Sites` panel; if not, you can repeat the BEAUti steps from Exercise 1 until you reach the `Sites` panel. Select the trait `HZ`(for health zone) on the left-hand side and select the Backward-in-time CTMC model that is used in the BASTA SCA (see De Maio et al., 2015; Shao et al., 2026).

#### Specifying the trait information

In the `Sites` panel, Click on 'HZ' in the `Substitution model` window and choose the `Backward-in-time CTMC` model as `Discrete Trait Substitution Model`, `Constant population size` as the `Backward-in-time Coalescent Model` (currently the only option), and the `Asymmetric substitution model` as `Backward-in-time Model Structure`. Select the option to perform BSSVS (`Infer social network with BSSVS`), which enables the Bayesian Stochastic Search Variable Selection procedure, and also select `Share coalescent model across demes` which reduces the number of free parameters in the model to ensure identifiability (see e.g. De Maio et al., 2015; Shao et al., 2026).

{% include image.html file="beautiBASTABIT.png" prefix=root_url %}

#### Setting the ‘molecular clock’ model

We keep a `Strict clock` for the location partition, as it only contains a single column of data and hence more complicated clock models may lead to overfitting the data.

#### Setting the tree prior

Structured coalescent approximations make a direct link between the migration process and the population size dynamics at the demes, and hence there is no possibility to make a choice in this panel:

{% include image.html file="beautiTreePriorSet.png" prefix=root_url %}

#### The ancestral states settings

In the `States` panel, check that for HZ partition the option to Reconstruct states at all ancestors is selected (by default). Note that there are fewer options than for the forward-in-time model in EXERCISE 1, but this will change in due time when Markov jumps for the BASTA model are developed.

{% include image.html file="beautiBASTAancestral.png" prefix=root_url %}

#### Setting up the priors

The `Priors` panel has a table showing every parameter of the currently selected model and what the prior distribution is for each. A prior distribution must be specified for every parameter and whilst BEAUti provides default options these are not necessarily tailored to the problem and data being analyzed.

The default prior on the rate of evolution (default.ucld.mean) is an approximation of a conditional reference prior (Approx. Reference Prior) (Ferreira and Suchard, 2008). The same is applied to the discrete location state (HZ) rate. We here keep the prior specification of Lemey et al. (2009) for the BSSVS procedure.

{% include image.html file="beautiBASTApriors.png" prefix=root_url %}

#### Setting up the operators

Each parameter in the model has one or more “operators” (these are variously called moves, proposals or transition kernels by other MCMC software packages such as MrBayes and LAMARC). The operators specify how the parameters change as the MCMC runs. The `Operators` tab in BEAUti has a table that lists the parameters, their operators and the tuning settings for these operators:

{% include image.html file="beautiBASTAoperators.png" prefix=root_url %}

We can keep the default operator settings for the current analysis.

#### Setting the MCMC options

In the `MCMC` tab, we keep the initial chain length to <samp>100,000</samp> (although for the BASTA model on this data set, ), both the sampling frequencies to <samp>100</samp> and checkpointing frequency to <samp>10000</samp>. The `File name stem:` will still be set to <samp>EBOV_DRC_18-20</samp> but you can easily adjust it to (for example): <samp>EBOV_DRC_18-20_BASTA</samp>.

{% include image.html file="beautiBASTAmcmc.png" prefix=root_url %}

We are now ready to create the BEAST XML file. Select `Generate XML...` from the `File` menu (or the button at the bottom of the window). BEAUti will ask you to review the prior settings one more time before saving the file (and will indicate if any are improper). Continue and choose a name for the file --- it will offer the name you gave it in the MCMC panel and we usually end the filename with '.xml' (although on Windows machines you may want to give the file the extension '.xml.txt').

{% include tip.html content="For convenience, leave the BEAUti window open so that you can change the models and their settings to re-generate the BEAST file in case you'd like to compare the results under different models." %}

### Running BEAST

Now that you have created another BEAST XML file, you can run the corresponding analysis in BEAST.

{% include icon-callout.html file='icons/beast-icon.png' content='Run <a href="beast">BEAST</a> by double-clicking on the BEAST icon.' %}

Once BEAST has started a dialog box will appear in which you select the XML file:

{% include image.html file="beastGUIbasta.png" prefix=root_url  width="80%" align="center" %}

Press the `Choose File...` button and select the XML file you just created and press `Run`. The analysis will then be performed with detailed information about the progress of the run being written to the screen. When it has finished, the log file and the trees file will have been created in the same location as your XML file.

[For more information about the other options in the BEAST dialog box see this page](beast).

### Analyzing the BEAST output using Tracer

While the analysis in the provided .log file has only run for 10 million iterations, it's already interesting to take a look at what can be seen in Tracer.

Select the `Import Trace File...` option from the `File` menu. If you have the log file that you created in the previous section available, you could select this (<samp>EBOV_DRC_18-20_BASTA.log</samp>). However, due to the data set size and the choice of the BASTA structured coalescent model, even the short chain will take some time to complete. So, if you do not wish to wait for this, you can go straight to selecting the log file from the longer run that has been made available (also <samp>EBOV_DRC_18-20_BASTA_10m.log</samp>).  
Instead of importing trace files, you can also drag and drop your log file into the Tracer window. The file will load and you will be presented with a window similar to the one below. Remember that MCMC is a stochastic algorithm so the actual numbers will not be exactly the same.

Tracer by default uses a burn-in of 10%, which here translates to 1 million iterations. This is clearly not enough, but we get an indication that an increased burn-in of 4 million iterations - based solely on the trace plot of the joint density - could be a reasonable first choice:

{% include image.html file="bastatracer1.png" prefix=root_url %}

However, when we take a look at the traces for different parameters (e.g. the tree length) we note a clear downward trend, meaning that the analysis is likely still converging to the posterior:

{% include image.html file="bastatracer2.png" prefix=root_url %}

### Analyzing the BEAST output using TreeTracer

It's interesting that the trace plot of the joint density in Tracer already seemed fairly stable after only 4 million iterations. Let's have a look in `TreeTracer` (Hong et al., 2026) if the chain has already converged in phylogenetic tree space. There are two tutorials on TreeTracer readily available: [TreeTracer tutorial 1](analysing_beast_output) and [TreeTracer tutorial 2](tracer_convergence). Launch `TreeTracer`, load the <samp>EBOV_DRC_18-20_BASTA_10m.trees</samp> file, and click the `Compute RF distances` and `Compute MDS` buttons: 

{% include image.html file="bastatreetracer1.png" prefix=root_url %}

Moving over to the `Within-run Analysis` panel confirms the burn-in of at least a few million iterations we observed in `Tracer`, and this in each pairwise 2D projection (MDS1 x MDS2, MDS1 x MDS3, MDS2 x MDS3) of the MDS; (very) light blue dots represent tree samples from the start of the analysis, whereas dark blue samples represent the latest trees sampled from the Markov chain:

{% include image.html file="bastatreetracer2.png" prefix=root_url %}

We can obtain a more objective confirmation of a lack of tree convergence and mixing with the sample and its current burn-in setting by checking the `Diagnostics` panel. First click the `Compute RF Trace` button, followed by the `Compute Tree-ESS` button. The different trace plots that will appear confirm that we need to modify the burn-in when inspecting the stored tree samples. Further, the `tree ESS` - similar to the ESS values in Tracer for continuous parameters, but for phylogenetic trees - is colored red (indicating a Fréchet correlation ESS far below the threshold of 500; Magee et al., 2024) and hence indicates that we need to reassess our current burn-in setting and (very likely) the current chain length:

{% include image.html file="bastatreetracer3.png" prefix=root_url %}

It's hence a good idea to go back to the `Compute Distances` panel and set a burn-in of 400 tree samples, leaving 601 tree samples to be analysed. You don't have to restart the TreeTracer application to do this, but you can if you find this to be easier. Click the `Compute RF distances` and `Compute MDS` buttons to recompute all metrics and visualisations with this updated burn-in setting:

{% include image.html file="bastatreetracer4.png" prefix=root_url %}

When we now inspect the `Within-run Analysis` panel, we no longer observe the initial convergence in the different 2D projections of the MDS. However, we can still clearly see a pattern in the first two projections (MDS1 x MDS2 and MDS1 x MDS3) that may indicate the burn-in setting was not set sufficiently high:

{% include image.html file="bastatreetracer5.png" prefix=root_url %}

This is more clearly visible in the 3D visualisation of the MDS, which you can find in the `Between-run Analysis` panel:

{% include image.html file="bastatreetracer6.png" prefix=root_url %}

In conclusion, this BASTA phylogeographic analysis needs to be run for (much) longer to be able to perform a more in-depth assessment of convergence and mixing in phylogenetic tree space. Based on what Tracer and TreeTracer show for the initial 10 million iterations, it would seem that at least 50 or 100 million iterations will be required to perform a more informative inspection of convergence and mixing for the continuous model parameters (in Tracer) and the sampled phylogenetic trees (in TreeTracer).

Once such an analysis for possibly hundreds of millions of iterations has been completed, the same steps as in EXERCISE 1 (`Summarizing and visualizing the trees` and `Visualizing the consensus tree using SpreadGL`) can then be followed to compare the consensus tree obtained under the BASTA model to the one obtained in EXERCISE 1 under a forward-in-time (FIT) CTMC model. Note that the `Compare Consensus` panel in TreeTracer offers the possibility to compare consensus trees through a tanglegram, but see  [TreeTracer tutorial 1](analysing_beast_output) for more information on how to do this. Finally, we refer to Baele et al. (2025) for a comparison of consensus tree methods, all of which are available in TreeAnnotator X.

## References

* [Kinganda-Lusamaki, E., Black, A., Mukadi, D.B. et al. 2021. Integration of genomic sequencing into the response to the Ebola virus outbreak in Nord Kivu, Democratic Republic of the Congo. Nat Med 27, 710–716. doi: 10.1038/s41591-021-01302-z](https://doi.org/10.1038/s41591-021-01302-z)
* [Ferreira, M. A. R. and M. A. Suchard. 2008. Bayesian analysis of elapsed times in continuous-time Markov chains. Can J Statistics, 36: 355–368. doi: 10.1002/cjs.5550360302](http://onlinelibrary.wiley.com/doi/10.1002/cjs.5550360302/abstract)
* [Lemey, P., A. Rambaut, A. J. Drummond, and M. A. Suchard. 2009. Bayesian phylogeography finds its roots. PLoS computational biology 5:e1000520.](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1000520)
* [Lemey, P., A. Rambaut, T. Bedford, N. Faria, F. Bielejec, G. Baele, C. A. Russell, D. J. Smith, O. G. Pybus, D. Brockmann, and M. A. Suchard. 2014. Unifying Viral Genetics and Human Transportation Data to Predict the Global Transmission Dynamics of Human Influenza H3N2. PLoS pathogens 10:e1003932.](http://journals.plos.org/plospathogens/article?id=10.1371/journal.ppat.1003932)
* [Bloomquist, E. W., P. Lemey, and M. A. Suchard. 2010. Three roads diverged? Routes to phylogeographic inference. Trends Ecol Evol 25:626-632.## Help and documentation.](https://www.ncbi.nlm.nih.gov/pubmed/20863591)
* [Nahata KD, Bielejec F, Monetta J, Dellicour S, Rambaut A, Suchard MA, Baele G, Lemey P. 2022. SPREAD 4: online visualisation of pathogen phylogeographic reconstructions. Virus Evol., 26;8(2):veac088. doi: 10.1093/ve/veac088. eCollection 2022.](https://academic.oup.com/ve/article/8/2/veac088/6717755)
* [De Maio N, Wu C.-H., O'Reilly K. M., Wilson D. 2015. New Routes to Phylogeography: A Bayesian Structured Coalescent Approximation. PLOS Genet. 11(8): e1005421.](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1005421)
* [Shao Y., Suchard M. A., Rambaut A., Ji X, Lemey P, Vasylyeva T. I., Baele G. 2026. Parallel algorithms for phylogenetic inference under a structured coalescent approximation. Proc. Natl. Acad. Sci. USA 123 (18) e2602412123.](https://www.pnas.org/doi/10.1073/pnas.2602412123)
* [Gao J., May M. R., Rannala B., Moore B. R. 2023. Model misspecification misleads inference of the spatial dynamics of disease outbreaks. Proc. Natl. Acad. Sci. USA 120 (11) e2213913120.](https://doi.org/10.1073/pnas.2213913120)
* Hong S. L., Brusselmans M., Klaps J., Carvalho L. M., Magee A. F., Suchard M. A., Rambaut A., Baele G. (2026) Tree convergence and mixing in Bayesian phylogenetics Using TreeTracer. In preparation.
* [Magee A., Karcher M., Matsen IV F. A., Minin V. (2024) How trustworthy is your tree? Bayesian phylogenetic effective sample size through the lens of Monte Carlo error. Bayesian Analysis, 19(2), 565-593.](https://projecteuclid.org/journals/bayesian-analysis/volume-19/issue-2/How-Trustworthy-Is-Your-Tree-Bayesian-Phylogenetic-Effective-Sample-Size/10.1214/22-BA1339.full)
* [Baele G., Carvalho L. M., Brusselmans M., Dudas G., Ji X, McCrone J. T., Lemey P., Suchard M. A., Rambaut A. (2025) HIPSTR: highest independent posterior subtree reconstruction in TreeAnnotator X. Bioinformatics 41(10): btaf488.](https://doi.org/10.1093/bioinformatics/btaf488)

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}

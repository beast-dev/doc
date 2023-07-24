---
title: Phylodynamic inference of respiratory viruses
keywords: phylodynamics, SARS-CoV-2, influenza, tutorial
last_updated: July 16, 2023
tags: [tutorial, workshop]
summary: "This tutorial provides a step-by-step explanation on how to reconstruct the evolutionary dynamics of respiratory viruses based on sets of virus sequences that been isolated at different points in time (‘heterochronous’ data) using BEAST. We will focus on SARS-CoV-2 and influenza A virus evolution, in particular on the emergence and invasion dynamics of the alpha (B.1.1.7) and omicron BA.1 variant of SARS-CoV-2 in the UK, and the seasonal transmission dynamics of influenza A virus H3N2 in the U.S. The alpha data set has previously been analysed to study the origins and molecular evolution of this lineage (Hill et al., 2022). The omicron BA.1 data set is a subset of genomes of the largest BA.1 transmission lineage identified in the England (Tsui et al, 2023).
The H3N2 data is a subset of a comprehensive data set spanning several epidemic seasons in the New York state, which has been used to unravel the genomic and epidemiological dynamics of this virus (Rambaut et al., 2008). In the first exercise, the aim is to obtain an estimate of the epidemic growth and basic reproductive number of the SARS-CoV-2 variants in the U.K. In the second exercise, we will examine how H3N2 population sizes fluctuates through time."
sidebar: beast_sidebar
permalink: workshop_respiratory_virus_phylodynamics.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/workshop_respiratory_virus_phylodynamics/{% endcapture %}


## Introduction

The first step will be to convert a fasta file into a BEAST XML input file. This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). This is a user-friendly program for setting the evolutionary model and options for the MCMC analysis. The second step is to actually run BEAST using the input file that contains the data, model and settings. The final step is to explore the output of BEAST in order to diagnose problems and to summarize the results.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

{% include note.html content='This tutorial builds on the <a href="workshop_rates_and_dates">Estimating rates and dates from time-stamped sequences</a> which should be completed before starting this one. In addition, this tutorial assumes your are familiar with temporal signal exploration using <a href="tempest">TempEst</a>.' %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> All the files needed for this tutorial
<a href="{{ root_url }}files/respiratoryTutorialFiles.zip"> can be downloaded from here</a>. 
If you download this zipped folder, there is no need to download other files/folders linked further in the tutorial.
</div>

## EXERCISE 1: The transmission dynamics of SARS-CoV-2 alpha and omicron BA.1 in the U.K.

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data files are called '<samp>b.1.1.7.fasta</samp>' and '<samp>omicron_BA1.fasta</samp>'. These can be downloaded from <a href="{{ root_url }}files/b.1.1.7.fasta">here</a> and <a href="{{ root_url }}files/omicron_BA1.fasta">here</a>.</div>

### Running BEAUti

{% include icon-callout.html file='icons/beauti-icon.png' content='Run <a href="beauti">BEAUti</a> by double clicking on its icon. BEAUti is an interactive graphical application for designing your analysis and generating the control file (a BEAST XML file) which BEAST will use to run the analysis.' %}

To load a fasta alignment, simply select the `Import Data...` option from the `File` menu. 

To start with the analysis of the alpha data set, select the file called `b.1.1.7.fasta`. This file contains an alignment of 976 genomes, 29,409 nucleotides in length. Once loaded, the new data will be listed under Partitions as shown in the figure:

{% include image.html file="image1.png" prefix=root_url %}  <br /><br />

#### Setting the tip dates

To undertake a phylodynamic analysis we need to specify the dates that the individual viruses were collected. In this case, the sequences were sampled between September and December 2020. To set these dates switch to the `Tips` panel using the tabs at the top of the window.

{% include image.html file="image2.png" prefix=root_url %}

Select the box labelled `Use tip dates`. The actual sampling time is encoded in the name of each taxon (at the end, using the year-mm-dd format) and we can use the `Parse Dates` button at the top of the panel to extract these. For the alpha sequences, select the `Defined by a prefix and its order` option. Select `last` from the `Order` drop-down menu and enter the pipe symbol `|` as `Prefix`. Select the `Parse as a calendar date` (and keep the default `Date` format) and press `OK`. The dates will appear in the appropriate column of the main window. You can then check these and edit them manually in case this would be required. 

{% include image.html file="image3.png" prefix=root_url %}

{% include tip.html content='There are many other options for reading and parsing tip dates in different formats. <a href="tip_dates.html">See this page for a more detailed description of these options.</a>' %}

#### Setting the substitution model

The next thing to do is to click on the `Sites` tab at the top of the main window to specify the evolutionary model settings for BEAST: 

{% include image.html file="image4.png" prefix=root_url %}

For this tutorial, keep the default `HKY` model, the default `Estimated` base frequencies and select `Gamma` as `Site Heterogeneity Model` (with 4 discrete categories) before proceeding to the `Clocks` tab. 

#### Setting the molecular clock model

The `Clocks` panel options allows us to choose between a strict and a relaxed (uncorrelated lognormal or uncorrelated exponential) clock. Because of the low diversity data we analyze here and its limited sampling time range, a relaxed clock would probably be over-parameterization. Hence, we keep a strict clock setting. 

{% include image.html file="image7.png" prefix=root_url %}  <br /><br />

Now move on to the `Trees` panel.

#### Setting the tree prior

This panel contains settings about the tree. Firstly the starting tree is specified to be ‘randomly generated’. The other main setting here is to specify the `Tree prior` which describes how the population size is expected to change over time for coalescent models. The default tree prior is set to a constant size coalescent prior. [The range of different tree priors (coalescent and other models) are described on this page](tree_priors).

To estimate the epidemic growth rate, we will change this demographic model to an exponential growth coalescent prior, which is intuitively appealing for viral outbreaks. Switch the option for `Tree Prior` to `Coalescent: Exponential Growth`:

{% include image.html file="image8.png" prefix=root_url %}

Note that the default parameterisation of the exponential growth coalescent model uses `Growth Rate`, but we can also opt for a parameterisation in terms of a `Doubling time`, which has an intuitive interpretation. We can also explore this parameterisation as an alternative later in this exercise (cfr. below).

#### Setting up the priors

Now switch to the `Priors` tab. This panel has a table showing every parameter of the currently selected model and what the prior distribution is for each. A strong prior allows the user to ‘inform’ the analysis by selecting a particular distribution with a small variance. Alternatively we can select a weak (diffuse) prior to try to minimise the effect on the analysis. Note that a prior distribution must be specified for every parameter and whilst BEAUti provides default options these are not necessarily tailored to the problem and data being analyzed. 

{% include image.html file="image9.png" prefix=root_url %}

In this case, the default prior for the exponential growth rate (the Laplace distribution) prefers relatively small growth rates because the of the default scale (<samp>1.0</samp>). However, on this epidemic scale, the growth rate parameter take could take on relatively large values. Therefore, we will increase the variance of this prior distribution by setting the scale to <samp>100</samp>. A useful exercise could be to examine the sensitity of the growth rate estimates to different scale values for this prior distribution (e.g. scale = 1, 10, 100).

The other priors can be left at their default options.

#### Setting up the operators

Each parameter in the model has one or more “operators” (these are variously called moves, proposals or transition kernels by other MCMC software packages such as MrBayes and LAMARC). The operators specify how the parameters change as the MCMC runs. The `Operators` tab in BEAUti has a table that lists the parameters, their operators and the tuning settings for these operators:

{% include image.html file="image10.png" prefix=root_url %}

Notice that the coalescent growth rate parameter (`exponential.growthrate`) has a `randomWalk` operator. This is appropriate for a parameter that can take both positive and negative values (parameters that are strictly positive can use a scale operator). No changes are required in this table.
 
#### Setting the MCMC options

The `MCMC` tab in BEAUti provides settings to control the MCMC chain and the log files that get produced.

{% include image.html file="image11.png" prefix=root_url %}

For this dataset let's initially set the chain length to <samp>100,000</samp> and both the sampling frequencies to <samp>100</samp>. The `File name stem:` should already be set to <samp>b.1.1.7</samp> but you can adjust this (perhaps add more indications about the analysis).

We are now ready to create the BEAST XML file. Select `Generate XML...` from the `File` menu (or the button at the bottom of the window). BEAUti will ask you to review the prior settings one more time before saving the file (and will indicate if any are improper). Continue and choose a name for the file --- it will offer the name you gave it in the MCMC panel and we usually end the filename with '.xml' (although on Windows machines you may want to give the file the extension '.xml.txt'). 

{% include tip.html content="For convenience, leave the BEAUti window open so that you can change the values, e.g. to specify a coalescent growth model with a doubling time parameterisation, and re-generate the BEAST file as required later in this tutorial." %}

### Running BEAST

Once the BEAST XML file has been created the analysis itself can be performed using BEAST. 

{% include icon-callout.html file='icons/beast-icon.png' content='Run <a href="beast">BEAST</a> by double-clicking on the BEAST icon.' %}

Once BEAST has started a dialog box will appear in which you select the XML file:

{% include image.html file="image12.png" prefix=root_url max-width="50%" align="center" %}

Press the `Choose File...` button and select the XML file you just created and press `Run`. The analysis will then be performed with detailed information about the progress of the run being written to the screen. When it has finished, the log file and the trees file will have been created in the same location as your XML file. 

[For more information about the other options in the BEAST dialog box see this page](beast).

### Analyzing the BEAST output
    
{% include icon-callout.html file='icons/tracer-icon.png' content='To analyze the results of running BEAST we are going to use the program <a href="tracer">Tracer</a>. Run Tracer by double clicking on the Tracer icon.' %}

Select the `Import Trace File...` option from the `File` menu. Select the log file, <samp>b.1.1.7.log</samp>, that you created in the previous section. The file will load and you will be presented with a window similar to the one below. 

{% include image.html file="image13.png" prefix=root_url %}

Similarly to the [previous tutorial](workshop_rates_and_dates) the effective sample sizes (ESSs) for all the traces are small (ESSs less 100 are highlighted in red respectively by Tracer). In the bottom right of the window is a frequency plot of the samples, which for the `joint` trace in the above figure, has multiple peaks.

If we select the tab on the right-hand-side labelled `Trace` we can view the raw trace --- the sampled values against the step in the MCMC chain:

{% include image.html file="image14.png" prefix=root_url %}

Here it is clear that the default burn-in of 10% of the chain length is inadequate (the posterior values are still increasing over the first part of the chain). Double-click on the `Burn-In` column in the top left and edit (in the case, above, a minimum of <samp>20,000</samp> is needed). However, it is still clear that a chain length of <samp>100,000</samp> was inadequate. Looking at the ESS values (generally in the low double-digits) suggests that a much longer chain length is needed. Running much longer chains would take a considerably longer times, but we have provided the output of a run of 500 million generations that you can use for the rest of this section. 

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The log files for long SARS-CoV-2 runs (alpha and omicron BA1) <a href="{{ root_url }}files/Long_Runs_SARS-CoV-2.zip">can be downloaded here</a>.</div>

Load the new log file (<samp>b.1.1.7.log</samp>) into Tracer (you can leave the old one loaded for comparison). Click on the `Trace` tab and look at the raw trace plot.

Again we have chosen options that produce 1000 samples and with an ESS of > 500 for the coalescent model parameters there is little auto-correlation between the samples. There are no obvious trends in the plot which would suggest that the MCMC has not yet converged, and there are no large-scale fluctuations in the trace which would suggest poor mixing. 

As we are satisfied with the behavior of the MCMC we can now move on to one of the parameters of interest: exponential growth rate for the coalescent model we chose as the tree prior. Select `exponential.growthRate` in the left-hand table. Now choose the density plot by selecting the tab labeled `Marginal Density`. This shows a plot of the marginal posterior probability density of this parameter. You should see a plot similar to this:

{% include image.html file="image15.png" prefix=root_url %}

As you can see the posterior probability density is roughly bell-shaped. The default is to show the kernel density estimate (KDE) which is smoothed probability density fitted to the data. Switch the `Display:` option at the top to `Histogram` to see the unsmoothed frequency plot. There is still a lot of noise here but it is a good estimate of the distribution. 

{% include callout.html type="warning" content="The <code>age(root)</code> statistic provides an estimate of the time of the most recent common ancestor of the entire tree. In this case it may be a reasonable estimate of the emergence of the alpha variant in the U.K. What is the mean estimate and 95% HPDs for the date of the MRCA?<br /><br /><br />" %} 

You can visualize the growth estimate using the `Demographic Reconstruction...` option in the `Analysis` menu. Select this option and set up the dialog box that appears like this:

{% include image.html file="image16.png" prefix=root_url %}

Select `Demographic Model: Exponential Growth (Growth Rate)` --- note, you must select the tree prior you picked in BEAUti, you can't change this here. Tracer will automatically identify the parameters of the model (`exponential.popSize` and `exponential.growthRate`). The option `Maximum time is the root height's:` pick the `Upper 95% HPD`. This means it will extend the reconstruction back to the extent of the root age credible interval. Set the `Age of youngest tip:` to <samp>2020.997</samp> (the date of the most recently sampled virus). Then press `OK` and this window will appear: 

{% include image.html file="image17.png" prefix=root_url %}

This shows the exponential growth line for the median growth rate and the 95% HPD intervals for this growth as a solid area. It is on a log scale so is a straight line. You can play with the axis settings using the `Axes...` button. The dotted vertical lines represent the 95% HPD for the date of the root of the tree. 

{% include callout.html type="primary" content="The exponential.growthRate ($r$) provides an estimate of the epidemic growth of the SARS-CoV-2 alpha variant in the U.K. Interestingly, it has been shown that the basic reproductive ratio $$ R_0 $$ is related to the growth rate --- see [this page for details](/estimating_R0.html). However, the basic reproductive number is dependent not just on an estimate of (\\( r \\)), but also a good estimate of the generation time distribution, which reflects the time between successive infections in a chain of transmission. If we assume a generation time distribution that follows the gamma distribution, then $(R_0 = (1 +  r / b) ^a)$, where $a$ and $b$ are the parameters of the gamma distribution (and $$a = \mu^2 / \sigma^2$$, $$b = \mu / \sigma^2)$$. " %} 

{% include callout.html type="warning" content="Following Volz et al. (2021), if we use  $`\mu = 6.44`$ days and $`\sigma = 4.25`$ days, what would be the mean estimate of $`R_t`$ for alpha in the U.K.? How does this compare to the estimate by Volz et al. (2021) of 1.79 (1.22-2.49) for 1 November 2020 to 16 January 2021 <br /><br /><br />" %} 

An alternative way of assessing viral population growth would be through the doubling time estimate. This can be obtained based on the growth rate (how would you get this?), or it can be estimated through a coalescent growth model model with a doubling time parameterisation (cfr. above). Similar to the growth rate analysis, a long run has been made available for the doubling time parameterisation that you can summarise in Tracer. How does the estimate compare to a doubling time estimate based on the spike gene target failure PCR method for Oregon, U.S., of 9.54 (Smith et al., 2022) for example?

In order to compare the expansion of alpha with another SARS-CoV-2 variant in the U.K., a data set encompassing 1,000 genomes for omicron BA.1 has been made available. This is a subset of the largest transmission lineage of omicron BA.1 identified in the U.K. (Tsui et al, 2023). The subset was obtained by sampling as evenly as possible over the time period between 27 November 2021 and 25 December 2021. This  time period is too short for the genome data to contain adequate temporal signal (which you can examine using TempEst). Therefore, we will fix the rate of 0.00054 substitutions per site per year, which is the posterior mean for the rate in the alpha analyses. This can be set in the `Priors`panel, by selecting `Fixed value`and entering 0.00054:

{% include image.html file="image18.png" prefix=root_url %}
 
Also for this data set, long runs have been provided both for the growth rate and doubling time parameterisation. Based on these, and a generation distribution mean of 3 and a standard deviation of 1 day (Park et al., 2023), what would be the mean estimates for $$R_t$$ and the doubling time? How do these compare to estimates of $$R_t = 2.1$$ for South Africa (Khan et al., 2022) and a doubling time of 4.28 days for Oregon, U.S. (Smith et al., 2022)?


## EXERCISE 2: reconstructing H3N2 epidemic dynamics in the New York state.

In this tutorial, we will reconstruct a [Bayesian skygrid](tree_priors#skygrid) of human influenza A, H3N2 subtype, over three northern hemisphere epidemic seasons. The data set contains 165 Hemagglutinin gene sequences, and as the SARS-CoV-2 data sets, it takes more time to run in BEAST than available during a practical session. Therefore, this tutorial will discuss how to set up this analysis and how to summarize the results based on runs that have already been performed.

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>NewYork.HA.2000-2003.nex</samp>' and can be found in the shared folder:<br />
 <div style="margin: 16px"><code>Tutorials\Tutorial 2 - Phylodynamics\Data\NewYork.HA.2000-2003.nex</code></div>
 <a href="{{ root_url }}files/NewYork.HA.2000-2003.nex">It can also be downloaded from here</a>.</div>
-->
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>NewYork.HA.2000-2003.nex</samp>' and  <a href="{{ root_url }}files/NewYork.HA.2000-2003.nex">can be downloaded from here</a>.</div>


### Running BEAUti

Run BEAUti, load the nexus file (<samp>NewYork.HA.2000-2003.nex</samp>) and set the `Tips` panel's `Parse Dates` to the last numerical field in the sequence names as previously, but now with an underscore `_` prefix and `Parse as a number`. Set the same evolutionary model (including gamma distributed rate variation) and clock model as in the previous exercise. In the `Trees` tab, select a `Coalescent: Bayesian SkyGrid` as the `Tree Prior`. We will construct a grid of <samp>72</samp> intervals over 6 years (`Time at last point:` <samp>6</samp>) before the most recent sampling date (<samp>2003.98</samp> in our case, so going back to about 1998) thus estimating 12 population sizes per year. The panel should look like this:

{% include image.html file="image19.png" prefix=root_url %}

At this point we would usually generate the BEAST XML file, load it into BEAST and run it. However, this data set, while smaller than the SARS-CoV-2 data sets, is still relatively computationally intensive so rather than waiting around for it to finish, you can go straight on and analyse some results files that have already been run.

<!-- 
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The log files for the long run can be found in the shared folder:<br />
    <div style="margin: 16px"><samp>Tutorials\Tutorial 2 - Phylodynamics\Long_Run_H3N2_SkyGrid\</samp></div>
</div>
-->
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The log and trees files for a longer H3N2 SkyGrid run <a href="{{ root_url }}files/Long_Run_H3N2_SkyGrid.zip">can be downloaded from here</a>.</div>
 

### Analyzing the BEAST output

Using Tracer, we can analyze the run based on the output files provided (load the file called <samp>NewYork.HA.2000-2003.log</samp>). This has been run with a chain length of 50,000,000 generations sampling every 50,000 steps so a total of 1,000 samples:

{% include image.html file="image20.png" prefix=root_url %}

To reconstruct the Bayesian skygrid plot, select `SkyGrid reconstruction...` under the `Analysis` menu. The following window should appear:

{% include image.html file="image21.png" prefix=root_url  max-width="50%" align="center"%}

Set the manual bin range from <samp>1999</samp> to <samp>2004</samp> and specify <samp>2003.98</samp> as the `Age of the youngest tip` at the bottom. Press `OK` and after some time, the following Bayesian skyGrid reconstruction should appear (with solid interval selected):

{% include image.html file="image22.png" prefix=root_url %}

By default the y-axis is in a log scale. Press the `Axes` button and turn off `Log axis` for the `Y axis`. You will also need to set the `Manual range` because the upper HPD bounds will be very large. Set this to <samp>0</samp> to <samp>100</samp> and you get the following:

{% include image.html file="image23.png" prefix=root_url %}

This clearly shows the seasonal peaks but the uncertainty represented by the credible intervale is very large. 

### Some Questions

{% include callout.html type="warning" content="What type of dynamics does the H3N2 skyride plot suggest? Would you expect to see the similar dynamics for H3N2 sampled in a southern hemisphere location?<br /><br /><br />" %} 

{% include callout.html type="warning" content="What happened in 2001?<br /><br /><br />" %} 


## References
- Drummond AJ, Rambaut A (2007) BEAST: Bayesian evolutionary analysis by sampling trees. BMC Evolutionary Biology 7: 214.
- Drummond AJ, Ho SYW, Phillips MJ & Rambaut A (2006) PLoS Biology 4, e88.
- Drummond AJ, Rambaut A & Shapiro B and Pybus OG (2005) Mol Biol Evol 22, 1185-1192.
- Drummond AJ, Nicholls GK, Rodrigo AG & Solomon W (2002) Genetics 161, 1307-1320.
- Ferreira, M. A. R. and M. A. Suchard. 2008. Bayesian analysis of elapsed times in continuous-time Markov chains. Can J Statistics, 36: 355–368. doi: 10.1002/cjs.5550360302
- Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
- Hill V, Du Plessis L, Peacock TP, Aggarwal D, Colquhoun R, Carabelli AM, Ellaby N, Gallagher E, Groves N, Jackson B, McCrone JT, O'Toole Á, Price A, Sanderson T, Scher E, Southgate J, Volz E, Barclay WS, Barrett JC, Chand M, Connor T, Goodfellow I, Gupta RK, Harrison EM, Loman N, Myers R, Robertson DL, Pybus OG, Rambaut A. The origins and molecular evolution of SARS-CoV-2 lineage B.1.1.7 in the UK. Virus Evol. 2022 Aug 26;8(2):veac080. doi: 10.1093/ve/veac080. Erratum in: Virus Evol. 2022 Dec 30;8(2):veac119. PMID: 36533153; PMCID: PMC9752794.
- Khan MA, Atangana A. Mathematical modeling and analysis of COVID‐19: a study of new variant Omicron. Physica A. 2022. https://doi.org/10. 1016/j.physa.2022.127452.
- Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
- Park SW, Sun K, Abbott S, Sender R, Bar-On YM, Weitz JS, Funk S, Grenfell BT, Backer JA, Wallinga J, Viboud C, Dushoff J. Inferring the differences in incubation-period and generation-interval distributions of the Delta and Omicron variants of SARS-CoV-2. Proc Natl Acad Sci U S A. 2023 May 30;120(22):e2221887120. doi: 10.1073/pnas.2221887120. Epub 2023 May 22. PMID: 37216529; PMCID: PMC10235974.
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.
- Smith, B. F., Graven, P. F., Yang, D. Y., Downs, S. M., Hansel, D. E., Fan, G., & Qin, X. (2022). Using Spike Gene Target Failure to Estimate Growth Rate of the Alpha and Omicron Variants of SARS-CoV-2. Journal of Clinical Microbiology, 60(4). https://doi.org/10.1128/jcm.02573-21.
- Joseph L.-H. Tsui et al. (2023). Genomic assessment of invasion dynamics of SARS-CoV-2 Omicron BA.1.Science381,336-343(2023).DOI:10.1126/science.adg6605.
- Volz, E., Mishra, S., Chand, M. et al. Assessing transmissibility of SARS-CoV-2 lineage B.1.1.7 in England. Nature 593, 266–269 (2021). https://doi.org/10.1038/s41586-021-03470-x.

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

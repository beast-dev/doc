---
title: Analysing BEAST Output
keywords: tracer, tutorial
last_updated: February 17, 2018
tags: [how-to]
summary: "Analysing BEAST output files"
sidebar: beast_sidebar
permalink: analysing_beast_output.html
folder: beast
redirect_from: "/analysing-beast-output"
---

{% include warning.html content="This page unfinished." %}

## Analysing BEAST output using Tracer

This document provides a step-by-step tutorial to analysing the output of BEAST in a GUI application called Tracer 1.7.

### Running Tracer

The exact instructions for running Tracer differs depending on which computer you are using. 
Please see the README text file that was distributed with the version you downloaded.
Once running, Tracer will look similar irrespective of which computer system it is running on. 
For this tutorial, the Mac OS X version will be shown but the Linux and Windows versions will have exactly the same layout and functionality.

### Data set information

For this tutorial, if you have it available, you can use the log file that you created in the [first tutorial|Tutorial 1]. 

Here, we use Tracer 1.7 to infer the spatial dispersal and cross-species dynamics of rabies virus (RABV) in North American bat populations. 
The data set consists of 372 nucleoprotein gene sequences (nucleotide positions: 594–1353) and comprises a total of 17 bat species sampled between 1997 and 2006 across 14 states in the United States (Streicker et al., Science, 2010, 329, 676-679). 
Following Faria et al. (Phil. Trans. Roy. Soc. B, 2013), two additional species that had been excluded from the original analysis owing to a limited amount of available sequences, Myotis austroriparius (Ma) and Parastrellus hesperus (Ph), are also included here. 
We also include a viral sequence with an unknown sampling date (accession no. TX5275, sampled in Texas from Lasiurus borealis). 
A uniform prior specification for the age of TX5275 adequately is used in our inference, based on the assumption that its sampling time is bounded by the sampling time distribution of the data set, implying that it is sampled between 1997.5 and 2005.5.
We estimate RABV ancestral locations and host-jumping history using a Bayesian discrete phylogeographic approach with BSSVS (Lemet et al., 2009), while simultaneously estimating effective population sizes over time through a Bayesian skygrid coalescent model (Gill et al., 2012).

### Loading the BEAST log files

#### The main Tracer panel

Select the Open option from the File menu.
The file will load and you will be presented with a window similar to the one below. 
Remember that BEAST is a stochastic program so the actual numbers will not be exactly the same.

{% include image.html file="tracer0.png" prefix="/tutorials/howtos/" %}<br />

On the left hand side is the name of the log file loaded and the traces that it contains. 
There are traces for the posterior, prior, likelihood, and all the integer, categorical and continuous parameters that are being estimated. 
Selecting a trace on the left brings up analyses for this trace on the right hand side depending on the tab that is selected and the parameter type (Real/Integer/Categorical). 
In the figure above, the state.clock.rate trace is selected and various statistics of this trace is shown under the Estimates tab.

Note that the Effective Sample Sizes(ESSs) for many of the traces are small (ESSs less than 100 are highlighted in red by Tracer). 
This indicates that the current analysis did not yet yield a sufficient number of independent samples from the posterior distribution for that parameter. 
A low ESS means that the trace contained a lot of correlated samples and thus may not represent the posterior distribution well. 
In the bottom right of the window is a frequency plot of the samples.

In the top right of the window is a table of calculated statistics for the selected trace. 
The statistics and their meaning are described in the table below.

`Mean`
: The mean value of the sampled trace across the chain (excluding the burn-in).

`Stdev`
: The standard deviation of the mean. This takes into account the effective sample size so a small ESS will give a large Stdev.

`Median`
: The median value of the sampled trace across the chain (excluding the burn-in).

`95% HPD Lower`
: The lower bound of the highest posterior density (HPD) interval. The HPD is a credible set that contains 95% of the sampled values.

`95% HPD Upper`
: The upper bound of the highest posterior density (HPD) interval. The HPD is a credible set that contains 95% of the sampled values.

`Auto-Correlation Time (ACT)`
: The number of states in the MCMC chain that two samples have to be from each other for them to be uncorrelated. The ACT is estimated from the samples in the trace (excluding the burn-in).

`Effective Sample Size (ESS)`
: The ESS is the number of independent samples that the trace is equivalent to. This is essentially the chain length (excluding the burn-in) divided by the ACT.

If we select the Trace we can view the raw trace, that is, the sampled values against the step in the MCMC chain:

tracer1.png

Here you can see how the samples are correlated. There are only 100 samples in the trace (we ran the MCMC for 100,000 steps sampling every 1000) but it is clear that adjacent samples often tend to have similar values. The ESS for the likelihood is about 50 so we are only getting half the amount of independent samples as actual samples.

Essentially this simply looks as if we need to run the chain for longer. Given the lowest ESS (for the coalescent likelihood) is 27, it would suggest that we have to run it for 4 times longer to get ESSs that are > 100. However it would be better to aim higher so lets go for a chain length of 1,000,000. Go back to [Tutorial 1] and create a new BEAST XML file with a longer chain length. Now run BEAST and load the new log file into Tracer (you need to quit and restart Tracer to clear out the old log file).

You should now have something like this:

tracer2.png

This is much better. The ESSs are now all > 350 and the frequency plot is starting to show a reasonable curve. Click on the Trace tab and look at the raw trace plot:

tracer3.png

Again this is more like what we are aiming for - we call this plot the hairy catapiller. There are now 1000 samples making up this plot and with an ESS of about 500 there is still auto-correlation between the samples but 500 effectively independent samples is pretty respectable. There are no obvious trends in the plot suggesting that the MCMC was still converging and there are no large-scale fluctuations in the trace suggesting poor mixing. Diagnosis of trace plots will be delt with in a another tutorial.

As we are happy with the behaviour of log-likelihood we can now move on to one of the parameters of interest: mutation rate. Select siteModel1.mu in the left-hand table. This is the mutation rate of the first codon position. Now choose the density plot by selecting the tab labelled Density. This shows a plot of the posterior probability density of this parameter. You should see a plot similar to this one:

tracer4.png

As you can see the posterior probability density is a reasonable looking bell-shaped curve. There is some stochastic noise which would be reduced if we ran the chain for longer but we already have a pretty good estimate of the mean and credible interval. You can overlay the density plots of multiple traces in order to compare them (it is up to the user whether they are comparable on the the same axis or not). Select the mutation rates for all three codon positions in the table to the left. You can either click and drag to select multiple traces or click on the top trace and shift-click on the bottom trace. You will now see the posterior probability densities for the mutation rate at all three codon positions over-layed:

tracer5.png

tracer6.png

tracer7.png

tracer8.png

tracer9.png

tracer10.png

tracer11.png

#### The marginal density panel



## References



{% include links.html %}

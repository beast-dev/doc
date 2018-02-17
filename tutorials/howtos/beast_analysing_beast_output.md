---
title: Analysing BEAST output using Tracer
keywords: tracer, tutorial
last_updated: February 17, 2018
tags: [how-to]
summary: "Analysing BEAST output files using Tracer"
sidebar: beast_sidebar
permalink: analysing_beast_output.html
folder: beast
redirect_from: "/analysing-beast-output"
---

{% include warning.html content="This page is currently under construction (February 17, 2018)." %}

## Analysing BEAST output using Tracer

This document provides a step-by-step tutorial to analysing the output of BEAST in a GUI application called Tracer 1.7.

### Running Tracer

The exact instructions for running Tracer differs depending on which computer you are using. 
Please see the README text file that was distributed with the version you downloaded.
Once running, Tracer will look similar irrespective of which computer system it is running on. 
For this tutorial, the Mac OS X version will be shown but the Linux and Windows versions will have exactly the same layout and functionality.

### Data set information

For this tutorial, if you have it available, you can use the log file that you created in the [first tutorial](first_tutorial). 

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

If we select the Trace (panel) we can view the raw trace, that is, the sampled values against the step in the MCMC chain:

{% include image.html file="tracer1.png" prefix="/tutorials/howtos/" %}<br />

Here you can see a visual explanation of the low ESS value for the state.clock.rate parameter, with that parameter's posterior distribution being difficult to explore.
The ESS for the likelihood is about 25 so we are only getting one eighth of the amount of independent samples as actual samples.
Essentially, this means we need to run the chain eight times as long to reach an ESS value of about 200.
Alternatively, given that many parameters have very high ESS values (such as the kappa parameter of the HKY model), we can alter the weights on the various transition kernels to spend more time estimating the state.clock.rate parameter.

In general, substitution model parameters are fairly easy to estimate, which quickly leads to high ESS values.
We can have a look at the trace of that kappa parameter to get an idea of what our trace for state.clock.rate would ideally look like (we call this plot the hairy caterpillar):

{% include image.html file="tracer2.png" prefix="/tutorials/howtos/" %}<br />

There are no obvious trends in the plot suggesting that the MCMC was still converging and there are no large-scale fluctuations in the trace suggesting poor mixing. 
Diagnosis of trace plots will be dealt with in a another tutorial.

Now, let's run our XML for about 5 times as long for a total of 500 million iterations and have a look at the state.clock.rate parameter again.
This already looks much better, with its ESS value having increased by about 5, which is reflected in the trace:

{% include image.html file="tracer3.png" prefix="/tutorials/howtos/" %}<br />

It's also straight forward to visualize the tracer for multiple parameters at the same time.
Simply selecting those parameters in the left column will take care of this:

{% include image.html file="tracer4.png" prefix="/tutorials/howtos/" %}<br />

Notice how all the other parameters now also show (much) increased ESS values, such as for the population size parameters of our skygrid model.
Most of those parameters have ESS values of about 200, meaning there is still auto-correlation between the samples but 200 effectively independent samples is fairly acceptable. 
Note that, while this analysis consists of multiple parameter types (Real/Integer/Categorical), ESS values only apply to Real (or continuous) parameters.

#### The marginal density panel



{% include image.html file="tracer5.png" prefix="/tutorials/howtos/" %}<br />





## References



{% include links.html %}

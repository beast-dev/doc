---
title: Analysing BEAST Output
keywords: tracer, tutorial
last_updated: July 6, 2017
tags: [tutorial]
summary: "Analysing BEAST output files"
sidebar: beast_sidebar
permalink: analysing_beast_output.html
folder: beast
---

## Analysing BEAST output using Tracer
This document provides a step-by-step tutorial to analysing the output of BEAST in a GUI application called Tracer.


Running Tracer
The exact instructions for running Tracer differs depending on which computer you are using. Please see the README text file that was distributed with the version you downloaded.

Once running, Tracer will look similar irrespective of which computer system it is running on. For this tutorial, the Mac OS X version will be shown but the Linux & Windows versions will have exactly the same layout and functionality.


Loading the BEAST log files
Select the Open option from the File menu. If you have it available, select the log file that you created in the [first tutorial|Tutorial 1]. The file will load and you will presented with a window similar to the one below. Remember that BEAST is a stochastic program so the actual numbers will not be exactly the same.

tracer0.png

On the left hand side is the name of the log file loaded and the traces that it contains. There are traces for the likelihood (this is the combined log likelihood of the tree and the coalescent model), and the continuous parameters. Selecting a trace on the left brings up analyses for this trace on the right hand side depending on tab that is selected. In the picture above, the log likelihood trace is selected and various statistics of this trace is shown under the Estimates tab.

Note that the Effective Sample Sizes(ESSs) for all the traces are small (ESSs less than 100 are highlighted in red by Tracer). This is not good. A low ESS means that the trace contained a lot of correlated samples and thus may not represent the posterior distribution well. In the bottom right of the window is a frequency plot of the samples which as expected given the low ESSs is extremely rough.

In the top right of the window is a table of calculated statistics for the selected trace. The statistics and their meaning are described in the table below.

Mean

The mean value of the sampled trace across the chain (excluding the burn-in).

Stdev

The standard deviation of the mean. This takes into account the effective sample size so a small ESS will give a large Stdev.

Median

The median value of the sampled trace across the chain (excluding the burn-in).

95% HPD Lower

The lower bound of the highest posterior density (HPD) interval. The HPD is a credible set that contains 95% of the sampled values.

95% HPD Upper

The upper bound of the highest posterior density (HPD) interval. The HPD is a credible set that contains 95% of the sampled values.

Auto-Correlation Time (ACT)

The number of states in the MCMC chain that two samples have to be from each other for them to be uncorrelated. The ACT is estimated from the samples in the trace (excluding the burn-in).

Effective Sample Size (ESS)

The ESS is the number of independent samples that the trace is equivalent to. This is essentially the chain length (excluding the burn-in) divided by the ACT.

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

{% include links.html %}

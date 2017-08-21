---
title: Estimating Rates and Dates Tutorial
keywords: rates, dates, mcmc, tutorial
last_updated: August 20, 2017
tags: [tutorial]
summary: "Estimating rates and dates from time-stamped sequences."
sidebar: beast_sidebar
permalink: estimating_rates.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/estimating_rates/{% endcapture %}

## Estimating rates and dates from time-stamped sequences: a hands-on tutorial

This tutorial provides a step-by-step tutorial for analyzing a set of virus sequences which have been isolated at different points in time (heterochronous data). 
The data are 71 sequences from the prM/E gene of yellow fever virus (YFV) from Africa and the Americas with isolation dates ranging from 1940-2009. 
The sequences represent a subset of the data set analyzed by Bryant et al. (Bryant JE, Holmes EC, Barrett ADT, 2007 Out of Africa: A Molecular Perspective on the Introduction of Yellow Fever Virus into the Americas. PLoS Pathog 3(5): e75. doi:10.1371/journal.ppat.0030075).

The most commonly cited hypothesis of the origin of yellow fever virus (YFV) in the Americas is that the virus was introduced from Africa, along with Aedes aegypti mosquitoes, in the bilges of sailing vessels during the slave trade. 
Although the hypothesis of a slave trade introduction is often repeated prior to paper by Bryant et al. (2007), it had not been subject to rigorous examination using gene sequence data and modern phylogenetic techniques for estimating divergence times. 
The aim of this exercise is to obtain an estimate of the rate of molecular evolution, an estimate of the date of the most recent common ancestor and to infer the phylogenetic relationships with appropriate measures of statistical support.

The first step will be to convert a NEXUS file with a DATA or CHARACTERS block into a BEAST XML input file. 
This is done using the program BEAUti (this stands for Bayesian Evolutionary Analysis Utility). 
This is a user-friendly program for setting the evolutionary model and options for the MCMC analysis. 
The second step is to actually run BEAST using the input file that contains the data, model and settings. 
The final step is to explore the output of BEAST in order to diagnose problems and to summarize the results.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

Prior to BEAST analysis of the YFV data, it is advisable to confirm that the sequences contain sufficient 'temporal signal' for reliable estimation of evolutionary rates and divergence times. 
This can be achieved using a simple exploratory regression approach as implemented in [TempEst](http://tree.bio.ed.ac.uk/software/tempest/) (Rambaut et al., 2016). 
TempEst takes as input a 'non-clock' phylogeny, which can be estimated using a standard neighbour-joining, maximum likelihood or Bayesian approach.

**Important:** [This link will take you to the first part of this tutorial](rates_and_dates).


## Evaluating rate variation (using model selection)

To investigate lineage-specific rate heterogeneity in this data set and its impact on divergence date estimates, a log and trees file is available for an analysis using an uncorrelated lognormal relaxed clock. 
Import this log file in Tracer in addition to the previously imported strict clock log file. 
Investigate the posterior density for the lognormal standard deviation; if this density excludes zero (= no rate variation), it would suggest that the strict clock model can be rejected in favor of the relaxed clock model.

A more formal test can be performed using a marginal likelihood estimator (MLE, Suchard et al., 2001, MBE 18: 1001-1013), which employs a mixture of model prior and posterior samples (Newton and Raftery 1994). 
The ratio of marginal likelihoods defines a Bayes factor, which measures the relative fit for two different models given the data at hand. 
Accurate estimation of the marginal likelihood is however not possible using Tracer, which has been shown on many occasions (Baele et al., 2012, 2013, 2016).

The harmonic mean estimator (HME) unfortunately remains a frequently used method to obtain marginal likelihood estimates, in large part because it’s so easily computed but it is more and more being disregarded as a reliable marginal likelihood estimator.
To compare demographic and molecular clock models, both HME and sHME have been shown to be unreliable (Baele et al., 2012, 2013).
More accurate/reliable MLE estimates can be obtained using computationally more demanding approaches, such as:

* path sampling (PS): proposed in the statistics literature over 2 decades ago (sometimes also referred to as 'thermodynamic integration'), this approach has been introduced in phylogenetics in 2006 (Lartillot and Philippe 2006). 
Rather than only using samples from the posterior distribution, samples are required from a series of power posteriors between posterior and prior. 
As the power posterior gets closer to the prior, there is less and less data available for the posterior, which may lead to improper results when improper priors have been specified. 
The use of proper priors is hence of primary importance for PS (Baele et al., 2013, MBE, doi:10.1093/molbev/mss243).

* stepping-stone sampling (SS): following essentially the same approach as PS and using the same collection of samples from a series of power posteriors, stepping-stone sampling (SS) yields faster-converging results compared to PS. 
As was the case for PS, the use of proper priors is critical for SS.

* generalised stepping-stone sampling (GSS): in a way, GSS combines the advantages of PS/SS - in that they yield reliable estimates of the (log) marginal likelihood - with what has been an important reason for the popularity of the HME/AICM, i.e. that these approaches make use of the samples collected during the exploration of the posterior. 
GSS makes use of working distributions to shorten the path of the PS/SS integration and as such constructs a path between posterior and a product of working distributions, thereby avoiding exploration of the priors and the numerical issues associated with this (Baele et al., 2016, Syst. Biol., doi:10.1093/sysbio/syv083).

The aforementioned PS, SS and GSS approaches have been implemented in BEAST (Baele at al., 2012, 2016). 
Typically, PS/SS or GSS model selection is performed after doing a standard MCMC analysis and collecting samples from a series of power posteriors can then start where the MCMC analysis has stopped (i.e. you should have run the MCMC analysis long enough so that it converged towards the posterior), thereby eliminating the need for PS, SS and GSS to first converge towards the posterior.

As discussed earlier in the tutorial and in the theory on Bayesian model selection, obtaining reliable model comparison results requires the use of proper priors for all parameters being estimated. 
When performing model comparison, improper priors will lead to improper Bayes Factors. 
Further, for the PS/SS procedure, we need to sample from the prior at the end of the series of the power posteriors, which will be problematic without proper priors and lead to numerical instabilities (Baele at al., 2013, MBE, doi:10.1093/molbev/mss243).

### Setting up a PS/SS analysis

To set up the PS/SS analyses, we can return to the MCMC panel in BEAUti and select 'path sampling / stepping-stone sampling' as the technique we will use to perform 'Marginal likelihood estimation (MLE)'. 

{% include image.html file="selectPSSS.png" prefix=root_url width="90%" alt="select ps ss for marginal likelihood estimation" caption="" %}

Click on 'settings' to specify the PS/SS settings. 
Because of time constraints, we will keep the length of the standard MCMC chain set to 100,000 and we will collect samples from 11 power posteriors (i.e. 10 path steps between 1.0 and 0.0). 
The length of the chain for the power posteriors can differ from the length of the standard MCMC chain, but we keep it here set to 100,000 as well. 
The powers for the different power posteriors are defined using evenly spaced quantiles of a Beta(\alpha ,1.0) distribution, with \alpha here equal to 0.30, as suggested in the stepping-stone sampling paper (Xie et al. 2011) since this approach is shown to outperform a uniform spreading suggested in the path sampling paper (Lartillot and Philippe 2006).

Note that there is an additional option available in the MLE panel: 'Print operator analysis'. 
When selected, this option will print an operator analysis for each power posterior to the screen, which can then be used to spot potential problems with the operators’ performance across the path from posterior to prior. 
This option is useful when employing highly complex models and when having obtained improbable results.

{% include image.html file="settingsPSSS.png" prefix=root_url width="90%" alt="ps ss marginal likelihood estimation settings" caption="" %}

Having set the PS/SS settings and proper priors, we can write to xml and run the analysis in BEAST. 
Use the same settings for the strict clock and the uncorrelated relaxed clock and run the analyses. 
What can we conclude from these (much too) short PS/SS analyses?

In order to obtain reliable estimates for the marginal likelihoods using PS/SS, we need to rerun these analyses using much more demanding computational settings. 
For example, by setting the number of path steps to 50 and the length of the MCMC chain for each power posterior to 500,000 (the logging frequency could also be increased). 
The length of the initial standard MCMC chain should also be increased to ensure convergence towards the posterior before the PS/SS calculations are initiated. 
An initial chain length of 5,000,000 iterations should be sufficient here. 
Note that using these settings, the marginal likelihood estimation will take approximately the time it takes to complete a standard MCMC run of 25,000,000 generations for this data (+ 5,000,000 iterations for the initial chain). 
Due to time constraints, the output files of these analyses have been made available.

**Important:** it makes no sense to load the output files from a PS/SS/GSS analysis into Tracer as these files contain the output of a series of MCMC analyses!

Note that in both folders containing the large output files for PS/SS/GSS provided, there is a BEAST XML file available to compute the MLE: calculate-PS-SS.xml or calculate-GSS.xml. 
These XML files will merely read in the samples from the power posteriors collected and will hence take only a short time to compute the actual estimates using these samples. 
Again, these simple XML files can be used when the actual MLE was lost but the log files are still available (which is a better alternative than rerunning the whole analysis).

For the strict clock analysis, we arrive at -5676.04 and -5676.10 for PS and SS respectively. 
For the uncorrelated relaxed clock analysis, we get -5656.8 and -5658.14 for the same estimators. 
How do the PS/SS MLEs compare to those obtained by the HME, and the Bayes factors resulting from these different estimators? 
What can be observed concerning the difference between the PS estimate and the SS estimate of the log marginal likelihood (also compared to the shorter runs)?

### Setting up a GSS analysis

To set up the GSS analyses, we can return to the MCMC panel in BEAUti and select 'generalized stepping-stone sampling' as the technique we will use to perform 'Marginal likelihood estimation (MLE)' in the MCMC panel. 

{% include image.html file="selectGSS.png" prefix=root_url width="90%" alt="select gss for marginal likelihood estimation" caption="" %}

Click on 'settings' to specify the GSS settings. 
Because of time constraints, we will keep the length of the standard MCMC chain set to 100,000 and we will collect samples from 11 power posteriors (i.e. 10 path steps between 1.0 and 0.0). 
The length of the chain for the power posteriors can differ from the length of the standard MCMC chain, but we set it here to 100,000 as well.
We again define the powers for the different power posteriors using evenly spaced quantiles of a Beta(0.3,1.0) distribution, since this has been shown to outperform a uniform spreading for generalised stepping-stone sampling (Baele et al., 2016).

{% include image.html file="settingsGSS.png" prefix=root_url width="90%" alt="gss marginal likelihood estimation settings" caption="" %}

The working priors/distribution for the models' parameters are automatically generated depending on their domain, but we need to make a choice when it comes to selecting a working prior for the tree topology. 
For parametric coalescent models, such as the constant population size model, the fastest approach is to use a 'matching coalescent model'; whereas for non- parametric coalescent models, such as the Bayesian Skygrid model, the general-purpose 'product of exponential distributions' is the only appropriate option.
Additionally, for speciation models (typically when using contemporaneous/isochronous sequences), the 'matching speciation model' is the only appropriate option.

For the strict clock analysis, we arrive at -5696.32 using GSS whereas for the uncorrelated relaxed clock analysis, we get -5680.06 using GSS. 
How do these MLEs compare to those obtained using PS/SS, and the Bayes factors resulting from these different estimators?

The number of power posteriors needed as well as the chain length per power posterior are important settings to achieve a reliable estimate of the (log) marginal likelihood. 
However, these settings can depend on the data set being analysed and hence different PS/SS/GSS analyses (with differing computational settings) are required when performing model comparison. 
It's strongly advised to estimate the MLE using PS/SS/GSS with increasing computational settings, until these values no longer change significantly, to ensure convergence to the correct MLE.

As discussed earlier, the model fit estimators used in this tutorial are not limited to specific types of models that can be compared. 
So apart from comparing different clock models to one another, we can use the same approaches to compare different evolutionary substitution models to one another, or different demographic models, ... 
For example, try to compare the model fit of the HKY model of nucleotide substitution we’ve been using so far to a GTR model of nucleotide substitution.  


{% include links.html %}
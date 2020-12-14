---
title: Using BETS to evaluate temporal signal
keywords: bets, tutorial
last_updated: December 14, 2020
tags: [bets, tutorial]
summary: "This tutorial describes the use of BETS (Bayesian Evaluation of Temporal Signal) to examine the temporal signal of a data set."
sidebar: beast_sidebar
permalink: bets_tutorial.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/bets/{% endcapture %}

In this tutorial, we will show how to employ Bayesian Evaluation of Temporal Signal (BETS) in BEAST to examine virus sequence data that has been sampled through time for signs of temporal signal, i.e. whether the combination of genetic sequences and their sampling times allows calibrating a molecular clock.
BETS constitutes a formal test of the strength of temporal signal in a data set, which is an important prerequisite for obtaining reliable inferences in phylodynamic analyses. 
The result of a BETS analysis is one or more (log) Bayes factors that allow to objectively assess whether a data set contains temporal signal, and hence whether a molecular clock can be calibrated using the sampling dates associated with the genetic sequences.
We have shown BETS to be effective in a range of conditions, including when the evolutionary rate is low or when the sampling window represents a small portion of the timespan of the tree (Duchene et al., 2020).

{% include note.html content="BETS should be used in addition to [TempEst](tempest)(Rambaut et al., 2016), an interactive graphical program that looks for problematic sequences in a data set in order to identify potential issues before committing significant time to running [BEAST](beast)." %}


## Running BETS

BETS involves comparing the fit to the data of two models: a model in which the data are accompanied by the actual (heterochronous) sampling times, and a model in which the samples are constrained to be contemporaneous (isochronous). 
As such, BETS relies on accurate estimations of the (log) marginal likelihoods of two models, for which [generalized stepping-stone sampling (GSS)](model_selection_2) is currently the best approach (Baele et al., 2016; Fourment et al., 2020).
In other words, BETS requires at least two independent BEAST analyses to be run so that a (log) Bayes factor can be calculated that allows to draw a conclusion regarding the presence or absence of temporal signal in the data.
We will here use BETS to analyse the published data from the [TempEst tutorial](tempest_tutorial), which investigated influenza viruses that were claimed to have been isolated and sequenced from glacial ice.

{% include note.html content="We start our analyses after the data set has been cleaned using [TempEst](tempest) in the [TempEst tutorial](tempest_tutorial)." %}

Regression of root-to-tip genetic distance against sampling time, as performed using [TempEst](tempest), can uncover a linear trend with small residuals which indicates that evolution will be adequately represented by a strict molecular clock.
The same trend with greater scatter from the regression line suggests a relaxed molecular clock model may be most appropriate.
We will here test both strict and relaxed clock models on the cleaned versions of the influenza data sets, i.e. one data set with only sequences isolated from humans and another with sequences isolated from three different lineages (human, swine and avian).


### Human lineage data set

The human lineage of the data set we consider here contains 18 taxa with an alignment length of 462 bp.

<div class="alert alert-success" role="alert"><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses_human.fasta"><i class="fa fa-download fa-lg"></i> Download the file, <code class="highlighter-rouge">ice_viruses_human.fasta</code>, here</a>.</div>
</div>

Given the size of the data set, we employ the following settings for (log) marginal likelihood estimation using GSS: an initial Markov chain of 10 million and 50 path steps with a chain length of 500.000 iterations for each power posterior.
The table below summarizes the results of the required (log) marginal likelihood estimations using GSS.

|    | Strict clock      | Relaxed clock      | 
|------------- | ------------- | ----- | 
| No sampling dates      | -2168.90 | -2122.02  | 
| Sampling dates      | -2093.03      |   -2079.18 |  
| log Bayes factor |  **75.87**  | **42.84**  |

<!-- 
SC: -2168.897286312406
SC+dates: -2093.0307790632105
RC: -2122.0200374515734
RC+dates: -2079.1823104950386
-->

The strongly positive (log) Bayes factors lead to conclude that these influenza virus data demonstrate clear temporal signal.
This result formally confirms the result from the [TempEst tutorial](tempest_tutorial), where the correlation between divergence from root and time of sampling was determined to be 0.909, with the variation around the regression line indicative of a relaxed clock as model choice.
Our (log) marginal likelihood results confirm this choice of model, with a (log) Bayes factor of 13.85 in favor of the relaxed clock over the strict clock model.


### Combined lineages data set

The combined lineages of the data set contain 45 taxa in total, and we hence stick to our settings for GSS.

<div class="alert alert-success" role="alert"><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses_cleaned.fasta"><i class="fa fa-download fa-lg"></i> Download the file, <code class="highlighter-rouge">ice_viruses_cleaned.fasta</code>, here</a>.</div>
</div>

The table below summarizes the results of the required (log) marginal likelihood estimations.

|        | Strict clock          | Relaxed clock         |
|------------- | ------------- | ----- |
| No sampling dates      | -4533.76 | -4407.29  |
| Sampling dates      | -4326.00      |   -4314.12 |
| log Bayes factor |  **207.76**  | **93.18**  |

<!-- 
SC: -4533.759115249582
SC+dates: -4325.999130699008
RC: -4407.293080081871
RC+dates: -4314.117226777445
FLC+dates: -4326.339229475603
-->

As for the human lineage data set, we observe strongly positive (log) Bayes factors when including the sampling dates compared to when these dates are not included.
Hence, these data also demonstrate clear temporal signal, again formally confirming the result from the [TempEst tutorial](tempest_tutorial), where a slightly lower correlation of 0.733 between divergence from root and time of sampling was determined.
Our (log) marginal likelihood results point to a preference for the relaxed clock model, with a (log) Bayes factor of 11.88 in favor over the strict clock model.

We note that for this heterochronous data set, other molecular clock models may be more suited to perform phylodynamic inference.
The presence of different lineages/host in the data is an indication that clade-specific clock models should be included in a model selection study.
Specifically, the fixed local clock (Worobey et al., 2014) which assumes a different strict clock for each clade, and the mixed effects clock model (Bletsa et al., 2019) which allows rate variation within each clade should be considered.


### Analyses on SARS-CoV-2 data sets

In follow-up work on applications of BETS, we applied the technique on eight data sets collected early on during the SARS-CoV-2 pandemic (Duchene et al., Virus Evol., 2020).
Our main goal was to determine if and when the phylodynamic threshold was reached, and the range of inferences that could be reliably drawn from these data.
The term **phylodynamic threshold** pertains to the question of whether a virus has had sufficient time to evolve since its origin so as to warrant tip-dating calibration, under the assumption that genome data from early stages of the outbreak are available (Hedge, Lycett, and Rambaut 2013).

We performed BETS on the following eight time points: 23rd of January, and the 2nd, 6th, 10th, 15th, 18th, 21st and 24th of February.
Our BETS results indicate that by 2 February 2020, estimates of evolutionary rates and time scales had become possible.
The February 2nd data set comprised 47 genomes, whereas the data set of the 23rd of January only comprised 22, for which BETS reported strong evidence against significant temporal signal.
Interestingly, all data sets with temporal signal favoured the strict clock over a relaxed clock model with the exception of the final data set that comprised 122 genomes, for which positive (but not strong) support for the relaxed clock was found.


## Citation

If you use BETS to test for temporal signal in your data set, we would appreciate citing the following paper:

S. Duchene, P. Lemey, T. Stadler, S. Y. W. Ho, D. A. Duchene, V. Dhanasekaran, G. Baele (2020) Bayesian evaluation of temporal signal in measurably evolving populations. Mol. Biol. Evol. (in press). DOI: [https://doi.org/10.1093/molbev/msaa163](https://doi.org/10.1093/molbev/msaa163)

S. Duchene, L. Featherstone, M. Haritopoulou-Sinanidou, A. Rambaut, P. Lemey, G. Baele (2020) Temporal signal and the phylodynamic threshold of SARS-CoV-2. Virus Evol. 6(2): veaa061. DOI: [https://doi.org/10.1093/ve/veaa061](https://doi.org/10.1093/ve/veaa061)


## References

A. Rambaut, T. T. Lam, L. M. Carvalho and O. G. Pybus (2016) Exploring the temporal structure of heterochronous sequences using TempEst. Virus Evolution 2(1): vew007. DOI: [http://dx.doi.org/10.1093/ve/vew007](http://dx.doi.org/10.1093/ve/vew007)

G. Baele, P. Lemey and M. A. Suchard (2016) Genealogical working distributions for Bayesian model testing with phylogenetic uncertainty. Syst. Biol. 65(2): 250-264. DOI: [https://doi.org/10.1093/sysbio/syv083](https://doi.org/10.1093/sysbio/syv083)

M. Fourment, A. F. Magee, C. Whidden, A. Bilge, F. A. Matsen IV, V. N. Minin (2020) 19 dubious ways to compute the marginal likelihood of a phylogenetic tree topology. Syst. Biol. 69(2): 209-220. DOI: [https://doi.org/10.1093/sysbio/syz046](https://doi.org/10.1093/sysbio/syz046)

M. Worobey, G. Z. Han, A. Rambaut (2014) A synchronized global sweep of the internal genes of modern avian influenza virus. Nature 508(7495): 254-257. DOI: [https://doi.org/10.1038/nature13016](https://doi.org/10.1038/nature13016)

M. Bletsa, M. A. Suchard, X. Ji, S. Gryseels, B. Vrancken, G. Baele, M. Worobey, P. Lemey (2019) Divergence dating using mixed effects clock modelling: An application to HIV-1. Virus Evol. 5(2): vez036. DOI: [https://doi.org/10.1093/ve/vez036](https://doi.org/10.1093/ve/vez036)

J. Hedge, S. J., Lycett, A. Rambaut (2013) Real-Time Characterization of the Molecular Epidemiology of an Influenza Pandemic. Biology Letters 9: 20130331. DOI: [https://doi.org/10.1098/rsbl.2013.0331](https://doi.org/10.1098/rsbl.2013.0331)
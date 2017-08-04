---
title: How to setup hierarchical models for sets of parameters
keywords: beast, tutorial
last_updated: August 3, 2017
tags: [tutorial]
summary: ""
sidebar: beast_sidebar
permalink: hierarchical_models.html
folder: beast
---

## Setting up Hierarchical Phylogenetic Models (HPMs)

### HPM across Different Partitions within a Species

This first part of the HPM tutorial describes how to set up a BEAST analysis with a hierarchical phylogenetic model (HPM) on substitution model parameters within a single species.
The Influenza B data set used here consists of multiple genes for the same viral sequences; we will focus here on 3 genes: hemagglutinin (HA), neuraminidase (NA) and RNA polymerase subunit (PA).
Separate alignments in nexus format are available for these genes: InfB_HA.nex, InfB_NA.nex and InfB_PA.nex.
Start BEAUti, select all the nexus files and drag them into the Partitions panel (or import them using File - Import Data ...):

{% include image.html file="InfluenzaBGenes.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="3 Influenza B genes" caption="" %}

Select all partitions, and click on 'Unlink Subst. Models' to allow each lineage to evolve according to different substitution parameters (check that the Site Model has changed and become specific to each partition). 
Given that these partitions constitute different genes from the same species, we (typically) do not unlink the clock models.

In the Tips panel, be sure to [parse the sampling dates from the taxon labels](tip_dates).

In the Sites panel, keep the default HKY model, but set the 'Base Frequencies' to 'Empirical' and 'Site heterogeneity Model' to 'Gamma' for the top partition (i.e. the first one in the list: InfB_HA).
Additionally, we'll partition each gene into 3 codon positions which will generate a total of 9 sequence data partitions:

{% include image.html file="codonPartitions.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="partitioning according to codon positions" caption="" %}

For this tutorial, we will not alter the settings for the clock model and the coalescent model.
In the 'Priors' panel, we will specify the hierarchical priors for the substitution model parameters. 
We can achieve this by cmd-selecting (or ctrl-selecting in Windows for example) all the equivalent parameters across the partitions and using the 'Link parameters into a hierarchical model' button at the bottom of the window. 
First select the kappa parameters in the first codon positions, and select 'Link parameters into a hierarchical model'. 
In the new Phylogenetic Hierarchical Model Setup window, enter a Unique Name (e.g. CP1.kappa), set the Normal Hyperprior Stdev to 5.0 and the Gamma Hyperprior Shape and Scale to 0.01 and 100.0 respectively and click OK:

{% include image.html file="kappaCP1HPM.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="HPM for the kappa parameters at the first codon positions" caption="" %}

Similarly, we can create HPMs for the kappa parameters at the second codon positions (e.g. CP2.kappa) and at the third codon positions (e.g. CP3.kappa).
The alpha parameters, describing among-site rate heterogeneity at each codon position, can also be equipped with an HPM (e.g. CP1.alpha, CP2.alpha and CP3.alpha).
In total, we end up with 6 HPMs, equal to the number of codon positions times (3) the different types of parameters across the partitions (2, i.e. kappa and alpha).


### HPM across Different Bat Species

This part of the HPM tutorial describes how to set up a BEAST analysis with a hierarchical phylogenetic model (HPM) on evolutionary rate variation in bat rabies viruses (RABV) based on a data set previously analysed by Streicker et al. (2012).
We will first set up an XML using BEAUti that specifies hierarchical prior distributions for the clock rates and substitution model parameters.

Separate alignments in fasta format are available for each host-associated lineage (DR.fas, EF1a.fas, EF1b.fas, EF2.fas, EF3.fas, EFSA.fas, LB1.fas, LB2.fas, LC.fas, LI.fas, LN.fas, LS.fas, LX.fas, M1.fas, M2.fas, MYSA.fas, NL.fas, PH.fas, PS.fas, TB.fas, TBSA.fas). 
Start BEAUti, select all the fasta files and drag them into the Partitions panel:

{% include image.html file="21BatPartitions.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="21 bat partitions" caption="" %}

Select all partitions, and click on 'Unlink Subst. Models' to allow each lineage to evolve according to different substitution parameters (check that the Site Model has changed and become specific to each partition). 
Also select 'Unlink Clock Models' to allow each lineage to evolve under different rates of evolution (check that the Clock Model has become specific to each partition).

In the Tips panel, be sure to [parse the sampling dates from the taxon labels](tip_dates).

In the Sites panel, keep the default HKY model, but set the 'Base Frequencies' to 'Empirical' and 'Site heterogeneity Model' to 'Gamma' for the top partition (i.e. the first one in the list: Te_EF1b):

{% include image.html file="setSubstitutionModel.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="setting the first substitution model" caption="" %}

To apply the same settings to all other partitions, select all partitions and click on the ‘Clone Settings’ button and keep the default 'Te_EF1b' partition as source model for the cloning:

{% include image.html file="cloneSettings.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="cloning substitution model settings" caption="" %}

Keep the default ‘Strict Clock’ model in the Clocks panel for all the partitions.
In the ‘Trees’ panel, make sure to unlink the tree prior (in the top left of the panel), and keep the default constant population size model as a simple tree prior.

{% include image.html file="treePriorSettings.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="unlinking tree prior" caption="" %}

In the 'Priors' panel, we will specify the hierarchical priors for the substitution model parameters and the clock rates. 
We can achieve this by cmd-selecting (or ctrl-selecting in Windows for example) all the equivalent parameters across the partitions and using the 'Link parameters into a hierarchical model' button at the bottom of the window. 
First cmd-select all kappa parameters, and select 'Link parameters into a hierarchical model'. 
In the new Phylogenetic Hierarchical Model Setup window, enter a Unique Name (e.g. kappa), set the Normal Hyperprior Stdev to 5.0 and the Gamma Hyperprior Shape and Scale to 0.01 and 100.0 respectively and click OK:

{% include image.html file="kappaHPM.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="hpm for kappa parameters" caption="" %}

This operation can be repeated for the 'alpha' parameters with the same hyperprior settings and 'alpha' as Unique Name.

A similar HPM can be created for the clock.rate parameters and the population sizes of the coalescent models.
To this end, shift select the first and the last clock.rate to select all clock.rate parameters and click 'Link parameters into a hierarchical model'. 
Provide clock.rate as unique name and set the Normal Hyperprior Stdev to 100.0 and the Gamma Hyperprior Shape and Scale to 0.001 and 1000.0 respectively and click OK:

{% include image.html file="clockRateHPM.png" prefix="tutorials/hpm_tutorial/" width="90%" alt="hpm for clock.rate parameters" caption="" %}

Finally, specify an HPM for the pop sizes by shift-selecting them and setting the Normal Hyperprior Stdev to 100.0 and the Gamma Hyperprior Shape and Scale to 0.001 and 1000.0.

This tutorial has shown how to set up HPMs on different parameters by using BEAUti, which will then generate a set of transition kernels on the parameters of these HPMs and write these to the generated BEAST XML file.
In that XML file, the weights of those additional transition kernels can then be modified, although we don't expect this to be necessary.

## References

Streicker D. G., Altizer S. M., Velasco-Villa A. and Rupprecht C. E. (2012) Variable evolutionary routes to host establishment across repeated rabies virus host shifts among bats. Proc. Natl. Acad. Sci. USA 109(48): 19715-19720.

{% include links.html %}

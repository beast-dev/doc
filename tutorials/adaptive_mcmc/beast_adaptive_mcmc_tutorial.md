---
title: Adaptive MCMC Tutorial
keywords: adaptive, mcmc, tutorial
last_updated: July 6, 2017
tags: [tutorial]
summary: "Using adaptive MCMC to update continuous parameters in BEAST."
sidebar: beast_sidebar
permalink: adaptive_mcmc_tutorial.html
folder: beast
---

## Adaptive MCMC Tutorial

In phylogenetic analyses, partitioning strategies (for example: by gene, by codon position, or both) involve estimating conditionally independent models of molecular evolution for those partitions, requiring a large number of evolutionary parameters that have to be estimated. 
This leads to an increased computational burden for such analyses. 
With the rise of multi-core processors, massively parallel computations can be enabled that are not yet fully exploited by many phylogenetic software packages for multipartite analyses.

The adaptive Metropolis (AM) algorithm is based on the classical random walk Metropolis algorithm (Metropolis et al., 1953) and an earlier study by Haario et al. (1999) that entertains a Gaussian proposal distribution centred on the chain’s current state and with a covariance calculated from a fixed number of previous states. 
The AM algorithm generalizes this by computing the covariance of the proposal distribution using all of the previous states.
An important advantage of the AM algorithm is that it starts using the cumulating information from the beginning of the run, ensuring that the search becomes more effective at an early stage.

In essence, an adaptive MCMC approach such as the one presented here attempts to automatically learn optimal parameter values for a collection of parameters by analysing the previous parameter values visited at earlier states of the analysis.
As such, adaptive MCMC transition kernels are non-Markovian, as they take into account a possible large collection of previous states to make proposals for the next state in the Markov chain.

## Prerequisites

This tutorial requires that you have a standard BEAST XML, as for example generated by BEAUti, at the ready.
This XML will be modified to replace the default transition kernels by one or more adaptable variance multivariate normal transition kernels.
Note that we're in the process of incorporating this functionality into BEAUti.

## Default transition kernels

BEAST XML files with default transition kernels, that can easily be adapted to using adaptive MCMC approaches, typically contain a mixture of so-called scaleOperators, randomWalkOperators and deltaExchangeOperators.
The parameters operated upon by those transition kernels can readily be added to an adaptable variance multivariate normal transition kernel.
For example, a BEAST XML file using default transition kernels for the carnivores data set discussed in our paper (Baele et al., 2017) contains the following transition kernels:

```xml
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="ND5.CP1.kappa"/>
    </scaleOperator>
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="ND5.CP2.kappa"/>
    </scaleOperator>
    <scaleOperator scaleFactor="0.75" weight="3">
        <parameter idref="ND5.CP3.kappa"/>
    </scaleOperator>
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="ND5.CP1.alpha"/>
    </scaleOperator>
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="ND5.CP2.alpha"/>
    </scaleOperator>
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="ND5.CP3.alpha"/>
    </scaleOperator>
		
    <scaleOperator scaleFactor="0.75" weight="2">
        <parameter idref="yule.birthRate"/>
    </scaleOperator>
		
    <deltaExchange delta="0.75" parameterWeights="612 612 612" weight="6">
        <parameter idref="allMus"/>
    </deltaExchange>
```

In other words, the are 3 transition kernels acting upon the &kappa; parameter of each codon position/partition and 3 transition kernels acting upon the &alpha; parameter - describing the distribution that models among-site rate heterogeneity.
Additionally, the birth rate &psi; of the tree prior and the &mu; parameters - describing the relative rate parameters - are being estimated.
Other transition kernels in this example include those that work upon the tree topology and the branch lengths, which at the moment cannot be incorporated into an adaptive MCMC analysis.

## Adaptive MCMC transition kernels

### XML Representation #1

The approach we've taken in our paper (Baele et al., 2017) is to combine all the (continuous) parameters above into one single adaptive MCMC transition kernel.
One possible approach to achieve this, is to first create a compound parameter - before the ```<operators>...</operators>``` block in the BEAST XML - that contains all the parameters which you want to estimate using an adaptive MCMC approach:

```xml
    <compoundParameter id="allParameters">
        <parameter idref="ND5.CP1.kappa"/>
        <parameter idref="ND5.CP2.kappa"/>
        <parameter idref="ND5.CP3.kappa"/>
    		
        <parameter idref="ND5.CP1.alpha"/>
        <parameter idref="ND5.CP2.alpha"/>
        <parameter idref="ND5.CP3.alpha"/>
    		
        <parameter idref="yule.birthRate"/>
    		
        <parameter idref="ND5.CP1.mu"/>
        <parameter idref="ND5.CP2.mu"/>
        <parameter idref="ND5.CP3.mu"/>
    </compoundParameter>
```

The transition kernel on this compound parameter can then be defined - in the ```<operators>...</operators>``` block - as follows:

```xml
    <adaptableVarianceMultivariateNormalOperator scaleFactor="1.0" weight="21" initial="5000" 
            burnin="2500" beta="0.05" coefficient="1.0" autoOptimize="true" formXtXInverse="false">
        <parameter idref="allParameters"/>			
        <transform type="log" start="1" end="7"/>
        <transform type="logConstrainedSum" start="8" end="10"/>
    </adaptableVarianceMultivariateNormalOperator>	
```

The important attributes to set in the adaptable variance multivariate normal operator are the weight, the initial phase of the operator and the burn-in phase of the operators.
While the beta and coefficient attributes can be manually set, we recommend leaving those at their default values,which are shown above.
To determine the weight of this operator, we have simply summed over all the weights assigned to the default transition kernels shown in the previous section.
We recommend a default value of 5000 for the initial phase of this operator, during which no learning is being done by analysing the values of the various parameters so far during the analysis.
We also typically set the burn-in phase of the operator at half that value, i.e. 2500 in this example, which represents the amount of parameter values that will not be used for the automatic learning process.

Apart from the compound parameter that needs to be provided to the operator, a number of transformation - corresponding to the parameters included in the operator - need to be provided.
Typically, a 'log'-transformation needs to be provided for those parameters with domain [0, +&infin;], whereas the transformation type 'none' can be used for those parameters with domain [-&infin;,+&infin;].
The transformation type 'logConstrainedSum' should be used for those continuous parameters that sum to a fixed value, such as for example the relative rates between codon positions.
Note that, in this representation, 'start' and 'end' values need to be provided for the transformations (with the first parameters receiving index 1).
For example, parameters 1 through 7 - corresponding to 'ND5.CP1.kappa' through 'yule.birthRate' all need to be 'log'-transformed independently from one another.

Note that it is possible to use multiple adaptable variance multivariate normal operators in a BEAST XML, operating on (not necessarily) different sets of (continuous) parameters.
For example, in our paper (Baele et al., 2017) we show the possibility of creating a separate operator for the parameters of the tree prior.

### XML Representation #2



## References

G. Baele, P. Lemey, A. Rambaut and M. A. Suchard (2017) Adaptive MCMC in Bayesian phylogenetics: an application to analyzing partitioned data in BEAST. Bioinformatics 33(12): 1798-1805.

N. Metropolis et al. (1953) Equations of state calculations by fast computing machines. J. Chem. Phys, 21, 1087–1091.

H. Haario et al. (2001) An adaptive Metropolis algorithm. Bernouilli, 7, 223–242.

{% include links.html %}
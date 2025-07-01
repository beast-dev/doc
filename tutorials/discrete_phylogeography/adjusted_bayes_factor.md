---
title: Computing the ajusted Bayes Factor (BF<sub>adj</sub>)
keywords: adjusted Bayes Factor, discrete phylogeography, tutorial
last_updated: April 18, 2025
tags: [tutorial]
summary: 'This tutorial provides guidelines for implementing and using the adjusted Bayes Factor (BF<sub>adj</sub>) to detect and mitigate the impact of sampling bias in discrete phylogeographic inference using CTMC modeling (Gámbaro et al., submitted).'
sidebar: beast_sidebar
permalink: adjusted_bayes_factor.html
folder: beast
---

## Introduction

Discrete phylogeographic analysis integrates geographic information as discrete characters and infers lineage transition events among discrete locations. A discrete phylogeographic analysis is typically followed by a Bayes factor (BF) test to assess the statistical support for inferred transition links by comparing their posterior and prior expectations. In the standard BF (BF<sub>std</sub>) test approach, the relative abundance of the involved trait states is not considered, which can be problematic in the case of unbalanced sampling among discrete locations. Although several strategies have been proposed to address sampling bias in discrete phylogeographic analyses that employ continuous-time Markov chain (CTMC) modeling, they might require additional epidemiological information. In this tutorial, we provide practical guidance on how to calculate and apply the adjusted Bayes factor (BF<sub>adj</sub>), a complementary metric to BF<sub>std</sub>, which aims to account for the relative abundance of samples across locations.The BF<sub>adj</sub> helps users to evaluate whether observed patterns are likely due to the overrepresentation of genomes from certain locations without relying on additional external data.

To undertake this tutorial, you will need to download three software packages in a format that is compatible with your computer system (all three are available for Mac OS X, Windows and Linux/UNIX operating systems):

{% include beast_callout.md %}

{% include beagle_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}


## Conducting the tip-state-swap discrete phylogeographic analysis

To calculate the BF<sub>adj</sub> we need to conduct two types of discrete phylogeographic analyses: (i) a “standard” discrete phylogeographic analysis and (ii) a “tip-state-swap” discrete phylogeographic analysis where the location states at the tips are randomly permuted during the run. For a step-by-step tutorial on how to conduct “standard” discrete phylogeographic analysis, please refer to the following resource: [Phylogeographic diffusion in discrete space](https://beast.community/workshop_discrete_diffusion).

To perform the tip-state-swap discrete phylogeographic analysis, at least 100 evenly sampled post-burnin trees from the corresponding standard discrete phylogeographic analysis are needed for use as an empirical tree distribution.
Because the analysis relies on empirical trees, the resulting XML file does not include certain xmls blocks such as `alignment`, `patterns` and `treeModel` nor the transition kernels acting on the tree or substitution model parameters. Instead, you will need to specify an empirical tree distribution and include a tip-state-swap operator block, which randomizes tip states during the MCMC run.

 📥 Download a template XML file [here](https://github.com/FabiGambaro/BFadj/blob/main/template_tipSwap.xml)
 
 📥 Example dataset available [here](https://github.com/FabiGambaro/BFadj/tree/main/Data)


##### Add empirical tree distribution and operator block
```xml
  <!-- Defining empirical tree distribution-->                            
  <empiricalTreeDistributionModel id="treeModel" fileName="template.trees">
    <taxa idref="taxa"/>
  </empiricalTreeDistributionModel>
	
  <!-- Add empirical tree distribution operator-->
  <empiricalTreeDistributionOperator weight="3">  
    <empiricalTreeDistributionModel idref="treeModel"/>  
  </empiricalTreeDistributionOperator>
```

##### Add tip-state-swap operator (or transition kernel)
```xml
  <!-- Add tipStateSwapOperator -->  
  <tipStateSwapOperator weight="" uniformRandomization="true">
    <ancestralTreeLikelihood idref="regions.treeLikelihood"/>
  </tipStateSwapOperator>
```

A key value to conduct the tip-state-swap discrete phylogeographic analysis is the relative weight of the tip-state-swap operator, which dictates the expected number of permutation events along a MCMC of given length. We recommend setting that at least 95% of tip states are expected to have been swapped between consecutively sampled posterior trees. To achieve this threshold, the weight of the tip-state-swap transition kernel can be manually adjusted, accounting for the (i) number of taxa, (ii) length of the MCMC, (iii) number of posterior samples and (iv) sum of all operator weights, as described in Gámbaro et al. (submitted). 

Otherwise, you can refer to the tip-state-swap operator calculator below:

##### tip-state-swap operator calculator

<script>
  function calculate() {
    var num1 = parseFloat(document.getElementById("num1").value); // number of tips
    var num2 = parseFloat(document.getElementById("num2").value); // MCMC chain length
    var num3 = parseFloat(document.getElementById("num3").value); // number of posterior samples
    var num4 = parseFloat(document.getElementById("num4").value); // sum of all operator weights

    // Make sure input values are valid and not zero (to avoid division errors)
    if (num1 <= 1 || num2 <= 0 || num3 <= 0 || num4 <= 0) {
      document.getElementById("result").innerHTML = "Please enter valid, non-zero values.";
      return;
    }

    var result = (((Math.log(1 - 0.95) / Math.log((num1-2) / num1))) * num3) / num2*num4;
    document.getElementById("result").innerHTML = "tip-state-swap operator value: " + result.toFixed(4);
  }
</script>

<form>
  Enter number of tips: <input type="number" id="num1" value="0"><br><br>
  Enter MCMC chain length: <input type="number" id="num2" value="0"><br><br>
  Enter number of posterior samples: <input type="number" id="num3" value="0"><br><br>
  Enter sum of all operators weights: <input type="number" id="num4" value="0"><br><br>
  <button type="button" onclick="calculate()">Calculate</button>
</form>

<p id="result"></p>

R scripts and example files are available in the following [Github Repo](https://github.com/FabiGambaro/BFadj).


## References

* [Lemey P, Rambaut A, Drummond AJ, Suchard MA (2009) Bayesian phylogeography finds its roots. PLoS Computational Biology 5: e1000520](https://doi.org/10.1371/journal.pcbi.1000520)
* [Vrancken B, Zhao B, Li X, Han X, Liu H, Zhao J, Zhong P, Lin Y, Zai J, Liu M, Smith DM, Dellicour S, Chaillon A (2020). Comparative circulation dynamics of the five main HIV types in China. Journal of Virology 94: e00683-20](https://doi.org/10.1128/jvi.00683-20)
* [Chaillon A, Gianella S, Dellicour S, Rawlings SA, Schlub TE, Oliveira MFD, Ignacio C, Porrachia M, Vrancken B, Smith DM (2020). HIV persists throughout deep tissues with repopulation from multiple anatomical sources. Journal of Clinical Investigation 130: 1699-1712](https://doi.org/10.1172/JCI134815)


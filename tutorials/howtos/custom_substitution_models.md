---
title: How to create custom substitution models
keywords: beast, tutorial
last_updated: August 6, 2017
tags: [how-to]
summary: "How to create custom substitution models other than the ones available in BEAUti."
sidebar: beast_sidebar
permalink: custom_substitution_models.html
folder: beast
---

## Custom substitution models

[BEAUti](beauti) provides a fairly standard selection of substitution models, but [BEAST](beast) can deal with a wide range of possible models through XML specification.
This can be done by imposing assumptions on the general time-reversible model (GTR; Tavaré, 1986) of nucleotide substitution.

This how-to guide provides XML code for employing standard time-reversible models, that may differ from the models available in [BEAUti](beauti). 
Each model discussion contains the substitution model structure, along with the site (rate heterogeneity) models, operator instructions, and the code for including parameters in the parameter log file. 
14 hypothetical partitions are involved ("Gene1" through "Gene14"), each requiring a different substitutional model. 
Appending the name of the gene to each parameter makes it easier to manage models and interpret output. 
Inside the frequency model, data reference is only existing when frequency is EMPIRICAL.

### JC69

The first model of nucleotide substitution, by Jukes and Cantor (1969):

```xml
<!-- *** DEFINE PARTITION-SPECIFIC SUBSTITUTION MODELS -->
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene1 *** -->
<!-- The JC69 substitution model (Jukes & Cantor, 1969) -->
<gtrModel id="JC69_Gene1">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="JC69_Gene1.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="JC69_Gene1.ac" value="1.0"/>
	</rateAC>
	<rateAG>
		<parameter id="JC69_Gene1.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="JC69_Gene1.at" value="1.0"/>
	</rateAT>
	<rateCG>
		<parameter id="JC69_Gene1.cg" value="1.0"/>
	</rateCG>
	<rateGT>
		<parameter id="JC69_Gene1.gt" value="1.0"/>
	</rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
For simplicity, all site (rate heterogeneity) models will be set to +G (i.e. JC69+G, F81+G, ...).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** DEFINE AMONG-SITE HETEROGENEITY (SITE MODELS) *** -->
<!-- *** SITE MODEL FOR PARTITION Gene1 *** -->
<siteModel id="siteModel_Gene1">
	<substitutionModel>
		<gtrModel idref="JC69_Gene1"/>
	</substitutionModel>
	<relativeRate>
		<parameter id="siteModel_Gene1.mu" value="1.0" lower="0.0"/>
	</relativeRate>
	<gammaShape gammaCategories="4">
		<parameter id="siteModel_Gene1.alpha" value="0.5" lower="0.0"/>
	</gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<!-- *** DEFINE OPERATORS *** -->
<operators id="operators">
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel_Gene1.alpha"/>
	</scaleOperator>
</operators>
```

You will need to specify priors for all the parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
**Note:** the parameters for JC69 do not receive priors, as they are set to 1.0.
We do need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene1.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="siteModel_Gene1.alpha"/>
```

### F81

The nucleotide substitution model by Joseph Felsenstein (1981):

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene2 *** -->
<!-- The F81 substitution model (Felsenstein, 1981) -->
<gtrModel id="F81_Gene2">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="F81_Gene2.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="F81_Gene2.ac" value="1.0"/>
	</rateAC>
	<rateAG>
		<parameter id="F81_Gene2.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="F81_Gene2.at" value="1.0"/>
	</rateAT>
	<rateCG>
		<parameter id="F81_Gene2.cg" value="1.0"/>
	</rateCG>
	<rateGT>
		<parameter id="F81_Gene2.gt" value="1.0"/>
	</rateGT>
</gtrModel>
```

### K80

The nucleotide substitution model by Motoo Kimura (1980):

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene3 *** -->
<!-- The K80 substitution model (Kimura, 1980) -->
<hkyModel id="K80_Gene3">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="K80_Gene3.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<kappa>
		<parameter id="K80_Gene3.kappa" value="1.0" lower="0.0"/>
	</kappa>
</hkyModel>
```

## References

Tavaré S. (1986) Some Probabilistic and Statistical Problems in the Analysis of DNA Sequences. Lectures on Mathematics in the Life Sciences. American Mathematical Society. 17: 57-86.

Jukes T. H. and Cantor C. R. (1969) Evolution of Protein Molecules. New York: Academic Press. pp. 21-132.

Felsenstein J. (1981) Evolutionary trees from DNA sequences: a maximum likelihood approach. Journal of Molecular Evolution. 17 (6): 368-376. 

Kimura M. (1980) A simple method for estimating evolutionary rates of base substitutions through comparative studies of nucleotide sequences. Journal of Molecular Evolution. 16 (2): 111-120.

{% include links.html %}

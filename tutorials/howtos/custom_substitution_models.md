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
First are presented the substitution models, then the site (rate heterogeneity) models, operator instructions, and finally the code for including parameters in the parameter log file. 
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

## References

Tavaré S. (1986) Some Probabilistic and Statistical Problems in the Analysis of DNA Sequences. Lectures on Mathematics in the Life Sciences. American Mathematical Society. 17: 57-86.

Jukes T. H. and Cantor C. R. (1969) Evolution of Protein Molecules. New York: Academic Press. pp. 21-132.

{% include links.html %}

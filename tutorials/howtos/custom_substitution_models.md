---
title: How to create custom substitution models
keywords: beast, xml, tutorial
last_updated: August 9, 2017
tags: [how-to]
summary: "How to create custom substitution models other than the ones available in BEAUti."
sidebar: beast_sidebar
permalink: custom_substitution_models.html
folder: beast
---

## Custom substitution models

[BEAUti](beauti) provides a fairly standard selection of substitution models, but [BEAST](beast) can deal with a wide range of possible models through XML specification.
This can be done by imposing assumptions on the general time-reversible model (GTR; Tavaré, 1986) of nucleotide substitution, or on the HKY (1985) model of nucleotide substitution.

This how-to guide provides XML code for employing standard time-reversible models, that may differ from the models available in [BEAUti](beauti). 
Each model discussion contains the substitution model structure, along with the site (rate heterogeneity) models, operator instructions, prior distributions and the code for including parameters in the parameter log file. 
14 hypothetical partitions are involved ("Gene1" through "Gene14"), each requiring a different substitutional model. 
Appending the name of the gene to each parameter makes it easier to manage models and interpret output. 
Inside the frequency model, data reference is only existing when frequency is EMPIRICAL.

### JC69

**Note:** as of BEAST v{{ site.beast_version }}, this model is again available in [BEAUti](beauti).

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
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
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
We need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
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

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene2 *** -->
<siteModel id="siteModel_Gene2">
    <substitutionModel>
        <gtrModel idref="F81_Gene2"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene2.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene2.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<!-- *** DEFINE OPERATORS *** -->
<operators id="operators">
    <deltaExchange delta="0.01" weight="0.1">
        <parameter idref="F81_Gene2.frequencies"/>
    </deltaExchange>
    <scaleOperator scaleFactor="0.75" weight="0.1">
        <parameter idref="siteModel_Gene2.alpha"/>
    </scaleOperator>
</operators>
```

You will need to specify priors for all the parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
**Note:** only the nucleotide frequences receive a prior for the F81 model.
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <uniformPrior lower="0.0" upper="1.0">
        <parameter idref="F81_Gene2.frequencies"/>
    </uniformPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene1.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="F81_Gene2.frequencies"/>
<parameter idref="siteModel_Gene2.alpha"/>
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

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene3 *** -->
<siteModel id="siteModel_Gene3">
    <substitutionModel>
        <hkyModel idref="K80_Gene3"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene3.mu" value="1.0" lower="0.0" upper="10000.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene3.alpha" value="0.5" lower="0.0" upper="1000.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="K80_Gene3.kappa"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene3.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
**Note:** only the kappa parameter receives a prior for the K80 model.
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <logNormalPrior mean="1.0" stdev="1.25" offset="0.0" meanInRealSpace="false">
		<parameter idref="K80_Gene3.kappa"/>
	</logNormalPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene1.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="K80_Gene3.kappa"/>
<parameter idref="K80_Gene3.frequencies"/>
<parameter idref="siteModel_Gene3.alpha"/>
```

### HKY

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene4 *** -->
<!-- The HKY substitution model (Hasegawa, Kishino & Yano, 1985) -->
<hkyModel id="HKY_Gene4">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="HKY_Gene4.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <kappa>
        <parameter id="HKY_Gene4.kappa" value="1.0" lower="0.0"/>
    </kappa>
</hkyModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene4 *** -->
<siteModel id="siteModel_Gene4">
    <substitutionModel>
        <hkyModel idref="HKY_Gene4"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene4.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene4.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="HKY_Gene4.kappa"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="0.1">
    <parameter idref="HKY_Gene4.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene4.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <logNormalPrior mean="1.0" stdev="1.25" offset="0.0" meanInRealSpace="false">
		<parameter idref="HKY_Gene4.kappa"/>
	</logNormalPrior>      
	<uniformPrior lower="0.0" upper="1.0">
        <parameter idref="HKY_Gene4.frequencies"/>
    </uniformPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene4.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="HKY_Gene4.kappa"/>
<parameter idref="HKY_Gene4.frequencies"/>
<parameter idref="siteModel_Gene4.alpha"/>
```

### TN93 (equal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene5 *** -->
<!-- The TrNef substitution model (Tamura & Nei, 1993)  -->
<gtrModel id="TrNef_Gene5">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TrNef_Gene5.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TrNef_Gene5.transversion" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TrNef_Gene5.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter idref="TrNef_Gene5.transversion"/>
    </rateAT>
    <rateCG>
        <parameter idref="TrNef_Gene5.transversion"/>
    </rateCG>
    <rateGT>
        <parameter idref="TrNef_Gene5.transversion"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene5 *** -->
<siteModel id="siteModel_Gene5">
    <substitutionModel>
        <gtrModel idref="TrNef_Gene5"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene5.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene5.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TrNef_Gene5.transversion"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TrNef_Gene5.ag"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene5.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="TrNef_Gene5.transversion"/>
    </gammaPrior>
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="TrNef_Gene5.ag"/>
    </gammaPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene5.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="TrNef_Gene5.transversion"/>
<parameter idref="TrNef_Gene5.ag"/>
<parameter idref="TrNef_Gene5.frequencies"/>
<parameter idref="siteModel_Gene5.alpha"/>
``` 


### TN93 (unequal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene6 *** -->
<!-- The TrN substitution model (Tamura & Nei, 1993)  -->
<gtrModel id="TrN_Gene6">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TrN_Gene6.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TrN_Gene6.transversion" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TrN_Gene6.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter idref="TrN_Gene6.transversion"/>
    </rateAT>
    <rateCG>
        <parameter idref="TrN_Gene6.transversion"/>
    </rateCG>
    <rateGT>
        <parameter idref="TrN_Gene6.transversion"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene6 *** -->
<siteModel id="siteModel_Gene6">
    <substitutionModel>
        <gtrModel idref="TrN_Gene6"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene6.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene6.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TrN_Gene6.transversion"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TrN_Gene6.ag"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="1">
    <parameter idref="TrN_Gene6.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene6.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="TrN_Gene6.transversion"/>
    </gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="TrN_Gene6.ag"/>
	</gammaPrior>
	<uniformPrior lower="0.0" upper="1.0">
        <parameter idref="TrN_Gene6.frequencies"/>
    </uniformPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene5.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="TrN_Gene6.transversion"/>
<parameter idref="TrN_Gene6.ag"/>
<parameter idref="TrN_Gene6.frequencies"/>
<parameter idref="siteModel_Gene6.alpha"/>
``` 


### K3P (equal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene7 *** -->
<!-- The K3P "3-parameter" substitution model (Kimura, 1981) -->
<gtrModel id="K3P_Gene7">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="K3P_Gene7.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="K3P_Gene7.purine2pyrimidine" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="K3P_Gene7.ag" value="1.0"/>
    </rateAG>
    <rateAT>
        <parameter id="K3P_Gene7.pyrimidine2purine" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter idref="K3P_Gene7.pyrimidine2purine"/>
    </rateCG>
    <rateGT>
        <parameter idref="K3P_Gene7.purine2pyrimidine"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene7 *** -->
<siteModel id="siteModel_Gene7">
    <substitutionModel>
        <gtrModel idref="K3P_Gene7"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene7.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene7.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="K3P_Gene7.purine2pyrimidine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="K3P_Gene7.pyrimidine2purine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene7.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="K3P_Gene7.purine2pyrimidine"/>
    </gammaPrior>
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="K3P_Gene7.pyrimidine2purine"/>
    </gammaPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene7.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="K3P_Gene7.purine2pyrimidine"/>
<parameter idref="K3P_Gene7.pyrimidine2purine"/>
<parameter idref="K3P_Gene7.frequencies"/>
<parameter idref="siteModel_Gene7.alpha"/>
``` 


### K3P (unequal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene8 *** -->
<!-- The K3Puf "3-parameter" substitution model (Kimura, 1981) -->
<gtrModel id="K3Puf_Gene8">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="K3Puf_Gene8.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="K3Puf_Gene8.purine2pyrimidine" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="K3Puf_Gene8.ag" value="1.0"/>
    </rateAG>
    <rateAT>
        <parameter id="K3Puf_Gene8.pyrimidine2purine" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter idref="K3Puf_Gene8.pyrimidine2purine"/>
    </rateCG>
    <rateGT>
        <parameter idref="K3Puf_Gene8.purine2pyrimidine"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene8 *** -->
<siteModel id="siteModel_Gene8">
	<substitutionModel>
		<gtrModel idref="K3Puf_Gene8"/>
	</substitutionModel>
	<relativeRate>
		<parameter id="siteModel_Gene8.mu" value="1.0" lower="0.0"/>
	</relativeRate>
	<gammaShape gammaCategories="4">
		<parameter id="siteModel_Gene8.alpha" value="0.5" lower="0.0"/>
	</gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="K3Puf_Gene8.purine2pyrimidine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="K3Puf_Gene8.pyrimidine2purine"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="0.1">
    <parameter idref="K3Puf_Gene8.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene8.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<prior id="prior">
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="K3Puf_Gene8.purine2pyrimidine"/>
    </gammaPrior>
    <gammaPrior shape="0.05" scale="10.0" offset="0.0">
        <parameter idref="K3Puf_Gene8.pyrimidine2purine"/>
	</gammaPrior>
    <uniformPrior lower="0.0" upper="1.0">
        <parameter idref="K3Puf_Gene8.frequencies"/>
    </uniformPrior>
    <exponentialPrior mean="0.5" offset="0.0">
        <parameter idref="siteModel_Gene8.alpha"/>
    </exponentialPrior>
</prior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="K3Puf_Gene8.purine2pyrimidine"/>
<parameter idref="K3Puf_Gene8.pyrimidine2purine"/>
<parameter idref="K3Puf_Gene8.frequencies"/>
<parameter idref="siteModel_Gene8.alpha"/>
``` 


### TIM (equal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene9 *** -->
<!-- The TIMef (transitional) substitution model -->
<gtrModel id="TIMef_Gene9">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TIMef_Gene9.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TIMef_Gene9.purine2pyrimidine" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TIMef_Gene9.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter id="TIMef_Gene9.pyrimidine2purine" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter idref="TIMef_Gene9.pyrimidine2purine"/>
    </rateCG>
    <rateGT>
        <parameter idref="TIMef_Gene9.purine2pyrimidine"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene9 *** -->
<siteModel id="siteModel_Gene9">
    <substitutionModel>
        <gtrModel idref="TIMef_Gene9"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene9.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene9.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIMef_Gene9.purine2pyrimidine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIMef_Gene9.ag"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIMef_Gene9.pyrimidine2purine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene9.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TIMef_Gene9.purine2pyrimidine"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TIMef_Gene9.ag"/>
</gammaPrior>
<exponentialPrior mean="0.5" offset="0.0">
    <parameter idref="siteModel_Gene9.alpha"/>
</exponentialPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="TIMef_Gene9.purine2pyrimidine"/>
<parameter idref="TIMef_Gene9.ag"/>
<parameter idref="TIMef_Gene9.pyrimidine2purine"/>
<parameter idref="TIMef_Gene9.frequencies"/>
<parameter idref="siteModel_Gene9.alpha"/>
```


### TIM (unequal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene10 *** -->
<!-- The TIM (transitional) substitution model -->
<gtrModel id="TIM_Gene10">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TIM_Gene10.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TIM_Gene10.purine2pyrimidine" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TIM_Gene10.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter id="TIM_Gene10.pyrimidine2purine" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter idref="TIM_Gene10.pyrimidine2purine"/>
    </rateCG>
    <rateGT>
        <parameter idref="TIM_Gene10.purine2pyrimidine"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene10 *** -->
<siteModel id="siteModel_Gene10">
    <substitutionModel>
        <gtrModel idref="TIM_Gene10"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene10.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene10.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIM_Gene10.purine2pyrimidine"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIM_Gene10.ag"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TIM_Gene10.pyrimidine2purine"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="0.1">
    <parameter idref="TIM_Gene10.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene10.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TIM_Gene10.purine2pyrimidine"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TIM_Gene10.ag"/>
</gammaPrior>
<exponentialPrior mean="0.5" offset="0.0">
    <parameter idref="siteModel_Gene10.alpha"/>
</exponentialPrior>
<uniformPrior lower="0.0" upper="1.0">
    <parameter idref="TIM_Gene10.frequencies"/>
</uniformPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="TIM_Gene10.purine2pyrimidine"/>
<parameter idref="TIM_Gene10.ag"/>
<parameter idref="TIM_Gene10.pyrimidine2purine"/>
<parameter idref="TIM_Gene10.frequencies"/>
<parameter idref="siteModel_Gene10.alpha"/>
```

### TVM (equal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene11 *** -->
<!-- The TVMef (transversional) substitution model -->
<gtrModel id="TVMef_Gene11">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TVMef_Gene11.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TVMef_Gene11.ac" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TVMef_Gene11.ag" value="1.0"/>
    </rateAG>
    <rateAT>
        <parameter id="TVMef_Gene11.at" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter id="TVMef_Gene11.cg" value="1.0" lower="0.0"/>
    </rateCG>
    <rateGT>
        <parameter id="TVMef_Gene11.gt" value="1.0" lower="0.0"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene11 *** -->
<siteModel id="siteModel_Gene11">
    <substitutionModel>
        <gtrModel idref="TVMef_Gene11"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene11.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene11.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.ac"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.at"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.cg"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.gt"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene11.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVMef_Gene11.ac"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVMef_Gene11.at"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVMef_Gene11.cg"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVMef_Gene11.gt"/>
</gammaPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.ac"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.at"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.cg"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVMef_Gene11.gt"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene11.alpha"/>
</scaleOperator>
```

### TVM (unequal frequencies)

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene12 *** -->
<!-- The TVM (transversional) substitution model  -->
<gtrModel id="TVM_Gene12">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="TVM_Gene12.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="TVM_Gene12.ac" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="TVM_Gene12.ag" value="1.0"/>
    </rateAG>
    <rateAT>
        <parameter id="TVM_Gene12.at" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter id="TVM_Gene12.cg" value="1.0" lower="0.0"/>
    </rateCG>
    <rateGT>
        <parameter id="TVM_Gene12.gt" value="1.0" lower="0.0"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene12 *** -->
<siteModel id="siteModel_Gene12">
    <substitutionModel>
        <gtrModel idref="TVM_Gene12"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene12.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene12.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVM_Gene12.ac"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVM_Gene12.at"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVM_Gene12.cg"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="TVM_Gene12.gt"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="0.1">
    <parameter idref="TVM_Gene12.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene12.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVM_Gene12.ac"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVM_Gene12.at"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVM_Gene12.cg"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="TVM_Gene12.gt"/>
</gammaPrior>
<uniformPrior lower="0.0" upper="1.0">
    <parameter idref="TVM_Gene12.frequencies"/>
</uniformPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="TVM_Gene12.ac"/>
<parameter idref="TVM_Gene12.at"/>
<parameter idref="TVM_Gene12.cg"/>
<parameter idref="TVM_Gene12.gt"/>
<parameter idref="TVM_Gene12.frequencies"/>
<parameter idref="siteModel_Gene12.alpha"/>
```

### SYM

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene13 *** -->
<!-- The SYM (symmetrical) substitution model (Zharkikh, 1994) -->
<gtrModel id="SYM_Gene13">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="SYM_Gene13.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="SYM_Gene13.ac" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="SYM_Gene13.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter id="SYM_Gene13.at" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter id="SYM_Gene13.cg" value="1.0" lower="0.0"/>
    </rateCG>
    <rateGT>
        <parameter id="SYM_Gene13.gt" value="1.0" lower="0.0"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene13 *** -->
<siteModel id="siteModel_Gene13">
    <substitutionModel>
        <gtrModel idref="SYM_Gene13"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene13.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene13.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="SYM_Gene13.ac"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="SYM_Gene13.ag"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="SYM_Gene13.at"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="SYM_Gene13.cg"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="SYM_Gene13.gt"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene13.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="SYM_Gene13.ac"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="SYM_Gene13.ag"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="SYM_Gene13.at"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="SYM_Gene13.cg"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="SYM_Gene13.gt"/>
</gammaPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="SYM_Gene13.ac"/>
<parameter idref="SYM_Gene13.ag"/>
<parameter idref="SYM_Gene13.at"/>
<parameter idref="SYM_Gene13.cg"/>
<parameter idref="SYM_Gene13.gt"/>
<parameter idref="SYM_Gene13.frequencies"/>
<parameter idref="siteModel_Gene13.alpha"/>
```

### GTR

```xml
<!-- *** SUBSTITUTION MODEL FOR PARTITION Gene14 *** -->
<!-- The GTR (general time reversible) substitution model (Lanace et al., 1984; Tavare, 1986) -->
<gtrModel id="GTR_Gene14">
    <frequencies>
        <frequencyModel dataType="nucleotide">
            <frequencies>
                <parameter id="GTR_Gene14.frequencies" value="0.25 0.25 0.25 0.25"/>
            </frequencies>
        </frequencyModel>
    </frequencies>
    <rateAC>
        <parameter id="GTR_Gene14.ac" value="1.0" lower="0.0"/>
    </rateAC>
    <rateAG>
        <parameter id="GTR_Gene14.ag" value="1.0" lower="0.0"/>
    </rateAG>
    <rateAT>
        <parameter id="GTR_Gene14.at" value="1.0" lower="0.0"/>
    </rateAT>
    <rateCG>
        <parameter id="GTR_Gene14.cg" value="1.0" lower="0.0"/>
    </rateCG>
    <rateGT>
        <parameter id="GTR_Gene14.gt" value="1.0" lower="0.0"/>
    </rateGT>
</gtrModel>
```

This substitution model XML element is required to construct a site (rate heterogeneity) model.
Typically, the site (rate heterogeneity) model is set to +G, i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
At the end of this how-to guide, we will show how to modify this, for example by adding a proportion of invariant sites (+I).

```xml
<!-- *** SITE MODEL FOR PARTITION Gene14 *** -->
<siteModel id="siteModel_Gene14">
    <substitutionModel>
        <gtrModel idref="GTR_Gene14"/>
    </substitutionModel>
    <relativeRate>
        <parameter id="siteModel_Gene14.mu" value="1.0" lower="0.0"/>
    </relativeRate>
    <gammaShape gammaCategories="4">
        <parameter id="siteModel_Gene14.alpha" value="0.5" lower="0.0"/>
    </gammaShape>
</siteModel>
```

Add the code below to your &lt;operators&gt;&lt;/operators&gt; block, to make sure the parameters are being updated/estimated:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="GTR_Gene14.ac"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="GTR_Gene14.ag"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="GTR_Gene14.at"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="GTR_Gene14.cg"/>
</scaleOperator>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="GTR_Gene14.gt"/>
</scaleOperator>
<deltaExchange delta="0.01" weight="0.1">
    <parameter idref="GTR_Gene14.frequencies"/>
</deltaExchange>
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene14.alpha"/>
</scaleOperator>
```

You will need to specify priors for all the model parameters that are being estimated (i.e. no priors are needed for fixed-value parameters) in your &lt;mcmc&gt;&lt;/mcmc&gt; block. 
We also need a prior for the parameter of our discretized gamma distribution, from which the rates of the among-site rate heterogeneity model are drawn.
A possible prior for this parameter could be the following:

```xml
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="GTR_Gene14.ac"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="GTR_Gene14.ag"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="GTR_Gene14.at"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="GTR_Gene14.cg"/>
</gammaPrior>
<gammaPrior shape="0.05" scale="10.0" offset="0.0">
    <parameter idref="GTR_Gene14.gt"/>
</gammaPrior>
<uniformPrior lower="0.0" upper="1.0">
    <parameter idref="GTR_Gene14.frequencies"/>
</uniformPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. 
Add the parameter references below to the file logger:

```xml
<parameter idref="GTR_Gene14.ac"/>
<parameter idref="GTR_Gene14.ag"/>
<parameter idref="GTR_Gene14.at"/>
<parameter idref="GTR_Gene14.cg"/>
<parameter idref="GTR_Gene14.gt"/>
<parameter idref="GTR_Gene14.frequencies"/>
<parameter idref="siteModel_Gene14.alpha"/>
```

## Additional Site Rate Heterogeneity Models

In the previous section, we have assumed the typical site (rate heterogeneity) model (+G), i.e. allowing for varying rates across sites according to a discretized gamma distribution (Yang, 1993).
This model is sometimes extended by adding a proportion of invariant sites (+I), although discussions often flare up as to whether such a combined model is actually identifiable.
As an example, the following ADDITIONS (i.e. one additional parameter and its operator and prior) need to be made to the first substitution model discussed in this how-to guide:

**Note:** assuming a proportion of invariant sites does not alter the substitution model, containing the instantaneous substitution rates, but is rather superimposed onto the substitution model.

Add a parameter that represents the proportion of invariant sites:

```xml
<siteModel id="siteModel_Gene1">
	<proportionInvariant>
		<parameter id="siteModel_Gene1.pInv" value="0.25" lower="0.0"/>
	</proportionInvariant>
</siteModel>
```

Add a transition kernel, i.e. a BEAST operator, to the list of transition kernels:

```xml
<scaleOperator scaleFactor="0.75" weight="0.1">
    <parameter idref="siteModel_Gene1.pInv"/>
</scaleOperator>
```

Add a prior to the list of priors:

```xml
<uniformPrior lower="0.0" upper="1.0">
    <parameter idref="siteModel_Gene1.pInv"/>
</uniformPrior>
```

And conclude by adding the additional parameter to the logger:

```xml 
<parameter idref="siteModel_Gene1.pInv"/>
```

**Note:** we have shown how to model among-site rate heterogeneity (+G), with or without assuming a proportion of invariant sites (+I).
It's possible to only model a proportion of invariant sites (+I) without assuming among-site rate heterogeneity by removing all relevant portions of the XML code.
Likewise, neither +I nor +G assumptions can be selected for the site model as follows:

```xml
<!-- *** SITE MODEL FOR PARTITION Gene15 *** -->
<siteModel id="siteModel_Gene15">
	<substitutionModel>
		<gtrModel idref="GTR_Gene15"/>
	</substitutionModel>
</siteModel>
```


## References

Tavaré S. (1986) Some Probabilistic and Statistical Problems in the Analysis of DNA Sequences. Lectures on Mathematics in the Life Sciences. American Mathematical Society. 17: 57-86.

Hasegawa M., Kishino H. and Yano T. (1985) Dating of human-ape splitting by a molecular clock of mitochondrial DNA. Journal of Molecular Evolution. 22 (2): 160-174.

Jukes T. H. and Cantor C. R. (1969) Evolution of Protein Molecules. New York: Academic Press. pp. 21-132.

Yang, Z. (1993) Maximum-likelihood estimation of phylogeny from DNA sequences when substitution rates differ over sites. Molecular Biology and Evolution 10(6): 1396-1401.

Felsenstein J. (1981) Evolutionary trees from DNA sequences: a maximum likelihood approach. Journal of Molecular Evolution. 17 (6): 368-376. 

Kimura M. (1980) A simple method for estimating evolutionary rates of base substitutions through comparative studies of nucleotide sequences. Journal of Molecular Evolution. 16 (2): 111-120.

Lanave C., Preparata G., Saccone C. and Serio, G. (1984) A new method for calculating evolutionary substitution rates. Journal of Molecular Evolution 20:86-93.

Tavaré, S. 1986. Some probabilistic and statistical problems in the analysis of DNA sequences. In M. S. Waterman, editor, Some mathematical questions in biology: DNA sequence analysis., pages 57-86. American Mathematical Society., Providence (RI).

{% include links.html %}

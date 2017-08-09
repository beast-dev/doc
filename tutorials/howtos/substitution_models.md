---
title: How to create taxon sets
keywords: beast, tutorial
last_updated: August 2, 2017
tags: [how-to]
summary: ""
sidebar: beast_sidebar
permalink: taxon_sets.html
folder: beast
---

Below is xml code for employing standard time-reversible models. First are presented the substitution models, then the site (rate heterogeneity) models, operator instructions, and finally the code for including parameters in the parameter log file. 14 hypothetical partitions are involved ("Gene1" through "Gene14"), each requiring a different substitutional model. I find appending the name of the gene to each parameter makes it easier to manage models and interpret output. Inside the frequency model, data reference is only existing when frequency is EMPIRICAL.

Substitution model code:

```
<!-- The JC69 substitution model (Jukes & Cantor, 1969) -->
<gtrModel id="JC69">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="JC69.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="JC69.ac" value="1.0"/>
	</rateAC>
	<rateAG>
		<parameter id="JC69.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="JC69.at" value="1.0"/>
	</rateAT>
	<rateCG>
		<parameter id="JC69.cg" value="1.0"/>
	</rateCG>
	<rateGT>
		<parameter id="JC69.gt" value="1.0"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The F81 substitution model (Felsenstein, 1981) -->
<gtrModel id="F81">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="F81.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="F81.ac" value="1.0"/>
	</rateAC>
	<rateAG>
		<parameter id="F81.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="F81.at" value="1.0"/>
	</rateAT>
	<rateCG>
		<parameter id="F81.cg" value="1.0"/>
	</rateCG>
	<rateGT>
		<parameter id="F81.gt" value="1.0"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The K80 substitution model (Kimura, 1980) -->
<hkyModel id="K80">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="K80.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<kappa>
		<parameter id="K80.kappa" value="1.0" lower="1.0E-8" upper="100.0"/>
	</kappa>
</hkyModel>
```

```xml
<!-- The HKY substitution model (Hasegawa, Kishino & Yano, 1985) -->
<hkyModel id="HKY">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="HKY.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<kappa>
		<parameter id="HKY.kappa" value="1.0" lower="1.0E-8" upper="100.0"/>
	</kappa>
</hkyModel>
```

```
<!-- The TrNef substitution model (Tamura & Nei, 1993)  -->
<gtrModel id="TrNef">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TrNef.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TrNef.transversion" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TrNef.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter idref="TrNef.transversion"/>
	</rateAT>
	<rateCG>
		<parameter idref="TrNef.transversion"/>
	</rateCG>
	<rateGT>
		<parameter idref="TrNef.transversion"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The TrN substitution model (Tamura & Nei, 1993)  -->
<gtrModel id="TrN">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TrN.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TrN.transversion" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TrN.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter idref="TrN.transversion"/>
	</rateAT>
	<rateCG>
		<parameter idref="TrN.transversion"/>
	</rateCG>
	<rateGT>
		<parameter idref="TrN.transversion"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The K3P "3-parameter" substitution model (Kimura, 1981) -->
<gtrModel id="K3P">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="K3P.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="K3P.purine2pyrimidine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="K3P.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="K3P.pyrimidine2purine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter idref="K3P.pyrimidine2purine"/>
	</rateCG>
	<rateGT>
		<parameter idref="K3P.purine2pyrimidine"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The K3Puf "3-parameter" substitution model (Kimura, 1981) -->
<gtrModel id="K3Puf">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="K3Puf.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="K3Puf.purine2pyrimidine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="K3Puf.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="K3Puf.pyrimidine2purine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter idref="K3Puf.pyrimidine2purine"/>
	</rateCG>
	<rateGT>
		<parameter idref="K3Puf.purine2pyrimidine"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The TIMef (transitional) substitution model -->
<gtrModel id="TIMef">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TIMef.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TIMef.purine2pyrimidine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TIMef.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter id="TIMef.pyrimidine2purine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter idref="TIMef.pyrimidine2purine"/>
	</rateCG>
	<rateGT>
		<parameter idref="TIMef.purine2pyrimidine"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The TIM (transitional) substitution model -->
<gtrModel id="TIM">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TIM.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TIM.purine2pyrimidine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TIM.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter id="TIM.pyrimidine2purine" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter idref="TIM.pyrimidine2purine"/>
	</rateCG>
	<rateGT>
		<parameter idref="TIM.purine2pyrimidine"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The TVMef (transversional) substitution model -->
<gtrModel id="TVMef">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TVMef.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TVMef.ac" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TVMef.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="TVMef.at" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter id="TVMef.cg" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateCG>
	<rateGT>
		<parameter id="TVMef.gt" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The TVM (transversional) substitution model  -->
<gtrModel id="TVM">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="TVM.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="TVM.ac" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="TVM.ag" value="1.0"/>
	</rateAG>
	<rateAT>
		<parameter id="TVM.at" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter id="TVM.cg" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateCG>
	<rateGT>
		<parameter id="TVM.gt" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The SYM (symmetrical) substitution model (Zharkikh, 1994) -->
<gtrModel id="SYM">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="SYM.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="SYM.ac" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="SYM.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter id="SYM.at" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter id="SYM.cg" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateCG>
	<rateGT>
		<parameter id="SYM.gt" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateGT>
</gtrModel>
```

```xml
<!-- The GTR (general time reversible) substitution model (Lanace et al., 1984; Tavare, 1986; Rodriguez et al., 1990) -->
<gtrModel id="GTR">
	<frequencies>
		<frequencyModel dataType="nucleotide">
			<frequencies>
				<parameter id="GTR.frequencies" value="0.25 0.25 0.25 0.25"/>
			</frequencies>
		</frequencyModel>
	</frequencies>
	<rateAC>
		<parameter id="GTR.ac" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAC>
	<rateAG>
		<parameter id="GTR.ag" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAG>
	<rateAT>
		<parameter id="GTR.at" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateAT>
	<rateCG>
		<parameter id="GTR.cg" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateCG>
	<rateGT>
		<parameter id="GTR.gt" value="1.0" lower="1.0E-8" upper="100.0"/>
	</rateGT>
</gtrModel>
```


Operators! You will want to specify weights. Add the code below to your Operators block:

```xml
<!-- *** DEFINE OPERATORS *** -->
<operators id="operators">
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="F81.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="K80.kappa"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="HKY.kappa"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="HKY.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TrNef.transversion"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TrNef.ag"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TrN.transversion"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TrN.ag"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="1">
		<parameter idref="TrN.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="K3P.purine2pyrimidine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="K3P.pyrimidine2purine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="K3Puf.purine2pyrimidine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="K3Puf.pyrimidine2purine"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="K3Puf.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIMef.purine2pyrimidine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIMef.ag"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIMef.pyrimidine2purine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIM.purine2pyrimidine"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIM.ag"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TIM.pyrimidine2purine"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="TIM.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVMef.ac"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVMef.at"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVMef.cg"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVMef.gt"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVM.ac"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVM.at"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVM.cg"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="TVM.gt"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="TVM.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="SYM.ac"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="SYM.ag"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="SYM.at"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="SYM.cg"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="SYM.gt"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>

	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="GTR.ac"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="GTR.ag"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="GTR.at"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="GTR.cg"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="GTR.gt"/>
	</scaleOperator>
	<deltaExchange delta="0.01" weight="0.1">
		<parameter idref="GTR.frequencies"/>
	</deltaExchange>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.alpha"/>
	</scaleOperator>
	<scaleOperator scaleFactor="0.75" weight="0.1">
		<parameter idref="siteModel.pInv"/>
	</scaleOperator>
</operators>
Priors. You will need to specify priors for the parameters above in your mcmc parameter block. This is harder to write template code, as the flavour of prior implemented will differ with the investigator. Below are some "reasonable" priors; alter to your liking. (Note that the parameters for JC69 and F81 do not receive priors, as they are set to 1.0).

	<logNormalPrior mean="1.0" stdev="1.25" offset="0.0" meanInRealSpace="false">
		<parameter idref="K80.kappa"/>
	</logNormalPrior>

	<logNormalPrior mean="1.0" stdev="1.25" offset="0.0" meanInRealSpace="false">
		<parameter idref="HKY.kappa"/>
	</logNormalPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TrNef.transversion"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TrNef.ag"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TrN.transversion"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TrN.ag"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="K3P.purine2pyrimidine"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="K3P.pyrimidine2purine"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="K3Puf.purine2pyrimidine"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="K3Puf.pyrimidine2purine"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIMef.purine2pyrimidine"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIMef.ag"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIMef.pyrimidine2purine"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIM.purine2pyrimidine"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIM.ag"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TIM.pyrimidine2purine"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVMef.ac"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVMef.at"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVMef.cg"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVMef.gt"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVM.ac"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVM.at"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVM.cg"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="TVM.gt"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="SYM.ac"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="SYM.ag"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="SYM.at"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="SYM.cg"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="SYM.gt"/>
	</gammaPrior>

	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="GTR.ac"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="GTR.ag"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="GTR.at"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="GTR.cg"/>
	</gammaPrior>
	<gammaPrior shape="0.05" scale="10.0" offset="0.0">
		<parameter idref="GTR.gt"/>
	</gammaPrior>
```

You will want to log the relevant parameters to file to monitor convergence/ESS. Add the commands below:

```xml
<!-- *** PRINT PARAMETERS TO FILE *** -->
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="F81.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="K80.kappa"/>
		<parameter idref="K80.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="HKY.kappa"/>
		<parameter idref="HKY.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TrNef.transversion"/>
		<parameter idref="TrNef.ag"/>
		<parameter idref="TrNef.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TrN.transversion"/>
		<parameter idref="TrN.ag"/>
		<parameter idref="TrN.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="K3P.purine2pyrimidine"/>
		<parameter idref="K3P.pyrimidine2purine"/>
		<parameter idref="K3P.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="K3Puf.purine2pyrimidine"/>
		<parameter idref="K3Puf.pyrimidine2purine"/>
		<parameter idref="K3Puf.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TIMef.purine2pyrimidine"/>
		<parameter idref="TIMef.ag"/>
		<parameter idref="TIMef.pyrimidine2purine"/>
		<parameter idref="TIMef.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TIM.purine2pyrimidine"/>
		<parameter idref="TIM.ag"/>
		<parameter idref="TIM.pyrimidine2purine"/>
		<parameter idref="TIM.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TVMef.ac"/>
		<parameter idref="TVMef.at"/>
		<parameter idref="TVMef.cg"/>
		<parameter idref="TVMef.gt"/>
		<parameter idref="TVMef.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="TVM.ac"/>
		<parameter idref="TVM.at"/>
		<parameter idref="TVM.cg"/>
		<parameter idref="TVM.gt"/>
		<parameter idref="TVM.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="SYM.ac"/>
		<parameter idref="SYM.ag"/>
		<parameter idref="SYM.at"/>
		<parameter idref="SYM.cg"/>
		<parameter idref="SYM.gt"/>
		<parameter idref="SYM.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>

		<parameter idref="GTR.ac"/>
		<parameter idref="GTR.ag"/>
		<parameter idref="GTR.at"/>
		<parameter idref="GTR.cg"/>
		<parameter idref="GTR.gt"/>
		<parameter idref="GTR.frequencies"/>
		<parameter idref="siteModel.alpha"/>
		<parameter idref="siteModel.pInv"/>
</log>
```

{% include links.html %}

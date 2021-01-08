---
title: Approaches for analyzing large phylogenetic datasets
keywords: Big data, SARS-CoV-2, COVID-19, tutorial
last_updated: January 7, 2021
tags: [tutorial]
summary: 'This tutorial offers a summary of approaches that can be used to more efficiently analyze large datasets with
an emphasis on methods targeted at SARS-CoV-2.'
sidebar: beast_sidebar
permalink: thorney_beast.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/thorney_beast/{% endcapture %}


# Introduction

The SARS-CoV-2 pandemic has highlighted the importance and challenge of large-scale molecular epidemiology. Through 
Herculean effort, academic and public health labs over the world have undertaken genomic sequencing on a scale that 
dwarfs any previous outbreak response. The magnitude of the resulting dataset makes many standard phylogenetic
approaches impractical. Here, we highlight some recent modifications we have made to make the analysis of tens of thousand of 
taxa in BEAST feasible on a time-scale that can help inform public health responses.

Many of these improvements are based on re-implementations of approaches used in other phylogenetic software, and we
are grateful to the entire phylogenetic community. Incorporating these approaches allows us to leverage the full
suite of models already available in BEAST. While the model used here dates back to Zuckerkandl E, Pauling L. 1962, this 
implementation was inspired by [Didelot et al., 2018](https://doi.org/10.1093/nar/gky783).

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
All the analyses described here can be performed using the <a href="https://github.com/beast-dev/beast-mcmc/releases/tag/v1.10.5pre_thorney"> BEASTv.1.10.5pre_thorney </a>pre-release.
</div>


*NB: To the best of our knowledge Jeff Thorne and colleges work in [multidivtime](https://brcwebportal.cos.ncsu.edu/thorne/multidivtime.html) 
represents the first implementation of related approaches in a Bayesian framework.*

## A note about efficiency 

The cost of an operation in a standard BEAST analysis is the product of how long that operation
takes, and how many times it is called. In any analysis calculating the likelihood of the sequence data over a tree (tree-data-likelihood) 
is the most computationally taxing step. BEAST mitigates this by delegating to the BEAGLE library, which limits this cost by
caching calculations on subtrees that remain unchanged between states, and computing the likelihood in parallel on high 
performance GPUs when available. These approaches reduce the number of times the full likelihood is calculated and
increase the speed of that calculation when it is needed. The analysis can be sped up further by fixing the substitution
model parameters and clock rate, if reasonable estimates exists, as sampling these parameters requires a full 
recalculation.

Although the cost of the tree-data-likelihood can be greatly reduced by fixing the parameters that govern the substitution model, 
estimates of the these parameters are not always transferable between datasets, even datasets from the same
pandemic. This is certainly true of SARS-CoV-2 where estimates of the rate can vary based on the time-scale and context of the 
data. Even when it is valid to fix these parameters, large dataset become challenging for a second reason. 
All GPUs have finite memory, and it is challenging if not impossible to find hardware configurations that 
can cope with alignments of tens of thousands of sequences. 

# An alternative likelihood function

Based on these challenges, we have implemented a more efficient likelihood based on 
a simple Poisson model commonly used in maximum likelihood methods that scale genetic phylogenies into time trees
(See [Didelot et al., 2020](https://doi.org/10.1093/molbev/msaa193) for a thorough discussion of these methods). 
Instead of an alignment, this likelihood takes a pre-estimated, rooted phylogeny with branchlengths scaled to the 
number of expected substitutions/site. This likelihood can be specified with a few xml modifications.

If you are starting from a standard BEAUTi-generated xml you can delete the `<alignment>` block and instead specify a 
"data tree" and a starting tree that is topologically consistent (every clade in the data tree must be present in the starting tree).

```xml
	<newick id="startingTree" usingDates="true">
		((taxa1|2020-02-17,...);
	</newick>

	<newick id="dataTree" usingDates="false" usingHeights="true">
		((taxa1|2020-02-17,...);
	</newick>
```

After the `<treeModel>` block we construct a `<constrainedTreeModel>` that ensures clades in the data tree are always 
present in the `<treeModel>`, which represents the estimated the time tree. 
```xml
	<constrainedTreeModel id = "constrainedTreeModel">
		<treeModel idref="treeModel"/>
		<constraintsTree>
			<tree idref="dataTree"/>
		</constraintsTree>
	</constrainedTreeModel>
```
We can now replace the standard `<treeDataLikelihood>` and its components with our new likelihood as indicated by the comments
below.
```xml
		<!-- Likelihood for tree given sequence data                                 -->

<!-- The strict clock (Uniform rates across branches)                        -->
<!--<strictClockBranchRates id="branchRates">-->
<!-- <rate>-->
<!--  <parameter id="clock.rate" value="1.0"/>-->
<!-- </rate>-->
<!--</strictClockBranchRates>-->

<!--<rateStatistic id="meanRate" name="meanRate" mode="mean" internal="true" external="true">-->
<!--<treeModel idref="treeModel"/>-->
<!--<strictClockBranchRates idref="branchRates"/>-->
<!--</rateStatistic>-->


        <!-- The HKY substitution model (Hasegawa, Kishino & Yano, 1985)             -->
<!--<HKYModel id="hky">-->
<!--<frequencies>-->
<!-- <frequencyModel dataType="nucleotide">-->
<!--  <frequencies>-->
<!--   <parameter id="frequencies" value="0.25 0.25 0.25 0.25"/>-->
<!--  </frequencies>-->
<!-- </frequencyModel>-->
<!--</frequencies>-->
<!--<kappa>-->
<!-- <parameter id="kappa" value="2.0" lower="0.0"/>-->
<!--</kappa>-->
<!--</HKYModel>-->

        <!-- site model                                                              -->
<!--<siteModel id="siteModel">-->
<!--<substitutionModel>-->
<!-- <HKYModel idref="hky"/>-->
<!--</substitutionModel>-->
<!--<gammaShape gammaCategories="4">-->
<!-- <parameter id="alpha" value="0.5" lower="0.0"/>-->
<!--</gammaShape>-->
<!--</siteModel>-->

        <!--                                                                         -->
<!--<statistic id="mu" name="mu">-->
<!--<siteModel idref="siteModel"/>-->
<!--</statistic>-->


        <!-- Likelihood for tree given sequence data                                 -->
<!--<treeDataLikelihood id="treeLikelihood" useAmbiguities="false">-->
<!--<partition>-->
<!-- <patterns idref="patterns"/>-->
<!-- <siteModel idref="siteModel"/>-->
<!--</partition>-->
<!--<treeModel idref="treeModel"/>-->
<!--<strictClockBranchRates idref="branchRates"/>-->
<!--</treeDataLikelihood>-->

<thorneyTreeLikelihood id="treeLikelihood">
	<constrainedTreeModel idref="constrainedTreeModel"/>
			 
    <strictClockBranchLengthLikelihood id="branchLengthLikelihood" scale="29903.0">
		<parameter id="clock.rate" value="0.00075" lower="0.0"/>
	</strictClockBranchLengthLikelihood>
		
	<constrainedBranchLengthProvider scale="29903.0"> 
		<constrainedTreeModel idref="constrainedTreeModel"/>
		<dataTree>
			<tree idref="dataTree"/>
		</dataTree>
	</constrainedBranchLengthProvider>
</thorneyTreeLikelihood>
```
Here `<strictClockBranchLengthLikelihood>` replaces `<strictClockBranchRates>`. It also scales the substitution
rate from substitutions/site/year to substitutions/year (i.e. `scale` represents the number of sites). 
`<constrainedBranchLengthProvider>` maps the branches in the data tree to those in the time tree and provides the number 
of mutations that occur along that branch. Similar to above, `scale` represents a multiplier to scale the branchlengths
in the data tree. In this example the original alignment used to make the data tree had 29,903 sites.

### A note about topologies

Our reliance on a fixed data tree means that every clade in the data must be present in the time tree. However, if the 
data tree is unresolved and contains polytomies, we can sample from possible resolutions without breaking that mapping.
(In these cases we know the inserted branches have 0 mutations.) The tree operators below accept a `<constrainedTreeModel>` 
and are compatible with these constraints. They allow us to sample node heights and polytomy resolutions within the 
constraints imposed by the data tree.

```xml
                
<nodeHeightOperator type="uniform" weight="10">
    <constrainedTreeModel idref="constrainedTreeModel"/>
</nodeHeightOperator>
		
<uniformSubtreePruneRegraft weight="10">
    <constrainedTreeModel idref="constrainedTreeModel"/>
</uniformSubtreePruneRegraft>
		
<narrowExchange weight="10">
    <constrainedTreeModel idref="constrainedTreeModel"/>
</narrowExchange>
		
<wideExchange weight="10">
    <constrainedTreeModel idref="constrainedTreeModel"/>
</wideExchange>
		
<wilsonBalding weight="10">
    <constrainedTreeModel idref="constrainedTreeModel"/>
</wilsonBalding>
```
		
# More efficient data structures  

Without the computational cost of the tree-data-likelihood, the routine processes of collating many coalescent
intervals and managing a large tree's internal structure become computational bottlenecks. Although these operations
are relatively efficient they occur at every state in the MCMC chain, and so even small inefficiencies add up.

To increase efficiency on large datasets we have implemented new data structures for the time tree and coalescent 
intervals. These implementations can be used in any analysis and improve 
performance in even moderately sized datasets (a few hundred taxa).

The tree class can be used by commenting out the standard treemodel and replacing it as below.

```xml

<!-- Generate a tree model                                                   -->

<!-- <treeModel id="treeModel">-->
<!--    <coalescentTree idref="startingTree"/>-->
<!--    <rootHeight>-->
<!--        <parameter id="treeModel.rootHeight"/>-->
<!--    </rootHeight>-->
<!--    <nodeHeights internalNodes="true">-->
<!--        <parameter id="treeModel.internalNodeHeights"/>-->
<!--    </nodeHeights>-->
<!--    <nodeHeights internalNodes="true" rootNode="true">-->
<!--        <parameter id="treeModel.allInternalNodeHeights"/>-->
<!--    </nodeHeights>-->
<!-- </treeModel>-->

<!-- Generate a tree model                                                   -->
<bigFastTreeModel id="treeModel">
    <tree idref="startingTree"/>
</bigFastTreeModel>
<!-- Statistic for root height of the tree       -->
<treeHeightStatistic id="treeModel.rootHeight">
	<treeModel idref="treeModel"/>
</treeHeightStatistic>
	

--snip--

<!--<scaleOperator scaleFactor="0.75" weight="3">-->
<!--     <parameter idref="treeModel.rootHeight"/>-->
<!-- </scaleOperator>-->
    <nodeHeightOperator type="scaleRoot" weight="3" scaleFactor="0.75" >
        <treeModel idref="treeModel"/>
    </nodeHeightOperator>
```
Note that this change affects how the root height is stored and so we need a new root height statistic and operator.

 
The new coalescent intervals can be added to any demographic model by replacing the `<populationTree>` in a coalescent model
with `<intervals>`. The example below is for an exponential coalescent model.

```xml
<coalescentLikelihood id="coalescent">
	<model>
		<exponentialGrowth idref="exponential"/>
	</model>
<!--        <populationTree>-->
<!--				<treeModel idref="treeModel"/>-->
<!--        </populationTree>-->
	<intervals>
		<bigFastTreeIntervals>
			<treeModel idref="treeModel"/>
		</bigFastTreeIntervals>
	</intervals>
</coalescentLikelihood>
```

# Managing large xmls with beastgen

These changes can be made to any xml generated by BEAUti. However, BEAUTi requires an alignment which can be very large,
and editing large xmls is clunky and tedious. An alternative is to use [BEASTGen](http://beast.community/beastgen), a small command line
utility that generates xmls from an Apache FreeMarker template and an input data file, which can be an alignment, a nexus tree, 
or a BEAST xml. 


<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
An example template that utilizes a skygrid coalescent prior as well as the new classes and likelihood discussed 
above can be downloaded from <a href="{{ root_url }}files/SG-thorney.template">here</a> along with a 
<a href="{{ root_url }}files/1K_SARS-CoV-2.nexus">nexus tree</a> containing 
1,000 SARS-CoV-2 taxa whose genomes were downloaded from GISAID and <a href="(https://www.cogconsortium.uk/data/)">COG-UK</a>.
An acknowledgement table for the genomes from GISAID is available
<a href="https://github.com/beast-dev/doc/blob/master/tutorials/thorney_beast/files/%20GISAID_acknowledgements.csv">here</a>
</div>

The xml can be generated with
```bash
beastgen -date_order -1 -date_prefix "|" -date_precision -D "outputStem=1K-SARS-CoV-2"	SG-thorney.template 1K_SARS-CoV-2.nexus 1K_SARS-CoV-2_SG-thorney.xml
```
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
The xml file can also be downloaded directly from <a href="{{ root_url }}files/1K_SARS-CoV-2_SG-thorney.xml">here</a>
</div>


The template, `SG-thorney.template`, is small and easy to edit. It can also be used to generate similar analysis on much
larger datsets without the tedious task of editing a large xml.

A brief introduction to BEASTGen can be found [here](http://beast.community/beastgen). The Apache FreeMarker template
engine is quite powerful, which makes BEASTGen a useful tool for managing large datasets and analyses. 

## References
Zuckerkandl E , Pauling L. 1962. Molecular disease, evolution, and genic heterogeneity. In: Kasha M , Pullman B, editors. Horizons Biochem. New York: Academic Press. p. 189–222

[Xavier Didelot, Nicholas J Croucher, Stephen D Bentley, Simon R Harris, Daniel J Wilson, Bayesian inference of ancestral dates on bacterial phylogenetic trees, Nucleic Acids Research, Volume 46, Issue 22, 14 December 2018, Page e134](https://doi.org/10.1093/nar/gky783)

[Xavier Didelot, Igor Siveroni, Erik M Volz, Additive Uncorrelated Relaxed Clock Models for the Dating of Genomic Epidemiology Phylogenies, Molecular Biology and Evolution](https://doi.org/10.1093/molbev/msaa193)

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)


{% include links.html %}

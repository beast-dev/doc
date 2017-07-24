---
title: BEAST XML Reference
permalink: xml_reference.html
sidebar: beast_sidebar
tags: [reference]
keywords: xml, reference, beast
last_updated: July 21, 2017
summary: "XML"
toc: true
folder: beast
---

## BEAST XML Elements   

The following is a list of valid elements in a beast file.

### <code>&lt;adaptableSizeFastMatrixParameter&gt;</code> element

Returns a blockUpperTriangularMatrixParameter which is a compoundParameter which forces the last element to be of full length, the second to last element to be of full length-1, etc.

The element takes following attributes:

* <code>columns</code> (optional) is of type [Integer](#integer)
: 

* <code>rows</code> (optional) is of type [Integer](#integer)
: 

* <code>maxRowSize</code> (optional) is of type [Integer](#integer)
: 

* <code>maxColumnSize</code> (optional) is of type [Integer](#integer)
: 

* <code>startingValue</code> (optional) is of type [Double](#double)
: 

* <code>lowerTriangle</code> (optional) is of type [Boolean](#boolean)
: 

Example:

```html
<adaptableSizeFastMatrixParameter columns="1" rows="1" maxRowSize="1" maxColumnSize="1" startingValue="1.0" lowerTriangle="true"/>
```

### <code>&lt;adaptableVarianceMultivariateNormalOperator&gt;</code> element

This element returns an adaptable variance multivariate normal operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>beta</code>  is of type [Double](#double)
: 

* <code>coefficient</code>  is of type [Double](#double)
: 

* <code>initial</code>  is of type [Integer](#integer)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>updateEvery</code> (optional) is of type [Integer](#integer)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>formXtXInverse</code> (optional) is of type [Boolean](#boolean)
: 

* <code>skipRankCheck</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) elements (zero or more)

* [Transform$ParsedTransform](#transform$parsedtransform) elements (zero or more)

Example:

```html
<adaptableVarianceMultivariateNormalOperator scaleFactor="1.0" weight="1.0" beta="1.0" coefficient="1.0" initial="1" burnin="1" updateEvery="1" autoOptimize="true" formXtXInverse="true" skipRankCheck="true">
  <mvPolyaLikelihood>
    <data>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </data>
    <alpha>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix4">
    </alpha>
  </mvPolyaLikelihood>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform8">
    </outer>
    <inner>
      <inverseTransform idref="inverseTransform10">
    </inner>
  </composedTransform>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform10">
    </outer>
    <inner>
      <inverseTransform idref="inverseTransform8">
    </inner>
  </composedTransform>
  <inverseTransform>
    <inverseTransform idref="inverseTransform1">
  </inverseTransform>
</adaptableVarianceMultivariateNormalOperator>
```



### <code>&lt;addremoveARGEvent&gt;</code> element

An operator that slides a subarg.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>size</code>  is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapTraits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<addremoveARGEvent weight="1" size="1.0" gaussian="true" swapRates="true" swapTraits="true" autoOptimize="true">
  <argTreeModel partitionType="reassortment">
    <starTreeModel idref="starTreeModel5">
    <rootHeight>
      <complementParameter idref="complementParameter2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter6">
    </nodeHeights>
  </argTreeModel>
</addremoveARGEvent>
```



### <code>&lt;aicmAnalysis&gt;</code> element

Performs a trace analysis. Estimates the mean of the various statistics in the given log file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

* <code>bootstrapLength</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<aicmAnalysis fileName="foo" burnIn="1" bootstrapLength="1">
  <likelihoodColumn name="foo"/>
</aicmAnalysis>
```



### <code>&lt;alignment&gt;</code> element

This element represents an alignment of molecular sequences.

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The data type"

    * [DataType](#datatype) element (exactly one)


* [Sequence](#sequence) elements (one or more)

Example:

```html
<!-- An alignment of three short DNA sequences -->
<alignment missing="-?" dataType="nucleotide">
  <sequence>
    <taxon idref="taxon1"/>
    ACGACTAGCATCGAGCTTCG--GATAGCAGGC
  </sequence>
  <sequence>
    <taxon idref="taxon2"/>
    ACGACTAGCATCGAGCTTCGG-GATAGCATGC
  </sequence>
  <sequence>
    <taxon idref="taxon3"/>
    ACG?CTAGAATCGAGCTTCGAGGATAGCATGC
  </sequence>
</alignment>
```



### <code>&lt;alloppNetworkPriorModel&gt;</code> element

Model for speciation, extinction, hybridization in allopolyploid network.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;eventRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationScalingFactor&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;tipPopulationDistribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;rootPopulationDistribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;hybridPopulationDistribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

Example:

```html
<alloppNetworkPriorModel units="days">
  <eventRate>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter9">
  </eventRate>
  <populationScalingFactor>
    <immutableParameter idref="immutableParameter9">
  </populationScalingFactor>
  <tipPopulationDistribution>
    <normalDistributionModel idref="normalDistributionModel1">
  </tipPopulationDistribution>
  <rootPopulationDistribution>
    <negativeBinomialDistributionModel idref="negativeBinomialDistributionModel1">
  </rootPopulationDistribution>
  <hybridPopulationDistribution>
    <onePGammaDistributionModel idref="onePGammaDistributionModel4">
  </hybridPopulationDistribution>
</alloppNetworkPriorModel>
```



### <code>&lt;alloppNumHybsStatistic&gt;</code> element

Statistic for number of hybridizations in allopolyploid network

The element has the following contents:

* Element named <code>&lt;apspNetwork&gt;</code>

    Containing:

    * [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<alloppNumHybsStatistic>
  <apspNetwork>
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork6">
  </apspNetwork>
</alloppNumHybsStatistic>
```



### <code>&lt;alloppspecies&gt;</code> element

Binds taxa to gene trees with information about possibly allopolyploid species.

The element takes following attributes:

* <code>minGeneNodeHeight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings$ApSpInfo](#alloppspeciesbindings$apspinfo) elements ( or more)

* Element named <code>&lt;geneTrees&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (zero or more)

    * Element named <code>&lt;gtree&gt;</code>

        Containing:

        * <code>popfactor</code>  is of type [Double](#double)
: 

        * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<alloppspecies minGeneNodeHeight="1.0">
  <apsp ploidylevel="1.0">
    <individual idref="individual3">
    <individual idref="individual4">
    <individual idref="individual10">
    <individual idref="individual8">
  </apsp>
  <apsp ploidylevel="1.0">
    <individual idref="individual4">
    <individual idref="individual2">
    <individual idref="individual10">
    <individual idref="individual1">
  </apsp>
  <geneTrees>
    <partitionedTreeModel idref="partitionedTreeModel1">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel6">
    <treeModel idref="treeModel6">
    <gtree popfactor="1.0">
      <partitionedTreeModel idref="partitionedTreeModel9">
    </gtree>
    <gtree popfactor="1.0">
      <treeModel idref="treeModel10">
    </gtree>
    <gtree popfactor="1.0">
      <starTreeModel idref="starTreeModel1">
    </gtree>
  </geneTrees>
</alloppspecies>
```



### <code>&lt;alloppSpeciesNetwork&gt;</code> element

Species network with population sizes along branches

The element takes following attributes:

* <code>oneHybridization</code> (optional) is of type [Boolean](#boolean)
: 

* <code>diploidRootIsRoot</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* Element named <code>&lt;tipPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rootPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;hybridPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp8">
    <apsp idref="apsp1">
    <apsp idref="apsp8">
    <apsp idref="apsp1">
    <geneTrees>
      <partitionedTreeModel idref="partitionedTreeModel9">
      <starTreeModel idref="starTreeModel6">
      <starTreeModel idref="starTreeModel9">
    </geneTrees>
  </alloppspecies>
  <tipPopulations value="1.0">
    <maskedMatrixParameter idref="maskedMatrixParameter4">
  </tipPopulations>
  <rootPopulations value="1.0">
    <matrixVectorProductParameter idref="matrixVectorProductParameter2">
  </rootPopulations>
  <hybridPopulations value="1.0">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
  </hybridPopulations>
</alloppSpeciesNetwork>
```



### <code>&lt;alsTreeLikelihood&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>storePartials</code> (optional) is of type [Boolean](#boolean)
: 

* <code>integrateGainRate</code>  is of type [Boolean](#boolean)
: 

* <code>forceRescaling</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;immigrationRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [PatternList](#patternlist) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

* [SiteModel](#sitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* Element named <code>&lt;observationProcess&gt;</code>

    Containing:

    * <code>type</code>  is of type [String](#string)
: 

    * <code>taxon</code> (optional) is of type [String](#string)
: 

Example:

```html
<alsTreeLikelihood useAmbiguities="true" storePartials="true" integrateGainRate="true" forceRescaling="true">
  <constantPatterns>
    <categoryOutbreak idref="categoryOutbreak3">
    <counts>
      <vectorSlice idref="vectorSlice8">
    </counts>
  </constantPatterns>
  <treeModel fixHeights="true" fixTree="true">
    <tree idref="tree5">
    <rootHeight>
      <duplicatedParameter idref="duplicatedParameter1">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundParameter idref="compoundParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <copyParameterValues idref="copyParameterValues5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter5">
    </nodeHeights>
    <leafHeight taxon="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter1">
    </leafHeight>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter8">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <copyParameterValues idref="copyParameterValues3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedParameter idref="maskedParameter6">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <complementParameter idref="complementParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter3">
    </leafTrait>
  </treeModel>
  ERROR!
  <observationProcess type="foo" taxon="foo"/>
</alsTreeLikelihood>
```



### <code>&lt;aminoAcidModel&gt;</code> element

An empirical amino acid substitution model.

The element takes following attributes:

* <code>type</code>  is of type [String](#string)
: "The type of empirical amino-acid rate matrix"

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>
: If the frequencies are omitted than the empirical frequencies associated with the selected model are used.

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

Example:

```html
<aminoAcidModel type="blosum62"/>
```



### <code>&lt;ancestralTrait&gt;</code> element

A statistic that has as its value the height of the most recent common ancestor of a set of taxa in a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

* <code>traitName</code> (optional) is of type [String](#string)
: "The name of the trait to log"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [TreeTraitProvider](#treetraitprovider) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>
: The MRCA to reconstruct the trait at (default root node)

    Containing:

    * [Taxa](#taxa) element (exactly one)

Example:

```html
<ancestralTrait name="foo" traitName="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <partitionedTreeModel idref="partitionedTreeModel6">
  </empiricalTreeDistributionModel>
  <attributeBranchRateModel rateAttribute="foo">
    <treeModel idref="treeModel6">
  </attributeBranchRateModel>
</ancestralTrait>
```



### <code>&lt;ancestralTrait&gt;</code> element

A statistic that has as its value the height of the most recent common ancestor of a set of taxa in a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

* <code>traitName</code> (optional) is of type [String](#string)
: "The name of the trait to log"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [TreeTraitProvider](#treetraitprovider) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>
: The MRCA to reconstruct the trait at (default root node)

    Containing:

    * [Taxa](#taxa) element (exactly one)

Example:

```html
<ancestralTrait name="foo" traitName="foo">
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork9">
    <rootHeight>
      <sumParameter idref="sumParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixParameter idref="matrixParameter2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <diagonalMatrix idref="diagonalMatrix1">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix6">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix1">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundParameter idref="compoundParameter9">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <maskedParameter idref="maskedParameter2">
    </leafTrait>
  </treeModel>
  <randomLocalYuleModel ratesAsMultipliers="true" dp="1" units="days">
    <birthRates>
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </birthRates>
    <indicators>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    </indicators>
    <meanRate>
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </meanRate>
  </randomLocalYuleModel>
</ancestralTrait>
```



### <code>&lt;ancestralTreeLikelihood&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>stateTagName</code> (optional) is of type [String](#string)
: 

* <code>scalingScheme</code> (optional) is of type [String](#string)
: 

* <code>delayScaling</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

* [GammaSiteRateModel](#gammasiteratemodel) element (exactly one)

* [BranchModel](#branchmodel) element (zero or one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

* [SubstitutionModel](#substitutionmodel) element (zero or one)

* Element named <code>&lt;partialsRestriction&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)

    * [Parameter](#parameter) element (exactly one)

* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<ancestralTreeLikelihood useAmbiguities="true" stateTagName="foo" scalingScheme="foo" delayScaling="foo">
  <convert dataType="nucleotide">
    <sequenceSimulator idref="sequenceSimulator2">
  </convert>
  <treeModel fixHeights="true" fixTree="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
    <rootHeight>
      <productParameter idref="productParameter4">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedParameter idref="maskedParameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips7">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <differenceParameter idref="differenceParameter4">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter1">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <parameter idref="parameter10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedParameter idref="maskedParameter5">
    </leafTrait>
  </treeModel>
  <siteModel>
    <relativeRate weight="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter1">
    </relativeRate>
  </siteModel>
</ancestralTreeLikelihood>
```



### <code>&lt;antigenicDriftPrior&gt;</code> element

Provides the likelihood of a vector of coordinates in some multidimensional 'antigenic' space based on an expected relationship with time.

The element has the following contents:

* Element named <code>&lt;locations&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;offsets&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;regressionSlope&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;regressionPrecision&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<antigenicDriftPrior>
  <locations>
    <compoundMatrixParameter idref="compoundMatrixParameter2">
  </locations>
  <offsets>
    <differenceMatrixParameter idref="differenceMatrixParameter4">
  </offsets>
  <regressionSlope>
    <matrixParameter idref="matrixParameter9">
  </regressionSlope>
  <regressionPrecision>
    <compoundParameter idref="compoundParameter5">
  </regressionPrecision>
</antigenicDriftPrior>
```



### <code>&lt;antigenicLikelihood&gt;</code> element

Provides the likelihood of immunological assay data such as Hemagglutinin inhibition (HI) given vectors of coordinatesfor viruses and sera/antisera in some multidimensional 'antigenic' space.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The name of the file containing the assay table"

* <code>mdsDimension</code>  is of type [Integer](#integer)
: "The dimension of the space for MDS"

* <code>mergeSerumIsolates</code> (optional) is of type [Boolean](#boolean)
: "Should multiple serum isolates from the same strain have their locations merged (defaults to false)"

* <code>intervalWidth</code> (optional) is of type [Double](#double)
: "The width of the titre interval in log 2 space"

* <code>driftInitialLocations</code> (optional) is of type [Double](#double)
: "The degree to drift initial virus and serum locations, defaults to 0.0"

The element has the following contents:

* Element named <code>&lt;tipTrait&gt;</code>
: Optional parameter of tip locations from the tree

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;virusLocations&gt;</code>
: Parameter of locations of all virus

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;serumLocations&gt;</code>
: Parameter of locations of all sera

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;virusOffsets&gt;</code>
: Optional parameter for virus dates to be stored

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;serumOffsets&gt;</code>
: Optional parameter for serum dates to be stored

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;serumPotencies&gt;</code>
: Optional parameter for serum potencies

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;serumBreadths&gt;</code>
: Optional parameter for serum breadths

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;virusAvidities&gt;</code>
: Optional parameter for virus avidities

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;mdsPrecision&gt;</code>
: Parameter for precision of MDS embedding

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;locationDrift&gt;</code>
: Optional parameter for drifting locations with time

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;virusDrift&gt;</code>
: Optional parameter for drifting only virus locations, overrides locationDrift

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;serumDrift&gt;</code>
: Optional parameter for drifting only serum locations, overrides locationDrift

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<antigenicLikelihood fileName="foo" mdsDimension="1" mergeSerumIsolates="true" intervalWidth="1.0" driftInitialLocations="1.0">
  <virusLocations>
    <mvPolyaLikelihood idref="mvPolyaLikelihood10">
  </virusLocations>
  <serumLocations>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
  </serumLocations>
  <mdsPrecision>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision7">
  </mdsPrecision>
</antigenicLikelihood>
```



### <code>&lt;appendedPotentialDerivative&gt;</code> element

null

The element has the following contents:

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) elements (one or more)

Example:

```html
<appendedPotentialDerivative>
  <gradient>
    <twoPartDistribution idref="twoPartDistribution6">
  </gradient>
  <sumDerivative>
    <sumDerivative idref="sumDerivative9">
    <sumDerivative idref="sumDerivative1">
    <gradient idref="gradient4">
    <gradient idref="gradient4">
  </sumDerivative>
  <sumDerivative>
    <appendedPotentialDerivative idref="appendedPotentialDerivative8">
  </sumDerivative>
  <maskedGradient>
    <sumDerivative idref="sumDerivative6">
    <mask>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
    </mask>
  </maskedGradient>
</appendedPotentialDerivative>
```



### <code>&lt;approximateFactorAnalysisPrecision&gt;</code> element

A diffusion approximation to a factor analysis

The element has the following contents:

* Element named <code>&lt;L&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;gamma&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<approximateFactorAnalysisPrecision>
  <L>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser3">
  </L>
  <gamma>
    <sumParameter idref="sumParameter5">
  </gamma>
</approximateFactorAnalysisPrecision>
```



### <code>&lt;apsp&gt;</code> element

A diploid or allopolyploid species made of individuals

The element takes following attributes:

* <code>ploidylevel</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings$Individual](#alloppspeciesbindings$individual) elements (one or more)

Example:

```html
<apsp ploidylevel="1.0">
  <individual>
    <apsp idref="apsp2">
  </individual>
</apsp>
```



### <code>&lt;apspCoalescent&gt;</code> element

Likelihood of a set of gene trees embedded in a allopolyploid species network.

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<apspCoalescent>
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp3">
    <apsp idref="apsp3">
    <apsp idref="apsp8">
    <apsp idref="apsp8">
    <geneTrees>
      <starTreeModel idref="starTreeModel7">
      <starTreeModel idref="starTreeModel8">
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
      </gtree>
      <gtree popfactor="1.0">
        <partitionedTreeModel idref="partitionedTreeModel10">
      </gtree>
      <gtree popfactor="1.0">
        <starTreeModel idref="starTreeModel10">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies3">
    <tipPopulations value="1.0">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
    </tipPopulations>
    <rootPopulations value="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter7">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <fastMatrixParameter idref="fastMatrixParameter3">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</apspCoalescent>
```



### <code>&lt;apspNetworkPrior&gt;</code> element

Prior for an allopolyploid species network.

The element has the following contents:

* Element named <code>&lt;model&gt;</code>

    Containing:

    * [AlloppNetworkPriorModel](#alloppnetworkpriormodel) element (exactly one)

* Element named <code>&lt;apspNetwork&gt;</code>

    Containing:

    * [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<apspNetworkPrior>
  <model>
    <alloppNetworkPriorModel idref="alloppNetworkPriorModel2">
  </model>
  <apspNetwork>
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork7">
  </apspNetwork>
</apspNetworkPrior>
```



### <code>&lt;arbitraryBranchRates&gt;</code> element

This element returns an arbitrary rate model.The branch rates are drawn from an arbitrary distribution determine by the prior.

The element takes following attributes:

* <code>reciprocal</code> (optional) is of type [Boolean](#boolean)
: 

* <code>centerAtOne</code> (optional) is of type [Boolean](#boolean)
: 

* <code>exp</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;rates&gt;</code>
: The rate parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<arbitraryBranchRates reciprocal="true" centerAtOne="true" exp="true">
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork5">
    <rootHeight>
      <differenceMatrixParameter idref="differenceMatrixParameter2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <complementParameter idref="complementParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter8">
    </nodeHeights>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastMatrixParameter idref="fastMatrixParameter3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <differenceParameter idref="differenceParameter9">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter3">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix7">
    </leafTrait>
  </treeModel>
  <rates>
    <dataFromTreeTips idref="dataFromTreeTips4">
  </rates>
</arbitraryBranchRates>
```



### <code>&lt;argCoalescentLikelihood&gt;</code> element

A coalescent likelihood for an ARG model

The element takes following attributes:

* <code>ancestralRestriction</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;recombinationRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;argModel&gt;</code>

    Containing:

    * [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argCoalescentLikelihood ancestralRestriction="true">
  <populationSize>
    <jointParameter idref="jointParameter8">
  </populationSize>
  <recombinationRate>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
  </recombinationRate>
  <argModel>
    <argTreeModel idref="argTreeModel2">
  </argModel>
</argCoalescentLikelihood>
```



### <code>&lt;argDiscretizedBranchRates&gt;</code> element

This element returns an discretized relaxed clock model.The branch rates are drawn from a discretized parametric distribution.

The element takes following attributes:

* <code>numRateCategories</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

* Element named <code>&lt;distribution&gt;</code>
: The distribution model for rates among branches

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

Example:

```html
<argDiscretizedBranchRates numRateCategories="1">
  <argTreeModel partitionType="recombination">
    <newick idref="newick9">
    <rootHeight>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastMatrixParameter idref="fastMatrixParameter5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter5">
    </nodeHeights>
  </argTreeModel>
  <distribution>
    <uniformDistributionModel idref="uniformDistributionModel10">
  </distribution>
</argDiscretizedBranchRates>
```



### <code>&lt;ARGEventOperator&gt;</code> element

An operator that slides a subarg.

The element takes following attributes:

* <code>addProbability</code>  is of type [Double](#double)
: "The probability that the operator adds a new reassortment event"

* <code>jointPartitioning</code> (optional) is of type [Boolean](#boolean)
: 

* <code>tossSize</code> (optional) is of type [Integer](#integer)
: 

* <code>addProbability</code> (optional) is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>weight</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

* [ARGPartitionLikelihood](#argpartitionlikelihood) element (exactly one)

* [ARGRatePrior](#argrateprior) element (zero or one)

* Element named <code>&lt;internalNodes&gt;</code>

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;internalNodesPlusRoot&gt;</code>

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;nodeRates&gt;</code>

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

Example:

```html
<ARGEventOperator addProbability="1.0" jointPartitioning="true" tossSize="1" addProbability="1.0" autoOptimize="true" weight="1">
  <argTreeModel partitionType="recombination">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
    <rootHeight>
      <sumParameter idref="sumParameter6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix1">
    </nodeHeights>
  </argTreeModel>
  <poissonPartitionLikelihood mean="1.0">
    <argTreeModel idref="argTreeModel5">
  </poissonPartitionLikelihood>
  <internalNodes>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser9">
  </internalNodes>
  <internalNodesPlusRoot>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView8">
  </internalNodesPlusRoot>
  <nodeRates>
    <matrixParameter idref="matrixParameter5">
  </nodeRates>
</ARGEventOperator>
```



### <code>&lt;argLocalClock&gt;</code> element

null

Example:

```html
<argLocalClock/>
```



### <code>&lt;argTreeModel&gt;</code> element

This element represents a model of the tree. The tree model includes and attributes of the nodes including the age (or <i>height</i>) and the rate of evolution at each node in the tree.

The element takes following attributes:

* <code>partitionType</code> (optional) is of type [String](#string)
: "Describes the partition structure of the model"

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;rootHeight&gt;</code>
: A parameter definition with id only (cannot be a reference!)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;nodeHeights&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root height is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node heights (minus the root) are included in the parameter"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

Example:

```html
<!-- the tree model as special sockets for attaching parameters to various aspects of the tree     -->
<!-- The treeModel below shows the standard setup with a parameter associated with the root height -->
<!-- a parameter associated with the internal node heights (minus the root height) and             -->
<!-- a parameter associates with all the internal node heights                                     -->
<!-- Notice that these parameters are overlapping                                                  -->
<!-- The parameters are subsequently used in operators to propose changes to the tree node heights -->
<treeModel id="treeModel1">
	<tree idref="startingTree"/>
	<rootHeight>
		<parameter id="treeModel1.rootHeight"/>
	</rootHeight>
	<nodeHeights internalNodes="true" rootNode="false">
		<parameter id="treeModel1.internalNodeHeights"/>
	</nodeHeights>
	<nodeHeights internalNodes="true" rootNode="true">
		<parameter id="treeModel1.allInternalNodeHeights"/>
	</nodeHeights>
</treeModel>```



### <code>&lt;argNarrowExchange&gt;</code> element

This element represents a narrow exchange operator. This operator swaps a random subtree with its uncle.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argNarrowExchange weight="1">
  <argTreeModel partitionType="recombination">
    <tree idref="tree8">
    <rootHeight>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixParameter idref="matrixParameter4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood9">
    </nodeHeights>
  </argTreeModel>
</argNarrowExchange>
```



### <code>&lt;argPartitionOperator&gt;</code> element

An operator that picks a new partitioning uniformly at random.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>tossSize</code> (optional) is of type [Integer](#integer)
: 

* <code>tossAll</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argPartitionOperator weight="1" tossSize="1" tossAll="true">
  <argTreeModel partitionType="recombination">
    <speciesTree idref="speciesTree3">
    <rootHeight>
      <fastMatrixParameter idref="fastMatrixParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
    </nodeHeights>
  </argTreeModel>
</argPartitionOperator>
```



### <code>&lt;argRatePrior&gt;</code> element

null

Example:

```html
<argRatePrior/>
```



### <code>&lt;argReassortmentNodeCount&gt;</code> element

A statistic that returns the number of reassortment nodes in an ARG

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic for the purpose of logging"

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argReassortmentNodeCount name="foo">
  <argTreeModel partitionType="recombination">
    <argTreeModel idref="argTreeModel6">
    <rootHeight>
      <leafTraitParameter idref="leafTraitParameter5">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </nodeHeights>
  </argTreeModel>
</argReassortmentNodeCount>
```



### <code>&lt;argSubtreeSlide&gt;</code> element

An operator that slides a subtree.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>size</code>  is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapTraits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argSubtreeSlide weight="1" size="1.0" gaussian="true" swapRates="true" swapTraits="true" autoOptimize="true">
  <argTreeModel partitionType="recombination">
    <speciesTree idref="speciesTree4">
    <rootHeight>
      <mvPolyaLikelihood idref="mvPolyaLikelihood2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter6">
    </nodeHeights>
  </argTreeModel>
</argSubtreeSlide>
```



### <code>&lt;argSwapOperator&gt;</code> element

Swaps nodes on a tree

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>type</code>  is of type [String](#string)
: "The mode of the operator"

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argSwapOperator weight="1" type="narrowSwap">
  <argTreeModel partitionType="recombination">
    <rescaledTree idref="rescaledTree4">
    <rootHeight>
      <copyParameterValues idref="copyParameterValues9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <differenceMatrixParameter idref="differenceMatrixParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <differenceMatrixParameter idref="differenceMatrixParameter5">
    </nodeHeights>
  </argTreeModel>
</argSwapOperator>
```



### <code>&lt;argTimingStatistic&gt;</code> element



The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argTimingStatistic name="foo">
  <argTreeModel partitionType="recombination">
    <mulSpeciesTree idref="mulSpeciesTree9">
    <rootHeight>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips5">
    </nodeHeights>
  </argTreeModel>
</argTimingStatistic>
```



### <code>&lt;argTotalLengthStatistic&gt;</code> element

null

Example:

```html
<argTotalLengthStatistic/>
```



### <code>&lt;argTraceAnalysis&gt;</code> element

Analyses and reports on a trace consisting of trees.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "name of a tree log file"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<argTraceAnalysis fileName="trees.log" burnIn="1"/>
```



### <code>&lt;argTreeCount&gt;</code> element

Provides number of distinct loci trees

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argTreeCount>
  <argTreeModel partitionType="recombination">
    <newick idref="newick7">
    <rootHeight>
      <complementParameter idref="complementParameter7">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedParameter idref="maskedParameter7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood9">
    </nodeHeights>
  </argTreeModel>
</argTreeCount>
```



### <code>&lt;argTreeLikelihood&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>storePartials</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useScaling</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

* [ARGModel](#argmodel) element (exactly one)

* [SiteModel](#sitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

Example:

```html
<argTreeLikelihood useAmbiguities="true" storePartials="true" useScaling="true">
  <ascertainedPatterns from="1" to="1" every="1">
    <sequenceSimulator idref="sequenceSimulator5">
  </ascertainedPatterns>
  <argTreeModel partitionType="reassortment">
    <speciesTree idref="speciesTree5">
    <rootHeight>
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter1">
    </nodeHeights>
  </argTreeModel>
  ERROR!
</argTreeLikelihood>
```



### <code>&lt;argTreeModel&gt;</code> element

This element represents a model of the tree. The tree model includes and attributes of the nodes including the age (or <i>height</i>) and the rate of evolution at each node in the tree.

The element takes following attributes:

* <code>partitionType</code> (optional) is of type [String](#string)
: "Describes the partition structure of the model"

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;rootHeight&gt;</code>
: A parameter definition with id only (cannot be a reference!)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;nodeHeights&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root height is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node heights (minus the root) are included in the parameter"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

Example:

```html
<!-- the tree model as special sockets for attaching parameters to various aspects of the tree     -->
<!-- The treeModel below shows the standard setup with a parameter associated with the root height -->
<!-- a parameter associated with the internal node heights (minus the root height) and             -->
<!-- a parameter associates with all the internal node heights                                     -->
<!-- Notice that these parameters are overlapping                                                  -->
<!-- The parameters are subsequently used in operators to propose changes to the tree node heights -->
<treeModel id="treeModel1">
	<tree idref="startingTree"/>
	<rootHeight>
		<parameter id="treeModel1.rootHeight"/>
	</rootHeight>
	<nodeHeights internalNodes="true" rootNode="false">
		<parameter id="treeModel1.internalNodeHeights"/>
	</nodeHeights>
	<nodeHeights internalNodes="true" rootNode="true">
		<parameter id="treeModel1.allInternalNodeHeights"/>
	</nodeHeights>
</treeModel>```



### <code>&lt;argUniformPrior&gt;</code> element

A uniform prior for an ARG model

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argUniformPrior>
  <argTreeModel partitionType="reassortment">
    <argTreeModel idref="argTreeModel5">
    <rootHeight>
      <maskedMatrixParameter idref="maskedMatrixParameter2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <copyParameterValues idref="copyParameterValues9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <parameter idref="parameter5">
    </nodeHeights>
  </argTreeModel>
</argUniformPrior>
```



### <code>&lt;argWideExchange&gt;</code> element

This element represents a wide exchange operator. This operator swaps two random subtrees.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argWideExchange weight="1">
  <argTreeModel partitionType="reassortment">
    <speciesTree idref="speciesTree6">
    <rootHeight>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice6">
    </nodeHeights>
  </argTreeModel>
</argWideExchange>
```



### <code>&lt;arithmeticMeanAnalysis&gt;</code> element

Performs a trace analysis. Estimates the mean of the various statistics in the given log file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

* <code>bootstrapLength</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<arithmeticMeanAnalysis fileName="foo" burnIn="1" bootstrapLength="1">
  <likelihoodColumn name="foo"/>
</arithmeticMeanAnalysis>
```



### <code>&lt;array&gt;</code> element

This element returns an array of the objects it contains.

The element has the following contents:

* [Object](#object) elements (one or more)
: Objects to be put in an array

Example:

```html
<array>
  <hiddenNucleotides classCount="1"/>
  <precisionGibbsOperator weight="1.0">
    <treeTraitNormalDistributionLikelihood idref="treeTraitNormalDistributionLikelihood2">
  </precisionGibbsOperator>
</array>
```



### <code>&lt;ascertainedPatterns&gt;</code> element

A weighted list of the unique site patterns (unique columns) in an alignment.

The element takes following attributes:

* <code>from</code> (optional) is of type [Integer](#integer)
: "The site position to start at, default is 1 (the first position)"

* <code>to</code> (optional) is of type [Integer](#integer)
: "The site position to finish at, must be greater than <b>from</b>, default is length of given alignment"

* <code>every</code> (optional) is of type [Integer](#integer)
: "Determines how many sites are selected. A value of 3 will select every third site starting from <b>from</b>, default is 1 (every site)"

The element has the following contents:

* Element named <code>&lt;taxonList&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)

* [Alignment](#alignment) element (exactly one)

: <includePatterns from="Z" to="X"/>
: <excludePatterns from="Z" to="X"/>
Example:

```html
<ascertainedPatterns from="1" to="1" every="1">
  <alignment>
    <kStateType idref="kStateType2">
    <sequence idref="sequence8">
    <sequence idref="sequence3">
    <sequence idref="sequence5">
    <sequence idref="sequence8">
  </alignment>
</ascertainedPatterns>
```



### <code>&lt;attr&gt;</code> element

This element represents a name/value pair.

The element takes following attributes:

* <code>name</code>  is of type [String](#string)
: "The name to give to this attribute"

The element has the following contents:

* [Object](#object) element (exactly one)

Example:

```html
<attr name="foo">
  <mulSpeciesTree constantRoot="true" constantPopulation="true">
    <mulSpecies idref="mulSpecies4">
    <sppSplitPopulations value="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter8">
    </sppSplitPopulations>
  </mulSpeciesTree>
</attr>
```



### <code>&lt;attributeBranchRateModel&gt;</code> element

This element returns a branch rate model.The branch rates are specified by an attribute embedded in the nodes of the tree.

The element takes following attributes:

* <code>rateAttribute</code>  is of type [String](#string)
: "Optional name of a rate attribute to be read with the trees"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<attributeBranchRateModel rateAttribute="foo">
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork1">
    <rootHeight>
      <copyParameterValues idref="copyParameterValues5">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <copyParameterValues idref="copyParameterValues2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedParameter idref="maskedParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <sumParameter idref="sumParameter5">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixMatrixProduct idref="matrixMatrixProduct4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix1">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <duplicatedParameter idref="duplicatedParameter2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixMatrixProduct idref="matrixMatrixProduct10">
    </nodeTraits>
    <leafTrait taxon="foo" name="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <complementParameter idref="complementParameter3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix7">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix8">
    </leafTrait>
  </treeModel>
</attributeBranchRateModel>
```



### <code>&lt;attributePatterns&gt;</code> element

A site pattern defined by an attribute in a set of taxa.

The element takes following attributes:

* <code>attribute</code>  is of type [String](#string)
: 

* <code>secondary</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The data type"

    * [DataType](#datatype) element (exactly one)


* [TaxonList](#taxonlist) element (exactly one)
: The taxon set

Example:

```html
<attributePatterns dataType="hiddenAminoAcid2" attribute="foo" secondary="foo">
  <hypermutantAlignment type="both">
    <sequenceSimulator idref="sequenceSimulator7">
  </hypermutantAlignment>
</attributePatterns>
```



### <code>&lt;attributes&gt;</code> element

This element represents an array of name/value pairs.

The element takes following attributes:

* <code>names</code>  is of type [String;](#string;)
: 

* <code>values</code>  is of type [String;](#string;)
: 

Example:

```html
<attributes names="foo bar" values="foo bar"/>
```



### <code>&lt;bdcNClustersStatistic&gt;</code> element

Statistic for number of collapsed nodes in species tree when using birth-death-collapse model.

The element takes following attributes:

* <code>name</code>  is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;speciesTree&gt;</code>

    Containing:

    * [SpeciesTreeModel](#speciestreemodel) element (exactly one)

* Element named <code>&lt;collapseModel&gt;</code>

    Containing:

    * [BirthDeathCollapseModel](#birthdeathcollapsemodel) element (exactly one)

Example:

```html
<bdcNClustersStatistic name="foo">
  <speciesTree>
    <speciesTree idref="speciesTree6">
  </speciesTree>
  <collapseModel>
    <birthDeathCollapseModel idref="birthDeathCollapseModel8">
  </collapseModel>
</bdcNClustersStatistic>
```



### <code>&lt;beagleBranchLikelihood&gt;</code> element

beagleBranchLikelihood

Example:

```html
<beagleBranchLikelihood/>
```



### <code>&lt;beagleOperationReport&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>branchFileName</code> (optional) is of type [String](#string)
: 

* <code>operationFileName</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [PatternList](#patternlist) elements (exactly 2)

* [TreeModel](#treemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (exactly one)

* [GammaSiteRateModel](#gammasiteratemodel) element (exactly one)

Example:

```html
<beagleOperationReport branchFileName="foo" operationFileName="foo">
  <maskedPatterns negative="true">
    <alignment idref="alignment9">
    <mask>
      foo
    </mask>
  </maskedPatterns>
  <convert dataType="nucleotide">
    <alignment idref="alignment2">
  </convert>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <patterns idref="patterns6">
  </empiricalTreeDistributionModel>
  <epochBranchModel>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel5">
    <empiricalCodonModel idref="empiricalCodonModel2">
    <epoch transitionTime="1.0">
      <binaryCovarionModel idref="binaryCovarionModel1">
    </epoch>
    <epoch transitionTime="1.0">
      <complexSubstitutionModel idref="complexSubstitutionModel4">
    </epoch>
    <epoch transitionTime="1.0">
      <binarySubstitutionModel idref="binarySubstitutionModel7">
    </epoch>
    <epoch transitionTime="1.0">
      <museGautCodonModel idref="museGautCodonModel5">
    </epoch>
  </epochBranchModel>
  <siteModel>
    <relativeRate weight="1.0">
      <leafTraitParameter idref="leafTraitParameter10">
    </relativeRate>
  </siteModel>
</beagleOperationReport>
```



### <code>&lt;benchmarker&gt;</code> element

This element runs a benchmark on a series of likelihood calculators.

The element takes following attributes:

* <code>iterationCount</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements (one or more)

Example:

```html
<benchmarker iterationCount="1">
  <empiricalDistributionLikelihood fileName="foo" splineInterpolation="true" degree="1" inverse="true" readByColumn="true">
    <data from="1" to="1" offset="1.0" lower="1.0" upper="1.0">
      <partitionStatistic idref="partitionStatistic3">
      <treeMetricStatistic idref="treeMetricStatistic10">
      <statistic idref="statistic3">
      <argTotalLengthStatistic idref="argTotalLengthStatistic5">
    </data>
  </empiricalDistributionLikelihood>
  <modelSpecificPseudoPrior/>
</benchmarker>
```



### <code>&lt;betaDistributionModel&gt;</code> element

A model of a beta distribution.

The element has the following contents:

* One of:
    * Element named <code>&lt;alpha&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;alpha&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;beta&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;beta&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<betaDistributionModel>
  <alpha>
    <parameter idref="parameter6">
  </alpha>
  <beta>
    1.0
  </beta>
</betaDistributionModel>
```



### <code>&lt;betaPrior&gt;</code> element

Calculates the prior probability of some data under a given beta distribution.

The element takes following attributes:

* <code>shape</code>  is of type [Double](#double)
: 

* <code>shapeB</code>  is of type [Double](#double)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<betaPrior shape="1.0" shapeB="1.0" offset="1.0">
  <correlation dimension1="1" dimension2="1">
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
  </correlation>
</betaPrior>
```



### <code>&lt;betaSplittingModel&gt;</code> element

The beta-splitting family of tree branching models (Aldous, 1996;2001).

The element has the following contents:

* Element named <code>&lt;phi&gt;</code>
: A parameter that ranges from -infinity (comb-tree) to +infinity (balanced tree)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;branchingTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<betaSplittingModel>
  <phi>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
  </phi>
  <branchingTree>
    <newick idref="newick8">
  </branchingTree>
</betaSplittingModel>
```



### <code>&lt;biasedMultivariateDiffusionModel&gt;</code> element

Describes a multivariate normal diffusion process.

The element has the following contents:

* Element named <code>&lt;precisionMatrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;biasParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<biasedMultivariateDiffusionModel>
  <precisionMatrix>
    <diagonalMatrix idref="diagonalMatrix1">
  </precisionMatrix>
  <biasParameter>
    <complementParameter idref="complementParameter2">
  </biasParameter>
</biasedMultivariateDiffusionModel>
```



### <code>&lt;bifractionalDiffusionModel&gt;</code> element

Describes a bivariate diffusion process using a bifractional random walk

The element has the following contents:

* Element named <code>&lt;alpha&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;beta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<bifractionalDiffusionModel>
  <alpha>
    <maskedMatrixParameter idref="maskedMatrixParameter1">
  </alpha>
  <beta>
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter1">
  </beta>
</bifractionalDiffusionModel>
```



### <code>&lt;binaryCovarionModel&gt;</code> element

A covarion substitution model on binary data and a hidden rate state with two rates.

The element takes following attributes:

* <code>version</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;hiddenFrequencies&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;alpha&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;switchingRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

Example:

```html
<binaryCovarionModel version="foo">
  <frequencies>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
  </frequencies>
  <hiddenFrequencies>
    <diagonalMatrix idref="diagonalMatrix4">
  </hiddenFrequencies>
  <alpha/>
  <switchingRate/>
</binaryCovarionModel>
```



### <code>&lt;binarySubstitutionModel&gt;</code> element

A general reversible model of sequence substitution for binary data type.

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

Example:

```html
<binarySubstitutionModel>
  <frequencies>
    <frequencyModel idref="frequencyModel2">
  </frequencies>
</binarySubstitutionModel>
```



### <code>&lt;binomialLikelihood&gt;</code> element

Calculates the likelihood of some data given some parametric or empirical distribution.

The element takes following attributes:

* <code>onLogitScale</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;counts&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;proportion&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;trials&gt;</code>

        Containing:

        * <code>values</code>  is of type [Integer;](#integer;)
: 

    * Element named <code>&lt;trials&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<binomialLikelihood onLogitScale="true">
  <counts>
    <copyParameterValues idref="copyParameterValues9">
  </counts>
  <proportion>
    <complementParameter idref="complementParameter10">
  </proportion>
  <trials values="1 2 4 8"/>
</binomialLikelihood>
```



### <code>&lt;birthDeathCollapseModel&gt;</code> element

A speciation model aimed at species delimitation, mixing birth-death model with spike near zero for node heights.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>collapseHeight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;speciesTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

* Element named <code>&lt;birthMinusDeathRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;relativeDeathRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;originHeight&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;collapseWeight&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<birthDeathCollapseModel units="months" collapseHeight="1.0">
  <speciesTree>
    <argTreeModel idref="argTreeModel8">
  </speciesTree>
  <birthMinusDeathRate>
    <maskedParameter idref="maskedParameter8">
  </birthMinusDeathRate>
  <relativeDeathRate>
    <vectorSlice idref="vectorSlice6">
  </relativeDeathRate>
  <originHeight>
    <fastMatrixParameter idref="fastMatrixParameter6">
  </originHeight>
  <collapseWeight>
    <immutableParameter idref="immutableParameter5">
  </collapseWeight>
</birthDeathCollapseModel>
```



### <code>&lt;birthDeathEpidemiology&gt;</code> element

Stadler et al (2011) model of epidemiology.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;origin&gt;</code>
: The origin of the infection, x0 > tree.rootHeight

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;R0&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;recoveryRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;samplingProbability&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<birthDeathEpidemiology units="days">
  <R0>
    <immutableParameter idref="immutableParameter7">
  </R0>
  <recoveryRate>
    <mvPolyaLikelihood idref="mvPolyaLikelihood2">
  </recoveryRate>
  <samplingProbability>
    <dataFromTreeTips idref="dataFromTreeTips4">
  </samplingProbability>
</birthDeathEpidemiology>
```



### <code>&lt;birthDeathModel&gt;</code> element

Gernhard (2008) model of speciation (equation at bottom of page 19 of draft).

The element takes following attributes:

* <code>type</code> (optional) is of type [String](#string)
: 

* <code>conditionalOnRoot</code> (optional) is of type [Boolean](#boolean)
: 

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;birthMinusDeathRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;relativeDeathRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;sampleProbability&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<birthDeathModel type="foo" conditionalOnRoot="true" units="years">
  <birthMinusDeathRate>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView6">
  </birthMinusDeathRate>
  <relativeDeathRate>
    <differenceParameter idref="differenceParameter2">
  </relativeDeathRate>
</birthDeathModel>
```



### <code>&lt;birthDeathSerialSampling&gt;</code> element

Stadler et al (2010) model of speciation.

The element takes following attributes:

* <code>type</code> (optional) is of type [String](#string)
: 

* <code>hasFinalSample</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;origin&gt;</code>
: The origin of the infection, x0 > tree.rootHeight

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;birthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;deathRate&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;relativeDeathRate&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;psi&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;sampleBecomesNonInfectiousProb&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<birthDeathSerialSampling type="foo" hasFinalSample="true">
  <birthRate>
    <copyParameterValues idref="copyParameterValues1">
  </birthRate>
  <deathRate>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
  </deathRate>
  <psi>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView7">
  </psi>
</birthDeathSerialSampling>
```



### <code>&lt;bitFlipInSubstitutionModelOperator&gt;</code> element

This element returns a bit-flip operator on a given indicatorParameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (zero or one)

* [BayesianStochasticSearchVariableSelection](#bayesianstochasticsearchvariableselection) element (exactly one)

Example:

```html
<bitFlipInSubstitutionModelOperator weight="1.0" scaleFactor="1.0" autoOptimize="true">
  <complexSubstitutionModel randomizeIndicator="true" bssvsTolerance="1.0" bssvsScalar="1.0" checkConditioning="true" normalized="true">
    <microsatellite idref="microsatellite2">
    <frequencies>
      <frequencyModel idref="frequencyModel9">
    </frequencies>
    <rates/>
  </complexSubstitutionModel>
</bitFlipInSubstitutionModelOperator>
```



### <code>&lt;bitFlipOperator&gt;</code> element

This element returns a bit-flip operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>usesPriorOnSum</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (zero or one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<bitFlipOperator weight="1.0" usesPriorOnSum="true">
  <maskedParameter complement="true" build="true" from="1" to="1" every="1">
    <compoundParameter idref="compoundParameter4">
  </maskedParameter>
</bitFlipOperator>
```



### <code>&lt;bitMoveOperator&gt;</code> element

This element returns a bit-move operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>numBitsToMove</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;bits&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;values&gt;</code>
: values parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<bitMoveOperator weight="1.0" numBitsToMove="1">
  <bits>
    <leafTraitParameter idref="leafTraitParameter3">
  </bits>
</bitMoveOperator>
```



### <code>&lt;bitSwapOperator&gt;</code> element

This element returns a bit-swap operator on a given parameter and data.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>radius</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

Example:

```html
<bitSwapOperator weight="1.0" radius="1.0">
  <data>
    <continuousDiffusionStatistic idref="continuousDiffusionStatistic8">
  </data>
  <indicators>
    <driftedLocationsStatistic idref="driftedLocationsStatistic1">
  </indicators>
</bitSwapOperator>
```



### <code>&lt;blockUpperTriangularMatrixParameter&gt;</code> element

Returns a blockUpperTriangularMatrixParameter which is a compoundParameter which forces the last element to be of full length, the second to last element to be of full length-1, etc.

The element takes following attributes:

* <code>transpose</code> (optional) is of type [Boolean](#boolean)
: 

* <code>columnDimension</code> (optional) is of type [Integer](#integer)
: 

* <code>diagonalRestriction</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) elements (zero or more)

Example:

```html
<blockUpperTriangularMatrixParameter transpose="true" columnDimension="1" diagonalRestriction="true">
  <diagonalMatrix>
    <copyParameterValues idref="copyParameterValues10">
  </diagonalMatrix>
  <markovRandomFieldMatrix asCorrelation="true" dim="1">
    <diagonal>
      <differenceParameter idref="differenceParameter6">
    </diagonal>
    <offDiagonal>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix1">
    </offDiagonal>
    <nugget>
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </nugget>
  </markovRandomFieldMatrix>
  <mvPolyaLikelihood>
    <data>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </data>
    <frequencies>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
    </frequencies>
  </mvPolyaLikelihood>
  <duplicatedParameter>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    <copies>
      <designMatrix idref="designMatrix3">
    </copies>
  </duplicatedParameter>
</blockUpperTriangularMatrixParameter>
```



### <code>&lt;booleanLikelihood&gt;</code> element

A function that log likelihood of a set of boolean statistics. If all the statistics are true then it returns 0.0 otherwise -infinity.

The element has the following contents:

* [BooleanStatistic](#booleanstatistic) elements (one or more)

Example:

```html
<booleanLikelihood>
  <monophylyStatistic name="foo" inverse="true">
    <upgmaTree idref="upgmaTree3">
    <mrca>
      <taxa idref="taxa3">
    </mrca>
  </monophylyStatistic>
  <notBooleanStatistic>
    <monophylyStatistic idref="monophylyStatistic3">
  </notBooleanStatistic>
  <compatibilityStatistic name="foo">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork8">
    <compatibleWith>
      <transformedTreeModel idref="transformedTreeModel10">
    </compatibleWith>
    <neighborJoiningTree idref="neighborJoiningTree9">
  </compatibilityStatistic>
</booleanLikelihood>
```



### <code>&lt;branchAssignmentModel&gt;</code> element

This element provides a branch model which assigns substitution models to branches on the tree 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;assignment&gt;</code>

    Containing:

    * <code>annotationValue</code>  is of type [Integer](#integer)
: 

    * [SubstitutionModel](#substitutionmodel) element (exactly one)

* Element named <code>&lt;baseModel&gt;</code>

    Containing:

    * [SubstitutionModel](#substitutionmodel) element (exactly one)

Example:

```html
<branchAssignmentModel>
  <treeModel fixHeights="true" fixTree="true">
    <upgmaTree idref="upgmaTree1">
    <rootHeight>
      <matrixMatrixProduct idref="matrixMatrixProduct7">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <dataFromTreeTips idref="dataFromTreeTips8">
    </leafHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix10">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <mvPolyaLikelihood idref="mvPolyaLikelihood10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <complementParameter idref="complementParameter3">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix8">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <duplicatedParameter idref="duplicatedParameter3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix1">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </leafTrait>
  </treeModel>
  <assignment annotationValue="1">
    <hkyModel idref="hkyModel9">
  </assignment>
  <assignment annotationValue="1">
    <markovModulatedSubstitutionModel idref="markovModulatedSubstitutionModel9">
  </assignment>
  <assignment annotationValue="1">
    <markovModulatedYangCodonModel idref="markovModulatedYangCodonModel10">
  </assignment>
  <assignment annotationValue="1">
    <glmSubstitutionModelNew idref="glmSubstitutionModelNew3">
  </assignment>
  <baseModel>
    <TN93Model idref="TN93Model4">
  </baseModel>
</branchAssignmentModel>
```



### <code>&lt;branchCategories&gt;</code> element

This element provides a set of branch categories.

The element takes following attributes:

* <code>randomize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;rateCategories&gt;</code>
: Allocation parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;clade&gt;</code>

    Containing:

    * <code>category</code>  is of type [Integer](#integer)
: 

    * <code>includeStem</code> (optional) is of type [Boolean](#boolean)
: "determines whether or not the stem branch above this clade is included in the siteModel (default false)."

    * <code>excludeClade</code> (optional) is of type [Boolean](#boolean)
: "determines whether to exclude actual branches of the clade from the siteModel (default false)."

    * [Taxa](#taxa) element (exactly one)
: A set of taxa which defines a clade to apply a different site model to

* Element named <code>&lt;trunk&gt;</code>

    Containing:

    * <code>category</code>  is of type [Integer](#integer)
: 

    * <code>includeStem</code> (optional) is of type [Boolean](#boolean)
: "determines whether or not the stem branch above this clade is included in the siteModel (default false)."

    * <code>excludeClade</code> (optional) is of type [Boolean](#boolean)
: "determines whether to exclude actual branches of the clade from the siteModel (default false)."

    * [Taxa](#taxa) element (exactly one)
: A set of taxa which defines a clade to apply a different site model to

Example:

```html
<branchCategories randomize="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <ascertainedPatterns idref="ascertainedPatterns1">
  </empiricalTreeDistributionModel>
  <rateCategories>
    <vectorSlice idref="vectorSlice8">
  </rateCategories>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa3">
  </clade>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa2">
  </clade>
  <trunk category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa9">
  </trunk>
</branchCategories>
```



### <code>&lt;branchDirections&gt;</code> element

null

The element has the following contents:

* [SampledMultivariateTraitLikelihood](#sampledmultivariatetraitlikelihood) element (exactly one)

Example:

```html
<branchDirections>
  ERROR!
</branchDirections>
```



### <code>&lt;branchingLikelihood&gt;</code> element

This element represents the likelihood of the tree given the demographic function.

The element has the following contents:

* Element named <code>&lt;model&gt;</code>

    Containing:

    * [BranchingModel](#branchingmodel) element (exactly one)

* Element named <code>&lt;branchingTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<branchingLikelihood>
  <model>
    <betaSplittingModel idref="betaSplittingModel4">
  </model>
  <branchingTree>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
  </branchingTree>
</branchingLikelihood>
```



### <code>&lt;branchMagnitudes&gt;</code> element

null

The element takes following attributes:

* <code>scaleByLength</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)

Example:

```html
<branchMagnitudes scaleByLength="true">
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <immutableParameter idref="immutableParameter5">
    </traitParameter>
    <bifractionalDiffusionModel idref="bifractionalDiffusionModel9">
    <starTreeModel idref="starTreeModel1">
    ERROR!
    ERROR!
  </multivariateTraitLikelihood>
</branchMagnitudes>
```



### <code>&lt;branchSpecificSubstitutionModel&gt;</code> element

This element provides a branch model which allows different substitution modelson different parts of the tree.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)
: The tree

* [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model for branches not explicitly included

* Element named <code>&lt;externalBranches&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)
: A substitution model will be applied to the external branches for these taxa

    * [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model

* Element named <code>&lt;clade&gt;</code>

    Containing:

    * <code>stemWeight</code> (optional) is of type [Double](#double)
: "What proportion of the stem branch to include [0 <= w <= 1] (default 0)."

    * [Taxa](#taxa) element (exactly one)
: A set of taxa which defines a clade to apply a different site model to

    * [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model

* Element named <code>&lt;backbone&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)
: A substitution model will be applied only to the 'backbone' branches defined by these taxa.

    * [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model

Example:

```html
<branchSpecificSubstitutionModel>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <mergePatterns idref="mergePatterns9">
  </empiricalTreeDistributionModel>
  <lewisMk totalOrder="true">
    <frequencies>
      <frequencyModel idref="frequencyModel2">
    </frequencies>
  </lewisMk>
  <backbone>
    <taxa idref="taxa6">
    <markovModulatedYangCodonModel idref="markovModulatedYangCodonModel7">
  </backbone>
  <backbone>
    <taxa idref="taxa6">
    <complexSubstitutionModel idref="complexSubstitutionModel5">
  </backbone>
  <backbone>
    <taxa idref="taxa9">
    <aminoAcidModel idref="aminoAcidModel1">
  </backbone>
</branchSpecificSubstitutionModel>
```



### <code>&lt;branchSpecificTrait&gt;</code> element

branchSpecificTrait

The element has the following contents:

* [BranchModel](#branchmodel) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<branchSpecificTrait>
  <randomBranchModel rate="1.0">
    <starTreeModel idref="starTreeModel7">
    <baseSubstitutionModel>
      <gtrModel idref="gtrModel6">
    </baseSubstitutionModel>
  </randomBranchModel>
  <starTreeModel>
    <argTreeModel idref="argTreeModel7">
    <sharedRootHeight>
      <treeModel idref="treeModel8">
    </sharedRootHeight>
    <leafHeight taxon="foo">
      <matrixParameter idref="matrixParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
    </leafHeight>
    <leafHeight taxon="foo">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </leafHeight>
  </starTreeModel>
</branchSpecificTrait>
```



### <code>&lt;BrownianMotion&gt;</code> element



The element takes following attributes:

* <code>logUnits</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;sigma&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;sigma&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* [VariableDemographicModel](#variabledemographicmodel) element (exactly one)

Example:

```html
<BrownianMotion logUnits="true">
  <sigma>
    1.0
  </sigma>
  <variableDemographic type="foo" logUnits="true" useMidpoints="true">
    <populationSizes>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix1">
    </populationSizes>
    <indicators>
      <leafTraitParameter idref="leafTraitParameter4">
    </indicators>
    <trees>
      <ptree ploidy="1.0">
        <partitionedTreeModel idref="partitionedTreeModel6">
      </ptree>
    </trees>
  </variableDemographic>
</BrownianMotion>
```



### <code>&lt;buildCompoundSymmetricMatrix&gt;</code> element

Returns a compound symmetric Matrix Parameter that is flexible, i.e. when exposed to a transition kernel can yield a result that is not compound symmetric

Example:

```html
<buildCompoundSymmetricMatrix/>
```



### <code>&lt;cachedPrior&gt;</code> element

Calculates a cached likelihood of some data given some parametric or empirical distribution.

The element has the following contents:

* [AbstractDistributionLikelihood](#abstractdistributionlikelihood) element (exactly one)

* [Variable](#variable) element (exactly one)

Example:

```html
<cachedPrior>
  <flatGeoSpatialPrior taxon="foo" inside="true" union="true" cache="true">
    <circle idref="circle10">
    <polygon idref="polygon3">
    <data>
      <duplicatedParameter idref="duplicatedParameter2">
      <differenceParameter idref="differenceParameter6">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter7">
      <complementParameter idref="complementParameter8">
    </data>
  </flatGeoSpatialPrior>
  <markovRandomFieldMatrix asCorrelation="true" dim="1">
    <diagonal>
      <designMatrix idref="designMatrix2">
    </diagonal>
    <offDiagonal>
      <differenceParameter idref="differenceParameter1">
    </offDiagonal>
    <nugget>
      <differenceParameter idref="differenceParameter4">
    </nugget>
  </markovRandomFieldMatrix>
</cachedPrior>
```



### <code>&lt;cartogramDiffusionModel&gt;</code> element

Describes a bivariate diffusion process using cartogram distances.

The element takes following attributes:

* <code>cartogramFileName</code> (optional) is of type [String](#string)
: 

* <code>xGridSize</code>  is of type [Integer](#integer)
: 

* <code>yGridSize</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;boundingBox&gt;</code>

    Containing:

    * <code>minX</code>  is of type [Double](#double)
: 

    * <code>maxX</code>  is of type [Double](#double)
: 

    * <code>minY</code>  is of type [Double](#double)
: 

    * <code>maxY</code>  is of type [Double](#double)
: 

Example:

```html
<cartogramDiffusionModel cartogramFileName="foo" xGridSize="1" yGridSize="1">
  <designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true">
    <differenceParameter idref="differenceParameter3">
    <matrixParameter idref="matrixParameter4">
    <parameter idref="parameter10">
  </designMatrix>
  <boundingBox minX="1.0" maxX="1.0" minY="1.0" maxY="1.0"/>
</cartogramDiffusionModel>
```



### <code>&lt;caseToCaseTransmissionLikelihood&gt;</code> element

This element represents a probability distribution for epidemiological parameters of an outbreakgiven a phylogenetic tree

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)
: The tree likelihood

* [SpatialKernel](#spatialkernel) element (zero or one)
: The spatial kernel

* Element named <code>&lt;transmissionRate&gt;</code>
: The transmission rate

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;initialInfectionTimePrior&gt;</code>
: The prior probability distibution of the first infection

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

Example:

```html
<caseToCaseTransmissionLikelihood>
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel5">
    <maxFirstInfToRoot>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix7">
    </maxFirstInfToRoot>
    <demographicModel>
      <emergingEpidemic idref="emergingEpidemic10">
    </demographicModel>
  </withinCaseCoalescent>
  <transmissionRate>
    <diagonalMatrix idref="diagonalMatrix3">
  </transmissionRate>
</caseToCaseTransmissionLikelihood>
```



### <code>&lt;cataclysm&gt;</code> element

A demographic model of exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthRate&gt;</code>
: The rate of exponential growth before the cataclysmic event.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;spikeFactor&gt;</code>
: The factor larger the population size was at its height.

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;declineRate&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;timeOfCataclysm&gt;</code>
: The time of the cataclysmic event that lead to exponential decline.

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<cataclysm units="generations">
  <populationSize>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
  </populationSize>
  <growthRate>
    <matrixParameter idref="matrixParameter6">
  </growthRate>
  <declineRate>
    <differenceParameter idref="differenceParameter4">
  </declineRate>
  <timeOfCataclysm>
    <vectorSlice idref="vectorSlice7">
  </timeOfCataclysm>
</cataclysm>
```



### <code>&lt;categoryOutbreak&gt;</code> element

Parses a set of 'category' farm outbreak and the information that they all share

The element takes following attributes:

* <code>hasLatentPeriods</code>  is of type [String](#string)
: "Whether to include a latent period in the model"

* <code>hasGeography</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ProductStatistic](#productstatistic) elements (zero to 2)

* Element named <code>&lt;categoryCase&gt;</code>

    Containing:

    * <code>wasEverInfected</code>  is of type [Boolean](#boolean)
: 

    * <code>hostID</code>  is of type [String](#string)
: "The unique identifier for this host"

    * <code>endTime</code> (optional) is of type [String](#string)
: "The time of noninfectiousness of this host"

    * [Taxon](#taxon) elements (zero or more)

    * Element named <code>&lt;infectionTimeBranchPosition&gt;</code>
: The exact position on the branch along which the infection of this case occurs that it actually does occur

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;spatialCoordinates&gt;</code>
: The spatial coordinates of this case

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * <code>latentCategory</code> (optional) is of type [String](#string)
: "The category of latent period"

    * <code>infectiousCategory</code> (optional) is of type [String](#string)
: "The category of infectious period"

    * <code>indexPriorWeight</code> (optional) is of type [String](#string)
: "The weight of this case in the prior probabilty for theindex case"

* [Taxa](#taxa) element (exactly one)

* Element named <code>&lt;infectiousPeriodPrior&gt;</code>
: A prior distribution for the length of infectious periods

    Containing:

    * [AbstractPeriodPriorDistribution](#abstractperiodpriordistribution) element (exactly one)

* Element named <code>&lt;latentPeriods&gt;</code>
: A prior distribution for the length of latent periods

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;distanceMatrix&gt;</code>
: A matrix of distances between the cases in this outbreak

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<categoryOutbreak hasLatentPeriods="foo" hasGeography="true">
  <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo">
    <apsp idref="apsp10">
    <individual idref="individual5">
    <individual idref="individual7">
  </categoryCase>
  <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo"/>
  <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo">
    <apsp idref="apsp9">
    <taxon idref="taxon6">
    <sp idref="sp8">
    <taxon idref="taxon5">
  </categoryCase>
  <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo">
    <taxon idref="taxon3">
    <taxon idref="taxon10">
  </categoryCase>
  <taxa>
    <taxa idref="taxa3">
    <taxa idref="taxa8">
  </taxa>
  <infectiousPeriodPrior>
    <oneOverStDevPeriodPriorDistribution idref="oneOverStDevPeriodPriorDistribution4">
  </infectiousPeriodPrior>
  <infectiousPeriodPrior>
    <normalPeriodPriorDistribution idref="normalPeriodPriorDistribution1">
  </infectiousPeriodPrior>
  <infectiousPeriodPrior>
    <knownVarianceNormalPeriodPriorDistribution idref="knownVarianceNormalPeriodPriorDistribution3">
  </infectiousPeriodPrior>
  <infectiousPeriodPrior>
    <individualPrior idref="individualPrior3">
  </infectiousPeriodPrior>
  <latentPeriods>
    <leafTraitParameter idref="leafTraitParameter8">
  </latentPeriods>
  <latentPeriods>
    <copyParameterValues idref="copyParameterValues6">
  </latentPeriods>
</categoryOutbreak>
```



### <code>&lt;centeredScale&gt;</code> element

A centered-scale operator. This operator scales the the values of a multi-dimensional parameter so as to perserve the mean. It does this by expanding or conrtacting the parameter values around the mean.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<centeredScale weight="1.0" scaleFactor="1.0" autoOptimize="true">
  <differenceMatrixParameter/>
</centeredScale>
```



### <code>&lt;changeNumHybridizations&gt;</code> element

Operator which changes the number of tetraploid subtrees (hybridizations) by merging and splitting them.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<changeNumHybridizations weight="1.0">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp1">
    <apsp idref="apsp2">
    <apsp idref="apsp7">
    <apsp idref="apsp10">
    <geneTrees>
      <starTreeModel idref="starTreeModel4">
      <starTreeModel idref="starTreeModel5">
      <gtree popfactor="1.0">
        <partitionedTreeModel idref="partitionedTreeModel8">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies4">
    <tipPopulations value="1.0">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
    </tipPopulations>
    <rootPopulations value="1.0">
      <diagonalMatrix idref="diagonalMatrix7">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</changeNumHybridizations>
```



### <code>&lt;circle&gt;</code> element

This element represents a regular circle polygon.

The element takes following attributes:

* <code>latitude</code>  is of type [Double](#double)
: 

* <code>longitude</code>  is of type [Double](#double)
: 

* <code>radius</code>  is of type [Double](#double)
: 

* <code>numberOfPoints</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<circle latitude="1.0" longitude="1.0" radius="1.0" numberOfPoints="1"/>
```



### <code>&lt;clusterSingleMoveOperator&gt;</code> element

An operator that moves single elements between clusters.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<clusterSingleMoveOperator weight="1.0">
  <productParameter>
    <maskedParameter idref="maskedParameter6">
    <matrixMatrixProduct idref="matrixMatrixProduct8">
  </productParameter>
</clusterSingleMoveOperator>
```



### <code>&lt;clusterSplitMergeOperator&gt;</code> element

An operator that splits and merges clusters.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;locations&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<clusterSplitMergeOperator weight="1.0">
  <leafTraitParameter taxon="foo" setBounds="true">
    <treeModel idref="treeModel8">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
  </leafTraitParameter>
  <locations>
    <dataFromTreeTips idref="dataFromTreeTips1">
  </locations>
</clusterSplitMergeOperator>
```



### <code>&lt;cNcSPerSiteAnalysis&gt;</code> element

Performs a trace analysis of N and S counts.

The element takes following attributes:

* <code>cutoff</code> (optional) is of type [Double](#double)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>includePValues</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeSymbol</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeClassification</code> (optional) is of type [Boolean](#boolean)
: 

* <code>simulationOutcome</code> (optional) is of type [Boolean](#boolean)
: 

* <code>siteSimulation</code> (optional) is of type [String](#string)
: 

* <code>separator</code> (optional) is of type [String](#string)
: 

Example:

```html
<cNcSPerSiteAnalysis cutoff="1.0" burnin="1" includePValues="true" includeSymbol="true" includeClassification="true" simulationOutcome="true" siteSimulation="foo" separator="foo"/>
```



### <code>&lt;cNcSTodNdSPerSiteAnalysis&gt;</code> element

Performs a trace analysis of N and S counts.

The element takes following attributes:

* <code>fileNameCN</code> (optional) is of type [String](#string)
: 

* <code>fileNameCS</code> (optional) is of type [String](#string)
: 

* <code>cutoff</code> (optional) is of type [Double](#double)
: 

* <code>proportion</code> (optional) is of type [Double](#double)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>sample</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeHPD</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeSymbol</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeLevel</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeClassification</code> (optional) is of type [Boolean](#boolean)
: 

* <code>simulationOutcome</code> (optional) is of type [Boolean](#boolean)
: 

* <code>siteSimulation</code> (optional) is of type [String](#string)
: 

* <code>test</code> (optional) is of type [String](#string)
: 

* <code>separator</code> (optional) is of type [String](#string)
: 

Example:

```html
<cNcSTodNdSPerSiteAnalysis fileNameCN="foo" fileNameCS="foo" cutoff="1.0" proportion="1.0" burnin="1" sample="true" includeHPD="true" includeSymbol="true" includeLevel="true" includeClassification="true" simulationOutcome="true" siteSimulation="foo" test="foo" separator="foo"/>
```



### <code>&lt;coalescentConstantLikelihood&gt;</code> element

Calculates the number of possible combinations of coalescent events.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<coalescentConstantLikelihood>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <starTreeModel idref="starTreeModel2">
    <rootHeight>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix7">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <immutableParameter idref="immutableParameter1">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <maskedParameter idref="maskedParameter6">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <differenceMatrixParameter idref="differenceMatrixParameter2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <fastMatrixParameter idref="fastMatrixParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundParameter idref="compoundParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips10">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak10">
    </outbreak>
  </partitionedTreeModel>
</coalescentConstantLikelihood>
```



### <code>&lt;coalescentEventsStatistic&gt;</code> element



The element has the following contents:

* [CoalescentIntervalProvider](#coalescentintervalprovider) element (exactly one)

Example:

```html
<coalescentEventsStatistic>
  <gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
    <populationSizes>
      <differenceParameter idref="differenceParameter9">
    </populationSizes>
    <precisionParameter>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
    </precisionParameter>
    <populationTree>
      <partitionedTreeModel idref="partitionedTreeModel2">
      <partitionedTreeModel idref="partitionedTreeModel2">
    </populationTree>
  </gmrfSkyrideLikelihood>
</coalescentEventsStatistic>
```



### <code>&lt;coalescentHeightsReferencePrior&gt;</code> element

Calculates the coalescent height probabilities based on a sample of coalescent heights.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<coalescentHeightsReferencePrior fileName="foo" parameterColumn="foo" dimension="1">
  <externalLengthStatistic name="foo">
    <treeModel idref="treeModel2">
    <taxa idref="taxa3">
  </externalLengthStatistic>
</coalescentHeightsReferencePrior>
```



### <code>&lt;coalescentIntervalStatistic&gt;</code> element



The element has the following contents:

* [CoalescentIntervalProvider](#coalescentintervalprovider) element (exactly one)

Example:

```html
<coalescentIntervalStatistic>
  <gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
    <populationSizes>
      <compoundParameter idref="compoundParameter3">
    </populationSizes>
    <precisionParameter>
      <matrixMatrixProduct idref="matrixMatrixProduct7">
    </precisionParameter>
    <populationTree>
      <starTreeModel idref="starTreeModel3">
      <treeModel idref="treeModel8">
    </populationTree>
  </gmrfSkyrideLikelihood>
</coalescentIntervalStatistic>
```



### <code>&lt;coalescentLikelihood&gt;</code> element

This element represents the likelihood of the tree given the demographic function.

The element has the following contents:

* Element named <code>&lt;model&gt;</code>
: The demographic model which describes the effective population size over time

    Containing:

    * [DemographicModel](#demographicmodel) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>
: Tree(s) to compute likelihood for

    Containing:

    * <code>factor</code> (optional) is of type [Double](#double)
: 

    * [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;include&gt;</code>
: An optional subset of taxa on which to calculate the likelihood (should be monophyletic)

    Containing:

    * [Taxa](#taxa) element (exactly one)

* Element named <code>&lt;exclude&gt;</code>
: One or more subsets of taxa which should be excluded from calculate the likelihood (should be monophyletic)

    Containing:

    * [Taxa](#taxa) elements (one or more)

Example:

```html
<coalescentLikelihood>
  <model>
    <logisticGrowth idref="logisticGrowth3">
  </model>
  <populationTree factor="1.0">
    <starTreeModel idref="starTreeModel10">
  </populationTree>
</coalescentLikelihood>
```



### <code>&lt;coalescentSimulator&gt;</code> element

This element returns a simulated tree under the given demographic model. The element can be nested to simulate with monophyletic clades. The tree will be rescaled to the given height.

The element takes following attributes:

* <code>height</code> (optional) is of type [Double](#double)
: ""

The element has the following contents:

* [Tree](#tree) elements (zero or more)

* [TaxonList](#taxonlist) elements (zero or more)

* [DemographicModel](#demographicmodel) elements (zero or more)

Example:

```html
<coalescentSimulator height="1.0">
  <tree units="years">
    <node idref="node10">
  </tree>
  <mulSpeciesTree constantRoot="true" constantPopulation="true">
    <mulSpecies idref="mulSpecies5">
    <sppSplitPopulations value="1.0">
      <dataFromTreeTips idref="dataFromTreeTips5">
    </sppSplitPopulations>
  </mulSpeciesTree>
  <upgmaTree usingDates="true" rootHeight="1.0" nonzeroBranchLengths="true">
    <distanceMatrix idref="distanceMatrix3">
  </upgmaTree>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <treeModel idref="treeModel5">
    <rootHeight>
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastMatrixParameter idref="fastMatrixParameter10">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <fastMatrixParameter idref="fastMatrixParameter10">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <leafTraitParameter idref="leafTraitParameter6">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter6">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <duplicatedParameter idref="duplicatedParameter6">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak5">
    </outbreak>
  </partitionedTreeModel>
  <categoryOutbreak hasLatentPeriods="foo" hasGeography="true">
    <productStatistic idref="productStatistic8">
    <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo"/>
    <categoryCase wasEverInfected="true" hostID="foo" endTime="foo" latentCategory="foo" infectiousCategory="foo" indexPriorWeight="foo">
      <sp idref="sp6">
      <taxon idref="taxon1">
      <individual idref="individual8">
    </categoryCase>
    <taxa idref="taxa1">
    <infectiousPeriodPrior>
      <normalPeriodPriorDistribution idref="normalPeriodPriorDistribution7">
    </infectiousPeriodPrior>
    <infectiousPeriodPrior>
      <individualPrior idref="individualPrior6">
    </infectiousPeriodPrior>
    <infectiousPeriodPrior>
      <oneOverStDevPeriodPriorDistribution idref="oneOverStDevPeriodPriorDistribution3">
    </infectiousPeriodPrior>
    <latentPeriods>
      <dataFromTreeTips idref="dataFromTreeTips9">
    </latentPeriods>
    <latentPeriods>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    </latentPeriods>
    <latentPeriods>
      <parameter idref="parameter7">
    </latentPeriods>
    <latentPeriods>
      <productParameter idref="productParameter10">
    </latentPeriods>
  </categoryOutbreak>
  <attributePatterns attribute="foo" secondary="foo">
    <hiddenNucleotides idref="hiddenNucleotides9">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork2">
  </attributePatterns>
  <exponentialExponential units="substitutions">
    <populationSize>
      <productParameter idref="productParameter3">
    </populationSize>
    <growthRate>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </growthRate>
    <ancestralGrowthRate>
      <differenceParameter idref="differenceParameter1">
    </ancestralGrowthRate>
    <transitionTime>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix6">
    </transitionTime>
  </exponentialExponential>
</coalescentSimulator>
```



### <code>&lt;coalescentTree&gt;</code> element

This element returns a simulated tree under the given demographic model.

The element takes following attributes:

* <code>rescaleHeight</code> (optional) is of type [Double](#double)
: "Attempt to rescale the tree to the given root height"

* <code>rootHeight</code> (optional) is of type [Double](#double)
: ""

The element has the following contents:

* [Tree](#tree) elements (zero or more)

* [TaxonList](#taxonlist) elements (zero or more)

* Element named <code>&lt;constrainedTaxa&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) elements (zero or more)

    * Element named <code>&lt;tmrca&gt;</code>

        Containing:

        * [TaxonList](#taxonlist) elements (zero or more)

* [DemographicModel](#demographicmodel) element (exactly one)

Example:

```html
<coalescentTree rescaleHeight="1.0" rootHeight="1.0">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <argTreeModel idref="argTreeModel10">
    <rootHeight>
      <sumParameter idref="sumParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <jointParameter idref="jointParameter10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter3">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <productParameter idref="productParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <jointParameter idref="jointParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter6">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <parameter idref="parameter10">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedMatrixParameter idref="maskedMatrixParameter6">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <diagonalMatrix idref="diagonalMatrix1">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundParameter idref="compoundParameter2">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak9">
    </outbreak>
  </partitionedTreeModel>
  <neighborJoiningTree>
    <distanceMatrix idref="distanceMatrix4">
  </neighborJoiningTree>
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species10">
    <sppSplitPopulations value="1.0">
      <maskedMatrixParameter idref="maskedMatrixParameter3">
    </sppSplitPopulations>
  </speciesTree>
  <upgmaTree usingDates="true" rootHeight="1.0" nonzeroBranchLengths="true">
    <distanceMatrix idref="distanceMatrix3">
  </upgmaTree>
  <taxa>
    <apsp idref="apsp6">
    <individual idref="individual3">
    <individual idref="individual9">
    <taxon idref="taxon10">
  </taxa>
  <tree units="generations">
    <node idref="node5">
  </tree>
  <cataclysm units="months">
    <populationSize>
      <parameter idref="parameter8">
    </populationSize>
    <growthRate>
      <jointParameter idref="jointParameter2">
    </growthRate>
    <declineRate>
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </declineRate>
    <timeOfCataclysm>
      <leafTraitParameter idref="leafTraitParameter5">
    </timeOfCataclysm>
  </cataclysm>
</coalescentTree>
```



### <code>&lt;codonPartitionedRobustCounting&gt;</code> element

A parser to specify robust counting procedures on codon partitioned models

The element takes following attributes:

* <code>geneticCode</code> (optional) is of type [String](#string)
: "The genetic code to use"

* <code>useUniformization</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeExternalBranches</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeInternalBranches</code> (optional) is of type [Boolean](#boolean)
: 

* <code>unconditionedPerBranch</code> (optional) is of type [Boolean](#boolean)
: 

* <code>averageRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>labeling</code>  is of type [String](#string)
: 

* <code>saveCompleteHistory</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useNewNeutralModel</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;firstPosition&gt;</code>

    Containing:

    * [AncestralStateBeagleTreeLikelihood](#ancestralstatebeagletreelikelihood) element (exactly one)

* Element named <code>&lt;secondPosition&gt;</code>

    Containing:

    * [AncestralStateBeagleTreeLikelihood](#ancestralstatebeagletreelikelihood) element (exactly one)

* Element named <code>&lt;thirdPosition&gt;</code>

    Containing:

    * [AncestralStateBeagleTreeLikelihood](#ancestralstatebeagletreelikelihood) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<codonPartitionedRobustCounting geneticCode="echinodermMitochondrial" useUniformization="true" includeExternalBranches="true" includeInternalBranches="true" unconditionedPerBranch="true" averageRates="true" labeling="foo" saveCompleteHistory="true" useNewNeutralModel="true">
  <firstPosition>
    ERROR!
  </firstPosition>
  <secondPosition>
    ERROR!
  </secondPosition>
  <thirdPosition>
    ERROR!
  </thirdPosition>
  <starTreeModel>
    <argTreeModel idref="argTreeModel7">
    <rootHeight>
      <compoundParameter idref="compoundParameter8">
    </rootHeight>
    <leafHeight taxon="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <vectorSlice idref="vectorSlice10">
    </leafHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix1">
    </leafHeight>
  </starTreeModel>
</codonPartitionedRobustCounting>
```



### <code>&lt;column&gt;</code> element

Specifies formating options for one or more columns in a log file.

The element takes following attributes:

* <code>label</code> (optional) is of type [String](#string)
: "The label of the column. If this is specified and more than one statistic is in this column, then the label will be appended by the index of the statistic to create individual column names"

* <code>sf</code> (optional) is of type [Integer](#integer)
: 

* <code>dp</code> (optional) is of type [Integer](#integer)
: 

* <code>width</code> (optional) is of type [Integer](#integer)
: 

* <code>format</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Object](#object) elements (one or more)

Example:

```html
<column label="foo" sf="1" dp="1" width="1" format="foo">
  <continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
    <inhibitionLikelihood idref="inhibitionLikelihood7">
  </continuousDiffusionStatistic>
  <continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood7">
    <inhibitionLikelihood idref="inhibitionLikelihood9">
    <inhibitionLikelihood idref="inhibitionLikelihood4">
  </continuousDiffusionStatistic>
</column>
```



### <code>&lt;compatibilityStatistic&gt;</code> element

A statistic that returns true if a pair of trees are compatible

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic for the purpose of logging"

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;compatibleWith&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

* [Tree](#tree) element (exactly one)

Example:

```html
<compatibilityStatistic name="foo">
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species3">
    <sppSplitPopulations value="1.0">
      <parameter idref="parameter6">
    </sppSplitPopulations>
  </speciesTree>
  <compatibleWith>
    <rescaledTree idref="rescaledTree4">
  </compatibleWith>
  <newick usingDates="true" usingHeights="true" rescaleHeight="1.0" rescaleLength="1.0" units="mutations">
    foo
  </newick>
</compatibilityStatistic>
```



### <code>&lt;complementParameter&gt;</code> element

A element-wise complement of parameters.

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<complementParameter>
  <compoundMatrixParameter>
    <designMatrix idref="designMatrix3">
    <matrixParameter idref="matrixParameter4">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
  </compoundMatrixParameter>
</complementParameter>
```



### <code>&lt;completeHistoryLogger&gt;</code> element

A logger to record all transitions in the complete history.

The element has the following contents:

* [MarkovJumpsTraitProvider](#markovjumpstraitprovider) element (exactly one)

* [HistoryFilter](#historyfilter) element (zero or one)

Example:

```html
<completeHistoryLogger>
  ERROR!
</completeHistoryLogger>
```



### <code>&lt;complexSubstitutionModel&gt;</code> element

A general irreversible model of sequence substitution for any data type.

The element takes following attributes:

* <code>randomizeIndicator</code> (optional) is of type [Boolean](#boolean)
: 

* <code>bssvsTolerance</code> (optional) is of type [Double](#double)
: 

* <code>bssvsScalar</code> (optional) is of type [Double](#double)
: 

* <code>checkConditioning</code> (optional) is of type [Boolean](#boolean)
: 

* <code>normalized</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* One of:
    * Element named <code>&lt;frequencies&gt;</code>

        Containing:

        * [FrequencyModel](#frequencymodel) element (exactly one)

    * Element named <code>&lt;rootFrequencies&gt;</code>

        Containing:

        * [FrequencyModel](#frequencymodel) element (exactly one)


* Element named <code>&lt;rates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;rateIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<complexSubstitutionModel dataType="generalDataType" randomizeIndicator="true" bssvsTolerance="1.0" bssvsScalar="1.0" checkConditioning="true" normalized="true">
  <rootFrequencies>
    <frequencyModel idref="frequencyModel6">
  </rootFrequencies>
  <rates/>
</complexSubstitutionModel>
```



### <code>&lt;composedTransform&gt;</code> element

null

The element has the following contents:

* Element named <code>&lt;outer&gt;</code>

    Containing:

    * [Transform$ParsedTransform](#transform$parsedtransform) element (exactly one)

* Element named <code>&lt;inner&gt;</code>

    Containing:

    * [Transform$ParsedTransform](#transform$parsedtransform) element (exactly one)

Example:

```html
<composedTransform>
  <outer>
    <inverseTransform idref="inverseTransform3">
  </outer>
  <inner>
    <inverseTransform idref="inverseTransform7">
  </inner>
</composedTransform>
```



### <code>&lt;compositeDataType&gt;</code> element

Defines a composite DataType consisting of multiple data types

The element has the following contents:

* [DataType](#datatype) elements (exactly 2)

Example:

```html
<compositeDataType>
  <generalDataType>
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood9">
    <argCoalescentLikelihood idref="argCoalescentLikelihood5">
    <duplicatedParameter idref="duplicatedParameter7">
  </generalDataType>
  <microsatellite/>
</compositeDataType>
```



### <code>&lt;compoundBranchRateModel&gt;</code> element

This element provides a strict clock model. All branches have the same rate of molecular evolution.

The element has the following contents:

* [BranchRateModel](#branchratemodel) elements (one or more)
: The component branch rate models

Example:

```html
<compoundBranchRateModel>
  <randomLocalClockModel ratesAreMultipliers="true" threshold="1.0">
    <treeModel idref="treeModel2">
    <rateIndicator>
      <parameter idref="parameter10">
    </rateIndicator>
    <rates>
      <diagonalMatrix idref="diagonalMatrix7">
    </rates>
  </randomLocalClockModel>
  <randomLocalClockModel ratesAreMultipliers="true" threshold="1.0">
    <starTreeModel idref="starTreeModel3">
    <rateIndicator>
      <productParameter idref="productParameter9">
    </rateIndicator>
    <rates>
      <fastMatrixParameter idref="fastMatrixParameter3">
    </rates>
  </randomLocalClockModel>
  <randomLocalClockModel ratesAreMultipliers="true" threshold="1.0">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel5">
    <rateIndicator>
      <maskedMatrixParameter idref="maskedMatrixParameter1">
    </rateIndicator>
    <rates>
      <differenceMatrixParameter idref="differenceMatrixParameter1">
    </rates>
  </randomLocalClockModel>
  <attributeBranchRateModel rateAttribute="foo">
    <treeModel idref="treeModel3">
  </attributeBranchRateModel>
</compoundBranchRateModel>
```



### <code>&lt;compoundFastMatrixParameter&gt;</code> element

A compound matrix parameter constructed from its component parameters.

The element has the following contents:

* [MatrixParameterInterface](#matrixparameterinterface) elements (one or more)

Example:

```html
<compoundFastMatrixParameter>
  <approximateFactorAnalysisPrecision>
    <L>
      <designMatrix idref="designMatrix1">
    </L>
    <gamma>
      <matrixMatrixProduct idref="matrixMatrixProduct5">
    </gamma>
  </approximateFactorAnalysisPrecision>
  <elementWiseMatrixMultiplicationParameter/>
</compoundFastMatrixParameter>
```



### <code>&lt;compoundGaussianProcess&gt;</code> element

Returned a Gaussian process formed from an ordered list of independent Gaussian processes

The element has the following contents:

* [GaussianProcessRandomGenerator](#gaussianprocessrandomgenerator) elements (one or more)

Example:

```html
<compoundGaussianProcess>
  <gaussianProcessFromTree>
    ERROR!
  </gaussianProcessFromTree>
</compoundGaussianProcess>
```



### <code>&lt;appendedPotentialDerivative&gt;</code> element

null

The element has the following contents:

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) elements (one or more)

Example:

```html
<appendedPotentialDerivative>
  <appendedPotentialDerivative>
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood6">
    <sumDerivative idref="sumDerivative4">
    <sumDerivative idref="sumDerivative4">
    <gradient idref="gradient7">
  </appendedPotentialDerivative>
  <sumDerivative>
    <sumDerivative idref="sumDerivative2">
    <gradient idref="gradient8">
    <gradient idref="gradient10">
  </sumDerivative>
  <maskedGradient>
    <appendedPotentialDerivative idref="appendedPotentialDerivative2">
    <mask>
      <differenceMatrixParameter idref="differenceMatrixParameter9">
    </mask>
  </maskedGradient>
  <sumDerivative>
    <appendedPotentialDerivative idref="appendedPotentialDerivative1">
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood3">
    <appendedPotentialDerivative idref="appendedPotentialDerivative10">
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood2">
  </sumDerivative>
</appendedPotentialDerivative>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <dirichletPrior counts="0.5 1.0" sumsTo="1.0">
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView9">
    <continuousDiffusionStatistic idref="continuousDiffusionStatistic3">
    <logarithmStatistic idref="logarithmStatistic7">
  </dirichletPrior>
  <productOfExponentialsPosteriorMeansLoess fileName="foo" parameterColumn="foo" dimension="1">
    <starTreeModel idref="starTreeModel9">
  </productOfExponentialsPosteriorMeansLoess>
</compoundLikelihood>
```



### <code>&lt;compoundMatrixParameter&gt;</code> element

A compound matrix parameter constructed from its component parameters.

The element has the following contents:

* [MatrixParameter](#matrixparameter) elements (one or more)

Example:

```html
<compoundMatrixParameter>
  <compoundSymmetricMatrix asCorrelation="true">
    <diagonal>
      <matrixMatrixProduct idref="matrixMatrixProduct8">
    </diagonal>
    <offDiagonal>
      <matrixParameter idref="matrixParameter4">
    </offDiagonal>
  </compoundSymmetricMatrix>
  <matrixParameter rows="1" columns="1" transpose="true" asCompoundParameter="true" test="true">
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter1">
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </matrixParameter>
</compoundMatrixParameter>
```



### <code>&lt;compoundParameter&gt;</code> element

A multidimensional parameter constructed from its component parameters.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<compoundParameter>
  <buildCompoundSymmetricMatrix/>
</compoundParameter>
```



### <code>&lt;compoundSymmetricMatrix&gt;</code> element

A diagonal matrix parameter constructed from its diagonals.

The element takes following attributes:

* <code>asCorrelation</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;diagonal&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;offDiagonal&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<compoundSymmetricMatrix asCorrelation="true">
  <diagonal>
    <sumParameter idref="sumParameter7">
  </diagonal>
  <offDiagonal>
    <copyParameterValues idref="copyParameterValues7">
  </offDiagonal>
</compoundSymmetricMatrix>
```



### <code>&lt;compoundTransform&gt;</code> element

null

The element has the following contents:

* [Transform$ParsedTransform](#transform$parsedtransform) elements (one or more)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<compoundTransform>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform10">
    </outer>
    <inner>
      <inverseTransform idref="inverseTransform9">
    </inner>
  </composedTransform>
  <transform type="foo" start="1" end="1" every="1" inverseTransform="true">
    <mvPolyaLikelihood idref="mvPolyaLikelihood9">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix6">
    <matrixMatrixProduct idref="matrixMatrixProduct8">
  </transform>
  <composedTransform>
    <outer>
      <composedTransform idref="composedTransform9">
    </outer>
    <inner>
      <transform idref="transform6">
    </inner>
  </composedTransform>
  <transform type="foo" start="1" end="1" every="1" inverseTransform="true">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter8">
    <dataFromTreeTips idref="dataFromTreeTips4">
    <maskedMatrixParameter idref="maskedMatrixParameter2">
    <maskedMatrixParameter idref="maskedMatrixParameter10">
  </transform>
  <jointParameter>
    <maskedParameter idref="maskedParameter6">
  </jointParameter>
</compoundTransform>
```



### <code>&lt;conditionalCladeProbability&gt;</code> element

Calculates the conditional clade probability of a tree based on a sample of tree space.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

* <code>epsilon</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<conditionalCladeProbability fileName="foo" burnin="1" epsilon="1.0">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <speciesTree idref="speciesTree3">
    <rootHeight>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter1">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <complementParameter idref="complementParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <vectorSlice idref="vectorSlice9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <jointParameter idref="jointParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <productParameter idref="productParameter8">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <leafTraitParameter idref="leafTraitParameter4">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser1">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak8">
    </outbreak>
  </partitionedTreeModel>
</conditionalCladeProbability>
```



### <code>&lt;ConditionalCladeProbabilityAnalysis&gt;</code> element

Calculates posterior of a tree on a trace consisting of trees.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "name of a tree log file"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: "The number of trees discarded because of the burn-in period."

* <code>minCladeProbability</code> (optional) is of type [Double](#double)
: "The frequency in % that a clade must achieve to be considered for the evaulation. Otherwise it's set to epsilon."

* <code>epsilon</code> (optional) is of type [Double](#double)
: "Epsilon is the default number of occurences for a clade if a clade wasn't observed. The default is 1.0"

* <code>referenceTree</code>  is of type [String](#string)
: "File in newick format containing a tree which is evaluated with the statistic."

Example:

```html
<ConditionalCladeProbabilityAnalysis fileName="trees.log" burnIn="1" minCladeProbability="1.0" epsilon="1.0" referenceTree="foo"/>
```



### <code>&lt;constantDecreasedVariancePrior&gt;</code> element

Calculates a product of exponentials based on a set of posterior sample means.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<constantDecreasedVariancePrior fileName="foo" parameterColumn="foo" dimension="1">
  <treeModel fixHeights="true" fixTree="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
    <rootHeight>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <complementParameter idref="complementParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter7">
    </nodeHeights>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter5">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundParameter idref="compoundParameter5">
    </nodeRates>
  </treeModel>
</constantDecreasedVariancePrior>
```



### <code>&lt;constantExponential&gt;</code> element

A demographic model of constant population size followed by exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthPhaseStartTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;growthRate&gt;</code>
: A value of zero represents a constant population size, negative values represent decline towards the present, positive numbers represents exponential growth towards the present. A random walk operator is recommended for this parameter with a starting value of 0.0 and no upper or lower limits.

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time.

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<constantExponential units="generations">
  <populationSize>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision7">
  </populationSize>
  <growthPhaseStartTime>
    <differenceMatrixParameter idref="differenceMatrixParameter3">
  </growthPhaseStartTime>
  <doublingTime>
    <dataFromTreeTips idref="dataFromTreeTips10">
  </doublingTime>
</constantExponential>
```



### <code>&lt;constantLikelihood&gt;</code> element

A function that returns a constant value as a likelihood.

The element takes following attributes:

* <code>logValue</code>  is of type [Double](#double)
: 

Example:

```html
<constantLikelihood logValue="1.0"/>
```



### <code>&lt;constantLogistic&gt;</code> element

A demographic model of constant population size followed by logistic growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>alpha</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ancestralPopulationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;shape&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<constantLogistic units="generations" alpha="1.0">
  <populationSize>
    <complementParameter idref="complementParameter5">
  </populationSize>
  <ancestralPopulationSize>
    <diagonalMatrix idref="diagonalMatrix3">
  </ancestralPopulationSize>
  <growthRate>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter5">
  </growthRate>
  <shape>
    <designMatrix idref="designMatrix8">
  </shape>
</constantLogistic>
```



### <code>&lt;constantPatterns&gt;</code> element

Creates a set of patterns for constant sites with weights as provided.

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

* Element named <code>&lt;counts&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<constantPatterns>
  <microsatelliteSimulator>
    <microsatellite idref="microsatellite2">
    <taxa idref="taxa4">
    <treeModel idref="treeModel7">
    ERROR!
  </microsatelliteSimulator>
  <counts>
    <compoundParameter idref="compoundParameter10">
  </counts>
</constantPatterns>
```



### <code>&lt;constantSize&gt;</code> element

A demographic model representing a constant population size through time.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<constantSize units="months">
  <populationSize>
    <matrixMatrixProduct idref="matrixMatrixProduct3">
  </populationSize>
</constantSize>
```



### <code>&lt;constantTreeTopologyPrior&gt;</code> element

Calculates the constant tree topology prior, i.e. 1 over the total number of rooted bifurcating trees.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<constantTreeTopologyPrior>
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork7">
    <rootHeight>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <parameter idref="parameter3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <compoundParameter idref="compoundParameter5">
    </nodeTraits>
    <leafTrait taxon="foo" name="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter10">
    </leafTrait>
  </treeModel>
</constantTreeTopologyPrior>
```



### <code>&lt;constExpConst&gt;</code> element

A demographic model of constant population size followed by exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>useNumericalIntegration</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;ancestralPopulationSize&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;growthRate&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;finalPhaseStartTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthPhaseTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<constExpConst units="days" useNumericalIntegration="true">
  <populationSize>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix4">
  </populationSize>
  <ancestralPopulationSize>
    <jointParameter idref="jointParameter6">
  </ancestralPopulationSize>
  <finalPhaseStartTime>
    <immutableParameter idref="immutableParameter4">
  </finalPhaseStartTime>
  <growthPhaseTime>
    <mvPolyaLikelihood idref="mvPolyaLikelihood9">
  </growthPhaseTime>
</constExpConst>
```



### <code>&lt;contemporaneousCoalescentConstantLikelihood&gt;</code> element

Calculates the number of possible combinations of coalescent events.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<contemporaneousCoalescentConstantLikelihood>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <sequenceSimulator idref="sequenceSimulator10">
  </empiricalTreeDistributionModel>
</contemporaneousCoalescentConstantLikelihood>
```



### <code>&lt;continuousBranchRates&gt;</code> element

This element returns a continuous quantile uncorrelated relaxed clock model.

The element takes following attributes:

* <code>singleRootRate</code> (optional) is of type [Boolean](#boolean)
: "Whether only a single rate should be used for the two children branches of the root"

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: "Whether the mean rate has to be normalized to a particular value"

* <code>normalizeBranchRateTo</code> (optional) is of type [Double](#double)
: "The mean rate to normalize to, if normalizing"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;distribution&gt;</code>
: The distribution model for rates among branches

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* One of:
    * Element named <code>&lt;rateQuantiles&gt;</code>
: The quantiles for each branch

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;rateCategoryQuantiles&gt;</code>
: The quantiles for each branch

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<continuousBranchRates singleRootRate="true" normalize="true" normalizeBranchRateTo="1.0">
  <treeModel fixHeights="true" fixTree="true">
    <newick idref="newick5">
    <rootHeight>
      <compoundParameter idref="compoundParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <differenceMatrixParameter idref="differenceMatrixParameter7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter7">
    </nodeHeights>
    <leafHeight taxon="foo">
      <designMatrix idref="designMatrix2">
    </leafHeight>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter1">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixParameter idref="matrixParameter6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser10">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixMatrixProduct idref="matrixMatrixProduct5">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <sumParameter idref="sumParameter3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser8">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter9">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
    </leafTrait>
  </treeModel>
  <distribution>
    <uniformDistributionModel idref="uniformDistributionModel1">
  </distribution>
  <rateQuantiles>
    <dataFromTreeTips idref="dataFromTreeTips2">
  </rateQuantiles>
</continuousBranchRates>
```



### <code>&lt;continuousDiffusionStatistic&gt;</code> element

A statistic that returns the average of the branch diffusion rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>greatCircleDistance</code> (optional) is of type [Boolean](#boolean)
: 

* <code>mode</code> (optional) is of type [String](#string)
: 

* <code>statistic</code> (optional) is of type [String](#string)
: 

* <code>discreteState</code> (optional) is of type [String](#string)
: 

* <code>heightUpper</code> (optional) is of type [Double](#double)
: 

* <code>heightLower</code> (optional) is of type [Double](#double)
: 

* <code>heightLowerSerie</code> (optional) is of type [String](#string)
: 

* <code>dimension</code> (optional) is of type [Double](#double)
: 

* <code>cumulative</code> (optional) is of type [Boolean](#boolean)
: 

* <code>noise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>branchSet</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TaxonList](#taxonlist) element (zero or one)

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) elements (one or more)

* [MarkovJumpsBeagleTreeLikelihood](#markovjumpsbeagletreelikelihood) element (zero or one)

Example:

```html
<continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <dataFromTreeTips idref="dataFromTreeTips3">
    </traitParameter>
    <bifractionalDiffusionModel idref="bifractionalDiffusionModel7">
    <starTreeModel idref="starTreeModel4">
  </multivariateTraitLikelihood>
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <compoundMatrixParameter idref="compoundMatrixParameter3">
    </traitParameter>
    <mixtureCartogramDiffusionModel idref="mixtureCartogramDiffusionModel8">
    <starTreeModel idref="starTreeModel1">
    ERROR!
  </multivariateTraitLikelihood>
  <inhibitionLikelihood>
    <treeModel idref="treeModel2">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix10">
    <precision>
      <differenceMatrixParameter idref="differenceMatrixParameter5">
    </precision>
  </inhibitionLikelihood>
</continuousDiffusionStatistic>
```



### <code>&lt;continuousTraitRateModel&gt;</code> element

This element returns an trait rate model.The branch rates are an average of the rates provided by a node trait.

The element takes following attributes:

* <code>dimension</code> (optional) is of type [Integer](#integer)
: "The dimension that supplies the rate"

The element has the following contents:

* Element named <code>&lt;rate&gt;</code>
: The rate parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ratio&gt;</code>
: The ratio parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [SampledMultivariateTraitLikelihood](#sampledmultivariatetraitlikelihood) element (zero or one)

Example:

```html
<continuousTraitRateModel dimension="1"/>
```



### <code>&lt;convert&gt;</code> element

Converts an alignment to the given data type.

The element takes following attributes:

* <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

The element has the following contents:

* [Alignment](#alignment) element (exactly one)

Example:

```html
<convert dataType="hiddenCodon3">
  <alignment dataType="codon-ascidianMitochondrial">
    <sequence idref="sequence2">
    <sequence idref="sequence5">
    <sequence idref="sequence2">
  </alignment>
</convert>
```



### <code>&lt;coordinates&gt;</code> element

This element represents a set of (X,Y,Z) coordinates in KML format

The element has the following contents:

* [String](#string) element (exactly one)

Example:

```html
<coordinates>
  foo
</coordinates>
```



### <code>&lt;copyParameterValues&gt;</code> element

Copy parameter values from source to destination

The element has the following contents:

* Element named <code>&lt;source&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;destination&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<copyParameterValues>
  <source>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix4">
  </source>
  <destination>
    <complementParameter idref="complementParameter2">
  </destination>
</copyParameterValues>
```



### <code>&lt;correlation&gt;</code> element

This element returns a precision that is the element-wise reciprocal of the child precision.

The element takes following attributes:

* <code>dimension1</code>  is of type [Integer](#integer)
: 

* <code>dimension2</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<correlation dimension1="1" dimension2="1">
  <designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true">
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
  </designMatrix>
</correlation>
```



### <code>&lt;countableMixtureBranchRates&gt;</code> element

This element provides a clock consisting of a mixture of fixed effects and random effects.

The element takes following attributes:

* <code>inLogSpace</code> (optional) is of type [Boolean](#boolean)
: 

* <code>randomize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* One of:
    * Element named <code>&lt;rates&gt;</code>
: The molecular evolutionary rate parameter

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;fixedEffects&gt;</code>
: Fixed effects

        Containing:

        * [AbstractBranchRateModel](#abstractbranchratemodel) elements (zero or more)


* Element named <code>&lt;rateCategories&gt;</code>
: Allocation parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;randomEffects&gt;</code>
: Possible random effects

    Containing:

    * [AbstractBranchRateModel](#abstractbranchratemodel) elements (zero or more)

* Element named <code>&lt;clade&gt;</code>

    Containing:

    * <code>category</code>  is of type [Integer](#integer)
: 

    * <code>includeStem</code> (optional) is of type [Boolean](#boolean)
: "determines whether or not the stem branch above this clade is included in the siteModel (default false)."

    * <code>excludeClade</code> (optional) is of type [Boolean](#boolean)
: "determines whether to exclude actual branches of the clade from the siteModel (default false)."

    * [Taxa](#taxa) element (exactly one)
: A set of taxa which defines a clade to apply a different site model to

Example:

```html
<countableMixtureBranchRates inLogSpace="true" randomize="true">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <argTreeModel idref="argTreeModel8">
    <rootHeight>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <parameter idref="parameter8">
    </nodeHeights>
    <leafHeight taxon="foo">
      <parameter idref="parameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter10">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <differenceParameter idref="differenceParameter5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter7">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak1">
    </outbreak>
  </partitionedTreeModel>
  <rates>
    <copyParameterValues idref="copyParameterValues6">
  </rates>
  <rateCategories>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser6">
  </rateCategories>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa2">
  </clade>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa3">
  </clade>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa2">
  </clade>
  <clade category="1" includeStem="true" excludeClade="true">
    <taxa idref="taxa9">
  </clade>
</countableMixtureBranchRates>
```



### <code>&lt;CSVexport&gt;</code> element

Write tabular data as an CSV file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The name of a BEAST log file (can not include trees, which should be logged separately"

* <code>separator</code> (optional) is of type [String](#string)
: "Values separator (default is tab)"

The element has the following contents:

* Element named <code>&lt;columns&gt;</code>
: A subset of columns from one source

    Containing:

    * <code>all</code> (optional) is of type [Boolean](#boolean)
: "Dump all columns. default is TRUE when no columns are specified, FALSE otherwise"

    * <code>rows</code> (optional) is of type [Boolean](#boolean)
: "Write data in rows (default is columns)"

    * [TabularData](#tabulardata) element (exactly one)

    * Element named <code>&lt;CSVcolumn&gt;</code>
: column name

        Containing:

        * <code>name</code>  is of type [String;](#string;)
: 

        * [Parameter](#parameter) element (exactly one)

Example:

```html
<CSVexport fileName="foo" separator="foo">
  <columns all="true" rows="true">
    <logFileTrace idref="logFileTrace4">
  </columns>
</CSVexport>
```



### <code>&lt;ctmcScalePrior&gt;</code> element

This element represents the prior for CTMC scale parameter.

The element takes following attributes:

* <code>reciprocal</code> (optional) is of type [Boolean](#boolean)
: 

* <code>trial</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;ctmcScale&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [SubstitutionModel](#substitutionmodel) element (zero or one)

Example:

```html
<ctmcScalePrior reciprocal="true" trial="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <microsatelliteSimulator idref="microsatelliteSimulator3">
  </empiricalTreeDistributionModel>
  <ctmcScale>
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter3">
  </ctmcScale>
</ctmcScalePrior>
```



### <code>&lt;dataFromTreeTips&gt;</code> element

Takes the data from the tips of a tree and puts it into a MatrixParameter

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: 

The element has the following contents:

* [MultivariateTraitTree](#multivariatetraittree) element (exactly one)

* Element named <code>&lt;traitParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;missingIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<dataFromTreeTips traitName="foo">
  <transformedTreeModel version="foo">
    <partitionedTreeModel idref="partitionedTreeModel2">
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser6">
  </transformedTreeModel>
  <traitParameter>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
  </traitParameter>
</dataFromTreeTips>
```



### <code>&lt;dataLikelihood&gt;</code> element

null

The element has the following contents:

* [MarkovJumpsTraitProvider](#markovjumpstraitprovider) element (exactly one)

Example:

```html
<dataLikelihood>
  ERROR!
</dataLikelihood>
```



### <code>&lt;date&gt;</code> element

Specifies a date on a given timescale

The element takes following attributes:

* <code>value</code>  is of type [String](#string)
: "The value of this date"

* <code>origin</code> (optional) is of type [String](#string)
: "The origin of this time scale, which must be a valid calendar date"

* <code>units</code> (optional) is of type [String](#string)
: "The units of the timescale"

* <code>direction</code> (optional) is of type [String](#string)
: "The direction of the timescale"

* <code>precision</code> (optional) is of type [Double](#double)
: "The precision to which the date is specified"

Example:

```html
<!-- a date representing 10 years in the past                                 -->
<date value="10.0" units="years" direction="backwards"/>

<!-- a date representing 300 days after Jan 1st 1989                          -->
<date value="300.0" origin="01/01/89" units="days" direction="forwards"/>
```



### <code>&lt;deltaExchange&gt;</code> element

This element returns a delta exchange operator on a given parameter.

The element takes following attributes:

* <code>delta</code>  is of type [Double](#double)
: 

* <code>parameterWeights</code> (optional) is of type [Integer;](#integer;)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>integer</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<deltaExchange delta="1.0" parameterWeights="1 2 4 8" weight="1.0" autoOptimize="true" integer="true">
  <compoundSymmetricMatrix asCorrelation="true">
    <diagonal>
      <leafTraitParameter idref="leafTraitParameter8">
    </diagonal>
    <offDiagonal>
      <immutableParameter idref="immutableParameter5">
    </offDiagonal>
  </compoundSymmetricMatrix>
</deltaExchange>
```



### <code>&lt;deltaMixOperator&gt;</code> element

This element returns a scale operator on a given parameter.

The element takes following attributes:

* <code>delta</code>  is of type [Double](#double)
: 

* <code>parameterWeights</code> (optional) is of type [Integer;](#integer;)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<deltaMixOperator delta="1.0" parameterWeights="1 2 4 8" weight="1.0" autoOptimize="true">
  <differenceMatrixParameter/>
</deltaMixOperator>
```



### <code>&lt;designMatrix&gt;</code> element

A matrix parameter constructed from its component parameters.

The element takes following attributes:

* <code>addIntercept</code> (optional) is of type [Boolean](#boolean)
: 

* <code>checkIdentifiability</code> (optional) is of type [Boolean](#boolean)
: 

* <code>form</code> (optional) is of type [String](#string)
: 

* <code>colDimension</code> (optional) is of type [Integer](#integer)
: 

* <code>rowDimension</code> (optional) is of type [Integer](#integer)
: 

* <code>standardize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) elements (zero or more)

Example:

```html
<designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true">
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <designMatrix idref="designMatrix9">
    <extendedDataType idref="extendedDataType3">
  </originDestinationDesignMatrix>
</designMatrix>
```



### <code>&lt;diagonalContrainedMatrixView&gt;</code> element

A diagonal matrix parameter constructed from its diagonals.

The element takes following attributes:

* <code>constraintValue</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<diagonalContrainedMatrixView constraintValue="1.0">
  <dataFromTreeTips traitName="foo">
    <starTreeModel idref="starTreeModel4">
    <traitParameter>
      <dataFromTreeTips idref="dataFromTreeTips7">
    </traitParameter>
  </dataFromTreeTips>
  <mask>
    <maskedMatrixParameter idref="maskedMatrixParameter7">
  </mask>
</diagonalContrainedMatrixView>
```



### <code>&lt;diagonalMatrix&gt;</code> element

A diagonal matrix parameter constructed from its diagonals.

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<diagonalMatrix>
  <compoundSymmetricMatrix asCorrelation="true">
    <diagonal>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter10">
    </diagonal>
    <offDiagonal>
      <maskedParameter idref="maskedParameter8">
    </offDiagonal>
  </compoundSymmetricMatrix>
</diagonalMatrix>
```



### <code>&lt;differenceStatistic&gt;</code> element

This element returns a statistic that is the difference of the 2 child statistics.

The element takes following attributes:

* <code>absolute</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Statistic](#statistic) elements (exactly 2)
: The two operand statistics

Example:

```html
<differenceStatistic absolute="true">
  <compoundSymmetricMatrix asCorrelation="true">
    <diagonal>
      <fastMatrixParameter idref="fastMatrixParameter8">
    </diagonal>
    <offDiagonal>
      <complementParameter idref="complementParameter4">
    </offDiagonal>
  </compoundSymmetricMatrix>
  <maskedParameter complement="true" build="true" from="1" to="1" every="1">
    <complementParameter idref="complementParameter8">
  </maskedParameter>
</differenceStatistic>
```



### <code>&lt;differenceMatrixParameter&gt;</code> element

differenceMatrixParameter

Example:

```html
<differenceMatrixParameter/>
```



### <code>&lt;differenceParameter&gt;</code> element

A element-wise difference of parameters.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<differenceParameter>
  <complementParameter>
    <vectorSlice idref="vectorSlice2">
  </complementParameter>
  <fastMatrixParameter rows="1" columns="1">
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    <dataFromTreeTips idref="dataFromTreeTips2">
    <matrixVectorProductParameter idref="matrixVectorProductParameter6">
    <productParameter idref="productParameter8">
  </fastMatrixParameter>
  <immutableParameter>
    <exponentialStatistic idref="exponentialStatistic3">
  </immutableParameter>
  <blockUpperTriangularMatrixParameter transpose="true" columnDimension="1" diagonalRestriction="true"/>
</differenceParameter>
```



### <code>&lt;differenceStatistic&gt;</code> element

This element returns a statistic that is the difference of the 2 child statistics.

The element takes following attributes:

* <code>absolute</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Statistic](#statistic) elements (exactly 2)
: The two operand statistics

Example:

```html
<differenceStatistic absolute="true">
  <generalizedSkylinePopSizeStatistic/>
  <differenceParameter>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser1">
    <duplicatedParameter idref="duplicatedParameter5">
    <vectorSlice idref="vectorSlice6">
  </differenceParameter>
</differenceStatistic>
```



### <code>&lt;diffusionRateCovarianceStatistic&gt;</code> element

A statistic that returns the average of the branch rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>greatCircleDistance</code> (optional) is of type [Boolean](#boolean)
: 

* <code>diffusionCoefficient</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [MultivariateTraitTree](#multivariatetraittree) element (exactly one)

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) elements (one or more)

Example:

```html
<diffusionRateCovarianceStatistic name="foo" greatCircleDistance="true" diffusionCoefficient="true">
  <transformedTreeModel version="foo">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
    <designMatrix idref="designMatrix5">
  </transformedTreeModel>
  <inhibitionLikelihood>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
    <compoundMatrixParameter idref="compoundMatrixParameter2">
    <precision>
      <vectorSlice idref="vectorSlice5">
    </precision>
  </inhibitionLikelihood>
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    </traitParameter>
    <bifractionalDiffusionModel idref="bifractionalDiffusionModel3">
    <transformedTreeModel idref="transformedTreeModel3">
    ERROR!
  </multivariateTraitLikelihood>
  <inhibitionLikelihood>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel6">
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    <precision>
      <dataFromTreeTips idref="dataFromTreeTips5">
    </precision>
  </inhibitionLikelihood>
</diffusionRateCovarianceStatistic>
```



### <code>&lt;continuousDiffusionStatistic&gt;</code> element

A statistic that returns the average of the branch diffusion rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>greatCircleDistance</code> (optional) is of type [Boolean](#boolean)
: 

* <code>mode</code> (optional) is of type [String](#string)
: 

* <code>statistic</code> (optional) is of type [String](#string)
: 

* <code>discreteState</code> (optional) is of type [String](#string)
: 

* <code>heightUpper</code> (optional) is of type [Double](#double)
: 

* <code>heightLower</code> (optional) is of type [Double](#double)
: 

* <code>heightLowerSerie</code> (optional) is of type [String](#string)
: 

* <code>dimension</code> (optional) is of type [Double](#double)
: 

* <code>cumulative</code> (optional) is of type [Boolean](#boolean)
: 

* <code>noise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>branchSet</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TaxonList](#taxonlist) element (zero or one)

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) elements (one or more)

* [MarkovJumpsBeagleTreeLikelihood](#markovjumpsbeagletreelikelihood) element (zero or one)

Example:

```html
<continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
  <inhibitionLikelihood>
    <partitionedTreeModel idref="partitionedTreeModel9">
    <designMatrix idref="designMatrix6">
    <precision>
      <maskedMatrixParameter idref="maskedMatrixParameter2">
    </precision>
  </inhibitionLikelihood>
  <inhibitionLikelihood>
    <partitionedTreeModel idref="partitionedTreeModel4">
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix6">
    <precision>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter5">
    </precision>
  </inhibitionLikelihood>
</continuousDiffusionStatistic>
```



### <code>&lt;dirichletParameterPrior&gt;</code> element

Calculates the likelihood of some data under a Dirichlet distribution.

The element takes following attributes:

* <code>sumToNumberOfElements</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;countsParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<dirichletParameterPrior sumToNumberOfElements="true">
  <countsParameter>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter3">
  </countsParameter>
  <data>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter6">
  </data>
  <data>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix4">
  </data>
</dirichletParameterPrior>
```



### <code>&lt;dirichletPrior&gt;</code> element

Calculates the prior probability of some data under a Dirichlet distribution.

The element takes following attributes:

* <code>sumsTo</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* One of:
    * <code>alpha</code>  is of type [Double;](#double;)
: 

    * <code>counts</code>  is of type [Double;](#double;)
: 


* [Statistic](#statistic) elements (one or more)

Example:

```html
<dirichletPrior counts="0.5 1.0" sumsTo="1.0">
  <parsimonyStatistic name="foo">
    <treeModel idref="treeModel9">
    <state>
      <taxa idref="taxa4">
    </state>
  </parsimonyStatistic>
  <transmissionStatistic name="foo">
    <hostTree>
      <tree idref="tree2">
    </hostTree>
    <parasiteTree>
      <newick idref="newick1">
    </parasiteTree>
  </transmissionStatistic>
  <notBooleanStatistic>
    <test idref="test2">
  </notBooleanStatistic>
  <logarithmStatistic base="1.0">
    <popGraph idref="popGraph3">
  </logarithmStatistic>
</dirichletPrior>
```



### <code>&lt;dirichletProcessLikelihood&gt;</code> element

Calculates the likelihood of some items distributed into a number of classes under a Dirichlet drocess.

The element has the following contents:

* Element named <code>&lt;eta&gt;</code>
: Counts of N items distributed amongst K classes

    Containing:

    * [Statistic](#statistic) element (exactly one)

* Element named <code>&lt;chi&gt;</code>
: Aggregation parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<dirichletProcessLikelihood>
  <eta>
    <driftedLocationsStatistic idref="driftedLocationsStatistic5">
  </eta>
  <chi>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter4">
  </chi>
</dirichletProcessLikelihood>
```



### <code>&lt;dirichletProcessOperator&gt;</code> element

An operator that picks a new allocation of an item to a cluster under the Dirichlet process.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;chi&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;likelihood&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<dirichletProcessOperator weight="1.0">
  <chi>
    <compoundMatrixParameter idref="compoundMatrixParameter3">
  </chi>
  <compoundFastMatrixParameter>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision2">
    <mvPolyaLikelihood idref="mvPolyaLikelihood7">
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix1">
  </compoundFastMatrixParameter>
</dirichletProcessOperator>
```



### <code>&lt;dirtyLikelihood&gt;</code> element

This element returns a operator that forces the entire model likelihood recomputation

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Likelihood](#likelihood) element (exactly one)

Example:

```html
<dirtyLikelihood weight="1.0">
  <productOfGammas fileName="foo" parameterColumn="foo" dimension="1" popSize="1.0">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
  </productOfGammas>
</dirtyLikelihood>
```



### <code>&lt;discreteTraitRateModel&gt;</code> element

This Branch Rate Model takes a discrete trait reconstruction (provided by a TreeTraitProvider) and gives the rate for each branch of the tree based on the child trait of that branch. The rates for each trait value are specified in a multidimensional parameter.

The element takes following attributes:

* <code>traitIndex</code> (optional) is of type [Integer](#integer)
: 

* <code>traitName</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)
: The tree model

* One of:
    * All of:
        * [TreeTraitProvider](#treetraitprovider) element (exactly one)
: The trait provider

        * One of:
            * <code>dataType</code>  is of type [String](#string)
: "The type of general data"

            * [DataType](#datatype) element (exactly one)




    * [PatternList](#patternlist) element (exactly one)


* One of:
    * All of:
        * Element named <code>&lt;rate&gt;</code>
: The over-all rate

            Containing:

            * [Parameter](#parameter) element (exactly one)

        * Element named <code>&lt;relativeRates&gt;</code>
: The state-specific relative rates

            Containing:

            * [Parameter](#parameter) element (exactly one)



    * Element named <code>&lt;rates&gt;</code>
: The state-specific rates

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<discreteTraitRateModel traitIndex="1" traitName="foo">
  <starTreeModel>
    <neighborJoiningTree idref="neighborJoiningTree7">
    <rootHeight>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </rootHeight>
    <leafHeight taxon="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter2">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <mvPolyaLikelihood idref="mvPolyaLikelihood9">
    </leafTrait>
  </starTreeModel>
  <maskedPatterns negative="true">
    <convert idref="convert9">
    <mask>
      foo
    </mask>
  </maskedPatterns>
  <rates>
    <jointParameter idref="jointParameter1">
  </rates>
</discreteTraitRateModel>
```



### <code>&lt;discreteUniformPrior&gt;</code> element

Calculates the prior probability of some data under a given discrete uniform distribution.

The element takes following attributes:

* <code>lower</code>  is of type [Double](#double)
: 

* <code>upper</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<discreteUniformPrior lower="1.0" upper="1.0">
  <argReassortmentNodeCount name="foo">
    <argTreeModel idref="argTreeModel4">
  </argReassortmentNodeCount>
  <logarithmStatistic base="1.0">
    <compoundParameter idref="compoundParameter5">
  </logarithmStatistic>
</discreteUniformPrior>
```



### <code>&lt;discretizedBranchRates&gt;</code> element

This element returns an discretized relaxed clock model.The branch rates are drawn from a discretized parametric distribution.

The element takes following attributes:

* <code>singleRootRate</code> (optional) is of type [Boolean](#boolean)
: "Whether only a single rate should be used for the two children branches of the root"

* <code>overSampling</code> (optional) is of type [Integer](#integer)
: "The integer factor for oversampling the distribution model (1 means no oversampling)"

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: "Whether the mean rate has to be normalized to a particular value"

* <code>normalizeBranchRateTo</code> (optional) is of type [Double](#double)
: "The mean rate to normalize to, if normalizing"

* <code>randomizeRates</code> (optional) is of type [Boolean](#boolean)
: "Randomize initial categories"

* <code>keepRates</code> (optional) is of type [Boolean](#boolean)
: "Keep current rate category specification"

* <code>cachedRates</code> (optional) is of type [Boolean](#boolean)
: "Cache rates between steps (default off)"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;distribution&gt;</code>
: The distribution model for rates among branches

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;rateCategories&gt;</code>
: The rate categories parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<discretizedBranchRates singleRootRate="true" overSampling="1" normalize="true" normalizeBranchRateTo="1.0" randomizeRates="true" keepRates="true" cachedRates="true">
  <starTreeModel>
    <transformedTreeModel idref="transformedTreeModel10">
    <sharedRootHeight>
      <treeModel idref="treeModel1">
    </sharedRootHeight>
    <leafHeight taxon="foo">
      <copyParameterValues idref="copyParameterValues8">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedParameter idref="maskedParameter3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <copyParameterValues idref="copyParameterValues7">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter5">
    </leafTrait>
  </starTreeModel>
  <distribution>
    <inverseGammaDistributionModel idref="inverseGammaDistributionModel7">
  </distribution>
  <rateCategories>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix8">
  </rateCategories>
</discretizedBranchRates>
```



### <code>&lt;discretizedLocationOperator&gt;</code> element

This element returns a multivariate Gibbs operator on traits for possible all nodes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>onlyInternalNodes</code> (optional) is of type [Boolean](#boolean)
: 

* <code>neighborhoodSize</code> (optional) is of type [Integer](#integer)
: 

* <code>randomize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)

Example:

```html
<discretizedLocationOperator weight="1.0" autoOptimize="true" onlyInternalNodes="true" neighborhoodSize="1" randomize="true">
  <inhibitionLikelihood>
    <starTreeModel idref="starTreeModel7">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix2">
    <precision>
      <fastMatrixParameter idref="fastMatrixParameter3">
    </precision>
  </inhibitionLikelihood>
</discretizedLocationOperator>
```



### <code>&lt;distanceDependentCRPGibbsOperator&gt;</code> element

An operator that picks a new allocation of an item to a cluster under the Dirichlet process.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;chi&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;likelihood&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* Element named <code>&lt;assignments&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;links&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<distanceDependentCRPGibbsOperator weight="1.0">
  <chi>
    <fastMatrixParameter idref="fastMatrixParameter8">
  </chi>
  <assignments>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
  </assignments>
  <links>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix1">
  </links>
</distanceDependentCRPGibbsOperator>
```



### <code>&lt;distanceMatrix&gt;</code> element

Constructs a distance matrix from a pattern list or alignment

The element takes following attributes:

* <code>correction</code>  is of type [String](#string)
: "The type of distance correction used"

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

Example:

```html
<distanceMatrix correction="JC">
  <patterns from="1" to="1" every="1" strip="true" unique="true">
    <convert idref="convert6">
  </patterns>
</distanceMatrix>
```



### <code>&lt;distributionLikelihood&gt;</code> element

Calculates the likelihood of some data given some parametric or empirical distribution.

The element has the following contents:

* Element named <code>&lt;distribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * <code>from</code> (optional) is of type [Integer](#integer)
: 

    * <code>to</code> (optional) is of type [Integer](#integer)
: 

    * [Statistic](#statistic) elements (one or more)

Example:

```html
<distributionLikelihood>
  <distribution>
    <exponentialDistributionModel idref="exponentialDistributionModel2">
  </distribution>
  <data from="1" to="1">
    <jointParameter idref="jointParameter6">
  </data>
</distributionLikelihood>
```



### <code>&lt;dNdSLogger&gt;</code> element

null

The element takes following attributes:

* <code>smooth</code> (optional) is of type [Boolean](#boolean)
: 

* <code>counts</code> (optional) is of type [Boolean](#boolean)
: 

* <code>synonymous</code> (optional) is of type [Boolean](#boolean)
: 

* <code>dn-ds</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CodonPartitionedRobustCounting](#codonpartitionedrobustcounting) elements (exactly 2)

* [Tree](#tree) element (exactly one)

Example:

```html
<dNdSLogger smooth="true" counts="true" synonymous="true" dn-ds="true">
  <codonPartitionedRobustCounting geneticCode="alternativeYeast" useUniformization="true" includeExternalBranches="true" includeInternalBranches="true" unconditionedPerBranch="true" averageRates="true" labeling="foo" saveCompleteHistory="true" useNewNeutralModel="true">
    <firstPosition>
      ERROR!
    </firstPosition>
    <secondPosition>
      ERROR!
    </secondPosition>
    <thirdPosition>
      ERROR!
    </thirdPosition>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
  </codonPartitionedRobustCounting>
  <codonPartitionedRobustCounting geneticCode="universal" useUniformization="true" includeExternalBranches="true" includeInternalBranches="true" unconditionedPerBranch="true" averageRates="true" labeling="foo" saveCompleteHistory="true" useNewNeutralModel="true">
    <firstPosition>
      ERROR!
    </firstPosition>
    <secondPosition>
      ERROR!
    </secondPosition>
    <thirdPosition>
      ERROR!
    </thirdPosition>
    <partitionedTreeModel idref="partitionedTreeModel7">
  </codonPartitionedRobustCounting>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <tree idref="tree2">
  </empiricalTreeDistributionModel>
</dNdSLogger>
```



### <code>&lt;dNdSPerSiteAnalysis&gt;</code> element

Performs a trace dN/dS analysis.

The element takes following attributes:

* <code>cutoff</code> (optional) is of type [Double](#double)
: 

* <code>proportion</code> (optional) is of type [Double](#double)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>includeHPD</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeCPD</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeSymbol</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeLevel</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeClassification</code> (optional) is of type [Boolean](#boolean)
: 

* <code>simulationOutcome</code> (optional) is of type [Boolean](#boolean)
: 

* <code>siteSimulation</code> (optional) is of type [String](#string)
: 

* <code>test</code> (optional) is of type [String](#string)
: 

* <code>separator</code> (optional) is of type [String](#string)
: 

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately"

Example:

```html
<dNdSPerSiteAnalysis cutoff="1.0" proportion="1.0" burnin="1" includeHPD="true" includeCPD="true" includeSymbol="true" includeLevel="true" includeClassification="true" simulationOutcome="true" siteSimulation="foo" test="foo" separator="foo" fileName="foo"/>
```



### <code>&lt;double&gt;</code> element

returns a Double. If a prompt attribute exists then the user is prompted for input, otherwise the character contents of the element are returned as a Double.

The element has the following contents:

* One of:
    * <code>prompt</code>  is of type [String](#string)
: "A message displayed to the user when entering a value for this double"

    * [Double](#double) element (exactly one)


Example:

```html
<double prompt="Enter the length of a piece of string (in metres):"/>
```



### <code>&lt;driftedLocationsStatistic&gt;</code> element

This element returns a statistic that shifts a matrix of locations by location drift in the first dimension.

The element has the following contents:

* Element named <code>&lt;locations&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;offsets&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;locationDrift&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<driftedLocationsStatistic>
  <locations>
    <matrixMatrixProduct idref="matrixMatrixProduct8">
  </locations>
  <offsets>
    <matrixVectorProductParameter idref="matrixVectorProductParameter7">
  </offsets>
  <locationDrift>
    <sumParameter idref="sumParameter5">
  </locationDrift>
</driftedLocationsStatistic>
```



### <code>&lt;driftedTraits&gt;</code> element

null

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)
: The tree trait provider which is to be drifted.

* [Parameter](#parameter) element (exactly one)
: The parameter specifying location drift rate.

Example:

```html
<driftedTraits>
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <differenceParameter idref="differenceParameter1">
    </traitParameter>
    <cartogramDiffusionModel idref="cartogramDiffusionModel3">
    <partitionedTreeModel idref="partitionedTreeModel6">
    ERROR!
    ERROR!
    ERROR!
  </multivariateTraitLikelihood>
  <elementWiseMatrixMultiplicationParameter/>
</driftedTraits>
```



### <code>&lt;dummyLikelihood&gt;</code> element

A function wraps a component model that would otherwise not be registered with the MCMC. Always returns a log likelihood of zero.

The element has the following contents:

* One of:
    * [Model](#model) element (exactly one)
: A model element

    * [Parameter](#parameter) element (exactly one)
: A parameter


Example:

```html
<dummyLikelihood>
  <lewisMk totalOrder="true">
    <frequencies>
      <frequencyModel idref="frequencyModel3">
    </frequencies>
    <order state="foo" adjacentTo="foo"/>
    <order state="foo" adjacentTo="foo"/>
    <order state="foo" adjacentTo="foo"/>
    <order state="foo" adjacentTo="foo"/>
  </lewisMk>
</dummyLikelihood>
```



### <code>&lt;dummyModel&gt;</code> element

A function wraps a component model that would otherwise not be registered with the MCMC. Always returns a log likelihood of zero.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<dummyModel>
  <diagonalMatrix>
    <dataFromTreeTips idref="dataFromTreeTips8">
  </diagonalMatrix>
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix1">
    <generalDataType idref="generalDataType3">
  </originDestinationDesignMatrix>
  <blockUpperTriangularMatrixParameter transpose="true" columnDimension="1" diagonalRestriction="true">
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser1">
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
  </blockUpperTriangularMatrixParameter>
  <leafTraitParameter taxon="foo" setBounds="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel10">
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix7">
  </leafTraitParameter>
</dummyModel>
```



### <code>&lt;duplicatedParameter&gt;</code> element

A duplicated parameter.

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;copies&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<duplicatedParameter>
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <designMatrix idref="designMatrix4">
    <extendedDataType idref="extendedDataType1">
  </originDestinationDesignMatrix>
  <copies>
    <productParameter idref="productParameter2">
  </copies>
</duplicatedParameter>
```



### <code>&lt;elementWiseMatrixMultiplicationParameter&gt;</code> element

Returns element wise matrix multiplication of a series of matrices

Example:

```html
<elementWiseMatrixMultiplicationParameter/>
```



### <code>&lt;ellipticalSliceSampler&gt;</code> element

An elliptical slice sampler for parameters with Gaussian priors.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>signalConstituentParameters</code> (optional) is of type [Boolean](#boolean)
: 

* <code>bracketAngle</code> (optional) is of type [Double](#double)
: 

* <code>translationInvariant</code> (optional) is of type [Boolean](#boolean)
: 

* <code>rotationInvariant</code> (optional) is of type [Boolean](#boolean)
: 

* <code>drawByRow</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* One of:
    * [GaussianProcessRandomGenerator](#gaussianprocessrandomgenerator) element (exactly one)

    * [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)


Example:

```html
<ellipticalSliceSampler weight="1.0" signalConstituentParameters="true" bracketAngle="1.0" translationInvariant="true" rotationInvariant="true" drawByRow="true">
  <productParameter>
    <jointParameter idref="jointParameter9">
  </productParameter>
  <normalDistributionModel>
    <mean>
      <matrixMatrixProduct idref="matrixMatrixProduct7">
    </mean>
    <precision>
      <productParameter idref="productParameter8">
    </precision>
  </normalDistributionModel>
</ellipticalSliceSampler>
```



### <code>&lt;emergingEpidemic&gt;</code> element

A self-consistent model of emerging epidemics.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;growthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;generationTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;generationShape&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;offspringDispersion&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;epidemicTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<emergingEpidemic units="substitutions">
  <growthRate>
    <compoundMatrixParameter idref="compoundMatrixParameter10">
  </growthRate>
  <generationTime>
    <maskedMatrixParameter idref="maskedMatrixParameter6">
  </generationTime>
  <generationShape>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
  </generationShape>
  <offspringDispersion>
    <productParameter idref="productParameter1">
  </offspringDispersion>
  <epidemicTree>
    <starTreeModel idref="starTreeModel7">
  </epidemicTree>
</emergingEpidemic>
```



### <code>&lt;empiricalCodonModel&gt;</code> element

This element represents the empirical model of codon evolution.

The element takes following attributes:

* <code>geneticCode</code> (optional) is of type [String](#string)
: "The genetic code to use"

* <code>ecmDataDir</code> (optional) is of type [String](#string)
: "The directory with the ECM data file"

* <code>ecmRateFile</code> (optional) is of type [String](#string)
: "The file with the ECM data matrix"

* <code>ecmFreqFile</code> (optional) is of type [String](#string)
: "The csv file with the ECM frequency matrix"

The element has the following contents:

* Element named <code>&lt;omega&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;kappaTsTv&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;multiNtChange&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<empiricalCodonModel geneticCode="universal" ecmDataDir="ecmdata" ecmRateFile="matrix.csv" ecmFreqFile="freqs.csv">
  <omega>
    <copyParameterValues idref="copyParameterValues4">
  </omega>
  <multiNtChange>
    <fastMatrixParameter idref="fastMatrixParameter7">
  </multiNtChange>
</empiricalCodonModel>
```



### <code>&lt;empiricalDistributionLikelihood&gt;</code> element

Calculates the likelihood of some data given some empirically-generated distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>splineInterpolation</code> (optional) is of type [Boolean](#boolean)
: 

* <code>degree</code> (optional) is of type [Integer](#integer)
: 

* <code>inverse</code> (optional) is of type [Boolean](#boolean)
: 

* <code>readByColumn</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;data&gt;</code>

    Containing:

    * <code>from</code> (optional) is of type [Integer](#integer)
: 

    * <code>to</code> (optional) is of type [Integer](#integer)
: 

    * <code>offset</code> (optional) is of type [Double](#double)
: 

    * <code>lower</code> (optional) is of type [Double](#double)
: 

    * <code>upper</code> (optional) is of type [Double](#double)
: 

    * [Statistic](#statistic) elements (one or more)

Example:

```html
<empiricalDistributionLikelihood fileName="foo" splineInterpolation="true" degree="1" inverse="true" readByColumn="true">
  <data from="1" to="1" offset="1.0" lower="1.0" upper="1.0">
    <complementParameter idref="complementParameter3">
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
    <thresholdStatistic idref="thresholdStatistic6">
  </data>
</empiricalDistributionLikelihood>
```



### <code>&lt;empiricalPiecewise&gt;</code> element

This element represents a piecewise population model

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;intervalWidths&gt;</code>

    Containing:

    * <code>values</code>  is of type [Double;](#double;)
: 

* Element named <code>&lt;populationSizes&gt;</code>
: The effective population sizes of each interval.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;generationLength&gt;</code>
: The scale factor.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;threshold&gt;</code>
: The threshold before counts occur.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;lag&gt;</code>
: The lag between actual population sizes and genetic diversity.

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<empiricalPiecewise units="generations">
  <intervalWidths values="0.5 1.0"/>
  <populationSizes>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter7">
  </populationSizes>
  <generationLength>
    <matrixParameter idref="matrixParameter2">
  </generationLength>
  <threshold>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
  </threshold>
  <lag>
    <differenceParameter idref="differenceParameter7">
  </lag>
</empiricalPiecewise>
```



### <code>&lt;empiricalTreeDistributionModel&gt;</code> element

Read a list of trees from a NEXUS file.

The element takes following attributes:

* <code>startingTree</code> (optional) is of type [Integer](#integer)
: 

* <code>iterate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fileName</code>  is of type [String](#string)
: "The name of a NEXUS tree file"

The element has the following contents:

* [TaxonList](#taxonlist) element (exactly one)

Example:

```html
<empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
  <ascertainedPatterns from="1" to="1" every="1">
    <convert idref="convert9">
  </ascertainedPatterns>
</empiricalTreeDistributionModel>
```



### <code>&lt;empiricalTreeDistributionOperator&gt;</code> element

Operator which switches between trees in an empirical distribution.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>metropolisHastings</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [EmpiricalTreeDistributionModel](#empiricaltreedistributionmodel) element (exactly one)

Example:

```html
<empiricalTreeDistributionOperator weight="1.0" metropolisHastings="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <rescaledTree idref="rescaledTree10">
  </empiricalTreeDistributionModel>
</empiricalTreeDistributionOperator>
```



### <code>&lt;epochBranchModel&gt;</code> element

This element provides a branch model which has multiple epoch. All branches (or portions of them) have the same substitution model within a given epoch. If parameters are used to sample transition times, these must be kept in ascending order by judicious use of bounds or priors.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)
: The tree across which the epochs will be assigned

* [SubstitutionModel](#substitutionmodel) element (exactly one)
: The ancestral substitution model after the last epoch

* Element named <code>&lt;epoch&gt;</code>
: An epoch that lasts until transitionTime

    Containing:

    * <code>transitionTime</code> (optional) is of type [Double](#double)
: "The time of transition between this epoch and the previous one"

    * [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model for this epoch

    * Element named <code>&lt;transitionTime&gt;</code>
: The transition time parameter for this epoch

        Containing:

        * [Parameter](#parameter) element (exactly one)

Example:

```html
<epochBranchModel>
  <treeModel fixHeights="true" fixTree="true">
    <rescaledTree idref="rescaledTree2">
    <rootHeight>
      <productParameter idref="productParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixMatrixProduct idref="matrixMatrixProduct10">
    </nodeHeights>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix8">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter10">
    </leafHeight>
    <leafHeight taxon="foo">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedMatrixParameter idref="maskedMatrixParameter6">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <productParameter idref="productParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <leafTraitParameter idref="leafTraitParameter3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter1">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter3">
    </leafTrait>
  </treeModel>
  <complexSubstitutionModel dataType="hiddenCodon2-universal" randomizeIndicator="true" bssvsTolerance="1.0" bssvsScalar="1.0" checkConditioning="true" normalized="true">
    <rootFrequencies>
      <frequencyModel idref="frequencyModel3">
    </rootFrequencies>
    <rates/>
  </complexSubstitutionModel>
  <epoch transitionTime="1.0">
    <markovModulatedYangCodonModel idref="markovModulatedYangCodonModel3">
  </epoch>
  <epoch transitionTime="1.0">
    <pcaCodonModel idref="pcaCodonModel9">
  </epoch>
</epochBranchModel>
```



### <code>&lt;exponentialStatistic&gt;</code> element

This element returns a statistic that is the element-wise exponentiation of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<exponentialStatistic>
  <mvPolyaLikelihood>
    <data>
      <mvPolyaLikelihood idref="mvPolyaLikelihood5">
    </data>
    <alpha>
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </alpha>
  </mvPolyaLikelihood>
</exponentialStatistic>
```



### <code>&lt;expansion&gt;</code> element

A demographic model of constant population size followed by exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ancestralPopulationProportion&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;growthRate&gt;</code>
: A value of zero represents a constant population size, negative values represent decline towards the present, positive numbers represents exponential growth towards the present. A random walk operator is recommended for this parameter with a starting value of 0.0 and no upper or lower limits.

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time.

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<expansion units="substitutions">
  <populationSize>
    <dataFromTreeTips idref="dataFromTreeTips7">
  </populationSize>
  <ancestralPopulationProportion>
    <mvPolyaLikelihood idref="mvPolyaLikelihood8">
  </ancestralPopulationProportion>
  <growthRate>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView9">
  </growthRate>
</expansion>
```



### <code>&lt;expConstExp&gt;</code> element

A demographic model of exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;relativePlateauSize&gt;</code>
: The size of plateau relative to modern population size.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;relTimeModGrowth&gt;</code>
: The time spanned by modern growth phase relative to time back to start of plateau phase.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;plateauStartTime&gt;</code>
: The time of the start of plateauPhase.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ancientGrowthRate&gt;</code>
: The growth rate of early growth phase

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<expConstExp units="generations">
  <populationSize>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
  </populationSize>
  <relativePlateauSize>
    <vectorSlice idref="vectorSlice8">
  </relativePlateauSize>
  <relTimeModGrowth>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter1">
  </relTimeModGrowth>
  <plateauStartTime>
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter3">
  </plateauStartTime>
  <ancientGrowthRate>
    <fastMatrixParameter idref="fastMatrixParameter2">
  </ancientGrowthRate>
</expConstExp>
```



### <code>&lt;exponentialDistributionModel&gt;</code> element

A model of an exponential distribution.

The element takes following attributes:

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;mean&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;mean&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<exponentialDistributionModel offset="1.0">
  <mean>
    <fastMatrixParameter idref="fastMatrixParameter1">
  </mean>
</exponentialDistributionModel>
```



### <code>&lt;exponentialExponential&gt;</code> element

A demographic model of exponential growth followed by a different exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ancestralGrowthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;transitionTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<exponentialExponential units="years">
  <populationSize>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser9">
  </populationSize>
  <growthRate>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
  </growthRate>
  <ancestralGrowthRate>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter7">
  </ancestralGrowthRate>
  <transitionTime>
    <fastMatrixParameter idref="fastMatrixParameter4">
  </transitionTime>
</exponentialExponential>
```



### <code>&lt;exponentialGrowth&gt;</code> element

A demographic model of exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;growthRate&gt;</code>
: A value of zero represents a constant population size, negative values represent decline towards the present, positive numbers represents exponential growth towards the present. A random walk operator is recommended for this parameter with a starting value of 0.0 and no upper or lower limits.

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time.

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<exponentialGrowth units="substitutions">
  <populationSize>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </populationSize>
  <doublingTime>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix7">
  </doublingTime>
</exponentialGrowth>
```



### <code>&lt;exponentialLogistic&gt;</code> element

A demographic model of exponential growth followed by logistic growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>alpha</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;logisticGrowthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;logisticShape&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;exponentialGrowthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;transitionTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<exponentialLogistic units="years" alpha="1.0">
  <populationSize>
    <dataFromTreeTips idref="dataFromTreeTips9">
  </populationSize>
  <logisticGrowthRate>
    <leafTraitParameter idref="leafTraitParameter1">
  </logisticGrowthRate>
  <logisticShape>
    <dataFromTreeTips idref="dataFromTreeTips1">
  </logisticShape>
  <exponentialGrowthRate>
    <dataFromTreeTips idref="dataFromTreeTips5">
  </exponentialGrowthRate>
  <transitionTime>
    <copyParameterValues idref="copyParameterValues3">
  </transitionTime>
</exponentialLogistic>
```



### <code>&lt;exponentialMarkovLikelihood&gt;</code> element

A continuous state, discrete time markov chain in which each new state is an exponentially distributed variable with a mean of the previous state.

The element takes following attributes:

* <code>jeffreys</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reverse</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;chainParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<exponentialMarkovLikelihood jeffreys="true" reverse="true">
  <chainParameter>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
  </chainParameter>
</exponentialMarkovLikelihood>
```



### <code>&lt;exponentialPrior&gt;</code> element

Calculates the prior probability of some data under a given exponential distribution.

The element takes following attributes:

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* One of:
    * <code>scale</code>  is of type [Double](#double)
: 

    * <code>mean</code>  is of type [Double](#double)
: 


* [Statistic](#statistic) elements (one or more)

Example:

```html
<exponentialPrior mean="1.0" offset="1.0">
  <gmrfPopSizeStatistic from="1.0" to="1.0" number="1" time="0.5 1.0">
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood1">
  </gmrfPopSizeStatistic>
</exponentialPrior>
```



### <code>&lt;exponentialSawtooth&gt;</code> element

A demographic model of succesive exponential growth and periodic population crashes.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthRate&gt;</code>
: The rate of exponential growth during the growth phase.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;wavelength&gt;</code>
: The wavelength between successive population crashes.

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;offset&gt;</code>
: The proportion of the last growth phase that is not achieved at the final sample time.

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<exponentialSawtooth units="years">
  <populationSize>
    <diagonalMatrix idref="diagonalMatrix8">
  </populationSize>
  <growthRate>
    <matrixVectorProductParameter idref="matrixVectorProductParameter2">
  </growthRate>
  <wavelength>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter7">
  </wavelength>
  <offset>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter7">
  </offset>
</exponentialSawtooth>
```



### <code>&lt;exponentialStatistic&gt;</code> element

This element returns a statistic that is the element-wise exponentiation of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<exponentialStatistic>
  <nodeHeightsStatistic name="foo">
    <starTreeModel idref="starTreeModel7">
  </nodeHeightsStatistic>
</exponentialStatistic>
```



### <code>&lt;expressionStatistic&gt;</code> element

This element returns a statistic that is the mean of the child statistics.

The element has the following contents:

* Element named <code>&lt;expression&gt;</code>

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;variables&gt;</code>

    Containing:

    * [Statistic](#statistic) elements (one or more)

Example:

```html
<expressionStatistic>
  <expression>
    foo
  </expression>
  <variables>
    <gmrfPopSizeStatistic idref="gmrfPopSizeStatistic3">
    <duplicatedParameter idref="duplicatedParameter6">
  </variables>
</expressionStatistic>
```



### <code>&lt;extendedDataType&gt;</code> element

This element represents an instance of the MutationDeathType which extends a base datatype with an additional "death" state.

The element takes following attributes:

* <code>dataType</code> (optional) is of type [String](#string)
: "Base datatype name"

The element has the following contents:

* [DataType](#datatype) element (zero or one)

* Element named <code>&lt;deathState&gt;</code>

    Containing:

    * <code>code</code>  is of type [String](#string)
: 

* Element named <code>&lt;extantState&gt;</code>

    Containing:

    * <code>code</code>  is of type [String](#string)
: 

: <ambiguity code="Z" states="XY"/>
Example:

```html
<extendedDataType dataType="codon-echinodermMitochondrial"/>
```



### <code>&lt;externalInternalBranchModel&gt;</code> element

This element provides a branch model which allows different substitution modelson internal and external branches of the tree.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)
: The tree

* [SubstitutionModel](#substitutionmodel) element (exactly one)
: The substitution model for internal branches

* Element named <code>&lt;externalBranches&gt;</code>

    Containing:

    * [SubstitutionModel](#substitutionmodel) element (exactly one)
: The external branch substitution model

Example:

```html
<externalInternalBranchModel>
  <starTreeModel>
    <argTreeModel idref="argTreeModel10">
    <rootHeight>
      <dataFromTreeTips idref="dataFromTreeTips5">
    </rootHeight>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundParameter idref="compoundParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter6">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <copyParameterValues idref="copyParameterValues3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView2">
    </leafTrait>
  </starTreeModel>
  <empiricalCodonModel geneticCode="invertebrateMitochondrial" ecmDataDir="ecmdata" ecmRateFile="matrix.csv" ecmFreqFile="freqs.csv">
    <omega>
      <productParameter idref="productParameter5">
    </omega>
    <multiNtChange>
      <diagonalMatrix idref="diagonalMatrix1">
    </multiNtChange>
  </empiricalCodonModel>
  <externalBranches>
    <aminoAcidModel idref="aminoAcidModel9">
  </externalBranches>
</externalInternalBranchModel>
```



### <code>&lt;externalLengthStatistic&gt;</code> element

A statistic that has as its value(s) the length of the external branch length(s) of a set of one or more taxa in a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [Taxa](#taxa) element (exactly one)

Example:

```html
<externalLengthStatistic name="foo">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork5">
    <rootHeight>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter8">
    </nodeHeights>
    <leafHeight taxon="foo">
      <designMatrix idref="designMatrix2">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixParameter idref="matrixParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <immutableParameter idref="immutableParameter6">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <compoundMatrixParameter idref="compoundMatrixParameter4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <diagonalMatrix idref="diagonalMatrix4">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <vectorSlice idref="vectorSlice7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues7">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <complementParameter idref="complementParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <fastMatrixParameter idref="fastMatrixParameter9">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak8">
    </outbreak>
  </partitionedTreeModel>
  <taxa>
    <apsp idref="apsp5">
    <apsp idref="apsp5">
  </taxa>
</externalLengthStatistic>
```



### <code>&lt;fastBlockUpperTriangularMatrixParameterParser&gt;</code> element

Returns a blockUpperTriangularMatrixParameter which is a compoundParameter which forces the last element to be of full length, the second to last element to be of full length-1, etc.

The element takes following attributes:

* <code>transpose</code> (optional) is of type [Boolean](#boolean)
: 

* <code>columns</code> (optional) is of type [Integer](#integer)
: 

* <code>rows</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<fastBlockUpperTriangularMatrixParameterParser transpose="true" columns="1" rows="1"/>
```



### <code>&lt;fastMatrixParameter&gt;</code> element

A fast matrix parameter constructed from a single parameter.

The element takes following attributes:

* <code>rows</code>  is of type [Integer](#integer)
: 

* <code>columns</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) elements (zero or more)

Example:

```html
<fastMatrixParameter rows="1" columns="1">
  <fastBlockUpperTriangularMatrixParameterParser transpose="true" columns="1" rows="1"/>
  <jointParameter>
    <maskedMatrixParameter idref="maskedMatrixParameter6">
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </jointParameter>
  <compoundParameter>
    <differenceParameter idref="differenceParameter4">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter7">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter1">
    <diagonalMatrix idref="diagonalMatrix9">
  </compoundParameter>
</fastMatrixParameter>
```



### <code>&lt;fireParameterChanged&gt;</code> element

This element returns a operator that forces the entire model likelihood recomputation

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<fireParameterChanged weight="1.0">
  <vectorSlice sliceDimension="1">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter1">
    <leafTraitParameter idref="leafTraitParameter8">
    <parameter idref="parameter8">
  </vectorSlice>
</fireParameterChanged>
```



### <code>&lt;fixedDriftModel&gt;</code> element

This element returns a relaxed drift model.

The element has the following contents:

* Element named <code>&lt;backboneDrift&gt;</code>
: backbone drift rate

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;otherDrift&gt;</code>
: other drift rate

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<fixedDriftModel>
  <backboneDrift>
    <fastMatrixParameter idref="fastMatrixParameter9">
  </backboneDrift>
  <otherDrift>
    <productParameter idref="productParameter3">
  </otherDrift>
</fixedDriftModel>
```



### <code>&lt;FixedNodeheightSubtreePruneRegraft&gt;</code> element

This element represents a FNPR operator. This operator swaps a random subtree with its uncle.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<FixedNodeheightSubtreePruneRegraft weight="1.0">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <upgmaTree idref="upgmaTree9">
    <rootHeight>
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter8">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter6">
    </nodeHeights>
    <leafHeight taxon="foo">
      <matrixParameter idref="matrixParameter6">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter7">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak3">
    </outbreak>
  </partitionedTreeModel>
</FixedNodeheightSubtreePruneRegraft>
```



### <code>&lt;flatGeoSpatialPrior&gt;</code> element

Calculates the likelihood of some data under a 2D geospatial distribution.

The element takes following attributes:

* <code>taxon</code> (optional) is of type [String](#string)
: 

* <code>inside</code> (optional) is of type [Boolean](#boolean)
: 

* <code>union</code> (optional) is of type [Boolean](#boolean)
: 

* <code>cache</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * <code>kmlFileName</code>  is of type [String](#string)
: 

    * [Polygon2D](#polygon2d) elements (one or more)


* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<flatGeoSpatialPrior taxon="foo" inside="true" union="true" cache="true" kmlFileName="foo">
  <data>
    <compoundParameter idref="compoundParameter6">
    <matrixParameter idref="matrixParameter10">
    <jointParameter idref="jointParameter9">
  </data>
</flatGeoSpatialPrior>
```



### <code>&lt;frequencyModel&gt;</code> element

A model of equilibrium base frequencies.

The element takes following attributes:

* <code>composition</code> (optional) is of type [String](#string)
: "Composition type"

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>compress</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [PatternList](#patternlist) element (zero or one)
: Initial value

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<frequencyModel composition="3x4" normalize="true" compress="true" dataType="codon-mycoplasma">
  <frequencies>
    <matrixMatrixProduct idref="matrixMatrixProduct5">
  </frequencies>
</frequencyModel>
```



### <code>&lt;gammaDistributionModel&gt;</code> element

The gamma probability distribution.

The element takes following attributes:

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;shape&gt;</code>
: Shape parameter

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;scale&gt;</code>
: Scale parameter

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;rate&gt;</code>
: Rate parameter

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;mean&gt;</code>
: Mean parameter

    Containing:

    * [Parameter](#parameter) element (zero or one)

Example:

```html
<gammaDistributionModel offset="1.0">
  <shape/>
</gammaDistributionModel>
```



### <code>&lt;gammaPrior&gt;</code> element

Calculates the prior probability of some data under a given gamma distribution.

The element takes following attributes:

* <code>shape</code>  is of type [Double](#double)
: 

* <code>scale</code>  is of type [Double](#double)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<gammaPrior shape="1.0" scale="1.0" offset="1.0">
  <monotonicStatistic order="foo" strictlyMonotic="true">
    <diagonalMatrix idref="diagonalMatrix3">
    <differenceStatistic idref="differenceStatistic8">
    <treeLengthStatistic idref="treeLengthStatistic8">
    <copyParameterValues idref="copyParameterValues1">
  </monotonicStatistic>
  <subStatistic dimension="1 2 4 8">
    <matrixParameter idref="matrixParameter4">
  </subStatistic>
  <elementWiseMatrixMultiplicationParameter/>
</gammaPrior>
```



### <code>&lt;gammaReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under a given normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<gammaReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <negativeStatistic>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser10">
  </negativeStatistic>
  <continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood8">
  </continuousDiffusionStatistic>
</gammaReferencePrior>
```



### <code>&lt;gammaReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under a given normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<gammaReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <complementParameter>
    <mvPolyaLikelihood idref="mvPolyaLikelihood9">
  </complementParameter>
  <parameter value="0.5 1.0" dimension="1" fileName="foo" parameterColumn="foo" burnin="1" upper="0.5 1.0" lower="0.5 1.0"/>
</gammaReferencePrior>
```



### <code>&lt;gaussianProcessFromTree&gt;</code> element

Returns a random draw of traits given a trait model and a prior

The element has the following contents:

* [FullyConjugateMultivariateTraitLikelihood](#fullyconjugatemultivariatetraitlikelihood) element (exactly one)

Example:

```html
<gaussianProcessFromTree>
  ERROR!
</gaussianProcessFromTree>
```



### <code>&lt;gaussianProcessOperator&gt;</code> element

This element returns a multivariate normal random walk operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>translationInvariant</code> (optional) is of type [Boolean](#boolean)
: 

* <code>rotationInvariant</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [GaussianProcessRandomGenerator](#gaussianprocessrandomgenerator) element (exactly one)

Example:

```html
<gaussianProcessOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" translationInvariant="true" rotationInvariant="true">
  <buildCompoundSymmetricMatrix/>
  <normalDistributionModel>
    <mean>
      1.0
    </mean>
    <precision>
      <differenceParameter idref="differenceParameter9">
    </precision>
  </normalDistributionModel>
</gaussianProcessOperator>
```



### <code>&lt;generalDataType&gt;</code> element

Defines a general DataType for any number of states

The element has the following contents:

* [Identifiable](#identifiable) elements (zero or more)

: <state code="X"/>
: <alias code="Y" state="X"/>
: <ambiguity code="Z" states="XY"/>
Example:

```html
<!-- The XML for a nucleotide data type under this scheme would be -->
<generalDataType id="nucleotides">
	<state code="A"/>
	<state code="C"/>
	<state code="G"/>
	<state code="T"/>
	<alias code="U" state="T"/>
	<ambiguity code="R" states="AG"/>
	<ambiguity code="Y" states="CT"/>
	<ambiguity code="?" states="ACGT"/>
	<ambiguity code="-" states="ACGT"/>
</generalDataType>
```



### <code>&lt;generalizedSkylineGibbsOperator&gt;</code> element

This element returns a Gibbs operator for the joint distribution of population sizes.

The element takes following attributes:

* <code>linear</code> (optional) is of type [Boolean](#boolean)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>lower</code>  is of type [Double](#double)
: 

* <code>upper</code>  is of type [Double](#double)
: 

* <code>Jeffreys</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reverse</code> (optional) is of type [Boolean](#boolean)
: 

* <code>exponentialMarkov</code> (optional) is of type [Boolean](#boolean)
: 

* <code>shape</code>  is of type [Double](#double)
: 

The element has the following contents:

* [BayesianSkylineLikelihood](#bayesianskylinelikelihood) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<generalizedSkylineGibbsOperator linear="true" weight="1.0" lower="1.0" upper="1.0" Jeffreys="true" reverse="true" exponentialMarkov="true" shape="1.0">
  <generalizedSkyLineLikelihood linear="true">
    <populationSizes>
      <differenceMatrixParameter idref="differenceMatrixParameter2">
    </populationSizes>
    <groupSizes>
      <jointParameter idref="jointParameter6">
    </groupSizes>
    <populationTree>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
    </populationTree>
  </generalizedSkyLineLikelihood>
  <matrixParameter rows="1" columns="1" transpose="true" asCompoundParameter="true" test="true">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter4">
  </matrixParameter>
</generalizedSkylineGibbsOperator>
```



### <code>&lt;generalizedSkyLineLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element has the following contents:

* One of:
    * <code>linear</code>  is of type [Boolean](#boolean)
: 

    * <code>type</code>  is of type [String](#string)
: 


* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;groupSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<generalizedSkyLineLikelihood linear="true">
  <populationSizes>
    <fastMatrixParameter idref="fastMatrixParameter7">
  </populationSizes>
  <groupSizes>
    <mvPolyaLikelihood idref="mvPolyaLikelihood1">
  </groupSizes>
  <populationTree>
    <starTreeModel idref="starTreeModel2">
  </populationTree>
</generalizedSkyLineLikelihood>
```



### <code>&lt;generalizedSkylinePopSizeStatistic&gt;</code> element

The pop sizes at the given times

Example:

```html
<generalizedSkylinePopSizeStatistic/>
```



### <code>&lt;generalizedSteppingStoneSamplingAnalysis&gt;</code> element

Performs a trace analysis.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately)"

* <code>resultsFileName</code> (optional) is of type [String](#string)
: "The name of the output file to which the generalized stepping-stone sampling estimate will be written"

The element has the following contents:

* Element named <code>&lt;thetaColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

* Element named <code>&lt;sourceColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

* Element named <code>&lt;destinationColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<generalizedSteppingStoneSamplingAnalysis fileName="foo" resultsFileName="foo">
  <thetaColumn name="foo"/>
  <sourceColumn name="foo"/>
  <destinationColumn name="foo"/>
</generalizedSteppingStoneSamplingAnalysis>
```



### <code>&lt;generalSubstitutionModel&gt;</code> element

A general reversible model of sequence substitution for any data type.

The element takes following attributes:

* <code>randomizeIndicator</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;rates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<generalSubstitutionModel randomizeIndicator="true">
  <hiddenNucleotides classCount="1"/>
  <frequencies>
    <frequencyModel idref="frequencyModel3">
  </frequencies>
  <rates>
    <vectorSlice idref="vectorSlice2">
  </rates>
</generalSubstitutionModel>
```



### <code>&lt;geoDistributionCollection&gt;</code> element

An operator that picks new parameter values uniformly at random.

The element has the following contents:

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) elements (zero or more)

* [CachedDistributionLikelihood](#cacheddistributionlikelihood) elements (zero or more)

Example:

```html
<geoDistributionCollection>
  <multivariateNormalPrior>
    <meanParameter>
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </meanParameter>
    <precisionParameter>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
    </precisionParameter>
    <composedTransform idref="composedTransform4">
  </multivariateNormalPrior>
  <dirichletPrior alpha="0.5 1.0" sumsTo="1.0">
    <ratioStatistic idref="ratioStatistic1">
    <popGraph idref="popGraph8">
    <reciprocalStatistic idref="reciprocalStatistic5">
  </dirichletPrior>
  <multivariateDistributionLikelihood dataAsMatrix="true">
    <distribution>
      <treeTraitNormalDistribution idref="treeTraitNormalDistribution8">
    </distribution>
    <transform idref="transform2">
    <inverseTransform idref="inverseTransform10">
  </multivariateDistributionLikelihood>
  ERROR!
</geoDistributionCollection>
```



### <code>&lt;GibbsIndependentCoalescentOperator&gt;</code> element

This element returns an independence coalescent sampler, disguised as a Gibbs operator, from a demographic model.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Taxa](#taxa) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

* [DemographicModel](#demographicmodel) element (exactly one)

* [CoalescentLikelihood](#coalescentlikelihood) element (exactly one)

Example:

```html
<GibbsIndependentCoalescentOperator weight="1.0">
  <taxa>
    <taxa idref="taxa5">
  </taxa>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <partitionedTreeModel idref="partitionedTreeModel3">
    <rootHeight>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter3">
    </nodeHeights>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter7">
    </leafHeight>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix2">
    </leafHeight>
    <leafHeight taxon="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter8">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <immutableParameter idref="immutableParameter3">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </nodeRates>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak3">
    </outbreak>
  </partitionedTreeModel>
  <constantLogistic units="years" alpha="1.0">
    <populationSize>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView4">
    </populationSize>
    <ancestralPopulationSize>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser8">
    </ancestralPopulationSize>
    <growthRate>
      <parameter idref="parameter6">
    </growthRate>
    <shape>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
    </shape>
  </constantLogistic>
  <coalescentLikelihood>
    <model>
      <transmissionModel idref="transmissionModel8">
    </model>
    <populationTree factor="1.0">
      <starTreeModel idref="starTreeModel8">
    </populationTree>
    <populationTree factor="1.0">
      <treeModel idref="treeModel5">
    </populationTree>
    <populationTree factor="1.0">
      <treeModel idref="treeModel10">
    </populationTree>
  </coalescentLikelihood>
</GibbsIndependentCoalescentOperator>
```



### <code>&lt;GibbsIndependentGammaOperator&gt;</code> element

This element returns an independence sampler, disguised as a Gibbs operator, from a provided gamma prior.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>shape</code>  is of type [Double](#double)
: 

* <code>scale</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<GibbsIndependentGammaOperator weight="1.0" shape="1.0" scale="1.0">
  <hiddenClassRewardParameter class="1" name="foo">
    <markovModulatedSubstitutionModel idref="markovModulatedSubstitutionModel8">
  </hiddenClassRewardParameter>
</GibbsIndependentGammaOperator>
```



### <code>&lt;GibbsIndependentNormalDistributionOperator&gt;</code> element

This element returns an independence sampler, disguised as a Gibbs operator, from a provided normal distribution model.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [NormalDistributionModel](#normaldistributionmodel) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<GibbsIndependentNormalDistributionOperator weight="1.0">
  <normalDistributionModel>
    <mean>
      <parameter idref="parameter10">
    </mean>
    <precision>
      <duplicatedParameter idref="duplicatedParameter1">
    </precision>
  </normalDistributionModel>
  <compoundMatrixParameter>
    <mvPolyaLikelihood idref="mvPolyaLikelihood5">
    <dataFromTreeTips idref="dataFromTreeTips7">
    <maskedMatrixParameter idref="maskedMatrixParameter3">
  </compoundMatrixParameter>
</GibbsIndependentNormalDistributionOperator>
```



### <code>&lt;GibbsPruneAndRegraft&gt;</code> element

This element represents a Gibbs sampler implemented through a prune and regraft operator. This operator prunes a random subtree and regrafts it below a node chosen by an importance distribution which is the proportion of the likelihoods of the proposals.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>pruned</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<GibbsPruneAndRegraft weight="1.0" pruned="true">
  <treeModel fixHeights="true" fixTree="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
    <rootHeight>
      <differenceParameter idref="differenceParameter2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundParameter idref="compoundParameter10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixParameter idref="matrixParameter3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter6">
    </nodeHeights>
    <leafHeight taxon="foo">
      <maskedParameter idref="maskedParameter10">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixParameter idref="matrixParameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision3">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
    </nodeTraits>
    <leafTrait taxon="foo" name="foo">
      <duplicatedParameter idref="duplicatedParameter2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <diagonalMatrix idref="diagonalMatrix10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <productParameter idref="productParameter7">
    </leafTrait>
  </treeModel>
</GibbsPruneAndRegraft>
```



### <code>&lt;gibbsSampleMissingTraitsOperator&gt;</code> element

This element returns an independence coalescent sampler from a demographic model.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>traitName</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeDataLikelihood](#treedatalikelihood) element (exactly one)

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;missingIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<gibbsSampleMissingTraitsOperator weight="1.0" traitName="foo">
  <newTreeDataLikelihood useAmbiguities="true" scalingScheme="foo">
    <maskedPatterns idref="maskedPatterns1">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
  </newTreeDataLikelihood>
  <fastMatrixParameter rows="1" columns="1">
    <immutableParameter idref="immutableParameter3">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
    <parameter idref="parameter7">
    <parameter idref="parameter4">
  </fastMatrixParameter>
  <missingIndicator>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
  </missingIndicator>
</gibbsSampleMissingTraitsOperator>
```



### <code>&lt;GibbsSubtreeSwap&gt;</code> element

This element represents a Gibbs wide exchange operator. This operator swaps two subtrees chosen to their posterior probaility.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>pruned</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<GibbsSubtreeSwap weight="1.0" pruned="true">
  <starTreeModel>
    <rescaledTree idref="rescaledTree10">
    <rootHeight>
      <jointParameter idref="jointParameter1">
    </rootHeight>
    <leafHeight taxon="foo">
      <jointParameter idref="jointParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser8">
    </leafHeight>
  </starTreeModel>
</GibbsSubtreeSwap>
```



### <code>&lt;glmModel&gt;</code> element

Calculates the generalized linear model likelihood of the dependent parameters given one or more blocks of independent parameters and their design matrix.

The element takes following attributes:

* <code>family</code>  is of type [String](#string)
: 

* <code>checkIdentifiability</code> (optional) is of type [Boolean](#boolean)
: 

* <code>checkFullRank</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;dependentVariables&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;independentVariables&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

    * [DesignMatrix](#designmatrix) element (exactly one)

    * Element named <code>&lt;indicator&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;randomEffects&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<glmModel family="foo" checkIdentifiability="true" checkFullRank="true">
  <independentVariables>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
  </independentVariables>
  <independentVariables>
    <designMatrix idref="designMatrix5">
  </independentVariables>
  <randomEffects>
    <productParameter idref="productParameter4">
  </randomEffects>
  <randomEffects>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser5">
  </randomEffects>
</glmModel>
```



### <code>&lt;glmModelNew&gt;</code> element

Calculates the generalized linear model likelihood of the dependent parameters given one or more blocks of independent parameters and their design matrix.

The element takes following attributes:

* <code>checkIdentifiability</code> (optional) is of type [Boolean](#boolean)
: 

* <code>checkFullRank</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;model&gt;</code>

    Containing:

    * <code>linkFunction</code>  is of type [String](#string)
: 

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;dependentVariables&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;independentVariables&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

    * [DesignMatrix](#designmatrix) element (exactly one)

    * Element named <code>&lt;indicator&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;randomEffects&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<glmModelNew checkIdentifiability="true" checkFullRank="true">
  <model linkFunction="foo">
    <scaledBetaDistributionModel idref="scaledBetaDistributionModel1">
  </model>
  <dependentVariables>
    <productParameter idref="productParameter8">
  </dependentVariables>
  <independentVariables>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix7">
  </independentVariables>
  <randomEffects>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
  </randomEffects>
  <randomEffects>
    <parameter idref="parameter6">
  </randomEffects>
</glmModelNew>
```



### <code>&lt;glmSubstitutionModel&gt;</code> element

A general model of sequence substitution for any data type where the rates come from the generalized linear model.

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* Element named <code>&lt;rootFrequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* [GeneralizedLinearModel](#generalizedlinearmodel) element (exactly one)

Example:

```html
<glmSubstitutionModel dataType="codon-noStops">
  <rootFrequencies>
    <frequencyModel idref="frequencyModel8">
  </rootFrequencies>
  <multivariateOUModel>
    <positiveDefiniteSubstitutionModel idref="positiveDefiniteSubstitutionModel7">
    <maskedMatrixParameter idref="maskedMatrixParameter3">
    <data>
      <sumParameter idref="sumParameter9">
    </data>
    <times>
      <matrixVectorProductParameter idref="matrixVectorProductParameter10">
    </times>
    <design>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    </design>
    <independentVariables>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
    </independentVariables>
  </multivariateOUModel>
</glmSubstitutionModel>
```



### <code>&lt;glmSubstitutionModelNew&gt;</code> element

A general model of sequence substitution for any data type where the rates come from the generalized linear model.

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* Element named <code>&lt;rootFrequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* [GeneralizedLinearModel](#generalizedlinearmodel) element (exactly one)

Example:

```html
<glmSubstitutionModelNew dataType="hiddenAminoAcid1">
  <rootFrequencies>
    <frequencyModel idref="frequencyModel5">
  </rootFrequencies>
  <glmModelNew checkIdentifiability="true" checkFullRank="true">
    <model linkFunction="foo">
      <poissonDistributionModel idref="poissonDistributionModel9">
    </model>
    <dependentVariables>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
    </dependentVariables>
    <independentVariables>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </independentVariables>
    <independentVariables>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </independentVariables>
    <randomEffects>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
    </randomEffects>
    <randomEffects>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix1">
    </randomEffects>
  </glmModelNew>
</glmSubstitutionModelNew>
```



### <code>&lt;gmrfBivariateCurveAnalysis&gt;</code> element

Integrates two curves

The element takes following attributes:

* <code>fileName1</code>  is of type [String](#string)
: 

* <code>fileName2</code>  is of type [String](#string)
: 

* <code>endTime</code>  is of type [String](#string)
: 

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<gmrfBivariateCurveAnalysis fileName1="foo" fileName2="foo" endTime="foo" burnIn="1"/>
```



### <code>&lt;gmrfBlockUpdateOperator&gt;</code> element

This element returns a GMRF block-update operator for the joint distribution of the population sizes and precision parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>stopValue</code> (optional) is of type [Double](#double)
: 

* <code>maxIterations</code> (optional) is of type [Integer](#integer)
: 

* <code>oldSkyride</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [GMRFSkyrideLikelihood](#gmrfskyridelikelihood) element (exactly one)

Example:

```html
<gmrfBlockUpdateOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" stopValue="1.0" maxIterations="1" oldSkyride="true">
  <gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
    <populationSizes>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision3">
    </populationSizes>
    <precisionParameter>
      <productParameter idref="productParameter9">
    </precisionParameter>
    <populationTree>
      <starTreeModel idref="starTreeModel3">
    </populationTree>
  </gmrfSkyrideLikelihood>
</gmrfBlockUpdateOperator>
```



### <code>&lt;gmrfFixedEffectsGibbsOperator&gt;</code> element

This element returns a Gibbs operator for regression coefficients in a GMRF.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

* [Parameter](#parameter) element (exactly one)

* [GMRFSkyrideLikelihood](#gmrfskyridelikelihood) element (exactly one)

Example:

```html
<gmrfFixedEffectsGibbsOperator weight="1.0">
  <treeTraitNormalDistributionLikelihood>
    <treeTraitNormalDistribution idref="treeTraitNormalDistribution10">
    <data>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter9">
      <compoundParameter idref="compoundParameter5">
      <diagonalMatrix idref="diagonalMatrix10">
      <designMatrix idref="designMatrix4">
    </data>
  </treeTraitNormalDistributionLikelihood>
  <elementWiseMatrixMultiplicationParameter/>
  <gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
    <populationSizes>
      <matrixParameter idref="matrixParameter8">
    </populationSizes>
    <precisionParameter>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix8">
    </precisionParameter>
    <populationTree>
      <partitionedTreeModel idref="partitionedTreeModel10">
      <partitionedTreeModel idref="partitionedTreeModel4">
      <partitionedTreeModel idref="partitionedTreeModel7">
      <treeModel idref="treeModel9">
    </populationTree>
  </gmrfSkyrideLikelihood>
</gmrfFixedEffectsGibbsOperator>
```



### <code>&lt;gmrfBlockUpdateOperator&gt;</code> element

This element returns a GMRF block-update operator for the joint distribution of the population sizes and precision parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>stopValue</code> (optional) is of type [Double](#double)
: 

* <code>maxIterations</code> (optional) is of type [Integer](#integer)
: 

* <code>oldSkyride</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [GMRFSkyrideLikelihood](#gmrfskyridelikelihood) element (exactly one)

Example:

```html
<gmrfBlockUpdateOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" stopValue="1.0" maxIterations="1" oldSkyride="true">
  <gmrfTestLikelihood>
    <populationSizes>
      <duplicatedParameter idref="duplicatedParameter5">
    </populationSizes>
    <precisionParameter>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter5">
    </precisionParameter>
    <lambdaParameter>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision8">
    </lambdaParameter>
  </gmrfTestLikelihood>
</gmrfBlockUpdateOperator>
```



### <code>&lt;gmrfHeightsStatistic&gt;</code> element

A statistic that returns the heights of each internal node in increasing order (or groups them by a group size parameter)

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [GMRFSkyrideLikelihood](#gmrfskyridelikelihood) element (exactly one)

Example:

```html
<gmrfHeightsStatistic name="foo">
  <gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
    <populationSizes>
      <matrixParameter idref="matrixParameter3">
    </populationSizes>
    <precisionParameter>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </precisionParameter>
    <populationTree>
      <partitionedTreeModel idref="partitionedTreeModel10">
    </populationTree>
  </gmrfSkyrideLikelihood>
</gmrfHeightsStatistic>
```



### <code>&lt;gmrfPopSizeStatistic&gt;</code> element

The pop sizes at the given times

The element takes following attributes:

* <code>from</code> (optional) is of type [Double](#double)
: 

* <code>to</code> (optional) is of type [Double](#double)
: 

* <code>number</code> (optional) is of type [Integer](#integer)
: 

* <code>time</code> (optional) is of type [Double;](#double;)
: 

The element has the following contents:

* [GMRFSkyrideLikelihood](#gmrfskyridelikelihood) element (exactly one)

Example:

```html
<gmrfPopSizeStatistic from="1.0" to="1.0" number="1" time="0.5 1.0">
  <gmrfTestLikelihood>
    <populationSizes>
      <compoundMatrixParameter idref="compoundMatrixParameter6">
    </populationSizes>
    <precisionParameter>
      <differenceMatrixParameter idref="differenceMatrixParameter2">
    </precisionParameter>
    <lambdaParameter>
      <designMatrix idref="designMatrix2">
    </lambdaParameter>
  </gmrfTestLikelihood>
</gmrfPopSizeStatistic>
```



### <code>&lt;gmrfSkyrideLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element takes following attributes:

* <code>rescaleByRootHeight</code> (optional) is of type [Boolean](#boolean)
: 

* <code>randomizeTree</code> (optional) is of type [Boolean](#boolean)
: 

* <code>timeAwareSmoothing</code> (optional) is of type [Boolean](#boolean)
: 

* <code>oldSkyride</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;phiParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (one or more)

* Element named <code>&lt;groupSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;singleBeta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
  <populationSizes>
    <compoundParameter idref="compoundParameter5">
  </populationSizes>
  <precisionParameter>
    <leafTraitParameter idref="leafTraitParameter9">
  </precisionParameter>
  <populationTree>
    <treeModel idref="treeModel5">
    <partitionedTreeModel idref="partitionedTreeModel10">
    <partitionedTreeModel idref="partitionedTreeModel7">
  </populationTree>
</gmrfSkyrideLikelihood>
```



### <code>&lt;gmrfSkyrideLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element takes following attributes:

* <code>rescaleByRootHeight</code> (optional) is of type [Boolean](#boolean)
: 

* <code>randomizeTree</code> (optional) is of type [Boolean](#boolean)
: 

* <code>timeAwareSmoothing</code> (optional) is of type [Boolean](#boolean)
: 

* <code>oldSkyride</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;phiParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (one or more)

* Element named <code>&lt;groupSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;singleBeta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
  <populationSizes>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
  </populationSizes>
  <precisionParameter>
    <immutableParameter idref="immutableParameter4">
  </precisionParameter>
  <populationTree>
    <partitionedTreeModel idref="partitionedTreeModel4">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
  </populationTree>
</gmrfSkyrideLikelihood>
```



### <code>&lt;gmrfTestLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;lambdaParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<gmrfTestLikelihood>
  <populationSizes>
    <differenceMatrixParameter idref="differenceMatrixParameter5">
  </populationSizes>
  <precisionParameter>
    <matrixVectorProductParameter idref="matrixVectorProductParameter1">
  </precisionParameter>
  <lambdaParameter>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView2">
  </lambdaParameter>
</gmrfTestLikelihood>
```



### <code>&lt;gradient&gt;</code> element

null

The element has the following contents:

* One of:
    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)

    * [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)


Example:

```html
<gradient>
  <multivariateNormalPrior>
    <meanParameter>
      <maskedParameter idref="maskedParameter3">
    </meanParameter>
    <precisionParameter>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView3">
    </precisionParameter>
  </multivariateNormalPrior>
</gradient>
```



### <code>&lt;greatCircleDiffusionModel&gt;</code> element

Describes a bivariate diffusion process using great circle distances.

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;diffusionCoefficient&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<greatCircleDiffusionModel>
  <maskedMatrixParameter complement="true" from="1" to="1" every="1">
    <mvPolyaLikelihood idref="mvPolyaLikelihood10">
  </maskedMatrixParameter>
</greatCircleDiffusionModel>
```



### <code>&lt;gtrModel&gt;</code> element

A general reversible model of nucleotide sequence substitution.

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;rates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateAC&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

* Element named <code>&lt;rateAG&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

* Element named <code>&lt;rateAT&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

* Element named <code>&lt;rateCG&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

* Element named <code>&lt;rateCT&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

* Element named <code>&lt;rateGT&gt;</code>

    Containing:

    * [Variable](#variable) element (exactly one)

Example:

```html
<!-- A general time reversible model for DNA.                                          -->
<!-- This element must have parameters for exactly five of the six rates               -->
<!-- The sixth rate has an implied value of 1.0 and all other rates are relative to it -->
<!-- This example parameterizes the rate matrix relative to the A<->G transition       -->
<gtrModel id="gtr1">
	<frequencies> <frequencyModel idref="freqs"/> </frequencies>
	<rateAC> <parameter id="rateAC" value="1.0"/> </rateAC>
	<rateAT> <parameter id="rateAT" value="1.0"/> </rateAT>
	<rateCG> <parameter id="rateCG" value="1.0"/> </rateCG>
	<rateCT> <parameter id="rateCT" value="1.0"/> </rateCT>
	<rateGT> <parameter id="rateGT" value="1.0"/> </rateGT>
</gtrModel>
```



### <code>&lt;halfNormalPrior&gt;</code> element

Calculates the prior probability of some data under a given half-normal distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>stdev</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<halfNormalPrior mean="1.0" stdev="1.0">
  <gmrfPopSizeStatistic from="1.0" to="1.0" number="1" time="0.5 1.0">
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood3">
  </gmrfPopSizeStatistic>
  <treeMetricStatistic name="foo" type="foo">
    <target>
      <treeModel idref="treeModel6">
    </target>
    <reference>
      <neighborJoiningTree idref="neighborJoiningTree8">
    </reference>
  </treeMetricStatistic>
  <argReassortmentNodeCount name="foo">
    <argTreeModel idref="argTreeModel4">
  </argReassortmentNodeCount>
</halfNormalPrior>
```



### <code>&lt;halfTPrior&gt;</code> element

Calculates the prior probability of some data under a given half-T distribution.

The element takes following attributes:

* <code>scale</code>  is of type [Double](#double)
: 

* <code>df</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<halfTPrior scale="1.0" df="1.0">
  <diffusionRateCovarianceStatistic name="foo" greatCircleDistance="true" diffusionCoefficient="true">
    <starTreeModel idref="starTreeModel2">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood6">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood3">
    <inhibitionLikelihood idref="inhibitionLikelihood8">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood2">
  </diffusionRateCovarianceStatistic>
</halfTPrior>
```



### <code>&lt;HamiltonianMonteCarloOperator&gt;</code> element

Returns a Hamiltonian Monte Carlo transition kernel

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>nSteps</code>  is of type [Integer](#integer)
: 

* <code>stepSize</code>  is of type [Double](#double)
: 

* <code>drawVariance</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>mode</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [Transform$MultivariableTransformWithParameter](#transform$multivariabletransformwithparameter) element (zero or one)

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) element (exactly one)

Example:

```html
<HamiltonianMonteCarloOperator weight="1.0" nSteps="1" stepSize="1.0" drawVariance="1.0" autoOptimize="true" mode="1">
  <approximateFactorAnalysisPrecision>
    <L>
      <designMatrix idref="designMatrix9">
    </L>
    <gamma>
      <matrixParameter idref="matrixParameter10">
    </gamma>
  </approximateFactorAnalysisPrecision>
  <gradient>
    <multivariateNormalPrior idref="multivariateNormalPrior2">
  </gradient>
</HamiltonianMonteCarloOperator>
```



### <code>&lt;harmonicMeanAnalysis&gt;</code> element

Performs a trace analysis. Estimates the mean of the various statistics in the given log file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

* <code>bootstrapLength</code> (optional) is of type [Integer](#integer)
: 

* <code>smoothedEstimate</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<harmonicMeanAnalysis fileName="foo" burnIn="1" bootstrapLength="1" smoothedEstimate="true">
  <likelihoodColumn name="foo"/>
</harmonicMeanAnalysis>
```



### <code>&lt;hiddenClassRewardParameter&gt;</code> element

Generates a reward parameter to log hidden classes in Markov-modulated substitutionProcess

The element takes following attributes:

* <code>class</code>  is of type [Integer](#integer)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [MarkovModulatedSubstitutionModel](#markovmodulatedsubstitutionmodel) element (exactly one)

Example:

```html
<hiddenClassRewardParameter class="1" name="foo">
  <markovModulatedSubstitutionModel dataType="foo" geometricRates="true" renormalize="true">
    <switchingRates>
      <fastMatrixParameter idref="fastMatrixParameter8">
    </switchingRates>
    <lewisMk idref="lewisMk5">
    <hkyModel idref="hkyModel9">
    <yangCodonModel idref="yangCodonModel6">
  </markovModulatedSubstitutionModel>
</hiddenClassRewardParameter>
```



### <code>&lt;hiddenNucleotides&gt;</code> element

A nucleotide data type that allows hidden substitution classes

The element takes following attributes:

* <code>classCount</code>  is of type [Integer](#integer)
: 

Example:

```html
<hiddenNucleotides classCount="1"/>
```



### <code>&lt;HierarchicalBitFlipOperator&gt;</code> element

This element returns a bit-flip operator on a set of hierarchical and strata parameters simulatneously.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>usesPriorOnSum</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;hParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;strataParameters&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<HierarchicalBitFlipOperator weight="1.0" usesPriorOnSum="true">
  <hParameter>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
  </hParameter>
  <strataParameters>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter6">
    <matrixVectorProductParameter idref="matrixVectorProductParameter4">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter10">
  </strataParameters>
</HierarchicalBitFlipOperator>
```



### <code>&lt;hierarchicalGraphLikelihood&gt;</code> element

Calculates the likelihood of strata graph given hierarchical graph and p.

The element has the following contents:

* Element named <code>&lt;hierarchicalIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;strataIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

* Element named <code>&lt;prob&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<hierarchicalGraphLikelihood>
  <hierarchicalIndicator>
    <maskedMatrixParameter idref="maskedMatrixParameter3">
  </hierarchicalIndicator>
  <strataIndicator>
    <maskedMatrixParameter idref="maskedMatrixParameter10">
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix4">
    <parameter idref="parameter7">
    <jointParameter idref="jointParameter7">
  </strataIndicator>
  <prob>
    <matrixVectorProductParameter idref="matrixVectorProductParameter2">
  </prob>
</hierarchicalGraphLikelihood>
```



### <code>&lt;hierarchicalPartitionLikelihood&gt;</code> element

null

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<hierarchicalPartitionLikelihood>
  <argTreeModel partitionType="reassortment">
    <rescaledTree idref="rescaledTree2">
    <rootHeight>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixMatrixProduct idref="matrixMatrixProduct5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedParameter idref="maskedParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice6">
    </nodeHeights>
  </argTreeModel>
</hierarchicalPartitionLikelihood>
```



### <code>&lt;hierarchicalTransmissionModel&gt;</code> element

A SiteModel that has a gamma distributed rates across sites

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>hostCount</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;constant&gt;</code>

        Containing:

        * Element named <code>&lt;populationSize&gt;</code>
: This parameter represents the carrying capacity (maximum population size). If the shape is very large then the current day population size will be very close to the carrying capacity.

            Containing:

            * [Parameter](#parameter) element (exactly one)

    * One of:
        * Element named <code>&lt;exponential&gt;</code>

            Containing:

            * One of:
                * Element named <code>&lt;growthRate&gt;</code>
: This parameter determines the rate of growth during the exponential phase. See exponentialGrowth for details.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)

                * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time at peak growth rate.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)


            * Element named <code>&lt;ancestralProportion&gt;</code>
: This parameter determines the populaation size at transmission.

                Containing:

                * [Parameter](#parameter) element (exactly one)

        * Element named <code>&lt;logistic&gt;</code>

            Containing:

            * Element named <code>&lt;populationSize&gt;</code>
: This parameter represents the carrying capacity (maximum population size). If the shape is very large then the current day population size will be very close to the carrying capacity.

                Containing:

                * [Parameter](#parameter) element (exactly one)

            * One of:
                * Element named <code>&lt;growthRate&gt;</code>
: This parameter determines the rate of growth during the exponential phase. See exponentialGrowth for details.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)

                * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time at peak growth rate.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)


            * Element named <code>&lt;ancestralProportion&gt;</code>
: This parameter determines the populaation size at transmission.

                Containing:

                * [Parameter](#parameter) element (exactly one)



Example:

```html
<hierarchicalTransmissionModel units="generations" hostCount="1">
  <exponential>
    <doublingTime>
      <dataFromTreeTips idref="dataFromTreeTips3">
    </doublingTime>
    <ancestralProportion>
      <differenceParameter idref="differenceParameter5">
    </ancestralProportion>
  </exponential>
</hierarchicalTransmissionModel>
```



### <code>&lt;historyFilter&gt;</code> element

A logger to filter transitions in the complete history.

The element takes following attributes:

* <code>maxTime</code> (optional) is of type [Double](#double)
: 

* <code>minTime</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;sources&gt;</code>

    Containing:

    * One of:
        * <code>includeAll</code> (optional) is of type [Boolean](#boolean)
: 

        * [Identifiable](#identifiable) elements (one or more)


* Element named <code>&lt;destinations&gt;</code>

    Containing:

    * One of:
        * <code>includeAll</code> (optional) is of type [Boolean](#boolean)
: 

        * [Identifiable](#identifiable) elements (one or more)


Example:

```html
<historyFilter maxTime="1.0" minTime="1.0"/>
```



### <code>&lt;hkyModel&gt;</code> element

This element represents an instance of the HKY85 (Hasegawa, Kishino & Yano, 1985) model of nucleotide evolution.

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;kappa&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<hkyModel>
  <frequencies>
    <frequencyModel idref="frequencyModel8">
  </frequencies>
  <kappa>
    <maskedParameter idref="maskedParameter6">
  </kappa>
</hkyModel>
```



### <code>&lt;hybPopSizesScaleOperator&gt;</code> element

Operator which scales the population size of a newly formed hybrid.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>scaleFactor</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<hybPopSizesScaleOperator weight="1.0" scaleFactor="1.0">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp2">
    <apsp idref="apsp8">
    <apsp idref="apsp6">
    <apsp idref="apsp9">
    <geneTrees>
      <starTreeModel idref="starTreeModel3">
      <partitionedTreeModel idref="partitionedTreeModel8">
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
      <gtree popfactor="1.0">
        <treeModel idref="treeModel7">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel7">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies6">
    <tipPopulations value="1.0">
      <differenceParameter idref="differenceParameter6">
    </tipPopulations>
    <rootPopulations value="1.0">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <compoundParameter idref="compoundParameter8">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</hybPopSizesScaleOperator>
```



### <code>&lt;hypermutantAlignment&gt;</code> element

Converts an alignment so that 'A's at specific APOBEC targeted contexts are set to an A/G ambiguity code.

The element takes following attributes:

* <code>type</code>  is of type [String](#string)
: "The type of APOBEC molecule being modelled"

The element has the following contents:

* [Alignment](#alignment) element (exactly one)

Example:

```html
<hypermutantAlignment type="hA3F">
  <sequenceSimulator replications="1">
    <newick idref="newick8">
    ERROR!
  </sequenceSimulator>
</hypermutantAlignment>
```



### <code>&lt;hypermutantErrorModel&gt;</code> element

This element returns a model that allows for APOBEC-type RNA editing.

The element takes following attributes:

* <code>unlinkedRates</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [HypermutantAlignment](#hypermutantalignment) element (exactly one)

* Element named <code>&lt;hypermutationRate&gt;</code>
: The hypermutation rate per target site per sequence

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;hypermutationIndicators&gt;</code>
: A binary indicator of whether the sequence is hypermutated

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<hypermutantErrorModel unlinkedRates="true">
  ERROR!
  <hypermutationRate>
    <vectorSlice idref="vectorSlice2">
  </hypermutationRate>
  <hypermutationIndicators>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView5">
  </hypermutationIndicators>
</hypermutantErrorModel>
```



### <code>&lt;immutableParameter&gt;</code> element

An immutable parameter generated from a statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<immutableParameter>
  <matrixInverse>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView6">
  </matrixInverse>
</immutableParameter>
```



### <code>&lt;ImportanceNarrowExchange&gt;</code> element

This element represents a swap operator. This operator swaps a random subtree with its uncle.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>epsilon</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<ImportanceNarrowExchange weight="1.0" epsilon="1.0">
  <sequenceSimulator replications="1">
    <tree idref="tree8">
    ERROR!
  </sequenceSimulator>
  <treeModel fixHeights="true" fixTree="true">
    <upgmaTree idref="upgmaTree8">
    <rootHeight>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix8">
    </nodeHeights>
    <leafHeight taxon="foo">
      <diagonalMatrix idref="diagonalMatrix4">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser1">
    </leafHeight>
    <leafHeight taxon="foo">
      <complementParameter idref="complementParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <immutableParameter idref="immutableParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix6">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastMatrixParameter idref="fastMatrixParameter7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastMatrixParameter idref="fastMatrixParameter5">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter10">
    </leafTrait>
  </treeModel>
</ImportanceNarrowExchange>
```



### <code>&lt;ImportancePruneAndRegraft&gt;</code> element

This element represents a importance guided prune and regraft operator. This operator prunes a random subtree and regrafts it below a node chosen by an importance distribution.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>samples</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<ImportancePruneAndRegraft weight="1.0" samples="1">
  <starTreeModel>
    <tree idref="tree4">
    <rootHeight>
      <matrixMatrixProduct idref="matrixMatrixProduct4">
    </rootHeight>
    <leafTrait taxon="foo" name="foo">
      <jointParameter idref="jointParameter10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </leafTrait>
  </starTreeModel>
</ImportancePruneAndRegraft>
```



### <code>&lt;ImportanceSubtreeSwap&gt;</code> element

This element represents a importance guided subtree swap operator. This operator swaps a random subtree with a second subtree guided by an importance distribution.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>samples</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<ImportanceSubtreeSwap weight="1.0" samples="1">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <upgmaTree idref="upgmaTree8">
  </empiricalTreeDistributionModel>
</ImportanceSubtreeSwap>
```



### <code>&lt;individual&gt;</code> element

Individual specimen from a species, possibly containing multiple genomes.

The element has the following contents:

* [Taxon](#taxon) elements (one or more)

Example:

```html
<individual>
  <individual>
    <individual idref="individual6">
    <individual idref="individual5">
    <sp idref="sp9">
  </individual>
  <taxon id="foo"/>
  <sp>
    <apsp idref="apsp2">
    <individual idref="individual1">
    <sp idref="sp10">
  </sp>
  <taxon id="foo"/>
</individual>
```



### <code>&lt;individualPrior&gt;</code> element

Calculates the probability of a set of doubles all being drawn from the specified prior distribution

The element takes following attributes:

* <code>id</code>  is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;distribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

Example:

```html
<individualPrior id="foo">
  <distribution>
    <exponentialDistributionModel idref="exponentialDistributionModel7">
  </distribution>
</individualPrior>
```



### <code>&lt;infectionBranchMovementOperator&gt;</code> element

This operator switches the painting of a random eligible internal node from the painting of one of its children to the painting of the other

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<infectionBranchMovementOperator weight="1.0" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel2">
    <maxFirstInfToRoot>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix4">
    </maxFirstInfToRoot>
    <demographicModel>
      <exponentialSawtooth idref="exponentialSawtooth4">
    </demographicModel>
  </withinCaseCoalescent>
</infectionBranchMovementOperator>
```



### <code>&lt;inhibitionLikelihood&gt;</code> element

Provides the likelihood of a continuous trait evolving on a tree by a given diffusion model.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;precision&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<inhibitionLikelihood>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <distanceMatrix idref="distanceMatrix5">
  </empiricalTreeDistributionModel>
  <mvPolyaLikelihood>
    <data>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </data>
    <alpha>
      <duplicatedParameter idref="duplicatedParameter6">
    </alpha>
  </mvPolyaLikelihood>
  <precision>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
  </precision>
</inhibitionLikelihood>
```



### <code>&lt;integer&gt;</code> element

returns an Integer. If a prompt attribute exists then the user is prompted for input, otherwise the character contents of the element are returned as an Integer.

The element has the following contents:

* One of:
    * <code>prompt</code>  is of type [String](#string)
: "A message displayed to the user when entering a value for this integer"

    * [Integer](#integer) element (exactly one)


Example:

```html
<integer prompt="Enter the number of categories:"/>
```



### <code>&lt;integerParameter&gt;</code> element

An integer-valued parameter only for staircase bound.

The element takes following attributes:

* <code>value</code> (optional) is of type [Integer;](#integer;)
: 

* <code>dimension</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<integerParameter value="1 2 4 8" dimension="1"/>
```



### <code>&lt;integratedFactorModel&gt;</code> element

null

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: 

* <code>nugget</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;loadings&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;precision&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [MultivariateTraitTree](#multivariatetraittree) element (exactly one)

* Element named <code>&lt;traitParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;missingIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<integratedFactorModel traitName="foo" nugget="1.0">
  <loadings>
    <matrixParameter idref="matrixParameter6">
  </loadings>
  <precision>
    <jointParameter idref="jointParameter8">
  </precision>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <speciesTree idref="speciesTree2">
    <rootHeight>
      <designMatrix idref="designMatrix4">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundParameter idref="compoundParameter6">
    </nodeHeights>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <diagonalMatrix idref="diagonalMatrix5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <leafTraitParameter idref="leafTraitParameter7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <vectorSlice idref="vectorSlice7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <jointParameter idref="jointParameter1">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter5">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak10">
    </outbreak>
  </partitionedTreeModel>
  <traitParameter>
    <leafTraitParameter idref="leafTraitParameter9">
  </traitParameter>
</integratedFactorModel>
```



### <code>&lt;integratedMixtureModel&gt;</code> element

This element represents a finite mixture of likelihood models.

The element takes following attributes:

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<integratedMixtureModel normalize="true">
  <mulSpeciesTreePrior>
    <model>
      <birthDeathSerialSampling idref="birthDeathSerialSampling7">
    </model>
    <mulTree>
      <mulSpeciesTree idref="mulSpeciesTree2">
    </mulTree>
  </mulSpeciesTreePrior>
  <compoundLikelihood threads="1"/>
  <buildCompoundSymmetricMatrix/>
</integratedMixtureModel>
```



### <code>&lt;traitGibbsOperator&gt;</code> element

This element returns a multivariate Gibbs operator on traits for possible all nodes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>onlyInternalNodes</code> (optional) is of type [Boolean](#boolean)
: 

* <code>onlyTipsWithPriors</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [SampledMultivariateTraitLikelihood](#sampledmultivariatetraitlikelihood) element (exactly one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) elements (zero or more)

* Element named <code>&lt;rootPrior&gt;</code>

    Containing:

    * [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

* [GeoSpatialCollectionModel](#geospatialcollectionmodel) element (zero or one)

Example:

```html
<traitGibbsOperator weight="1.0" onlyInternalNodes="true" onlyTipsWithPriors="true">
  ERROR!
  <multivariateGammaPrior>
    <meanParameter>
      <vectorSlice idref="vectorSlice10">
    </meanParameter>
    <scaleParameter>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix8">
    </scaleParameter>
    <data>
      <duplicatedParameter idref="duplicatedParameter6">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter10">
    </data>
  </multivariateGammaPrior>
  <treeTraitNormalDistributionLikelihood>
    <treeTraitNormalDistribution idref="treeTraitNormalDistribution3">
    <data>
      <parameter idref="parameter9">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    </data>
  </treeTraitNormalDistributionLikelihood>
</traitGibbsOperator>
```



### <code>&lt;intervalLatentLiabilityLikelihood&gt;</code> element

Provides the likelihood of a latent liability model on multivariate-binary trait data

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)
: The model for the latent random variables

* Element named <code>&lt;tipTrait&gt;</code>
: The parameter of tip locations from the tree

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)
: The tree model

Example:

```html
<intervalLatentLiabilityLikelihood>
  <inhibitionLikelihood>
    <partitionedTreeModel idref="partitionedTreeModel4">
    <dataFromTreeTips idref="dataFromTreeTips9">
    <precision>
      <designMatrix idref="designMatrix4">
    </precision>
  </inhibitionLikelihood>
  <tipTrait>
    <compoundMatrixParameter idref="compoundMatrixParameter3">
  </tipTrait>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <neighborJoiningTree idref="neighborJoiningTree9">
  </empiricalTreeDistributionModel>
</intervalLatentLiabilityLikelihood>
```



### <code>&lt;invariantOperator&gt;</code> element

This element returns a operator that forces the entire model likelihood recomputation

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>translate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>rotate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>checkLikelihood</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [Likelihood](#likelihood) element (zero or one)

Example:

```html
<invariantOperator weight="1.0" translate="true" rotate="true" checkLikelihood="true">
  <differenceParameter>
    <diagonalMatrix idref="diagonalMatrix4">
    <productParameter idref="productParameter8">
  </differenceParameter>
</invariantOperator>
```



### <code>&lt;inverseGammaDistributionModel&gt;</code> element

A model of an inverese gamma distribution.

The element has the following contents:

* One of:
    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<inverseGammaDistributionModel>
  <shape>
    1.0
  </shape>
  <scale>
    1.0
  </scale>
</inverseGammaDistributionModel>
```



### <code>&lt;invgammaPrior&gt;</code> element

Calculates the prior probability of some data under a given inverse gamma distribution.

The element takes following attributes:

* <code>shape</code>  is of type [Double](#double)
: 

* <code>scale</code>  is of type [Double](#double)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<invgammaPrior shape="1.0" scale="1.0" offset="1.0">
  <exponentialStatistic>
    <exponentialStatistic idref="exponentialStatistic1">
  </exponentialStatistic>
  <notStatistic>
    <sumParameter idref="sumParameter9">
  </notStatistic>
  <generalizedSkylinePopSizeStatistic/>
</invgammaPrior>
```



### <code>&lt;inverseGaussianDistributionModel&gt;</code> element

Describes a inverse gaussian distribution with a given mean and shape (or standard deviation) that can be used in a distributionLikelihood element

The element takes following attributes:

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;mean&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* Element named <code>&lt;stdev&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* Element named <code>&lt;shape&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


Example:

```html
<inverseGaussianDistributionModel offset="1.0">
  <mean>
    1.0
  </mean>
</inverseGaussianDistributionModel>
```



### <code>&lt;inverseTransform&gt;</code> element

null

The element has the following contents:

* [Transform$ParsedTransform](#transform$parsedtransform) element (exactly one)

Example:

```html
<inverseTransform>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform9">
    </outer>
    <inner>
      <transform idref="transform7">
    </inner>
  </composedTransform>
</inverseTransform>
```



### <code>&lt;invgammaPrior&gt;</code> element

Calculates the prior probability of some data under a given inverse gamma distribution.

The element takes following attributes:

* <code>shape</code>  is of type [Double](#double)
: 

* <code>scale</code>  is of type [Double](#double)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<invgammaPrior shape="1.0" scale="1.0" offset="1.0">
  <coalescentIntervalStatistic>
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood2">
  </coalescentIntervalStatistic>
  <adaptableSizeFastMatrixParameter columns="1" rows="1" maxRowSize="1" maxColumnSize="1" startingValue="1.0" lowerTriangle="true"/>
  <sumParameter>
    <vectorSlice idref="vectorSlice4">
    <matrixParameter idref="matrixParameter1">
  </sumParameter>
  <maskedMatrixParameter complement="true" from="1" to="1" every="1">
    <maskedMatrixParameter idref="maskedMatrixParameter10">
  </maskedMatrixParameter>
</invgammaPrior>
```



### <code>&lt;oneOnXPrior&gt;</code> element

Calculates the (improper) prior proportional to Prod_i (1/x_i) for the given statistic x.

The element has the following contents:

* One of:
    * [Statistic](#statistic) elements (one or more)

    * Element named <code>&lt;data&gt;</code>

        Containing:

        * [Statistic](#statistic) elements (one or more)


Example:

```html
<oneOnXPrior>
  <continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
    <inhibitionLikelihood idref="inhibitionLikelihood6">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood7">
  </continuousDiffusionStatistic>
</oneOnXPrior>
```



### <code>&lt;jitter&gt;</code> element

This element returns a random walk operator on a given parameter.

The element takes following attributes:

* <code>times</code> (optional) is of type [Integer](#integer)
: 

* <code>scale</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<jitter times="1" scale="1.0">
  <leafTraitParameter taxon="foo" setBounds="true">
    <treeModel idref="treeModel4">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
  </leafTraitParameter>
</jitter>
```



### <code>&lt;sumDerivative&gt;</code> element

null

The element has the following contents:

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) elements (one or more)

Example:

```html
<sumDerivative>
  <gradient>
    <cachedPrior idref="cachedPrior7">
  </gradient>
  <sumDerivative>
    <sumDerivative idref="sumDerivative7">
  </sumDerivative>
</sumDerivative>
```



### <code>&lt;jointOperator&gt;</code> element

This element represents an arbitrary list of operators; only the first is optimizable

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>targetAcceptance</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [SimpleMCMCOperator](#simplemcmcoperator) elements (one or more)

Example:

```html
<jointOperator weight="1.0" targetAcceptance="1.0">
  <MsatFullAncestryImportanceSamplingOperator weight="1.0">
    <leafTraitParameter idref="leafTraitParameter1">
    <microsatelliteSamplerTreeModel idref="microsatelliteSamplerTreeModel5">
    ERROR!
    <argDiscretizedBranchRates idref="argDiscretizedBranchRates9">
  </MsatFullAncestryImportanceSamplingOperator>
  <transmissionExchangeOperatorA weight="1.0" resampleInfectionTimes="true">
    <withinCaseCoalescent idref="withinCaseCoalescent2">
  </transmissionExchangeOperatorA>
  <narrowExchange weight="1.0">
    <treeModel idref="treeModel7">
  </narrowExchange>
  <setOperator set="0.5 1.0" weight="1.0">
    <productParameter idref="productParameter10">
  </setOperator>
</jointOperator>
```



### <code>&lt;jointParameter&gt;</code> element

A parameter that synchronises its component parameters.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<jointParameter>
  <maskedMatrixParameter complement="true" from="1" to="1" every="1">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
  </maskedMatrixParameter>
  <matrixParameter rows="1" columns="1" transpose="true" asCompoundParameter="true" test="true">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    <differenceMatrixParameter idref="differenceMatrixParameter1">
  </matrixParameter>
</jointParameter>
```



### <code>&lt;knownVarianceNormalPeriodPriorDistribution&gt;</code> element

Calculates the probability of a set of doubles being drawn from the prior posterior distributionof a normal distribution of unknown mean and known standard deviation sigma

The element takes following attributes:

* <code>log</code> (optional) is of type [Boolean](#boolean)
: 

* <code>id</code>  is of type [String](#string)
: 

* <code>mu0</code>  is of type [Double](#double)
: 

* <code>sigma</code>  is of type [Double](#double)
: 

* <code>sigma0</code>  is of type [Double](#double)
: 

Example:

```html
<knownVarianceNormalPeriodPriorDistribution log="true" id="foo" mu0="1.0" sigma="1.0" sigma0="1.0"/>
```



### <code>&lt;kStateType&gt;</code> element

Parser for k-state model.

The element takes following attributes:

* <code>stateCount</code>  is of type [Integer](#integer)
: 

* <code>startWith</code> (optional) is of type [Integer](#integer)
: 

Example:

```html
<kStateType stateCount="1" startWith="1"/>
```



### <code>&lt;laplacePrior&gt;</code> element

Calculates the prior probability of some data under a given laplace distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>scale</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<laplacePrior mean="1.0" scale="1.0">
  <parsimonyStatistic name="foo">
    <partitionedTreeModel idref="partitionedTreeModel5">
    <state>
      <taxa idref="taxa3">
    </state>
  </parsimonyStatistic>
  <differenceStatistic absolute="true">
    <alloppNumHybsStatistic idref="alloppNumHybsStatistic2">
    <mvPolyaLikelihood idref="mvPolyaLikelihood1">
  </differenceStatistic>
  <maskedMatrixParameter complement="true" from="1" to="1" every="1">
    <dataFromTreeTips idref="dataFromTreeTips5">
  </maskedMatrixParameter>
</laplacePrior>
```



### <code>&lt;latentFactorModel&gt;</code> element

Sets up a latent factor model, with starting guesses for the loadings and factor matrices as well as the data for the factor analysis

The element takes following attributes:

* <code>factorNumber</code>  is of type [Integer](#integer)
: 

* <code>scaleData</code> (optional) is of type [Boolean](#boolean)
: 

* <code>computeResidualsForDiscrete</code> (optional) is of type [Boolean](#boolean)
: 

* <code>recomputeFactors</code> (optional) is of type [Boolean](#boolean)
: 

* <code>recomputeResiduals</code> (optional) is of type [Boolean](#boolean)
: 

* <code>recomputeLoadings</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;factors&gt;</code>

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;loadings&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;rowPrecision&gt;</code>

    Containing:

    * [DiagonalMatrix](#diagonalmatrix) element (exactly one)

* Element named <code>&lt;columnPrecision&gt;</code>

    Containing:

    * [DiagonalMatrix](#diagonalmatrix) element (exactly one)

* Element named <code>&lt;continuous&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;missingIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<latentFactorModel factorNumber="1" scaleData="true" computeResidualsForDiscrete="true" recomputeFactors="true" recomputeResiduals="true" recomputeLoadings="true">
  <data>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter6">
  </data>
  <factors>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
  </factors>
  <loadings>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter2">
  </loadings>
  <rowPrecision>
    ERROR!
  </rowPrecision>
  <columnPrecision>
    ERROR!
  </columnPrecision>
</latentFactorModel>
```



### <code>&lt;latentLiabilityGibbsOperator&gt;</code> element

This element returns a gibbs sampler on tip latent trais for latent liability model.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [FullyConjugateMultivariateTraitLikelihood](#fullyconjugatemultivariatetraitlikelihood) element (exactly one)
: The model for the latent random variables

* [LatentTruncation](#latenttruncation) element (exactly one)
: The model that links latent and observed variables

* [CompoundParameter](#compoundparameter) element (exactly one)
: The parameter of tip locations from the tree

Example:

```html
<latentLiabilityGibbsOperator weight="1.0">
  ERROR!
  <latentLiabilityLikelihood>
    <inhibitionLikelihood idref="inhibitionLikelihood4">
    <tipTrait>
      <dataFromTreeTips idref="dataFromTreeTips8">
    </tipTrait>
    <maskedPatterns idref="maskedPatterns5">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel6">
  </latentLiabilityLikelihood>
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix6">
    <generalDataType idref="generalDataType6">
  </originDestinationDesignMatrix>
</latentLiabilityGibbsOperator>
```



### <code>&lt;latentLiabilityLikelihood&gt;</code> element

Provides the likelihood of a latent liability model on multivariate-binary trait data

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)
: The model for the latent random variables

* Element named <code>&lt;tipTrait&gt;</code>
: The parameter of tip locations from the tree

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* [PatternList](#patternlist) element (exactly one)
: The binary tip data

* [TreeModel](#treemodel) element (exactly one)
: The tree model

Example:

```html
<latentLiabilityLikelihood>
  <inhibitionLikelihood>
    <starTreeModel idref="starTreeModel8">
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix9">
    <precision>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    </precision>
  </inhibitionLikelihood>
  <tipTrait>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix2">
  </tipTrait>
  <constantPatterns>
    <patternSubSet idref="patternSubSet10">
    <counts>
      <matrixMatrixProduct idref="matrixMatrixProduct9">
    </counts>
  </constantPatterns>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <upgmaTree idref="upgmaTree2">
    <rootHeight>
      <matrixVectorProductParameter idref="matrixVectorProductParameter6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice10">
    </nodeHeights>
    <leafHeight taxon="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <diagonalMatrix idref="diagonalMatrix7">
    </leafHeight>
    <leafHeight taxon="foo">
      <immutableParameter idref="immutableParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix3">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <jointParameter idref="jointParameter6">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <leafTraitParameter idref="leafTraitParameter7">
    </nodeRates>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak10">
    </outbreak>
  </partitionedTreeModel>
</latentLiabilityLikelihood>
```



### <code>&lt;latentStateBranchRateModel&gt;</code> element

This element provides a model with a latent state where no evolution occurs but condition on being non-latent at the nodes.

The element has the following contents:

* [BranchRateModel](#branchratemodel) element (exactly one)
: A branch rate model to provide the rates for the non-latent state

* [TreeModel](#treemodel) element (exactly one)
: The tree on which this will operate

* [CountableBranchCategoryProvider](#countablebranchcategoryprovider) element (zero or one)

* Element named <code>&lt;latentTransitionRate&gt;</code>
: A parameter which gives the instantaneous rate of switching to and from the latent state

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;latentTransitionFrequency&gt;</code>
: A parameter which gives the rate bias of switching to and from the latent state

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;latentStateProportions&gt;</code>
: The proportion of each branch which is spend in a latent state

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<latentStateBranchRateModel>
  <continuousBranchRates singleRootRate="true" normalize="true" normalizeBranchRateTo="1.0">
    <treeModel idref="treeModel2">
    <distribution>
      <poissonDistributionModel idref="poissonDistributionModel9">
    </distribution>
    <rateCategoryQuantiles>
      <matrixParameter idref="matrixParameter6">
    </rateCategoryQuantiles>
  </continuousBranchRates>
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork1">
    <rootHeight>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastMatrixParameter idref="fastMatrixParameter3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
    </nodeHeights>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </leafHeight>
    <leafHeight taxon="foo">
      <complementParameter idref="complementParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <parameter idref="parameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter7">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedMatrixParameter idref="maskedMatrixParameter2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <leafTraitParameter idref="leafTraitParameter4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter10">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix7">
    </leafTrait>
  </treeModel>
  <latentTransitionRate>
    <dataFromTreeTips idref="dataFromTreeTips10">
  </latentTransitionRate>
  <latentTransitionFrequency>
    <differenceParameter idref="differenceParameter2">
  </latentTransitionFrequency>
</latentStateBranchRateModel>
```



### <code>&lt;leafTraitParameter&gt;</code> element

Parses the leaf trait parameter out of the compound parameter of an integrated trait likelihood

The element takes following attributes:

* <code>taxon</code>  is of type [String](#string)
: 

* <code>setBounds</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [CompoundParameter](#compoundparameter) element (exactly one)

Example:

```html
<leafTraitParameter taxon="foo" setBounds="true">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <partitionedTreeModel idref="partitionedTreeModel3">
    <rootHeight>
      <matrixParameter idref="matrixParameter10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <copyParameterValues idref="copyParameterValues6">
    </nodeHeights>
    <leafHeight taxon="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct6">
    </leafHeight>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </leafHeight>
    <leafHeight taxon="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter1">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <copyParameterValues idref="copyParameterValues4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <complementParameter idref="complementParameter6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter3">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <vectorSlice idref="vectorSlice3">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <sumParameter idref="sumParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <complementParameter idref="complementParameter3">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak6">
    </outbreak>
  </partitionedTreeModel>
  <elementWiseMatrixMultiplicationParameter/>
</leafTraitParameter>
```



### <code>&lt;lewisMk&gt;</code> element

A parser for Lewis's Mk model

The element takes following attributes:

* <code>totalOrder</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;order&gt;</code>

    Containing:

    * <code>state</code>  is of type [String](#string)
: 

    * <code>adjacentTo</code>  is of type [String](#string)
: 

Example:

```html
<lewisMk totalOrder="true">
  <frequencies>
    <frequencyModel idref="frequencyModel5">
  </frequencies>
  <order state="foo" adjacentTo="foo"/>
  <order state="foo" adjacentTo="foo"/>
  <order state="foo" adjacentTo="foo"/>
  <order state="foo" adjacentTo="foo"/>
</lewisMk>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <modelSpecificPseudoPrior/>
  <pathLikelihood>
    <source>
      <modelSpecificPseudoPrior idref="modelSpecificPseudoPrior3">
    </source>
    <destination>
      <multivariateInverseWishartPrior idref="multivariateInverseWishartPrior2">
    </destination>
  </pathLikelihood>
  <logTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
    <treeLengthStatistic idref="treeLengthStatistic8">
    <sumParameter idref="sumParameter6">
    <copyParameterValues idref="copyParameterValues2">
  </logTransformedNormalReferencePrior>
  <compoundLikelihood threads="1">
    <twoPartDistribution idref="twoPartDistribution4">
  </compoundLikelihood>
</compoundLikelihood>
```



### <code>&lt;likelihoodProfile&gt;</code> element

This element represents a tool to profile a likelihood surface

The element takes following attributes:

* <code>lower</code>  is of type [Double;](#double;)
: 

* <code>upper</code>  is of type [Double;](#double;)
: 

* <code>dim</code> (optional) is of type [Integer](#integer)
: 

* <code>points</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) element (exactly one)

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;expectation&gt;</code>

    Containing:

    * <code>samples</code>  is of type [Integer](#integer)
: 

    * [RandomGenerator](#randomgenerator) element (exactly one)

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<likelihoodProfile lower="0.5 1.0" upper="0.5 1.0" dim="1" points="1">
  <uniformNodeHeightPrior analytic="true" maxRootHeight="1.0" mcSampleSize="1" marginal="true" approximate="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
  </uniformNodeHeightPrior>
  <differenceMatrixParameter/>
</likelihoodProfile>
```



### <code>&lt;lineageCountStatistic&gt;</code> element



The element has the following contents:

* [OldAbstractCoalescentLikelihood](#oldabstractcoalescentlikelihood) element (exactly one)

Example:

```html
<lineageCountStatistic>
  <generalizedSkyLineLikelihood linear="true">
    <populationSizes>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </populationSizes>
    <groupSizes>
      <matrixParameter idref="matrixParameter5">
    </groupSizes>
    <populationTree>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel6">
    </populationTree>
  </generalizedSkyLineLikelihood>
</lineageCountStatistic>
```



### <code>&lt;lineageSpecificBranchModel&gt;</code> element

This element provides a branch model which has branches assigned to specific substitution models.These assignments can then be changed in course of MCMC.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;models&gt;</code>

    Containing:

    * [AbstractModel](#abstractmodel) elements (one or more)

* Element named <code>&lt;categories&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<lineageSpecificBranchModel>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <alignment idref="alignment9">
  </empiricalTreeDistributionModel>
  <frequencyModel composition="3x4" normalize="true" compress="true" dataType="codon-universal">
    <frequencies>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    </frequencies>
  </frequencyModel>
  <models>
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood6">
    <uniformNodeHeightPrior idref="uniformNodeHeightPrior2">
  </models>
  <categories>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
  </categories>
</lineageSpecificBranchModel>
```



### <code>&lt;localClockModel&gt;</code> element

This element returns a branch rate model that adds a delta to each terminal branch length.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;rate&gt;</code>
: The molecular evolutionary rate parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;externalBranches&gt;</code>

    Containing:

    * <code>relative</code> (optional) is of type [Boolean](#boolean)
: 

    * [Taxa](#taxa) element (exactly one)
: A local clock that will be applied only to the external branches for these taxa

    * [Parameter](#parameter) element (exactly one)
: The rate parameter

* Element named <code>&lt;clade&gt;</code>

    Containing:

    * <code>relative</code> (optional) is of type [Boolean](#boolean)
: 

    * <code>includeStem</code> (optional) is of type [Boolean](#boolean)
: "determines whether or not the stem branch above this clade is included in the siteModel (default false)."

    * <code>stemProportion</code> (optional) is of type [Double](#double)
: "proportion of stem to include in clade rate (default 0)."

    * <code>excludeClade</code> (optional) is of type [Boolean](#boolean)
: "determines whether to exclude actual branches of the clade from the siteModel (default false)."

    * [Taxa](#taxa) element (exactly one)
: A set of taxa which defines a clade to apply a different site model to

    * [Parameter](#parameter) element (exactly one)
: The rate parameter

* Element named <code>&lt;trunk&gt;</code>

    Containing:

    * <code>relative</code> (optional) is of type [Boolean](#boolean)
: 

    * [Taxa](#taxa) element (exactly one)
: A local clock that will be applied only to the 'trunk' branches defined by these taxa

    * [Parameter](#parameter) element (exactly one)
: The rate parameter

    * Element named <code>&lt;index&gt;</code>
: The trunk taxon index

        Containing:

        * [Parameter](#parameter) element (exactly one)

Example:

```html
<localClockModel>
  <starTreeModel>
    <treeModel idref="treeModel10">
    <rootHeight>
      <fastMatrixParameter idref="fastMatrixParameter7">
    </rootHeight>
    <leafHeight taxon="foo">
      <maskedParameter idref="maskedParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter9">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <parameter idref="parameter6">
    </leafTrait>
  </starTreeModel>
  <rate>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
  </rate>
  <clade relative="true" includeStem="true" stemProportion="1.0" excludeClade="true">
    <taxa idref="taxa3">
    <dataFromTreeTips idref="dataFromTreeTips4">
  </clade>
  <trunk relative="true">
    <taxa idref="taxa1">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
  </trunk>
  <trunk relative="true">
    <taxa idref="taxa6">
    <differenceMatrixParameter idref="differenceMatrixParameter5">
  </trunk>
</localClockModel>
```



### <code>&lt;location&gt;</code> element

Specifies a location with an optional longitude and latitude

The element takes following attributes:

* <code>description</code> (optional) is of type [String](#string)
: "A description of this location"

* <code>longitude</code> (optional) is of type [String](#string)
: "The longitude in degrees, minutes, seconds or decimal degrees"

* <code>latitude</code> (optional) is of type [String](#string)
: "The latitude in degrees, minutes, seconds or decimal degrees"

Example:

```html
<location description="foo" longitude="foo" latitude="foo"/>
```



### <code>&lt;log&gt;</code> element

Logs one or more items at a given frequency to the screen or to a file

The element takes following attributes:

* <code>logEvery</code>  is of type [Integer](#integer)
: 

* <code>overwrite</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fileName</code> (optional) is of type [String](#string)
: "The name of the file to send log output to. If no file name is specified then log is sent to standard output"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the log"

* <code>header</code> (optional) is of type [String](#string)
: "The subtitle of the log"

The element has the following contents:

* At least one of:
    * [Columns](#columns) elements (one or more)

    * [Loggable](#loggable) elements (one or more)

    * [Object](#object) elements (one or more)



Example:

```html
<log logEvery="1" overwrite="true" fileName="foo" title="foo" header="foo">
  <biasedMultivariateDiffusionModel>
    <precisionMatrix>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </precisionMatrix>
    <biasParameter>
      <designMatrix idref="designMatrix9">
    </biasParameter>
  </biasedMultivariateDiffusionModel>
  <gmrfBivariateCurveAnalysis fileName1="foo" fileName2="foo" endTime="foo" burnIn="1"/>
  <uniformPartitionLikelihood>
    <argTreeModel idref="argTreeModel6">
  </uniformPartitionLikelihood>
</log>
```



### <code>&lt;logAllTraits&gt;</code> element

null

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)
: The tree which is to be logged

Example:

```html
<logAllTraits>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <alignment idref="alignment4">
  </empiricalTreeDistributionModel>
</logAllTraits>
```



### <code>&lt;logArg&gt;</code> element

Logs an ARG to a file

The element takes following attributes:

* <code>logEvery</code>  is of type [Integer](#integer)
: 

* <code>format</code>  is of type [String](#string)
: "The type logger's output type"

* <code>fileName</code> (optional) is of type [String](#string)
: "The name of the file to send log output to. If no file name is specified then log is sent to standard output"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the log"

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)
: The ARG which is to be logged

Example:

```html
<!-- The logArg element takes an argModel to be logged -->
<logArg logEvery="100" fileName="log.args">
	<argModel idref="treeModel1"/>
</logArg>
```



### <code>&lt;logArgTree&gt;</code> element

Logs a tree to a file

The element takes following attributes:

* <code>logEvery</code>  is of type [Integer](#integer)
: 

* <code>partition</code>  is of type [Integer](#integer)
: 

* <code>fileName</code> (optional) is of type [String](#string)
: "The name of the file to send log output to. If no file name is specified then log is sent to standard output"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the log"

* <code>nexusFormat</code> (optional) is of type [Boolean](#boolean)
: "Whether to use the NEXUS format for the tree log"

* <code>branchLengths</code> (optional) is of type [String](#string)
: "What units should the branch lengths be in"

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)
: The ARG which is to be logged

* [BranchRateModel](#branchratemodel) element (zero or one)

* [ColourSamplerModel](#coloursamplermodel) element (zero or one)

* [Likelihood](#likelihood) element (zero or one)

Example:

```html
<!-- The logArgTree element takes an argTreeModel to be logged -->
<logArgTree logEvery="100" fileName="log.trees" nexusFormat="true">
	<treeModel idref="treeModel1"/>
</logArgTree>
```



### <code>&lt;logarithmStatistic&gt;</code> element

This element returns a statistic that is the element-wise natural logarithm of the child statistic.

The element takes following attributes:

* <code>base</code> (optional) is of type [Double](#double)
: "An optional base for the logarithm (default is the natural logarithm, base e)"

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<logarithmStatistic base="1.0">
  <meanStatistic>
    <varianceStatistic idref="varianceStatistic9">
    <popGraph idref="popGraph8">
    <coalescentEventsStatistic idref="coalescentEventsStatistic7">
  </meanStatistic>
</logarithmStatistic>
```



### <code>&lt;logarithmStatistic&gt;</code> element

This element returns a statistic that is the element-wise natural logarithm of the child statistic.

The element takes following attributes:

* <code>base</code> (optional) is of type [Double](#double)
: "An optional base for the logarithm (default is the natural logarithm, base e)"

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<logarithmStatistic base="1.0">
  <productParameter>
    <jointParameter idref="jointParameter5">
    <productParameter idref="productParameter6">
  </productParameter>
</logarithmStatistic>
```



### <code>&lt;logFileTrace&gt;</code> element

reconstruct population graph from variable dimension run.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "trace log."

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: "The number of states (not sampled states, but actual states) that are discarded from the beginning of the trace before doing the analysis"

Example:

```html
<logFileTrace fileName="foo" burnIn="1"/>
```



### <code>&lt;loggableStatistic&gt;</code> element

Allows you to choose specific dimensions of a given statistic

The element has the following contents:

* [Loggable](#loggable) element (exactly one)

Example:

```html
<loggableStatistic>
  <jointParameter>
    <sumParameter idref="sumParameter10">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix4">
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
    <duplicatedParameter idref="duplicatedParameter9">
  </jointParameter>
</loggableStatistic>
```



### <code>&lt;logisticGrowth&gt;</code> element

Logistic growth demographic model.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>
: This parameter represents the population size at time 0 (the time of the last tip of the tree)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;growthRate&gt;</code>
: This parameter determines the rate of growth during the exponential phase. See exponentialGrowth for details.

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time at peak growth rate.

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;t50&gt;</code>
: This parameter represents the time in the past when the population was half of that which it isat time zero (not half it's carrying capacity). It is therefore a positive number with the same units as divergence times. A scale operator is recommended with a starting value near zero. A lower bound of zero should be employed and an upper bound is recommended.

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<logisticGrowth units="mutations">
  <populationSize>
    <fastMatrixParameter idref="fastMatrixParameter8">
  </populationSize>
  <growthRate>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix4">
  </growthRate>
  <t50>
    <mvPolyaLikelihood idref="mvPolyaLikelihood10">
  </t50>
</logisticGrowth>
```



### <code>&lt;logitTransformedNormalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under logit transformed normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

* <code>dimension</code> (optional) is of type [Integer](#integer)
: 

* <code>upperLimit</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<logitTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1" dimension="1" upperLimit="1.0">
  <partitionStatistic/>
</logitTransformedNormalReferencePrior>
```



### <code>&lt;logitTransformedNormalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under logit transformed normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

* <code>dimension</code> (optional) is of type [Integer](#integer)
: 

* <code>upperLimit</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<logitTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1" dimension="1" upperLimit="1.0">
  <differenceStatistic absolute="true">
    <coalescentIntervalStatistic idref="coalescentIntervalStatistic3">
    <sumStatistic idref="sumStatistic8">
  </differenceStatistic>
  <logarithmStatistic base="1.0">
    <sumStatistic idref="sumStatistic3">
  </logarithmStatistic>
  <logarithmStatistic base="1.0">
    <treeMetricStatistic idref="treeMetricStatistic3">
  </logarithmStatistic>
  <lineageCountStatistic>
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood5">
  </lineageCountStatistic>
</logitTransformedNormalReferencePrior>
```



### <code>&lt;logML&gt;</code> element

Logs one or more items every time the given likelihood improves

The element takes following attributes:

* <code>logEvery</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;ml&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* At least one of:
    * [Columns](#columns) elements (one or more)

    * [Loggable](#loggable) elements (one or more)



Example:

```html
<logML logEvery="1">
  <ml>
    <glmSubstitutionModel idref="glmSubstitutionModel10">
  </ml>
  <column label="foo" sf="1" dp="1" width="1" format="foo">
    <cNcSTodNdSPerSiteAnalysis idref="cNcSTodNdSPerSiteAnalysis10">
    <intervalLatentLiabilityLikelihood idref="intervalLatentLiabilityLikelihood6">
    <antigenicDriftPrior idref="antigenicDriftPrior6">
    <argRatePrior idref="argRatePrior4">
  </column>
  <column label="foo" sf="1" dp="1" width="1" format="foo">
    <operators idref="operators1">
    <complexSubstitutionModel idref="complexSubstitutionModel1">
    <cNcSTodNdSPerSiteAnalysis idref="cNcSTodNdSPerSiteAnalysis2">
  </column>
</logML>
```



### <code>&lt;logNormalDistributionModel&gt;</code> element

Describes a normal distribution with a given mean and standard deviation that can be used in a distributionLikelihood element

The element takes following attributes:

* <code>meanInRealSpace</code> (optional) is of type [Boolean](#boolean)
: 

* <code>stdevInRealSpace</code> (optional) is of type [Boolean](#boolean)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;mean&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* One of:
    * Element named <code>&lt;stdev&gt;</code>

        Containing:

        * One of:
            * [Parameter](#parameter) element (exactly one)

            * [Double](#double) element (exactly one)


    * Element named <code>&lt;precision&gt;</code>

        Containing:

        * One of:
            * [Parameter](#parameter) element (exactly one)

            * [Double](#double) element (exactly one)



Example:

```html
<logNormalDistributionModel meanInRealSpace="true" stdevInRealSpace="true" offset="1.0">
  <mean>
    1.0
  </mean>
  <precision>
    <maskedMatrixParameter idref="maskedMatrixParameter2">
  </precision>
</logNormalDistributionModel>
```



### <code>&lt;logNormalPrior&gt;</code> element

Calculates the prior probability of some data under a given lognormal distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>stdev</code>  is of type [Double](#double)
: 

* <code>offset</code> (optional) is of type [Double](#double)
: 

* <code>meanInRealSpace</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<logNormalPrior mean="1.0" stdev="1.0" offset="1.0" meanInRealSpace="true">
  <compoundParameter>
    <leafTraitParameter idref="leafTraitParameter4">
    <differenceMatrixParameter idref="differenceMatrixParameter5">
    <immutableParameter idref="immutableParameter4">
    <sumParameter idref="sumParameter4">
  </compoundParameter>
  <externalLengthStatistic name="foo">
    <treeModel idref="treeModel2">
    <taxa idref="taxa1">
  </externalLengthStatistic>
  <statistic name="foo">
    <hkyModel idref="hkyModel5">
  </statistic>
</logNormalPrior>
```



### <code>&lt;logPartitionedTree&gt;</code> element

Logs a partitioned tree (phylogenetic tree and transmission tree)

The element takes following attributes:

* <code>logEvery</code> (optional) is of type [Integer](#integer)
: 

* <code>overwrite</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fileName</code> (optional) is of type [String](#string)
: "The name of the file to send log output to. If no file name is specified then log is sent to standard output"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the log"

* <code>nexusFormat</code> (optional) is of type [Boolean](#boolean)
: "Whether to use the NEXUS format for the tree log"

* <code>sortTranslationTable</code> (optional) is of type [Boolean](#boolean)
: "Whether the translation table is sorted."

* <code>branchLengths</code> (optional) is of type [String](#string)
: "What units should the branch lengths be in"

* <code>traitFilter</code> (optional) is of type [String](#string)
: 

* <code>mapNamesToNumbers</code> (optional) is of type [Boolean](#boolean)
: 

* <code>dp</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)
: The tree which is to be logged

* Element named <code>&lt;trait&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The name of the trait"

    * <code>tag</code> (optional) is of type [String](#string)
: "The label of the trait to be used in the tree"

    * [TreeAttributeProvider](#treeattributeprovider) element (exactly one)
: The trait provider

* [Likelihood](#likelihood) element (zero or one)

* [Loggable](#loggable) elements (zero or more)

* [TreeAttributeProvider](#treeattributeprovider) elements (zero or more)

* [TreeTraitProvider](#treetraitprovider) elements (zero or more)

* [TreeLogger$LogUpon](#treelogger$logupon) element (zero or one)

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<!-- The logPartitionedTree element takes a treeModel to be logged -->
<logPartitionedTree logEvery="100" fileName="log.trees" nexusFormat="true">
	<treeModel idref="treeModel1"/>
</logPartitionedTree>
```



### <code>&lt;logRandomWalkOperator&gt;</code> element

This element returns a scale operator on a given parameter.

The element takes following attributes:

* <code>window</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scaleAll</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scaleAllIndependently</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<logRandomWalkOperator window="1.0" weight="1.0" autoOptimize="true" scaleAll="true" scaleAllIndependently="true">
  <fastMatrixParameter rows="1" columns="1"/>
</logRandomWalkOperator>
```



### <code>&lt;logTransformedNormalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under log transformed normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<logTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <tmrcaStatistic name="foo" absolute="true" includeStem="true">
    <newick idref="newick2">
  </tmrcaStatistic>
  <test name="foo" greaterThan="1.0">
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
  </test>
</logTransformedNormalReferencePrior>
```



### <code>&lt;logTransformedNormalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under log transformed normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<logTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <logarithmStatistic base="1.0">
    <differenceParameter idref="differenceParameter8">
  </logarithmStatistic>
  <lineageCountStatistic>
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood8">
  </lineageCountStatistic>
  <nodeHeightsStatistic name="foo">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
  </nodeHeightsStatistic>
</logTransformedNormalReferencePrior>
```



### <code>&lt;logTree&gt;</code> element

Logs a tree to a file

The element takes following attributes:

* <code>logEvery</code> (optional) is of type [Integer](#integer)
: 

* <code>overwrite</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fileName</code> (optional) is of type [String](#string)
: "The name of the file to send log output to. If no file name is specified then log is sent to standard output"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the log"

* <code>nexusFormat</code> (optional) is of type [Boolean](#boolean)
: "Whether to use the NEXUS format for the tree log"

* <code>sortTranslationTable</code> (optional) is of type [Boolean](#boolean)
: "Whether the translation table is sorted."

* <code>branchLengths</code> (optional) is of type [String](#string)
: "What units should the branch lengths be in"

* <code>traitFilter</code> (optional) is of type [String](#string)
: 

* <code>mapNamesToNumbers</code> (optional) is of type [Boolean](#boolean)
: 

* <code>dp</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)
: The tree which is to be logged

* Element named <code>&lt;trait&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The name of the trait"

    * <code>tag</code> (optional) is of type [String](#string)
: "The label of the trait to be used in the tree"

    * [TreeAttributeProvider](#treeattributeprovider) element (exactly one)
: The trait provider

* [Likelihood](#likelihood) element (zero or one)

* [Loggable](#loggable) elements (zero or more)

* [TreeAttributeProvider](#treeattributeprovider) elements (zero or more)

* [TreeTraitProvider](#treetraitprovider) elements (zero or more)

* [TreeLogger$LogUpon](#treelogger$logupon) element (zero or one)

Example:

```html
<!-- The logTree element takes a treeModel to be logged -->
<logTree logEvery="100" fileName="log.trees" nexusFormat="true">
	<treeModel idref="treeModel1"/>
</logTree>
```



### <code>&lt;marginalLikelihoodAnalysis&gt;</code> element

Performs a trace analysis. Estimates the mean of the various statistics in the given log file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<marginalLikelihoodAnalysis fileName="foo" burnIn="1">
  <likelihoodColumn name="foo"/>
</marginalLikelihoodAnalysis>
```



### <code>&lt;marginalLikelihoodEstimator&gt;</code> element

This element returns an MCMC chain and runs the chain as a side effect.

The element takes following attributes:

* <code>chainLength</code>  is of type [Integer](#integer)
: 

* <code>pathSteps</code> (optional) is of type [Integer](#integer)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>prerun</code> (optional) is of type [Integer](#integer)
: 

* <code>linear</code> (optional) is of type [Boolean](#boolean)
: 

* <code>lacing</code> (optional) is of type [Boolean](#boolean)
: 

* <code>spawn</code> (optional) is of type [Boolean](#boolean)
: 

* <code>printOperatorAnalysis</code> (optional) is of type [Boolean](#boolean)
: 

* <code>pathScheme</code> (optional) is of type [String](#string)
: 

* <code>fixedValues</code> (optional) is of type [Double;](#double;)
: 

* <code>alpha</code> (optional) is of type [Double](#double)
: 

* <code>beta</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;samplers&gt;</code>

    Containing:

    * [MCMC](#mcmc) elements (one or more)

* [PathLikelihood](#pathlikelihood) element (exactly one)

* [MCLogger](#mclogger) elements (one or more)

Example:

```html
<marginalLikelihoodEstimator chainLength="1" pathSteps="1" burnin="1" prerun="1" linear="true" lacing="true" spawn="true" printOperatorAnalysis="true" pathScheme="foo" fixedValues="0.5 1.0" alpha="1.0" beta="1.0">
  <samplers>
    <mcmc idref="mcmc2">
  </samplers>
  ERROR!
  <logPartitionedTree logEvery="1" overwrite="true" fileName="foo" title="foo" nexusFormat="true" sortTranslationTable="true" branchLengths="time" traitFilter="foo" mapNamesToNumbers="true" dp="1">
    <speciesTree idref="speciesTree3">
    <trait name="foo" tag="foo">
      <biasedMultivariateDiffusionModel idref="biasedMultivariateDiffusionModel5">
    </trait>
    <trait name="foo" tag="foo">
      <bifractionalDiffusionModel idref="bifractionalDiffusionModel9">
    </trait>
    <productStatistic idref="productStatistic1">
    <transmissionLikelihood idref="transmissionLikelihood5">
    <matrixMatrixProduct idref="matrixMatrixProduct1">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood6">
    <speciesTree idref="speciesTree9">
    <withinCaseCoalescent idref="withinCaseCoalescent4">
  </logPartitionedTree>
</marginalLikelihoodEstimator>
```



### <code>&lt;markovJumpsTreeLikelihood&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>stateTagName</code> (optional) is of type [String](#string)
: 

* <code>jumpTagName</code> (optional) is of type [String](#string)
: 

* <code>scaleRewardsByTime</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useUniformization</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reportUnconditionedValues</code> (optional) is of type [Boolean](#boolean)
: 

* <code>numberOfSimulants</code> (optional) is of type [Integer](#integer)
: 

* <code>saveCompleteHistory</code> (optional) is of type [Boolean](#boolean)
: 

* <code>logCompleteHistory</code> (optional) is of type [Boolean](#boolean)
: 

* <code>compactHistory</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scalingScheme</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;partialsRestriction&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)

    * [Parameter](#parameter) element (exactly one)

* [PatternList](#patternlist) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

* [GammaSiteRateModel](#gammasiteratemodel) element (exactly one)

* [BranchModel](#branchmodel) element (zero or one)

* [SubstitutionModel](#substitutionmodel) element (zero or one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [Parameter](#parameter) elements (zero or more)

* Element named <code>&lt;counts&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (zero or more)

* Element named <code>&lt;rewards&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (zero or more)

* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<markovJumpsTreeLikelihood useAmbiguities="true" stateTagName="foo" jumpTagName="foo" scaleRewardsByTime="true" useUniformization="true" reportUnconditionedValues="true" numberOfSimulants="1" saveCompleteHistory="true" logCompleteHistory="true" compactHistory="true" scalingScheme="foo">
  <constantPatterns>
    <constantPatterns idref="constantPatterns5">
    <counts>
      <copyParameterValues idref="copyParameterValues8">
    </counts>
  </constantPatterns>
  <treeModel fixHeights="true" fixTree="true">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork5">
    <rootHeight>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <complementParameter idref="complementParameter4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter10">
    </nodeHeights>
    <leafHeight taxon="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <diagonalMatrix idref="diagonalMatrix4">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <differenceMatrixParameter idref="differenceMatrixParameter1">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixParameter idref="matrixParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues10">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues5">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <parameter idref="parameter2">
    </leafTrait>
  </treeModel>
  <siteModel>
    <mutationRate>
      <matrixVectorProductParameter idref="matrixVectorProductParameter1">
    </mutationRate>
  </siteModel>
  <blockUpperTriangularMatrixParameter transpose="true" columnDimension="1" diagonalRestriction="true"/>
</markovJumpsTreeLikelihood>
```



### <code>&lt;markovModulatedSubstitutionModel&gt;</code> element

This element represents the a Markov-modulated substitution model.

The element takes following attributes:

* <code>dataType</code>  is of type [String](#string)
: 

* <code>geometricRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>renormalize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;switchingRates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [SubstitutionModel](#substitutionmodel) elements (one or more)

* Element named <code>&lt;rateScalar&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [SiteRateModel](#siteratemodel) element (zero or one)

Example:

```html
<markovModulatedSubstitutionModel dataType="foo" geometricRates="true" renormalize="true">
  <switchingRates>
    <sumParameter idref="sumParameter7">
  </switchingRates>
  <lewisMk totalOrder="true">
    <frequencies>
      <frequencyModel idref="frequencyModel9">
    </frequencies>
    <order state="foo" adjacentTo="foo"/>
    <order state="foo" adjacentTo="foo"/>
    <order state="foo" adjacentTo="foo"/>
  </lewisMk>
  <hkyModel>
    <frequencies>
      <frequencyModel idref="frequencyModel1">
    </frequencies>
    <kappa>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
    </kappa>
  </hkyModel>
  <mutationDeathModel>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    <extendedDataType idref="extendedDataType8">
  </mutationDeathModel>
  <mutationDeathModel>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter7">
    <extendedDataType idref="extendedDataType6">
  </mutationDeathModel>
</markovModulatedSubstitutionModel>
```



### <code>&lt;markovModulatedYangCodonModel&gt;</code> element

This element represents the a Markov-modulated Yang model of codon evolution.

The element takes following attributes:

* <code>dataType</code>  is of type [String](#string)
: 

* <code>geneticCode</code>  is of type [String](#string)
: 

* <code>diagonalization</code>  is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;omega&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;kappa&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;switchingRates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [FrequencyModel](#frequencymodel) element (exactly one)

Example:

```html
<markovModulatedYangCodonModel dataType="foo" geneticCode="foo" diagonalization="foo">
  <omega>
    <compoundParameter idref="compoundParameter8">
  </omega>
  <kappa>
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
  </kappa>
  <switchingRates>
    <dataFromTreeTips idref="dataFromTreeTips3">
  </switchingRates>
  <frequencyModel composition="3x4" normalize="true" compress="true">
    <extendedDataType idref="extendedDataType2">
    <frequencies>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter7">
    </frequencies>
  </frequencyModel>
</markovModulatedYangCodonModel>
```



### <code>&lt;markovRandomFieldMatrix&gt;</code> element

A MRF matrix parameter constructed from its diagonals and first-order off diagonal.

The element takes following attributes:

* <code>asCorrelation</code> (optional) is of type [Boolean](#boolean)
: 

* <code>dim</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;diagonal&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

    * [Transform$ParsedTransform](#transform$parsedtransform) element (zero or one)

* Element named <code>&lt;offDiagonal&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

    * [Transform$ParsedTransform](#transform$parsedtransform) element (zero or one)

* Element named <code>&lt;nugget&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<markovRandomFieldMatrix asCorrelation="true" dim="1">
  <diagonal>
    <maskedParameter idref="maskedParameter1">
  </diagonal>
  <offDiagonal>
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter8">
  </offDiagonal>
  <nugget>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter3">
  </nugget>
</markovRandomFieldMatrix>
```



### <code>&lt;maskedGradient&gt;</code> element

null

The element has the following contents:

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<maskedGradient>
  <appendedPotentialDerivative>
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood5">
    <sumDerivative idref="sumDerivative5">
  </appendedPotentialDerivative>
  <mask>
    <duplicatedParameter idref="duplicatedParameter9">
  </mask>
</maskedGradient>
```



### <code>&lt;maskedMatrixParameter&gt;</code> element

A masked matrix parameter.

The element takes following attributes:

* <code>complement</code> (optional) is of type [Boolean](#boolean)
: 

* <code>from</code> (optional) is of type [Integer](#integer)
: 

* <code>to</code> (optional) is of type [Integer](#integer)
: 

* <code>every</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<maskedMatrixParameter complement="true" from="1" to="1" every="1">
  <markovRandomFieldMatrix asCorrelation="true" dim="1">
    <diagonal>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter6">
    </diagonal>
    <offDiagonal>
      <complementParameter idref="complementParameter3">
    </offDiagonal>
    <nugget>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
    </nugget>
  </markovRandomFieldMatrix>
</maskedMatrixParameter>
```



### <code>&lt;maskedParameter&gt;</code> element

A masked parameter.

The element takes following attributes:

* <code>complement</code> (optional) is of type [Boolean](#boolean)
: 

* <code>build</code> (optional) is of type [Boolean](#boolean)
: 

* <code>from</code> (optional) is of type [Integer](#integer)
: 

* <code>to</code> (optional) is of type [Integer](#integer)
: 

* <code>every</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<maskedParameter complement="true" build="true" from="1" to="1" every="1">
  <matrixMatrixProduct>
    <left>
      <diagonalMatrix idref="diagonalMatrix6">
    </left>
    <right>
      <matrixParameter idref="matrixParameter2">
    </right>
  </matrixMatrixProduct>
</maskedParameter>
```



### <code>&lt;maskedPatterns&gt;</code> element

A weighted list of the unique site patterns (unique columns) in an alignment.

The element takes following attributes:

* <code>negative</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [SiteList](#sitelist) element (exactly one)

* Element named <code>&lt;mask&gt;</code>
: A parameter of 1s and 0s that represent included and excluded sites

    Containing:

    * [String](#string) element (exactly one)

Example:

```html
<maskedPatterns negative="true">
  <hypermutantAlignment type="hA3F">
    <alignment idref="alignment10">
  </hypermutantAlignment>
  <mask>
    foo
  </mask>
</maskedPatterns>
```



### <code>&lt;matrixInverse&gt;</code> element

This element returns a statistic that is the matrix inverse of the child statistic.

The element has the following contents:

* [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<matrixInverse>
  <diagonalMatrix>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
  </diagonalMatrix>
</matrixInverse>
```



### <code>&lt;matrixMatrixProduct&gt;</code> element

Gets Latent Factor Model to return data with residuals computed

The element has the following contents:

* Element named <code>&lt;left&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;right&gt;</code>

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;ColumnMask&gt;</code>
: Only some columns need to be multiplied

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;InPlace&gt;</code>
: Matrix values that are returned

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<matrixMatrixProduct>
  <left>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix7">
  </left>
  <right>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
  </right>
</matrixMatrixProduct>
```



### <code>&lt;matrixParameter&gt;</code> element

A matrix parameter constructed from its component parameters.

The element takes following attributes:

* <code>rows</code> (optional) is of type [Integer](#integer)
: 

* <code>columns</code> (optional) is of type [Integer](#integer)
: 

* <code>transpose</code> (optional) is of type [Boolean](#boolean)
: 

* <code>asCompoundParameter</code> (optional) is of type [Boolean](#boolean)
: 

* <code>test</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) elements (zero or more)

Example:

```html
<matrixParameter rows="1" columns="1" transpose="true" asCompoundParameter="true" test="true">
  <approximateFactorAnalysisPrecision>
    <L>
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </L>
    <gamma>
      <maskedParameter idref="maskedParameter3">
    </gamma>
  </approximateFactorAnalysisPrecision>
  <fastBlockUpperTriangularMatrixParameterParser transpose="true" columns="1" rows="1"/>
</matrixParameter>
```



### <code>&lt;matrixVectorProductParameter&gt;</code> element

A matrix-vector product of parameters.

The element has the following contents:

* Element named <code>&lt;matrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;vector&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<matrixVectorProductParameter>
  <matrix>
    <diagonalMatrix idref="diagonalMatrix4">
  </matrix>
  <vector>
    <productParameter idref="productParameter3">
  </vector>
</matrixVectorProductParameter>
```



### <code>&lt;mcmc&gt;</code> element

This element returns an MCMC chain and runs the chain as a side effect.

The element takes following attributes:

* <code>chainLength</code>  is of type [Long](#long)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimizeDelay</code> (optional) is of type [Integer](#integer)
: 

* <code>preBurnin</code> (optional) is of type [Integer](#integer)
: 

* <code>temperature</code> (optional) is of type [Double](#double)
: 

* <code>fullEvaluation</code> (optional) is of type [Integer](#integer)
: 

* <code>minOpsFullEvaluations</code> (optional) is of type [Integer](#integer)
: 

* <code>evaluationThreshold</code> (optional) is of type [Double](#double)
: 

* <code>spawn</code> (optional) is of type [Boolean](#boolean)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>operatorAnalysis</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [OperatorSchedule](#operatorschedule) element (exactly one)

* [Likelihood](#likelihood) element (exactly one)

* [Logger](#logger) elements (one or more)

Example:

```html
<mcmc chainLength="1" autoOptimize="true" autoOptimizeDelay="1" preBurnin="1" temperature="1.0" fullEvaluation="1" minOpsFullEvaluations="1" evaluationThreshold="1.0" spawn="true" name="foo" operatorAnalysis="foo">
  <operators sequential="true" optimizationSchedule="foo" minAcceptance="1.0" minUsage="1">
    <GibbsIndependentGammaOperator idref="GibbsIndependentGammaOperator4">
  </operators>
  <integratedFactorModel traitName="foo" nugget="1.0">
    <loadings>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </loadings>
    <precision>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix9">
    </precision>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel10">
    <traitParameter>
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </traitParameter>
  </integratedFactorModel>
  <logArg logEvery="1" format="extendedNewick" fileName="foo" title="foo">
    <argTreeModel idref="argTreeModel4">
  </logArg>
</mcmc>
```



### <code>&lt;mdsModeFinder&gt;</code> element

Provides a mode finder for a MDS model on a tree

The element takes following attributes:

* <code>tolerance</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [MultiDimensionalScalingLikelihood](#multidimensionalscalinglikelihood) element (exactly one)

* [GaussianProcessRandomGenerator](#gaussianprocessrandomgenerator) element (zero or one)

Example:

```html
<mdsModeFinder tolerance="1.0">
  <multiDimensionalScalingLikelihood fileName="foo" mdsDimension="1" useOld="true" includeTruncation="true" forceReorder="true">
    <locations>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser6">
    </locations>
    <mdsPrecision>
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </mdsPrecision>
  </multiDimensionalScalingLikelihood>
</mdsModeFinder>
```



### <code>&lt;meanStatistic&gt;</code> element

This element returns a statistic that is the mean of the child statistics.

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<meanStatistic>
  <reciprocalStatistic>
    <productStatistic idref="productStatistic9">
  </reciprocalStatistic>
  <copyParameterValues>
    <source>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter10">
    </source>
    <destination>
      <duplicatedParameter idref="duplicatedParameter4">
    </destination>
  </copyParameterValues>
  <mvPolyaLikelihood>
    <data>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix8">
    </data>
    <alpha>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix7">
    </alpha>
  </mvPolyaLikelihood>
  <rateCovarianceStatistic name="foo">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
    <argDiscretizedBranchRates idref="argDiscretizedBranchRates8">
  </rateCovarianceStatistic>
</meanStatistic>
```



### <code>&lt;mergePatterns&gt;</code> element

A weighted list of the unique site patterns (unique columns) in an alignment.

The element has the following contents:

* [PatternList](#patternlist) elements (one or more)

Example:

```html
<mergePatterns>
  <microsatellitePattern id="foo" printDetails="true" printMsatPatContent="true">
    <taxa idref="taxa9">
    <microsatellite idref="microsatellite1">
    <microsatSeq>
        1,2,3,4,5,67,100
    </microsatSeq>
  </microsatellitePattern>
</mergePatterns>
```



### <code>&lt;MetagenomeData&gt;</code> element

Data representing metagenome reads aligned to reference sequences and a reference tree

The element takes following attributes:

* <code>fixedReferenceTree</code> (optional) is of type [Boolean](#boolean)
: "Whether the reference tree should be of fixed topology"

The element has the following contents:

* One of:
    * [Taxa](#taxa) element (exactly one)

    * [Tree](#tree) element (exactly one)


* [Alignment](#alignment) element (exactly one)

* [LinkageConstraints](#linkageconstraints) element (zero or one)

Example:

```html
<MetagenomeData fixedReferenceTree="true">
  <taxa>
    <sp idref="sp9">
    <taxon idref="taxon1">
    <sp idref="sp6">
    <apsp idref="apsp3">
  </taxa>
  <hypermutantAlignment type="all">
    <convert idref="convert4">
  </hypermutantAlignment>
</MetagenomeData>
```



### <code>&lt;microsatellite&gt;</code> element

This element represents a microsatellite data type.

The element has the following contents:

* All of:
    * <code>id</code>  is of type [String](#string)
: 

    * <code>min</code>  is of type [Integer](#integer)
: 

    * <code>max</code>  is of type [Integer](#integer)
: 

    * <code>unitLength</code> (optional) is of type [Integer](#integer)
: 



Example:

```html
<microsatellite min="0" max="20" unitLength="2"/>```



### <code>&lt;microsatellitePattern&gt;</code> element

This element represents a microsatellite pattern.

The element takes following attributes:

* <code>id</code>  is of type [String](#string)
: "the name of the locus"

* <code>printDetails</code> (optional) is of type [Boolean](#boolean)
: 

* <code>printMsatPatContent</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Taxa](#taxa) element (exactly one)

* [Microsatellite](#microsatellite) element (exactly one)

* Element named <code>&lt;microsatSeq&gt;</code>

    Containing:

    * [String](#string) element (exactly one)
: A string of numbers representing the microsatellite lengths for a locus

Example:

```html
<microsatellitePattern id="foo" printDetails="true" printMsatPatContent="true">
  <taxa>
    <individual idref="individual3">
    <sp idref="sp1">
    <sp idref="sp6">
  </taxa>
  <microsatellite/>
  <microsatSeq>
      1,2,3,4,5,67,100
  </microsatSeq>
</microsatellitePattern>
```



### <code>&lt;microsatelliteSamplerTreeModel&gt;</code> element

This parser returns a TreeMicrosatelliteSamplerModel Object

The element takes following attributes:

* <code>provideInternalNodeValues</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;tree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;internalValues&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;externalValues&gt;</code>

    Containing:

    * [Patterns](#patterns) element (exactly one)

Example:

```html
<microsatelliteSamplerTreeModel provideInternalNodeValues="true">
  <tree>
    <starTreeModel idref="starTreeModel4">
  </tree>
  <internalValues>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter3">
  </internalValues>
  <externalValues>
    <microsatelliteSimulator idref="microsatelliteSimulator5">
  </externalValues>
</microsatelliteSamplerTreeModel>
```



### <code>&lt;microsatelliteSimulator&gt;</code> element

This parser facilliates simulation of microsatellites given a tree and infinitesimal rate model

The element has the following contents:

* [Microsatellite](#microsatellite) element (exactly one)

* [Taxa](#taxa) element (exactly one)

* [Tree](#tree) element (exactly one)

* [MicrosatelliteModel](#microsatellitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

Example:

```html
<microsatelliteSimulator>
  <microsatellite/>
  <taxa>
    <individual idref="individual9">
    <individual idref="individual9">
    <sp idref="sp5">
  </taxa>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <tree idref="tree1">
    <rootHeight>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixParameter idref="matrixParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
    </nodeHeights>
    <leafHeight taxon="foo">
      <immutableParameter idref="immutableParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <dataFromTreeTips idref="dataFromTreeTips10">
    </leafHeight>
    <leafHeight taxon="foo">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <maskedParameter idref="maskedParameter3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <mvPolyaLikelihood idref="mvPolyaLikelihood4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues10">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundParameter idref="compoundParameter2">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak6">
    </outbreak>
  </partitionedTreeModel>
  ERROR!
</microsatelliteSimulator>
```



### <code>&lt;microsatUpDownOperator&gt;</code> element

This element represents an operator that scales two parameters in different directions. Each operation involves selecting a scale uniformly at random between scaleFactor and 1/scaleFactor. The up parameter is multipled by this scale and the down parameter is divided by this scale.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;up&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;down&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

Example:

```html
<microsatUpDownOperator scaleFactor="1.0" weight="1.0" autoOptimize="true">
  <up/>
  <up/>
  <up/>
  <up/>
  <down/>
  <down/>
  <down/>
</microsatUpDownOperator>
```



### <code>&lt;mixedDistributionLikelihood&gt;</code> element

Calculates the likelihood of some data given some mix of parametric distributions.

The element has the following contents:

* Element named <code>&lt;distribution0&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;distribution1&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

Example:

```html
<mixedDistributionLikelihood>
  <distribution0>
    <onePGammaDistributionModel idref="onePGammaDistributionModel6">
  </distribution0>
  <distribution1>
    <exponentialDistributionModel idref="exponentialDistributionModel1">
  </distribution1>
  <data>
    <jointParameter idref="jointParameter5">
  </data>
  <indicators>
    <bdcNClustersStatistic idref="bdcNClustersStatistic4">
  </indicators>
</mixedDistributionLikelihood>
```



### <code>&lt;mixtureCartogramDiffusionModel&gt;</code> element

Describes a bivariate diffusion process using cartogram distances.

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;mixture&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;boundingBox&gt;</code>

    Containing:

    * <code>minX</code>  is of type [Double](#double)
: 

    * <code>maxX</code>  is of type [Double](#double)
: 

    * <code>minY</code>  is of type [Double](#double)
: 

    * <code>maxY</code>  is of type [Double](#double)
: 

Example:

```html
<mixtureCartogramDiffusionModel>
  <designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true">
    <matrixVectorProductParameter idref="matrixVectorProductParameter1">
  </designMatrix>
  <mixture>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix3">
  </mixture>
  <boundingBox minX="1.0" maxX="1.0" minY="1.0" maxY="1.0"/>
</mixtureCartogramDiffusionModel>
```



### <code>&lt;mixtureModel&gt;</code> element

This element represents a finite mixture of likelihood models.

The element takes following attributes:

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<mixtureModel normalize="true">
  <multivariateNormalPrior>
    <meanParameter>
      <jointParameter idref="jointParameter7">
    </meanParameter>
    <precisionParameter>
      <compoundMatrixParameter idref="compoundMatrixParameter10">
    </precisionParameter>
    <transform idref="transform4">
    <transform idref="transform7">
  </multivariateNormalPrior>
  <gammaReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
    <matrixMatrixProduct idref="matrixMatrixProduct1">
  </gammaReferencePrior>
  <treeDataLikelihood useAmbiguities="true" scalingScheme="foo">
    <partition>
      <microsatelliteSimulator idref="microsatelliteSimulator6">
      <siteModel idref="siteModel8">
    </partition>
    <treeModel idref="treeModel7">
  </treeDataLikelihood>
  <productParameter>
    <vectorSlice idref="vectorSlice5">
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView6">
    <mvPolyaLikelihood idref="mvPolyaLikelihood2">
  </productParameter>
</mixtureModel>
```



### <code>&lt;mixtureModelBranchRates&gt;</code> element

This element returns a random discretized relaxed clock model.The branch rates are drawn from a continuous parametric distribution.

The element takes following attributes:

* <code>singleRootRate</code> (optional) is of type [Boolean](#boolean)
: "Whether only a single rate should be used for the two children branches of the root"

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: "Whether the mean rate has to be normalized to a particular value"

* <code>normalizeBranchRateTo</code> (optional) is of type [Double](#double)
: "The mean rate to normalize to, if normalizing"

* <code>useQuantilesForRates</code> (optional) is of type [Boolean](#boolean)
: "Whether or not to use quantiles to represent rates. If false then rates are not drawn specifically from any of the distributions"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;distribution&gt;</code>
: The distribution model for rates among branches

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;distributionIndex&gt;</code>
: Operator that switches between the distributions of the branch rate distribution model

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateCategoryQuantiles&gt;</code>
: The quantiles for

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<mixtureModelBranchRates singleRootRate="true" normalize="true" normalizeBranchRateTo="1.0" useQuantilesForRates="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <partitionedTreeModel idref="partitionedTreeModel7">
  </empiricalTreeDistributionModel>
  <distribution>
    <inverseGammaDistributionModel idref="inverseGammaDistributionModel9">
  </distribution>
  <distribution>
    <onePGammaDistributionModel idref="onePGammaDistributionModel6">
  </distribution>
  <distribution>
    <inverseGammaDistributionModel idref="inverseGammaDistributionModel6">
  </distribution>
  <distributionIndex>
    <vectorSlice idref="vectorSlice9">
  </distributionIndex>
  <rateCategoryQuantiles>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
  </rateCategoryQuantiles>
</mixtureModelBranchRates>
```



### <code>&lt;mixtureModelLikelihood&gt;</code> element

This element represents a finite mixture of likelihood models.

The element takes following attributes:

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<mixtureModelLikelihood normalize="true">
  <multiDimensionalScalingLikelihood fileName="foo" mdsDimension="1" useOld="true" includeTruncation="true" forceReorder="true">
    <locations>
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser8">
    </locations>
    <mdsPrecision>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter3">
    </mdsPrecision>
  </multiDimensionalScalingLikelihood>
  <alsTreeLikelihood useAmbiguities="true" storePartials="true" integrateGainRate="true" forceRescaling="true">
    <convert idref="convert4">
    <starTreeModel idref="starTreeModel7">
    ERROR!
    <observationProcess type="foo" taxon="foo"/>
  </alsTreeLikelihood>
  <argLocalClock/>
  <adaptableSizeFastMatrixParameter columns="1" rows="1" maxRowSize="1" maxColumnSize="1" startingValue="1.0" lowerTriangle="true"/>
</mixtureModelLikelihood>
```



### <code>&lt;modeFindOperator&gt;</code> element

This element returns a mode finder that always accepts.

The element takes following attributes:

* <code>maxTimes</code> (optional) is of type [Integer](#integer)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>sd</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [MultiDimensionalScalingMM](#multidimensionalscalingmm) element (exactly one)

Example:

```html
<modeFindOperator maxTimes="1" weight="1.0" autoOptimize="true" sd="1.0">
  ERROR!
</modeFindOperator>
```



### <code>&lt;modeIndependenceOperator&gt;</code> element

This element returns a multivariate normal random walk operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>formXtXInverse</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;varMatrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<modeIndependenceOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" formXtXInverse="true">
  <matrixMatrixProduct>
    <left>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView8">
    </left>
    <right>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix7">
    </right>
  </matrixMatrixProduct>
  <varMatrix>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
  </varMatrix>
</modeIndependenceOperator>
```



### <code>&lt;modelSpecificPseudoPrior&gt;</code> element

Calculates the likelihood of some data given some parametric or empirical distribution.

Example:

```html
<modelSpecificPseudoPrior/>
```



### <code>&lt;monophylyStatistic&gt;</code> element

A statistic that returns true if a given set of taxa are monophyletic for a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic for the purpose of logging"

* <code>inverse</code> (optional) is of type [Boolean](#boolean)
: "inverse, returns 0/false when monophyletic and 1/true when not monophyletic"

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>

    Containing:

    * One of:
        * [Taxon](#taxon) elements (one or more)

        * [Taxa](#taxa) element (exactly one)


* Element named <code>&lt;ignore&gt;</code>
: An optional list of taxa to ignore from the test of monophyly

    Containing:

    * One of:
        * [Taxon](#taxon) elements (one or more)

        * [Taxa](#taxa) element (exactly one)


Example:

```html
<monophylyStatistic name="foo" inverse="true">
  <newick usingDates="true" usingHeights="true" rescaleHeight="1.0" rescaleLength="1.0" units="days">
    foo
  </newick>
  <mrca>
    <taxa idref="taxa1">
  </mrca>
</monophylyStatistic>
```



### <code>&lt;monotonicStatistic&gt;</code> element



The element takes following attributes:

* <code>order</code> (optional) is of type [String](#string)
: 

* <code>strictlyMonotic</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<monotonicStatistic order="foo" strictlyMonotic="true">
  <diffusionRateCovarianceStatistic name="foo" greatCircleDistance="true" diffusionCoefficient="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
    <inhibitionLikelihood idref="inhibitionLikelihood4">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood10">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood10">
    <inhibitionLikelihood idref="inhibitionLikelihood5">
  </diffusionRateCovarianceStatistic>
</monotonicStatistic>
```



### <code>&lt;moveLegs&gt;</code> element

Operator which changes the way a tetraploid subtree joins the diploid tree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<moveLegs weight="1.0">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp10">
    <apsp idref="apsp10">
    <geneTrees>
      <starTreeModel idref="starTreeModel6">
      <partitionedTreeModel idref="partitionedTreeModel7">
      <gtree popfactor="1.0">
        <starTreeModel idref="starTreeModel2">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies5">
    <tipPopulations value="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter7">
    </tipPopulations>
    <rootPopulations value="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <compoundMatrixParameter idref="compoundMatrixParameter9">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</moveLegs>
```



### <code>&lt;mrcaTraitStatistic&gt;</code> element

A statistic that has as its value the height of the most recent common ancestor of a set of taxa in a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

* <code>trait</code>  is of type [String](#string)
: "The name of the trait (can be rate)"

* <code>rate</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)

Example:

```html
<mrcaTraitStatistic name="foo" trait="foo" rate="true">
  <treeModel fixHeights="true" fixTree="true">
    <rescaledTree idref="rescaledTree4">
    <rootHeight>
      <designMatrix idref="designMatrix10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser5">
    </leafHeight>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter4">
    </leafHeight>
    <leafHeight taxon="foo">
      <vectorSlice idref="vectorSlice2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <duplicatedParameter idref="duplicatedParameter8">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <differenceParameter idref="differenceParameter4">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <productParameter idref="productParameter5">
    </leafTrait>
  </treeModel>
  <mrca>
    <taxa idref="taxa4">
  </mrca>
</mrcaTraitStatistic>
```



### <code>&lt;MsatFullAncestryImportanceSamplingOperator&gt;</code> element

This element represents an operator that samples the full ancestry given a microsatellite pattern and a tree

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [MicrosatelliteSamplerTreeModel](#microsatellitesamplertreemodel) element (exactly one)

* [MicrosatelliteModel](#microsatellitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (exactly one)

Example:

```html
<MsatFullAncestryImportanceSamplingOperator weight="1.0">
  <duplicatedParameter>
    <maskedParameter idref="maskedParameter5">
    <copies>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
    </copies>
  </duplicatedParameter>
  <microsatelliteSamplerTreeModel provideInternalNodeValues="true">
    <tree>
      <treeModel idref="treeModel7">
    </tree>
    <internalValues>
      <immutableParameter idref="immutableParameter2">
    </internalValues>
    <externalValues>
      <microsatellitePattern idref="microsatellitePattern9">
    </externalValues>
  </microsatelliteSamplerTreeModel>
  ERROR!
  <rateEpochBranchRates continuousNormalization="true">
    <epoch transitionTime="1.0">
      <mvPolyaLikelihood idref="mvPolyaLikelihood8">
    </epoch>
    <rate>
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </rate>
  </rateEpochBranchRates>
</MsatFullAncestryImportanceSamplingOperator>
```



### <code>&lt;msatModelSelectOperator&gt;</code> element

This element returns a microsatellite averaging operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;modelChoose&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;modelIndicators&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<msatModelSelectOperator weight="1.0">
  <modelChoose>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
  </modelChoose>
  <modelIndicators>
    <vectorSlice idref="vectorSlice4">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    <complementParameter idref="complementParameter4">
  </modelIndicators>
</msatModelSelectOperator>
```



### <code>&lt;msatModelSwitchOperator&gt;</code> element

This element returns a microsatellite averaging operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;modelChoose&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;dependencies&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;variableIndices&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<msatModelSwitchOperator weight="1.0">
  <modelChoose>
    <vectorSlice idref="vectorSlice1">
  </modelChoose>
  <dependencies>
    <compoundParameter idref="compoundParameter10">
  </dependencies>
</msatModelSwitchOperator>
```



### <code>&lt;msatPatternStatistic&gt;</code> element

Returns MsatPatternStatistic object

The element takes following attributes:

* <code>mode</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Patterns](#patterns) element (exactly one)

Example:

```html
<msatPatternStatistic mode="foo">
  <microsatellitePattern id="foo" printDetails="true" printMsatPatContent="true">
    <taxa idref="taxa5">
    <microsatellite idref="microsatellite7">
    <microsatSeq>
        1,2,3,4,5,67,100
    </microsatSeq>
  </microsatellitePattern>
</msatPatternStatistic>
```



### <code>&lt;MsatSingleAncestralStateGibbsOperator&gt;</code> element

This element represents an operator that samples the state of a single ancestor given a microsatellite pattern and a tree

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [MicrosatelliteSamplerTreeModel](#microsatellitesamplertreemodel) element (exactly one)

* [MicrosatelliteModel](#microsatellitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (exactly one)

Example:

```html
<MsatSingleAncestralStateGibbsOperator weight="1.0">
  <mvPolyaLikelihood>
    <data>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter1">
    </data>
    <alpha>
      <differenceMatrixParameter idref="differenceMatrixParameter1">
    </alpha>
  </mvPolyaLikelihood>
  <microsatelliteSamplerTreeModel provideInternalNodeValues="true">
    <tree>
      <partitionedTreeModel idref="partitionedTreeModel1">
    </tree>
    <internalValues>
      <sumParameter idref="sumParameter7">
    </internalValues>
    <externalValues>
      <microsatellitePattern idref="microsatellitePattern5">
    </externalValues>
  </microsatelliteSamplerTreeModel>
  ERROR!
  <strictClockBranchRates>
    <rate>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
    </rate>
  </strictClockBranchRates>
</MsatSingleAncestralStateGibbsOperator>
```



### <code>&lt;mulMSCoalescent&gt;</code> element

Compute coalecent log-liklihood of a set of gene trees embedded inside one species tree.

The element has the following contents:

* [MulSpeciesBindings](#mulspeciesbindings) element (exactly one)

* [MulSpeciesTreeModel](#mulspeciestreemodel) element (exactly one)

Example:

```html
<mulMSCoalescent>
  <mulSpecies>
    <apsp idref="apsp1">
    <apsp idref="apsp4">
    <apsp idref="apsp5">
    <geneTrees>
      <partitionedTreeModel idref="partitionedTreeModel7">
      <gtree popfactor="1.0">
        <treeModel idref="treeModel2">
      </gtree>
      <gtree popfactor="1.0">
        <partitionedTreeModel idref="partitionedTreeModel2">
      </gtree>
      <gtree popfactor="1.0">
        <treeModel idref="treeModel8">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
      </gtree>
    </geneTrees>
  </mulSpecies>
  <mulSpeciesTree constantRoot="true" constantPopulation="true">
    <mulSpecies idref="mulSpecies3">
    <sppSplitPopulations value="1.0">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView2">
    </sppSplitPopulations>
  </mulSpeciesTree>
</mulMSCoalescent>
```



### <code>&lt;mulSpecies&gt;</code> element

Binds taxa to gene trees with information about possibly allopolyploid species.

The element has the following contents:

* [AlloppSpeciesBindings$ApSpInfo](#alloppspeciesbindings$apspinfo) elements ( or more)

* Element named <code>&lt;geneTrees&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (zero or more)

    * Element named <code>&lt;gtree&gt;</code>

        Containing:

        * <code>popfactor</code>  is of type [Double](#double)
: 

        * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<mulSpecies>
  <apsp ploidylevel="1.0">
    <individual idref="individual7">
  </apsp>
  <apsp ploidylevel="1.0">
    <individual idref="individual3">
    <individual idref="individual2">
    <individual idref="individual7">
  </apsp>
  <geneTrees>
    <gtree popfactor="1.0">
      <partitionedTreeModel idref="partitionedTreeModel10">
    </gtree>
    <gtree popfactor="1.0">
      <partitionedTreeModel idref="partitionedTreeModel2">
    </gtree>
    <gtree popfactor="1.0">
      <treeModel idref="treeModel4">
    </gtree>
  </geneTrees>
</mulSpecies>
```



### <code>&lt;mulSpeciesTree&gt;</code> element

Multiply-labelled species tree which includes demographic function per branch.

The element takes following attributes:

* <code>constantRoot</code> (optional) is of type [Boolean](#boolean)
: 

* <code>constantPopulation</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [MulSpeciesBindings](#mulspeciesbindings) element (exactly one)

* [Tree](#tree) element (zero or one)

* Element named <code>&lt;sppSplitPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<mulSpeciesTree constantRoot="true" constantPopulation="true">
  <mulSpecies>
    <apsp idref="apsp4">
    <apsp idref="apsp9">
    <geneTrees>
      <partitionedTreeModel idref="partitionedTreeModel10">
    </geneTrees>
  </mulSpecies>
  <sppSplitPopulations value="1.0">
    <copyParameterValues idref="copyParameterValues10">
  </sppSplitPopulations>
</mulSpeciesTree>
```



### <code>&lt;mulSpeciesTreePrior&gt;</code> element

Prior for a multiply-labelled species tree for allopolyploids.

The element has the following contents:

* Element named <code>&lt;model&gt;</code>

    Containing:

    * [SpeciationModel](#speciationmodel) element (exactly one)

* Element named <code>&lt;mulTree&gt;</code>

    Containing:

    * [MulSpeciesTreeModel](#mulspeciestreemodel) element (exactly one)

Example:

```html
<mulSpeciesTreePrior>
  <model>
    <randomLocalYuleModel idref="randomLocalYuleModel5">
  </model>
  <mulTree>
    <mulSpeciesTree idref="mulSpeciesTree4">
  </mulTree>
</mulSpeciesTreePrior>
```



### <code>&lt;multiDimensionalScalingLikelihood&gt;</code> element

Provides the likelihood of pairwise distance given vectors of coordinatesfor points according to the multidimensional scaling scheme of XXX & Rafferty (xxxx).

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The name of the file containing the assay table"

* <code>mdsDimension</code>  is of type [Integer](#integer)
: "The dimension of the space for MDS"

* <code>useOld</code> (optional) is of type [Boolean](#boolean)
: 

* <code>includeTruncation</code> (optional) is of type [Boolean](#boolean)
: 

* <code>forceReorder</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;locations&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

* Element named <code>&lt;mdsPrecision&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<multiDimensionalScalingLikelihood fileName="foo" mdsDimension="1" useOld="true" includeTruncation="true" forceReorder="true">
  <locations>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView4">
  </locations>
  <mdsPrecision>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
  </mdsPrecision>
</multiDimensionalScalingLikelihood>
```



### <code>&lt;multiEpochExponential&gt;</code> element

A demographic model of multi-phae exponential growth.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;populationSize&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;growthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;transitionTime&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<multiEpochExponential units="months">
  <populationSize>
    <jointParameter idref="jointParameter9">
  </populationSize>
  <growthRate>
    <diagonalMatrix idref="diagonalMatrix9">
  </growthRate>
  <transitionTime>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
  </transitionTime>
</multiEpochExponential>
```



### <code>&lt;multiLociDistance&gt;</code> element

Constructs a distance matrix from a pattern list or alignment

The element has the following contents:

* [DistanceMatrix](#distancematrix) elements (one or more)

Example:

```html
<multiLociDistance>
  <distanceMatrix correction="SMM">
    <alignment idref="alignment5">
  </distanceMatrix>
  <distanceMatrix correction="SMM">
    <patternSubSet idref="patternSubSet1">
  </distanceMatrix>
  <distanceMatrix correction="JC">
    <alignment idref="alignment2">
  </distanceMatrix>
  <distanceMatrix correction="JC">
    <patternSubSet idref="patternSubSet8">
  </distanceMatrix>
</multiLociDistance>
```



### <code>&lt;multivariateDiffusionModel&gt;</code> element

Describes a multivariate normal diffusion process.

The element has the following contents:

* Element named <code>&lt;precisionMatrix&gt;</code>

    Containing:

    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

Example:

```html
<multivariateDiffusionModel>
  <precisionMatrix>
    <diagonalMatrix idref="diagonalMatrix10">
  </precisionMatrix>
</multivariateDiffusionModel>
```



### <code>&lt;multivariateDistributionLikelihood&gt;</code> element

Calculates the likelihood of some data under a given multivariate distribution.

The element takes following attributes:

* <code>dataAsMatrix</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;distribution&gt;</code>

    Containing:

    * [ParametricMultivariateDistributionModel](#parametricmultivariatedistributionmodel) element (exactly one)

* [Transform$ParsedTransform](#transform$parsedtransform) elements (zero or more)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<multivariateDistributionLikelihood dataAsMatrix="true">
  <distribution>
    <treeTraitNormalDistribution idref="treeTraitNormalDistribution6">
  </distribution>
  <composedTransform>
    <outer>
      <composedTransform idref="composedTransform8">
    </outer>
    <inner>
      <inverseTransform idref="inverseTransform2">
    </inner>
  </composedTransform>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform1">
    </outer>
    <inner>
      <composedTransform idref="composedTransform8">
    </inner>
  </composedTransform>
</multivariateDistributionLikelihood>
```



### <code>&lt;multivariateGammaPrior&gt;</code> element

Calculates the likelihood of some data under a given multivariate-gamma distribution.

The element has the following contents:

* One of:
    * Element named <code>&lt;shapeParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;meanParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;scaleParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;coefficientOfVariation&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<multivariateGammaPrior>
  <shapeParameter>
    <productParameter idref="productParameter8">
  </shapeParameter>
  <scaleParameter>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter2">
  </scaleParameter>
  <data>
    <diagonalMatrix idref="diagonalMatrix9">
    <immutableParameter idref="immutableParameter1">
    <immutableParameter idref="immutableParameter10">
  </data>
</multivariateGammaPrior>
```



### <code>&lt;multivariateInverseWishartPrior&gt;</code> element

Calculates the likelihood of some data under an Inverse-Wishart distribution.

The element takes following attributes:

* <code>df</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;scaleMatrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<multivariateInverseWishartPrior df="1.0">
  <scaleMatrix>
    <diagonalMatrix idref="diagonalMatrix8">
  </scaleMatrix>
</multivariateInverseWishartPrior>
```



### <code>&lt;multivariateNormalDistributionModel&gt;</code> element

Describes a normal distribution with a given mean and precision that can be used in a distributionLikelihood element

The element has the following contents:

* Element named <code>&lt;meanParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<multivariateNormalDistributionModel>
  <meanParameter>
    <matrixMatrixProduct idref="matrixMatrixProduct2">
  </meanParameter>
  <precisionParameter>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
  </precisionParameter>
</multivariateNormalDistributionModel>
```



### <code>&lt;multivariateNormalPrior&gt;</code> element

Calculates the likelihood of some data under a given multivariate-normal distribution.

The element has the following contents:

* Element named <code>&lt;meanParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* [Transform$ParsedTransform](#transform$parsedtransform) elements (zero or more)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<multivariateNormalPrior>
  <meanParameter>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </meanParameter>
  <precisionParameter>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView5">
  </precisionParameter>
  <inverseTransform>
    <transform idref="transform6">
  </inverseTransform>
  <transform type="foo" start="1" end="1" every="1" inverseTransform="true">
    <mvPolyaLikelihood idref="mvPolyaLikelihood10">
    <dataFromTreeTips idref="dataFromTreeTips2">
    <immutableParameter idref="immutableParameter3">
  </transform>
  <composedTransform>
    <outer>
      <inverseTransform idref="inverseTransform8">
    </outer>
    <inner>
      <composedTransform idref="composedTransform4">
    </inner>
  </composedTransform>
</multivariateNormalPrior>
```



### <code>&lt;multivariateOUModel&gt;</code> element

Describes a multivariate OU process

The element has the following contents:

* [SubstitutionModel](#substitutionmodel) element (exactly one)

* [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;times&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;design&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;independentVariables&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<multivariateOUModel>
  <positiveDefiniteSubstitutionModel>
    <dataFromTreeTips idref="dataFromTreeTips1">
  </positiveDefiniteSubstitutionModel>
  <diagonalMatrix>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix6">
  </diagonalMatrix>
  <data>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter7">
  </data>
  <times>
    <sumParameter idref="sumParameter9">
  </times>
  <design>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter2">
  </design>
  <independentVariables>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter6">
  </independentVariables>
</multivariateOUModel>
```



### <code>&lt;multivariateTDiffusionModel&gt;</code> element

Describes a multivariate t-distribution diffusion process.

The element has the following contents:

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;dfParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<multivariateTDiffusionModel>
  <precisionParameter>
    <sumParameter idref="sumParameter7">
  </precisionParameter>
  <dfParameter>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter10">
  </dfParameter>
</multivariateTDiffusionModel>
```



### <code>&lt;multivariateTraitLikelihood&gt;</code> element

Provides the likelihood of a continuous trait evolving on a tree by a given diffusion model.

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: "The name of the trait for which a likelihood should be calculated"

* <code>integrateInternalTraits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>cut</code> (optional) is of type [Double;](#double;)
: 

* <code>reportAsMultivariate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useTreeLength</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scaleByTime</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reciprocalRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>cacheBranches</code> (optional) is of type [Boolean](#boolean)
: 

* <code>randomSample</code> (optional) is of type [Integer](#integer)
: 

* <code>ignorePhylogeny</code> (optional) is of type [Boolean](#boolean)
: 

* <code>exchangeableTips</code> (optional) is of type [Boolean](#boolean)
: 

* <code>sampleMissingTraits</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;traitParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;delta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (zero or one)

* Element named <code>&lt;conjugateRootPrior&gt;</code>

    Containing:

    * Element named <code>&lt;meanParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;priorSampleSize&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ascertainedTaxon&gt;</code>

    Containing:

    * [Taxon](#taxon) element (exactly one)

* [MultivariateDiffusionModel](#multivariatediffusionmodel) element (exactly one)

* [MultivariateTraitTree](#multivariatetraittree) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;randomize&gt;</code>

    Containing:

    * <code>lower</code> (optional) is of type [Double](#double)
: 

    * <code>upper</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;jitter&gt;</code>

    Containing:

    * <code>window</code>  is of type [Double;](#double;)
: 

    * <code>duplicatesOnly</code> (optional) is of type [Boolean](#boolean)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;check&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;driftModels&gt;</code>

    Containing:

    * [BranchRateModel](#branchratemodel) elements (one or more)

* [RestrictedPartials](#restrictedpartials) elements (zero or more)

Example:

```html
<multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
  <traitParameter>
    <mvPolyaLikelihood idref="mvPolyaLikelihood1">
  </traitParameter>
  <vonMisesFisherDiffusionModel>
    <kappa>
      <immutableParameter idref="immutableParameter5">
    </kappa>
  </vonMisesFisherDiffusionModel>
  <transformedTreeModel version="foo">
    <starTreeModel idref="starTreeModel4">
    <fastMatrixParameter idref="fastMatrixParameter1">
  </transformedTreeModel>
  ERROR!
  ERROR!
</multivariateTraitLikelihood>
```



### <code>&lt;multivariateWishartPrior&gt;</code> element

Calculates the likelihood of some data under a Wishart distribution.

The element takes following attributes:

* <code>nonInformative</code> (optional) is of type [Boolean](#boolean)
: 

* <code>df</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;scaleMatrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) elements (one or more)

Example:

```html
<multivariateWishartPrior nonInformative="true" df="1.0">
  <data>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    <matrixMatrixProduct idref="matrixMatrixProduct8">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix1">
  </data>
</multivariateWishartPrior>
```



### <code>&lt;mulTreeNodeReHeight&gt;</code> element

Specialized Species tree operator, transform tree without breaking embedding of gene trees.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [MulSpeciesBindings](#mulspeciesbindings) element (exactly one)

* [MulSpeciesTreeModel](#mulspeciestreemodel) element (exactly one)

Example:

```html
<mulTreeNodeReHeight weight="1.0">
  <mulSpecies>
    <apsp idref="apsp6">
    <apsp idref="apsp9">
    <geneTrees>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
      <gtree popfactor="1.0">
        <starTreeModel idref="starTreeModel10">
      </gtree>
      <gtree popfactor="1.0">
        <treeModel idref="treeModel2">
      </gtree>
    </geneTrees>
  </mulSpecies>
  <mulSpeciesTree constantRoot="true" constantPopulation="true">
    <mulSpecies idref="mulSpecies6">
    <sppSplitPopulations value="1.0">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision4">
    </sppSplitPopulations>
  </mulSpeciesTree>
</mulTreeNodeReHeight>
```



### <code>&lt;mulTreeSequenceReassignment&gt;</code> element

Operator which reassigns sequences within an allopolyploid species.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [MulSpeciesBindings](#mulspeciesbindings) element (exactly one)

* [MulSpeciesTreeModel](#mulspeciestreemodel) element (exactly one)

Example:

```html
<mulTreeSequenceReassignment weight="1.0">
  <mulSpecies>
    <apsp idref="apsp2">
    <apsp idref="apsp8">
    <apsp idref="apsp9">
    <geneTrees>
      <starTreeModel idref="starTreeModel7">
      <gtree popfactor="1.0">
        <treeModel idref="treeModel3">
      </gtree>
      <gtree popfactor="1.0">
        <treeModel idref="treeModel1">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
      </gtree>
    </geneTrees>
  </mulSpecies>
  <mulSpeciesTree constantRoot="true" constantPopulation="true">
    <mulSpecies idref="mulSpecies7">
    <sppSplitPopulations value="1.0">
      <matrixMatrixProduct idref="matrixMatrixProduct10">
    </sppSplitPopulations>
  </mulSpeciesTree>
</mulTreeSequenceReassignment>
```



### <code>&lt;museGautCodonModel&gt;</code> element

This element represents the Yang model of codon evolution.

The element takes following attributes:

* <code>geneticCode</code> (optional) is of type [String](#string)
: "The genetic code to use"

* <code>normalized</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;alpha&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;beta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;kappa&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateAC&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateAG&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateAT&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateCG&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateCT&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateGT&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [FrequencyModel](#frequencymodel) element (exactly one)

Example:

```html
<museGautCodonModel geneticCode="blepharismaNuclear" normalized="true">
  <alpha>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
  </alpha>
  <beta>
    <differenceParameter idref="differenceParameter8">
  </beta>
  <frequencyModel composition="3x4" normalize="true" compress="true" dataType="hiddenCodon2-universal">
    <frequencies>
      <matrixMatrixProduct idref="matrixMatrixProduct1">
    </frequencies>
  </frequencyModel>
</museGautCodonModel>
```



### <code>&lt;mutationDeathModel&gt;</code> element

This element represents an instance of the MutationDeath model of CTMC evolution with deletions.

The element has the following contents:

* [SubstitutionModel](#substitutionmodel) element (zero or one)

* [Parameter](#parameter) element (exactly one)

* [MutationDeathType](#mutationdeathtype) element (exactly one)

* Element named <code>&lt;mutationRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<mutationDeathModel>
  <buildCompoundSymmetricMatrix/>
  <extendedDataType dataType="binary"/>
</mutationDeathModel>
```



### <code>&lt;mvnOperator&gt;</code> element

This element returns a multivariate normal random walk operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>formXtXInverse</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;varMatrix&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<mvnOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" formXtXInverse="true">
  <productParameter>
    <diagonalMatrix idref="diagonalMatrix6">
    <productParameter idref="productParameter2">
    <diagonalMatrix idref="diagonalMatrix3">
    <compoundMatrixParameter idref="compoundMatrixParameter1">
  </productParameter>
  <varMatrix>
    <matrixParameter idref="matrixParameter3">
  </varMatrix>
</mvnOperator>
```



### <code>&lt;mvouOperator&gt;</code> element

This element returns junk.

The element takes following attributes:

* <code>mixingFactor</code>  is of type [Double](#double)
: 

* <code>priorDf</code>  is of type [Integer](#integer)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<mvouOperator mixingFactor="1.0" priorDf="1" weight="1.0" autoOptimize="true">
  <maskedMatrixParameter complement="true" from="1" to="1" every="1">
    <designMatrix idref="designMatrix5">
  </maskedMatrixParameter>
</mvouOperator>
```



### <code>&lt;mvPolyaLikelihood&gt;</code> element

A matrix parameter constructed from its component parameters.

The element has the following contents:

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [MatrixParameter](#matrixparameter) element (exactly one)

* One of:
    * Element named <code>&lt;alpha&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;frequencies&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;dispersion&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<mvPolyaLikelihood>
  <data>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
  </data>
  <alpha>
    <compoundMatrixParameter idref="compoundMatrixParameter8">
  </alpha>
</mvPolyaLikelihood>
```



### <code>&lt;narrowExchange&gt;</code> element

This element represents a narrow exchange operator. This operator swaps a random subtree with its uncle.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<narrowExchange weight="1.0">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <patternSubSet idref="patternSubSet6">
  </empiricalTreeDistributionModel>
</narrowExchange>
```



### <code>&lt;NearestNeighborInterchange&gt;</code> element

This element represents a NNI operator. This operator swaps a random subtree with its uncle.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<NearestNeighborInterchange weight="1.0">
  <starTreeModel>
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork4">
    <rootHeight>
      <sumParameter idref="sumParameter2">
    </rootHeight>
    <leafHeight taxon="foo">
      <compoundParameter idref="compoundParameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter7">
    </leafHeight>
    <leafHeight taxon="foo">
      <dataFromTreeTips idref="dataFromTreeTips7">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <matrixParameter idref="matrixParameter7">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix7">
    </leafTrait>
  </starTreeModel>
</NearestNeighborInterchange>
```



### <code>&lt;negativeStatistic&gt;</code> element

This element returns a statistic that is the element-wise negation of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<negativeStatistic>
  <maskedParameter complement="true" build="true" from="1" to="1" every="1">
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
  </maskedParameter>
</negativeStatistic>
```



### <code>&lt;negationOperator&gt;</code> element

null

Example:

```html
<negationOperator/>
```



### <code>&lt;negativeStatistic&gt;</code> element

This element returns a statistic that is the element-wise negation of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<negativeStatistic>
  <notStatistic>
    <treeLengthStatistic idref="treeLengthStatistic8">
  </notStatistic>
</negativeStatistic>
```



### <code>&lt;negativeBinomialDistributionModel&gt;</code> element

Describes a Negative Binomial distribution with a given mean and scale that can be used in a distributionLikelihood element

The element has the following contents:

* Element named <code>&lt;mean&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* Element named <code>&lt;alpha&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


Example:

```html
<negativeBinomialDistributionModel>
  <mean>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision9">
  </mean>
  <alpha>
    <mvPolyaLikelihood idref="mvPolyaLikelihood10">
  </alpha>
</negativeBinomialDistributionModel>
```



### <code>&lt;negativeBinomialPrior&gt;</code> element

Calculates the prior probability of some data under a given negative binomial distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>stdev</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<negativeBinomialPrior mean="1.0" stdev="1.0">
  <varianceStatistic>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
  </varianceStatistic>
</negativeBinomialPrior>
```



### <code>&lt;negativeStatistic&gt;</code> element

This element returns a statistic that is the element-wise negation of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<negativeStatistic>
  <productStatistic elementwise="true" name="foo">
    <rateCovarianceStatistic idref="rateCovarianceStatistic4">
    <leafTraitParameter idref="leafTraitParameter9">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix2">
    <RPNcalculator idref="RPNcalculator8">
  </productStatistic>
</negativeStatistic>
```



### <code>&lt;neighborJoiningTree&gt;</code> element

This element returns a neighbour-joining tree generated from the given distances.

The element has the following contents:

* [DistanceMatrix](#distancematrix) element (exactly one)

Example:

```html
<neighborJoiningTree>
  <distanceMatrix correction="none">
    <categoryOutbreak idref="categoryOutbreak2">
  </distanceMatrix>
</neighborJoiningTree>
```



### <code>&lt;networkNodeReHeight&gt;</code> element

Operator for allopolyploid species network: transforms network without breaking embedding of gene trees.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<networkNodeReHeight weight="1.0">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp2">
    <apsp idref="apsp6">
    <geneTrees>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
      <gtree popfactor="1.0">
        <partitionedTreeModel idref="partitionedTreeModel2">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel7">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies4">
    <tipPopulations value="1.0">
      <matrixMatrixProduct idref="matrixMatrixProduct10">
    </tipPopulations>
    <rootPopulations value="1.0">
      <complementParameter idref="complementParameter1">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <jointParameter idref="jointParameter6">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</networkNodeReHeight>
```



### <code>&lt;newARGEvent&gt;</code> element

An operator that slides a subarg.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>size</code>  is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapTraits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<newARGEvent weight="1" size="1.0" gaussian="true" swapRates="true" swapTraits="true" autoOptimize="true">
  <argTreeModel partitionType="reassortment">
    <treeModel idref="treeModel3">
    <rootHeight>
      <leafTraitParameter idref="leafTraitParameter6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter9">
    </nodeHeights>
  </argTreeModel>
</newARGEvent>
```



### <code>&lt;newick&gt;</code> element

Constructs a tree from a NEWICK format tree description

The element takes following attributes:

* <code>usingDates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>usingHeights</code> (optional) is of type [Boolean](#boolean)
: 

* <code>rescaleHeight</code> (optional) is of type [Double](#double)
: "Attempt to rescale the tree to the given root height"

* <code>rescaleLength</code> (optional) is of type [Double](#double)
: "Attempt to rescale the tree to the given total length"

* <code>units</code> (optional) is of type [String](#string)
: "The branch length units of this tree"

The element has the following contents:

* [String](#string) element (exactly one)
: The NEWICK format tree. Tip labels are taken to be Taxon IDs

Example:

```html
<newick units="years"> ((A:1.0, B:1.0):1.0,(C:2.0, D:2.0):1.0); </newick>```



### <code>&lt;newTreeDataLikelihood&gt;</code> element

This element represents the likelihood of data on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scalingScheme</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [PatternList](#patternlist) elements (zero to 2)

* [TreeModel](#treemodel) element (exactly one)

* [SiteRateModel](#siteratemodel) elements (zero to 2)

* [BranchModel](#branchmodel) element (zero or one)

* [SubstitutionModel](#substitutionmodel) element (zero or one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<newTreeDataLikelihood useAmbiguities="true" scalingScheme="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <mulSpeciesTree idref="mulSpeciesTree4">
  </empiricalTreeDistributionModel>
  <siteModel>
    <mutationRate>
      <matrixVectorProductParameter idref="matrixVectorProductParameter6">
    </mutationRate>
  </siteModel>
</newTreeDataLikelihood>
```



### <code>&lt;node&gt;</code> element

This element represents a node in a tree.

The element takes following attributes:

* <code>height</code> (optional) is of type [Double](#double)
: "the age of the node"

* <code>rate</code> (optional) is of type [Double](#double)
: "the relative rate of evolution at this node - default is 1.0"

The element has the following contents:

* One of:
    * [Taxon](#taxon) element (exactly one)
: The taxon of this leaf node

    * [SimpleNode](#simplenode) elements (exactly 2)
: The children of this internal node


Example:

```html
<node height="1.0" rate="1.0">
  <node height="1.0" rate="1.0">
    <individual idref="individual4">
  </node>
  <node height="1.0" rate="1.0">
    <apsp idref="apsp4">
  </node>
</node>
```



### <code>&lt;nodeHeightsStatistic&gt;</code> element

A statistic that returns the heights of each internal node in increasing order (or groups them by a group size parameter)

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [Parameter](#parameter) element (zero or one)

Example:

```html
<nodeHeightsStatistic name="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <convert idref="convert9">
  </empiricalTreeDistributionModel>
</nodeHeightsStatistic>
```



### <code>&lt;nodeReHeight&gt;</code> element

Specialized Species tree operator, transform tree without breaking embedding of gene trees.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [SpeciesBindings](#speciesbindings) element (exactly one)

* [SpeciesTreeModel](#speciestreemodel) element (exactly one)

Example:

```html
<nodeReHeight weight="1.0">
  <species>
    <sp idref="sp7">
    <sp idref="sp1">
    <sp idref="sp8">
    <geneTrees>
      <starTreeModel idref="starTreeModel6">
      <treeModel idref="treeModel3">
    </geneTrees>
  </species>
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species4">
    <sppSplitPopulations value="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter3">
    </sppSplitPopulations>
  </speciesTree>
</nodeReHeight>
```



### <code>&lt;normalDistributionModel&gt;</code> element

Describes a normal distribution with a given mean and standard deviation that can be used in a distributionLikelihood element

The element has the following contents:

* Element named <code>&lt;mean&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* One of:
    * One of:
        * Element named <code>&lt;scale&gt;</code>

            Containing:

            * One of:
                * [Parameter](#parameter) element (exactly one)

                * [Double](#double) element (exactly one)


        * Element named <code>&lt;stdev&gt;</code>

            Containing:

            * One of:
                * [Parameter](#parameter) element (exactly one)

                * [Double](#double) element (exactly one)



    * Element named <code>&lt;precision&gt;</code>

        Containing:

        * One of:
            * [Parameter](#parameter) element (exactly one)

            * [Double](#double) element (exactly one)



Example:

```html
<normalDistributionModel>
  <mean>
    <duplicatedParameter idref="duplicatedParameter7">
  </mean>
  <scale>
    <parameter idref="parameter2">
  </scale>
</normalDistributionModel>
```



### <code>&lt;normalGammaPrecisionGibbsOperator&gt;</code> element

This element returns a operator on the precision parameter of a normal model with gamma prior.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;likelihood&gt;</code>

    Containing:

    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)

* Element named <code>&lt;prior&gt;</code>

    Containing:

    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)

Example:

```html
<normalGammaPrecisionGibbsOperator weight="1.0">
  <likelihood>
    <distributionLikelihood idref="distributionLikelihood1">
  </likelihood>
  <prior>
    <modelSpecificPseudoPrior idref="modelSpecificPseudoPrior4">
  </prior>
</normalGammaPrecisionGibbsOperator>
```



### <code>&lt;normalNormalMeanGibbsOperator&gt;</code> element

This element returns a operator on the mean parameter of a normal model with normal prior.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;likelihood&gt;</code>

    Containing:

    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)

* Element named <code>&lt;prior&gt;</code>

    Containing:

    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)

Example:

```html
<normalNormalMeanGibbsOperator weight="1.0">
  <likelihood>
    <twoPartDistribution idref="twoPartDistribution2">
  </likelihood>
  <prior>
    <modelSpecificPseudoPrior idref="modelSpecificPseudoPrior8">
  </prior>
</normalNormalMeanGibbsOperator>
```



### <code>&lt;normalPeriodPriorDistribution&gt;</code> element

Calculates the probability of a set of doubles being drawn from the prior posterior distributionof a normal distribution of unknown mean and variance

The element takes following attributes:

* <code>log</code> (optional) is of type [Boolean](#boolean)
: 

* <code>id</code>  is of type [String](#string)
: 

* <code>mu</code>  is of type [Double](#double)
: 

* <code>lambda</code>  is of type [Double](#double)
: 

* <code>alpha</code>  is of type [Double](#double)
: 

* <code>beta</code>  is of type [Double](#double)
: 

Example:

```html
<normalPeriodPriorDistribution log="true" id="foo" mu="1.0" lambda="1.0" alpha="1.0" beta="1.0"/>
```



### <code>&lt;normalPrior&gt;</code> element

Calculates the prior probability of some data under a given normal distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>stdev</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<normalPrior mean="1.0" stdev="1.0">
  <buildCompoundSymmetricMatrix/>
</normalPrior>
```



### <code>&lt;normalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under a given normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<normalReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <rateCovarianceStatistic name="foo">
    <partitionedTreeModel idref="partitionedTreeModel3">
    <argDiscretizedBranchRates idref="argDiscretizedBranchRates6">
  </rateCovarianceStatistic>
  <alloppNumHybsStatistic>
    <apspNetwork>
      <alloppSpeciesNetwork idref="alloppSpeciesNetwork10">
    </apspNetwork>
  </alloppNumHybsStatistic>
  <fastBlockUpperTriangularMatrixParameterParser transpose="true" columns="1" rows="1"/>
</normalReferencePrior>
```



### <code>&lt;normalReferencePrior&gt;</code> element

Calculates the reference prior probability of some data under a given normal distribution.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>burnin</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<normalReferencePrior fileName="foo" parameterColumn="foo" burnin="1">
  <reciprocalStatistic>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView8">
  </reciprocalStatistic>
</normalReferencePrior>
```



### <code>&lt;notStatistic&gt;</code> element

This element returns a statistic that is the element-wise inverse of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<notStatistic>
  <continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood6">
    <inhibitionLikelihood idref="inhibitionLikelihood7">
  </continuousDiffusionStatistic>
</notStatistic>
```



### <code>&lt;notBooleanStatistic&gt;</code> element

This element returns a statistic that is the element-wise negation of the child boolean statistic.

The element has the following contents:

* [BooleanStatistic](#booleanstatistic) element (exactly one)

Example:

```html
<notBooleanStatistic>
  <test name="foo" equals="1.0">
    <differenceStatistic idref="differenceStatistic9">
  </test>
</notBooleanStatistic>
```



### <code>&lt;notStatistic&gt;</code> element

This element returns a statistic that is the element-wise inverse of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<notStatistic>
  <lineageCountStatistic>
    <gmrfSkyrideLikelihood idref="gmrfSkyrideLikelihood9">
  </lineageCountStatistic>
</notStatistic>
```



### <code>&lt;NPAntigenicLikelihood&gt;</code> element

conditional likelihood ddCRP

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: "The name of the trait for which a likelihood should be calculated"

The element has the following contents:

* Element named <code>&lt;traitParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;priorPrec&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;clusterPrec&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;priorMean&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;assignments&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;links&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;transformFactor&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;clusterMeans1&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;clusterMeans2&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;chi&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;offsets&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;locationDrift&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<NPAntigenicLikelihood traitName="foo">
  <traitParameter>
    <leafTraitParameter idref="leafTraitParameter2">
  </traitParameter>
  <priorPrec>
    <dataFromTreeTips idref="dataFromTreeTips2">
  </priorPrec>
  <clusterPrec>
    <differenceParameter idref="differenceParameter1">
  </clusterPrec>
  <priorMean>
    <diagonalMatrix idref="diagonalMatrix2">
  </priorMean>
  <assignments>
    <maskedMatrixParameter idref="maskedMatrixParameter4">
  </assignments>
  <links>
    <differenceParameter idref="differenceParameter4">
  </links>
  <transformFactor>
    <compoundMatrixParameter idref="compoundMatrixParameter1">
  </transformFactor>
  <clusterMeans1>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
  </clusterMeans1>
  <clusterMeans2>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix10">
  </clusterMeans2>
  <chi>
    <productParameter idref="productParameter3">
  </chi>
  <offsets>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </offsets>
  <locationDrift>
    <matrixVectorProductParameter idref="matrixVectorProductParameter3">
  </locationDrift>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <neighborJoiningTree idref="neighborJoiningTree8">
    <rootHeight>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <immutableParameter idref="immutableParameter9">
    </nodeHeights>
    <leafHeight taxon="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <copyParameterValues idref="copyParameterValues1">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixParameter idref="matrixParameter1">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak3">
    </outbreak>
  </partitionedTreeModel>
</NPAntigenicLikelihood>
```



### <code>&lt;oldLatentLiabilityGibbsOperator&gt;</code> element

This element returns a multivariate Gibbs operator on traits for tip nodes under a latent liability model.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [IntegratedMultivariateTraitLikelihood](#integratedmultivariatetraitlikelihood) element (exactly one)

* [BinaryLatentLiabilityLikelihood](#binarylatentliabilitylikelihood) element (exactly one)

Example:

```html
<oldLatentLiabilityGibbsOperator weight="1.0">
  ERROR!
  <latentLiabilityLikelihood>
    <multivariateTraitLikelihood idref="multivariateTraitLikelihood7">
    <tipTrait>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter5">
    </tipTrait>
    <mergePatterns idref="mergePatterns6">
    <starTreeModel idref="starTreeModel1">
  </latentLiabilityLikelihood>
</oldLatentLiabilityGibbsOperator>
```



### <code>&lt;oneOnXPrior&gt;</code> element

Calculates the (improper) prior proportional to Prod_i (1/x_i) for the given statistic x.

The element has the following contents:

* One of:
    * [Statistic](#statistic) elements (one or more)

    * Element named <code>&lt;data&gt;</code>

        Containing:

        * [Statistic](#statistic) elements (one or more)


Example:

```html
<oneOnXPrior>
  <reciprocalStatistic>
    <statistic idref="statistic3">
  </reciprocalStatistic>
  <compoundSymmetricMatrix asCorrelation="true">
    <diagonal>
      <immutableParameter idref="immutableParameter4">
    </diagonal>
    <offDiagonal>
      <immutableParameter idref="immutableParameter3">
    </offDiagonal>
  </compoundSymmetricMatrix>
</oneOnXPrior>
```



### <code>&lt;oneOverStDevPeriodPriorDistribution&gt;</code> element

Calculates the probability of observing a list of doubles with probability proportional to1 over their standard deviation (the Jeffreys prior for normally distributed data)

The element takes following attributes:

* <code>log</code> (optional) is of type [Boolean](#boolean)
: 

* <code>id</code>  is of type [String](#string)
: 

Example:

```html
<oneOverStDevPeriodPriorDistribution log="true" id="foo"/>
```



### <code>&lt;onePGammaDistributionModel&gt;</code> element

A model of a one parameter gamma distribution.

The element has the following contents:

* One of:
    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<onePGammaDistributionModel>
  <shape>
    <matrixParameter idref="matrixParameter6">
  </shape>
</onePGammaDistributionModel>
```



### <code>&lt;operators&gt;</code> element

A simple operator scheduler

The element takes following attributes:

* <code>sequential</code> (optional) is of type [Boolean](#boolean)
: 

* <code>optimizationSchedule</code> (optional) is of type [String](#string)
: 

* <code>minAcceptance</code> (optional) is of type [Double](#double)
: "Acceptance rate below which an operator will be switched off"

* <code>minUsage</code> (optional) is of type [Integer](#integer)
: "Minimum number of usage before testing acceptance threshold"

The element has the following contents:

* [MCMCOperator](#mcmcoperator) elements (one or more)

Example:

```html
<operators sequential="true" optimizationSchedule="foo" minAcceptance="1.0" minUsage="1">
  <subtreeLeap weight="1.0" size="1.0" accP="1.0" autoOptimize="true">
    <treeModel idref="treeModel3">
  </subtreeLeap>
  <jointOperator weight="1.0" targetAcceptance="1.0">
    <uniformOperator idref="uniformOperator6">
    <uniformOperator idref="uniformOperator8">
  </jointOperator>
  <networkNodeReHeight weight="1.0">
    <alloppspecies idref="alloppspecies10">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork7">
  </networkNodeReHeight>
</operators>
```



### <code>&lt;optimizedBeagleTreeLikelihood&gt;</code> element

Parses a collection of BeagleTreeLikelihoods and determines the number of partitions.

The element takes following attributes:

* <code>calibrate</code> (optional) is of type [Integer](#integer)
: 

* <code>retry</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [BeagleTreeLikelihood](#beagletreelikelihood) elements (one or more)

Example:

```html
<optimizedBeagleTreeLikelihood calibrate="1" retry="1">
  ERROR!
  ERROR!
</optimizedBeagleTreeLikelihood>
```



### <code>&lt;optimizer&gt;</code> element

This element returns a maximum likelihood heuristic optimizer and runs the optimization as a side effect.

The element takes following attributes:

* <code>chainLength</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [OperatorSchedule](#operatorschedule) element (exactly one)

* [Likelihood](#likelihood) element (exactly one)

* [Logger](#logger) elements (one or more)

Example:

```html
<optimizer chainLength="1">
  <operators sequential="true" optimizationSchedule="foo" minAcceptance="1.0" minUsage="1">
    <adaptableVarianceMultivariateNormalOperator idref="adaptableVarianceMultivariateNormalOperator7">
    <oldLatentLiabilityGibbsOperator idref="oldLatentLiabilityGibbsOperator3">
    <msatModelSwitchOperator idref="msatModelSwitchOperator8">
    <treeBitRandomWalk idref="treeBitRandomWalk1">
  </operators>
  <attributeBranchRateModel rateAttribute="foo">
    <partitionedTreeModel idref="partitionedTreeModel4">
  </attributeBranchRateModel>
  <completeHistoryLogger>
    ERROR!
  </completeHistoryLogger>
  <logArgTree logEvery="1" partition="1" fileName="foo" title="foo" nexusFormat="true" branchLengths="time">
    <argTreeModel idref="argTreeModel9">
  </logArgTree>
  <logTree logEvery="1" overwrite="true" fileName="foo" title="foo" nexusFormat="true" sortTranslationTable="true" branchLengths="time" traitFilter="foo" mapNamesToNumbers="true" dp="1">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
    <trait name="foo" tag="foo">
      <mixtureCartogramDiffusionModel idref="mixtureCartogramDiffusionModel3">
    </trait>
    <trait name="foo" tag="foo">
      <mixtureCartogramDiffusionModel idref="mixtureCartogramDiffusionModel8">
    </trait>
    <trait name="foo" tag="foo">
      <multivariateDiffusionModel idref="multivariateDiffusionModel9">
    </trait>
    <trait name="foo" tag="foo">
      <greatCircleDiffusionModel idref="greatCircleDiffusionModel2">
    </trait>
    <multivariateInverseWishartPrior idref="multivariateInverseWishartPrior7">
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser9">
    <rateCovarianceStatistic idref="rateCovarianceStatistic10">
    <relaxedDriftModel idref="relaxedDriftModel3">
  </logTree>
</optimizer>
```



### <code>&lt;orderedLatentLiabilityLikelihood&gt;</code> element

Provides the likelihood of a latent liability model on multivariate ordered trait data

The element takes following attributes:

* <code>isUnordered</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* At least one of:
    * [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)
: The model for the latent random variables

    * All of:
        * <code>NData</code>  is of type [Integer](#integer)
: 

        * <code>NTraits</code>  is of type [Integer](#integer)
: 





* Element named <code>&lt;tipTrait&gt;</code>
: The parameter of tip locations from the tree

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;threshold&gt;</code>
: The parameter with nonzero thershold values

    Containing:

    * [CompoundParameter](#compoundparameter) element (exactly one)

* Element named <code>&lt;numClasses&gt;</code>
: Number of multinomial classes in each dimention

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [PatternList](#patternlist) element (exactly one)
: The binary tip data

* [TreeModel](#treemodel) element (exactly one)
: The tree model

Example:

```html
<orderedLatentLiabilityLikelihood isUnordered="true">
  <tipTrait>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix2">
  </tipTrait>
  <threshold>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix4">
  </threshold>
  <numClasses>
    <complementParameter idref="complementParameter6">
  </numClasses>
  <sequenceSimulator replications="1">
    <argTreeModel idref="argTreeModel9">
    ERROR!
  </sequenceSimulator>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <rescaledTree idref="rescaledTree10">
  </empiricalTreeDistributionModel>
</orderedLatentLiabilityLikelihood>
```



### <code>&lt;orderedLatentLiabilityTransform&gt;</code> element

null

The element has the following contents:

* [OrderedLatentLiabilityLikelihood](#orderedlatentliabilitylikelihood) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<orderedLatentLiabilityTransform>
  <orderedLatentLiabilityLikelihood isUnordered="true">
    <tipTrait>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter1">
    </tipTrait>
    <threshold>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix2">
    </threshold>
    <numClasses>
      <diagonalMatrix idref="diagonalMatrix8">
    </numClasses>
    <categoryOutbreak idref="categoryOutbreak5">
    <partitionedTreeModel idref="partitionedTreeModel1">
  </orderedLatentLiabilityLikelihood>
</orderedLatentLiabilityTransform>
```



### <code>&lt;originDestinationDesignMatrix&gt;</code> element

A matrix parameter constructed from its component parameters.

The element takes following attributes:

* <code>latitudeTrait</code> (optional) is of type [String](#string)
: 

* <code>longitudeTrait</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [DesignMatrix](#designmatrix) element (exactly one)

* [DataType](#datatype) element (exactly one)

Example:

```html
<originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <designMatrix idref="designMatrix4">
    <hiddenNucleotides idref="hiddenNucleotides3">
  </originDestinationDesignMatrix>
  <hiddenNucleotides classCount="1"/>
</originDestinationDesignMatrix>
```



### <code>&lt;Ornstein-Uhlenbeck&gt;</code> element



The element takes following attributes:

* <code>logUnits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>normalize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;mean&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;mean&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;sigma&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;sigma&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;lambda&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;lambda&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* [VariableDemographicModel](#variabledemographicmodel) element (zero or one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

* Element named <code>&lt;times&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

Example:

```html
<Ornstein-Uhlenbeck logUnits="true" normalize="true">
  <mean>
    1.0
  </mean>
  <sigma>
    1.0
  </sigma>
  <lambda>
    <vectorSlice idref="vectorSlice3">
  </lambda>
</Ornstein-Uhlenbeck>
```



### <code>&lt;ovariableSkyLineLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element takes following attributes:

* <code>type</code> (optional) is of type [Boolean](#boolean)
: 

* <code>logUnits</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<ovariableSkyLineLikelihood type="true" logUnits="true">
  <populationSizes>
    <jointParameter idref="jointParameter9">
  </populationSizes>
  <indicators>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter3">
  </indicators>
  <populationTree>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel7">
  </populationTree>
</ovariableSkyLineLikelihood>
```



### <code>&lt;parameter&gt;</code> element

A real-valued parameter of one or more dimensions.

The element takes following attributes:

* <code>value</code> (optional) is of type [Double;](#double;)
: 

* <code>dimension</code> (optional) is of type [Integer](#integer)
: 

* <code>fileName</code> (optional) is of type [String](#string)
: 

* <code>parameterColumn</code> (optional) is of type [String](#string)
: 

* <code>burnin</code> (optional) is of type [Integer](#integer)
: 

* <code>upper</code> (optional) is of type [Double;](#double;)
: 

* <code>lower</code> (optional) is of type [Double;](#double;)
: 

The element has the following contents:

* Element named <code>&lt;randomize&gt;</code>

    Containing:

    * [Distribution](#distribution) element (exactly one)

Example:

```html
<parameter value="0.5 1.0" dimension="1" fileName="foo" parameterColumn="foo" burnin="1" upper="0.5 1.0" lower="0.5 1.0"/>
```



### <code>&lt;parsimonyStateStatistic&gt;</code> element

A statistic that has as its value the parsimony state reconstruction of a binary state defined by a set of taxa at a given MRCA of a tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic for the purposes of logging"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;state&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)

Example:

```html
<parsimonyStateStatistic name="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <categoryOutbreak idref="categoryOutbreak9">
  </empiricalTreeDistributionModel>
  <state>
    <taxa idref="taxa2">
  </state>
  <mrca>
    <taxa idref="taxa4">
  </mrca>
</parsimonyStateStatistic>
```



### <code>&lt;parsimonyStatistic&gt;</code> element

A statistic that has as its value the parsimony tree length of a set of a binary state defined by a set of taxa for a given tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;state&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)

Example:

```html
<parsimonyStatistic name="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <speciesTree idref="speciesTree5">
  </empiricalTreeDistributionModel>
  <state>
    <taxa idref="taxa1">
  </state>
</parsimonyStatistic>
```



### <code>&lt;partitionedTreeModel&gt;</code> element

This element represents a model of a phylogenetic tree together with the partitioning of its nodes into connected subgraphs to represent the transmission tree.

The element takes following attributes:

* <code>startingTransmissionTreeFile</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;rootHeight&gt;</code>
: A parameter definition with id only (cannot be a reference!)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;nodeHeights&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root height is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node heights (minus the root) are included in the parameter"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafHeight&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;nodeTraits&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The name of the trait attribute in the taxa"

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root trait is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node traits (minus the root) are included in the parameter"

    * <code>leafNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the leaf node traits are included in the parameter"

    * <code>traitDimension</code> (optional) is of type [Integer](#integer)
: "The number of dimensions (if multivariate)"

    * <code>initialValue</code> (optional) is of type [Double](#double)
: "The initial value(s)"

    * <code>fireTreeEvents</code> (optional) is of type [Boolean](#boolean)
: "Whether to fire tree events if the traits change"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;nodeRates&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root rate is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node rate (minus the root) are included in the parameter"

    * <code>leafNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the leaf node rate are included in the parameter"

    * <code>initialValue</code> (optional) is of type [Double](#double)
: "The initial value(s)"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafTrait&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * <code>name</code>  is of type [String](#string)
: "The name of the trait attribute in the taxa"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafHeights&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)
: A set of taxa for which leaf heights are required

    * [Parameter](#parameter) element (exactly one)
: A compound parameter containing the leaf heights

* Element named <code>&lt;outbreak&gt;</code>
: The case data

    Containing:

    * [AbstractOutbreak](#abstractoutbreak) element (exactly one)

Example:

```html
<partitionedTreeModel startingTransmissionTreeFile="foo">
  <newick usingDates="true" usingHeights="true" rescaleHeight="1.0" rescaleLength="1.0" units="mutations">
    foo
  </newick>
  <rootHeight>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
  </rootHeight>
  <nodeHeights rootNode="true" internalNodes="true">
    <diagonalMatrix idref="diagonalMatrix9">
  </nodeHeights>
  <nodeHeights rootNode="true" internalNodes="true">
    <compoundMatrixParameter idref="compoundMatrixParameter2">
  </nodeHeights>
  <nodeHeights rootNode="true" internalNodes="true">
    <matrixParameter idref="matrixParameter7">
  </nodeHeights>
  <nodeHeights rootNode="true" internalNodes="true">
    <compoundMatrixParameter idref="compoundMatrixParameter1">
  </nodeHeights>
  <leafHeight taxon="foo">
    <sumParameter idref="sumParameter4">
  </leafHeight>
  <leafHeight taxon="foo">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
  </leafHeight>
  <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
    <sumParameter idref="sumParameter8">
  </nodeTraits>
  <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
    <vectorSlice idref="vectorSlice4">
  </nodeRates>
  <leafTrait taxon="foo" name="foo">
    <maskedMatrixParameter idref="maskedMatrixParameter10">
  </leafTrait>
  <leafTrait taxon="foo" name="foo">
    <matrixVectorProductParameter idref="matrixVectorProductParameter8">
  </leafTrait>
  <leafTrait taxon="foo" name="foo">
    <hiddenClassRewardParameter idref="hiddenClassRewardParameter3">
  </leafTrait>
  <leafTrait taxon="foo" name="foo">
    <diagonalMatrix idref="diagonalMatrix1">
  </leafTrait>
  <outbreak>
    <categoryOutbreak idref="categoryOutbreak9">
  </outbreak>
</partitionedTreeModel>
```



### <code>&lt;partitionStatistic&gt;</code> element

null

Example:

```html
<partitionStatistic/>
```



### <code>&lt;pathLikelihood&gt;</code> element

A likelihood function used for estimating marginal likelihoods and Bayes factors using path sampling.

The element has the following contents:

* Element named <code>&lt;source&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* Element named <code>&lt;destination&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* Element named <code>&lt;sourcePseudoPrior&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

* Element named <code>&lt;destinationPseudoPrior&gt;</code>

    Containing:

    * [Likelihood](#likelihood) element (exactly one)

Example:

```html
<pathLikelihood>
  <source>
    <discretizedBranchRates idref="discretizedBranchRates9">
  </source>
  <destination>
    <compoundLikelihood idref="compoundLikelihood7">
  </destination>
</pathLikelihood>
```



### <code>&lt;pathSamplingAnalysis&gt;</code> element

Performs a trace analysis.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately)"

* <code>resultsFileName</code> (optional) is of type [String](#string)
: "The name of the output file to which the path sampling estimate will be written"

The element has the following contents:

* Element named <code>&lt;thetaColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<pathSamplingAnalysis fileName="foo" resultsFileName="foo">
  <thetaColumn name="foo"/>
  <likelihoodColumn name="foo"/>
</pathSamplingAnalysis>
```



### <code>&lt;patterns&gt;</code> element

A weighted list of the unique site patterns (unique columns) in an alignment.

The element takes following attributes:

* <code>from</code> (optional) is of type [Integer](#integer)
: "The site position to start at, default is 1 (the first position)"

* <code>to</code> (optional) is of type [Integer](#integer)
: "The site position to finish at, must be greater than <b>from</b>, default is length of given alignment"

* <code>every</code> (optional) is of type [Integer](#integer)
: "Determines how many sites are selected. A value of 3 will select every third site starting from <b>from</b>, default is 1 (every site)"

* <code>strip</code> (optional) is of type [Boolean](#boolean)
: "Strip out completely ambiguous sites"

* <code>unique</code> (optional) is of type [Boolean](#boolean)
: "Return a weight list of unique patterns"

The element has the following contents:

* Element named <code>&lt;taxonList&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)

* Element named <code>&lt;constantPatterns&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [Alignment](#alignment) element (exactly one)

Example:

```html
<patterns from="1" to="1" every="1" strip="true" unique="true">
  <hypermutantAlignment type="hA3G">
    <hypermutantAlignment idref="hypermutantAlignment6">
  </hypermutantAlignment>
</patterns>
```



### <code>&lt;patternSubSet&gt;</code> element

A weighted list of the unique site patterns (unique columns) in an alignment.

The element takes following attributes:

* <code>subSet</code> (optional) is of type [Integer](#integer)
: "Which subset of patterns to use (out of subSetCount)"

* <code>subSetCount</code> (optional) is of type [Integer](#integer)
: "The number of subsets"

The element has the following contents:

* [SiteList](#sitelist) element (exactly one)

Example:

```html
<patternSubSet subSet="1" subSetCount="1">
  <alignment>
    <hiddenNucleotides idref="hiddenNucleotides5">
    <sequence idref="sequence8">
    <sequence idref="sequence1">
    <sequence idref="sequence5">
    <sequence idref="sequence6">
  </alignment>
</patternSubSet>
```



### <code>&lt;pcaCodonModel&gt;</code> element

This element represents the PCA model of codon evolution.

The element takes following attributes:

* <code>geneticCode</code> (optional) is of type [String](#string)
: "The genetic code to use"

* <code>pcaType</code> (optional) is of type [String](#string)
: "The PCA type to use"

* <code>pcaDataDir</code> (optional) is of type [String](#string)
: "The directory with the PCA data files"

The element has the following contents:

* Element named <code>&lt;pcaDimension&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<pcaCodonModel geneticCode="bacterial" pcaType="null" pcaDataDir="pcadata">
  <pcaDimension>
    <diagonalMatrix idref="diagonalMatrix2">
  </pcaDimension>
</pcaCodonModel>
```



### <code>&lt;piecewisePopulation&gt;</code> element

This element represents a piecewise population model

The element takes following attributes:

* <code>linear</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;epochSizes&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * All of:
        * Element named <code>&lt;populationSize&gt;</code>

            Containing:

            * [Parameter](#parameter) element (exactly one)

        * Element named <code>&lt;growthRates&gt;</code>

            Containing:

            * [Parameter](#parameter) element (exactly one)




* Element named <code>&lt;epochWidths&gt;</code>

    Containing:

    * <code>widths</code>  is of type [Double;](#double;)
: 

Example:

```html
<piecewisePopulation linear="true">
  <epochSizes>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix1">
  </epochSizes>
  <epochWidths widths="0.5 1.0"/>
</piecewisePopulation>
```



### <code>&lt;plinkImport&gt;</code> element

Provides the likelihood of pairwise distance given vectors of coordinatesfor points according to the multidimensional scaling scheme of XXX & Rafferty (xxxx).

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The name of the file containing the plink table"

* <code>traitName</code>  is of type [String](#string)
: 

The element has the following contents:

* At least one of:
    * [Taxa](#taxa) elements (one or more)

    * [Taxon](#taxon) elements (one or more)



Example:

```html
<plinkImport fileName="foo" traitName="foo">
  <sp>
    <apsp idref="apsp4">
    <sp idref="sp1">
    <taxon idref="taxon10">
  </sp>
</plinkImport>
```



### <code>&lt;poissonDistributionModel&gt;</code> element

Describes a Poisson distribution with a given mean that can be used in a distributionLikelihood element

The element has the following contents:

* Element named <code>&lt;mean&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


Example:

```html
<poissonDistributionModel>
  <mean>
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView8">
  </mean>
</poissonDistributionModel>
```



### <code>&lt;poissonPartitionLikelihood&gt;</code> element

null

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<poissonPartitionLikelihood mean="1.0">
  <argTreeModel partitionType="reassortment">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
    <rootHeight>
      <leafTraitParameter idref="leafTraitParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <copyParameterValues idref="copyParameterValues9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter2">
    </nodeHeights>
  </argTreeModel>
</poissonPartitionLikelihood>
```



### <code>&lt;poissonPrior&gt;</code> element

Calculates the prior probability of some data under a given poisson distribution.

The element takes following attributes:

* <code>mean</code>  is of type [Double](#double)
: 

* <code>offset</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<poissonPrior mean="1.0" offset="1.0">
  <diagonalMatrix>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
  </diagonalMatrix>
</poissonPrior>
```



### <code>&lt;polygon&gt;</code> element

This element represents a polygon.

The element takes following attributes:

* <code>closed</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fillValue</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* One of:
    * [KMLCoordinates](#kmlcoordinates) element (exactly one)

    * [Polygon2D](#polygon2d) element (exactly one)


Example:

```html
<polygon closed="true" fillValue="1.0">
  <coordinates>
    foo
  </coordinates>
</polygon>
```



### <code>&lt;poolSwapOperator&gt;</code> element

.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [ValuesPool](#valuespool) element (exactly one)

Example:

```html
<poolSwapOperator weight="1.0">
  ERROR!
</poolSwapOperator>
```



### <code>&lt;popGraph&gt;</code> element

This element returns a statistic that is the population size at evenly spaced intervals over tree.

The element takes following attributes:

* <code>time</code>  is of type [Double](#double)
: 

The element has the following contents:

* [VariableDemographicModel](#variabledemographicmodel) element (exactly one)

Example:

```html
<popGraph time="1.0">
  <variableDemographic type="foo" logUnits="true" useMidpoints="true">
    <populationSizes>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter1">
    </populationSizes>
    <indicators>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter8">
    </indicators>
    <trees>
      <ptree ploidy="1.0">
        <partitionedTreeModel idref="partitionedTreeModel1">
      </ptree>
      <ptree ploidy="1.0">
        <treeModel idref="treeModel1">
      </ptree>
      <ptree ploidy="1.0">
        <partitionedTreeModel idref="partitionedTreeModel2">
      </ptree>
    </trees>
  </variableDemographic>
</popGraph>
```



### <code>&lt;positiveDefiniteSubstitutionModel&gt;</code> element

A general reversible model of sequence substitution for any data type with stochastic variable selection.

The element has the following contents:

* [MatrixParameter](#matrixparameter) element (exactly one)

Example:

```html
<positiveDefiniteSubstitutionModel>
  <designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true"/>
</positiveDefiniteSubstitutionModel>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1"/>
```



### <code>&lt;precisionGibbsOperator&gt;</code> element

This element returns a multivariate normal random walk operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (zero or one)

* [ConjugateWishartStatisticsProvider](#conjugatewishartstatisticsprovider) element (zero or one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) elements (one to 2)

* [MatrixParameterInterface](#matrixparameterinterface) element (zero or one)

Example:

```html
<precisionGibbsOperator weight="1.0">
  <dirichletPrior counts="0.5 1.0" sumsTo="1.0">
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView10">
    <exponentialStatistic idref="exponentialStatistic10">
  </dirichletPrior>
</precisionGibbsOperator>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <ovariableSkyLineLikelihood type="true" logUnits="true">
    <populationSizes>
      <leafTraitParameter idref="leafTraitParameter5">
    </populationSizes>
    <indicators>
      <diagonalMatrix idref="diagonalMatrix5">
    </indicators>
    <populationTree>
      <partitionedTreeModel idref="partitionedTreeModel1">
    </populationTree>
  </ovariableSkyLineLikelihood>
</compoundLikelihood>
```



### <code>&lt;productStatistic&gt;</code> element

This element returns a statistic that is the product of the child statistics.

The element takes following attributes:

* <code>elementwise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<productStatistic elementwise="true" name="foo">
  <negativeStatistic>
    <rateStatistic idref="rateStatistic4">
  </negativeStatistic>
</productStatistic>
```



### <code>&lt;productOfExponentials&gt;</code> element

Calculates a product of exponentials based on a (set of) fixed log population sizes.

The element takes following attributes:

* <code>logPopSize</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<productOfExponentials logPopSize="1.0">
  <treeModel fixHeights="true" fixTree="true">
    <speciesTree idref="speciesTree9">
    <rootHeight>
      <parameter idref="parameter1">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <designMatrix idref="designMatrix1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <immutableParameter idref="immutableParameter2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <dataFromTreeTips idref="dataFromTreeTips3">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastMatrixParameter idref="fastMatrixParameter10">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedParameter idref="maskedParameter6">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <duplicatedParameter idref="duplicatedParameter7">
    </leafTrait>
  </treeModel>
</productOfExponentials>
```



### <code>&lt;productOfExponentialsPosteriorMeans&gt;</code> element

Calculates a product of exponentials based on a set of posterior sample means.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<productOfExponentialsPosteriorMeans fileName="foo" parameterColumn="foo" dimension="1">
  <starTreeModel>
    <upgmaTree idref="upgmaTree10">
    <sharedRootHeight>
      <starTreeModel idref="starTreeModel2">
    </sharedRootHeight>
    <leafTrait taxon="foo" name="foo">
      <sumParameter idref="sumParameter3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixVectorProductParameter idref="matrixVectorProductParameter2">
    </leafTrait>
  </starTreeModel>
</productOfExponentialsPosteriorMeans>
```



### <code>&lt;productOfExponentialsPosteriorMeansLoess&gt;</code> element

Calculates a product of exponentials based on a set of posterior sample means, undergoing loess smoothing.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<productOfExponentialsPosteriorMeansLoess fileName="foo" parameterColumn="foo" dimension="1">
  <treeModel fixHeights="true" fixTree="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel4">
    <rootHeight>
      <compoundMatrixParameter idref="compoundMatrixParameter4">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
    </nodeHeights>
    <leafHeight taxon="foo">
      <fastMatrixParameter idref="fastMatrixParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter4">
    </leafHeight>
    <leafHeight taxon="foo">
      <vectorSlice idref="vectorSlice1">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixParameter idref="matrixParameter3">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter9">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix1">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <designMatrix idref="designMatrix6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues4">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
    </leafTrait>
  </treeModel>
</productOfExponentialsPosteriorMeansLoess>
```



### <code>&lt;productOfExponentialsSufficientStatistics&gt;</code> element

Calculates a product of exponentials based on a set of posterior sample means, using sufficient statistics.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<productOfExponentialsSufficientStatistics fileName="foo" parameterColumn="foo" dimension="1">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <transformedTreeModel idref="transformedTreeModel7">
    <rootHeight>
      <matrixVectorProductParameter idref="matrixVectorProductParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix6">
    </nodeHeights>
    <leafHeight taxon="foo">
      <jointParameter idref="jointParameter6">
    </leafHeight>
    <leafHeight taxon="foo">
      <jointParameter idref="jointParameter10">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <duplicatedParameter idref="duplicatedParameter4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <complementParameter idref="complementParameter2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix1">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak4">
    </outbreak>
  </partitionedTreeModel>
</productOfExponentialsSufficientStatistics>
```



### <code>&lt;productOfGammas&gt;</code> element

Calculates a product of gamma distributions.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: 

* <code>parameterColumn</code>  is of type [String](#string)
: 

* <code>dimension</code>  is of type [Integer](#integer)
: 

* <code>popSize</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<productOfGammas fileName="foo" parameterColumn="foo" dimension="1" popSize="1.0">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <newick idref="newick7">
    <rootHeight>
      <sumParameter idref="sumParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <parameter idref="parameter3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix7">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastMatrixParameter idref="fastMatrixParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter4">
    </leafHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </leafHeight>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
    </leafHeight>
    <leafHeight taxon="foo">
      <copyParameterValues idref="copyParameterValues4">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <diagonalMatrix idref="diagonalMatrix2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <matrixVectorProductParameter idref="matrixVectorProductParameter10">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <diagonalMatrix idref="diagonalMatrix2">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <vectorSlice idref="vectorSlice6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <parameter idref="parameter8">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <productParameter idref="productParameter2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <fastMatrixParameter idref="fastMatrixParameter2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix8">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak5">
    </outbreak>
  </partitionedTreeModel>
</productOfGammas>
```



### <code>&lt;productParameter&gt;</code> element

A element-wise product of parameters.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<productParameter>
  <blockUpperTriangularMatrixParameter transpose="true" columnDimension="1" diagonalRestriction="true">
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter6">
    <complementParameter idref="complementParameter9">
  </blockUpperTriangularMatrixParameter>
</productParameter>
```



### <code>&lt;productStatistic&gt;</code> element

This element returns a statistic that is the product of the child statistics.

The element takes following attributes:

* <code>elementwise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<productStatistic elementwise="true" name="foo">
  <exponentialStatistic>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
  </exponentialStatistic>
  <ratioStatistic>
    <negativeStatistic idref="negativeStatistic5">
    <sumStatistic idref="sumStatistic3">
  </ratioStatistic>
</productStatistic>
```



### <code>&lt;property&gt;</code> element

This element returns an object representing the named property of the given child object.

The element takes following attributes:

* <code>name</code>  is of type [String](#string)
: "name of the property"

The element has the following contents:

* [Object](#object) element (exactly one)

Example:

```html
<property name="length">
  <multivariateWishartPrior nonInformative="true" df="1.0">
    <data>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix4">
    </data>
  </multivariateWishartPrior>
</property>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <ancestralTreeLikelihood useAmbiguities="true" stateTagName="foo" scalingScheme="foo" delayScaling="foo">
    <sequenceSimulator idref="sequenceSimulator5">
    <treeModel idref="treeModel9">
    <siteModel idref="siteModel6">
  </ancestralTreeLikelihood>
  <glmModel family="foo" checkIdentifiability="true" checkFullRank="true">
    <independentVariables>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </independentVariables>
    <independentVariables>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix2">
    </independentVariables>
    <randomEffects>
      <mvPolyaLikelihood idref="mvPolyaLikelihood10">
    </randomEffects>
  </glmModel>
</compoundLikelihood>
```



### <code>&lt;randomBranchModel&gt;</code> element

randomBranchModel

The element takes following attributes:

* <code>rate</code> (optional) is of type [Double](#double)
: "Rate of the exponentially distributed random component."

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;baseSubstitutionModel&gt;</code>

    Containing:

    * [SubstitutionModel](#substitutionmodel) element (exactly one)

Example:

```html
<randomBranchModel rate="1.0">
  <starTreeModel>
    <speciesTree idref="speciesTree2">
    <sharedRootHeight>
      <partitionedTreeModel idref="partitionedTreeModel5">
    </sharedRootHeight>
    <leafHeight taxon="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <duplicatedParameter idref="duplicatedParameter3">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser10">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter4">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix1">
    </leafTrait>
  </starTreeModel>
  <baseSubstitutionModel>
    <markovModulatedSubstitutionModel idref="markovModulatedSubstitutionModel6">
  </baseSubstitutionModel>
</randomBranchModel>
```



### <code>&lt;randomLocalClockModel&gt;</code> element

This element returns an random local clock (RLC) model.Each branch either has a new rate or inherits the rate of the branch above it depending on the indicator vector, which is itself sampled.

The element takes following attributes:

* <code>ratesAreMultipliers</code>  is of type [Boolean](#boolean)
: 

* <code>threshold</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;rateIndicator&gt;</code>
: The rate change indicators parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rates&gt;</code>
: The rates parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;clockRate&gt;</code>
: The mean rate across all local clocks

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<randomLocalClockModel ratesAreMultipliers="true" threshold="1.0">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <attributePatterns idref="attributePatterns10">
  </empiricalTreeDistributionModel>
  <rateIndicator>
    <maskedParameter idref="maskedParameter10">
  </rateIndicator>
  <rates>
    <differenceParameter idref="differenceParameter2">
  </rates>
</randomLocalClockModel>
```



### <code>&lt;randomLocalLogger&gt;</code> element

A speciation model of a Yule process whose rate can evolve down the tree.

The element takes following attributes:

* <code>logEvery</code>  is of type [Integer](#integer)
: 

* <code>fileName</code>  is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [RandomLocalTreeVariable](#randomlocaltreevariable) element (exactly one)

Example:

```html
<randomLocalLogger logEvery="1" fileName="foo">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <upgmaTree idref="upgmaTree5">
    <rootHeight>
      <matrixVectorProductParameter idref="matrixVectorProductParameter7">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
    </leafHeight>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
    </leafHeight>
    <leafHeight taxon="foo">
      <designMatrix idref="designMatrix9">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <complementParameter idref="complementParameter4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix9">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter5">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak10">
    </outbreak>
  </partitionedTreeModel>
  <randomLocalYuleModel ratesAsMultipliers="true" dp="1" units="years">
    <birthRates>
      <complementParameter idref="complementParameter8">
    </birthRates>
    <indicators>
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    </indicators>
    <meanRate>
      <parameter idref="parameter3">
    </meanRate>
  </randomLocalYuleModel>
</randomLocalLogger>
```



### <code>&lt;randomLocalLoggerOnTree&gt;</code> element

A parser to log changed == 0 : 1 in a tree log

The element has the following contents:

* [RandomLocalTreeVariable](#randomlocaltreevariable) element (exactly one)

Example:

```html
<randomLocalLoggerOnTree>
  <randomLocalYuleModel ratesAsMultipliers="true" dp="1" units="generations">
    <birthRates>
      <matrixParameter idref="matrixParameter9">
    </birthRates>
    <indicators>
      <immutableParameter idref="immutableParameter5">
    </indicators>
    <meanRate>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix6">
    </meanRate>
  </randomLocalYuleModel>
</randomLocalLoggerOnTree>
```



### <code>&lt;randomLocalYuleModel&gt;</code> element

A speciation model of a Yule process whose rate can change at random nodes in the tree.

The element takes following attributes:

* <code>ratesAsMultipliers</code>  is of type [Boolean](#boolean)
: 

* <code>dp</code> (optional) is of type [Integer](#integer)
: 

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;birthRates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;meanRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<randomLocalYuleModel ratesAsMultipliers="true" dp="1" units="substitutions">
  <birthRates>
    <vectorSlice idref="vectorSlice4">
  </birthRates>
  <indicators>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
  </indicators>
  <meanRate>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter1">
  </meanRate>
</randomLocalYuleModel>
```



### <code>&lt;randomTaxaSample&gt;</code> element

Randomly samples n taxa from a collection of N taxa

The element takes following attributes:

* <code>sample</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Taxa](#taxa) element (exactly one)

Example:

```html
<randomTaxaSample sample="1">
  <taxa>
    <taxa idref="taxa3">
  </taxa>
</randomTaxaSample>
```



### <code>&lt;randomWalk&gt;</code> element

Describes a first-order random walk. No prior is assumed on the first data element

The element takes following attributes:

* <code>logScale</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* One of:
    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

    * [DistributionLikelihood](#distributionlikelihood) element (exactly one)


Example:

```html
<randomWalk logScale="true">
  <vectorSlice sliceDimension="1">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter7">
    <compoundParameter idref="compoundParameter9">
    <duplicatedParameter idref="duplicatedParameter4">
    <fastMatrixParameter idref="fastMatrixParameter6">
  </vectorSlice>
  <poissonDistributionModel>
    <mean>
      1.0
    </mean>
  </poissonDistributionModel>
</randomWalk>
```



### <code>&lt;randomWalkIntegerNodeHeightWeightedOperator&gt;</code> element

This element returns a random walk node height weighted operator on a given parameter.

The element takes following attributes:

* <code>windowSize</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;internalNodeHeights&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<randomWalkIntegerNodeHeightWeightedOperator windowSize="1.0" weight="1.0">
  <sumParameter>
    <differenceParameter idref="differenceParameter3">
  </sumParameter>
  <internalNodeHeights>
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix9">
  </internalNodeHeights>
</randomWalkIntegerNodeHeightWeightedOperator>
```



### <code>&lt;randomWalkIntegerOperator&gt;</code> element

This element returns a random walk operator on a given parameter.

The element takes following attributes:

* <code>windowSize</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Variable](#variable) element (exactly one)

Example:

```html
<randomWalkIntegerOperator windowSize="1.0" weight="1.0">
  <diagonalMatrix>
    <designMatrix idref="designMatrix9">
  </diagonalMatrix>
</randomWalkIntegerOperator>
```



### <code>&lt;randomWalkIntegerSetSizeWeightedOperator&gt;</code> element

This element returns a random walk set size weighted operator on a given parameter.

The element takes following attributes:

* <code>windowSize</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>baseSetSize</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [MicrosatelliteSamplerTreeModel](#microsatellitesamplertreemodel) element (exactly one)

Example:

```html
<randomWalkIntegerSetSizeWeightedOperator windowSize="1.0" weight="1.0" baseSetSize="1.0">
  <complementParameter>
    <fastMatrixParameter idref="fastMatrixParameter10">
  </complementParameter>
  <microsatelliteSamplerTreeModel provideInternalNodeValues="true">
    <tree>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
    </tree>
    <internalValues>
      <vectorSlice idref="vectorSlice4">
    </internalValues>
    <externalValues>
      <microsatelliteSimulator idref="microsatelliteSimulator2">
    </externalValues>
  </microsatelliteSamplerTreeModel>
</randomWalkIntegerSetSizeWeightedOperator>
```



### <code>&lt;randomWalkOnMapOperator&gt;</code> element

This element returns a random walk operator on a given map.

The element takes following attributes:

* <code>windowSize</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [MapDiffusionModel](#mapdiffusionmodel) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<randomWalkOnMapOperator windowSize="1.0" weight="1.0" autoOptimize="true">
  ERROR!
  <dataFromTreeTips traitName="foo">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel2">
    <traitParameter>
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </traitParameter>
  </dataFromTreeTips>
</randomWalkOnMapOperator>
```



### <code>&lt;randomWalkOperator&gt;</code> element

This element returns a random walk operator on a given parameter.

The element takes following attributes:

* <code>windowSize</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>lower</code> (optional) is of type [Double](#double)
: 

* <code>upper</code> (optional) is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>boundaryCondition</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;updateIndex&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<randomWalkOperator windowSize="1.0" weight="1.0" lower="1.0" upper="1.0" autoOptimize="true" boundaryCondition="reflecting">
  <matrixVectorProductParameter>
    <matrix>
      <matrixParameter idref="matrixParameter3">
    </matrix>
    <vector>
      <productParameter idref="productParameter10">
    </vector>
  </matrixVectorProductParameter>
</randomWalkOperator>
```



### <code>&lt;rateBitExchangeOperator&gt;</code> element

This element returns a bit-flip operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>maxTries</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;bits&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<rateBitExchangeOperator weight="1.0" maxTries="1">
  <bits>
    <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser10">
  </bits>
  <rates>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
  </rates>
</rateBitExchangeOperator>
```



### <code>&lt;rateCovarianceStatistic&gt;</code> element

A statistic that has as its value the covariance of parent and child branch rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (exactly one)

Example:

```html
<rateCovarianceStatistic name="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <convert idref="convert9">
  </empiricalTreeDistributionModel>
  <continuousBranchRates singleRootRate="true" normalize="true" normalizeBranchRateTo="1.0">
    <partitionedTreeModel idref="partitionedTreeModel2">
    <distribution>
      <uniformDistributionModel idref="uniformDistributionModel10">
    </distribution>
    <rateCategoryQuantiles>
      <compoundMatrixParameter idref="compoundMatrixParameter3">
    </rateCategoryQuantiles>
  </continuousBranchRates>
</rateCovarianceStatistic>
```



### <code>&lt;rateEpochBranchRates&gt;</code> element

This element provides a multiple epoch molecular clock model. All branches (or portions of them) have the same rate of molecular evolution within a given epoch. If parameters are used to sample transition times, these must be kept in ascending order by judicious use of bounds or priors.

The element takes following attributes:

* <code>continuousNormalization</code> (optional) is of type [Boolean](#boolean)
: "Special rate normalization for a Brownian diffusion process"

The element has the following contents:

* Element named <code>&lt;epoch&gt;</code>
: An epoch that lasts until transitionTime

    Containing:

    * <code>transitionTime</code> (optional) is of type [Double](#double)
: "The time of transition between this epoch and the previous one"

    * [Parameter](#parameter) element (exactly one)
: The evolutionary rate parameter for this epoch

    * Element named <code>&lt;transitionTime&gt;</code>
: The transition time parameter for this epoch

        Containing:

        * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rate&gt;</code>
: The ancestral molecular evolutionary rate parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rootHeight&gt;</code>
: Parameterization may require the root height

    Containing:

    * [Parameter](#parameter) element (exactly one)
: The tree root height

Example:

```html
<rateEpochBranchRates continuousNormalization="true">
  <epoch transitionTime="1.0">
    <matrixParameter idref="matrixParameter8">
  </epoch>
  <epoch transitionTime="1.0">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter10">
  </epoch>
  <epoch transitionTime="1.0">
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix8">
  </epoch>
  <rate>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter4">
  </rate>
</rateEpochBranchRates>
```



### <code>&lt;rateExchange&gt;</code> element

An operator that exchanges rates and traits on a tree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>swapRates</code>  is of type [Boolean](#boolean)
: 

* <code>swapTraits</code>  is of type [Boolean](#boolean)
: 

* <code>swapAtRoot</code>  is of type [Boolean](#boolean)
: 

* <code>moveHeight</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<rateExchange weight="1.0" swapRates="true" swapTraits="true" swapAtRoot="true" moveHeight="true">
  <starTreeModel>
    <argTreeModel idref="argTreeModel9">
    <sharedRootHeight>
      <treeModel idref="treeModel3">
    </sharedRootHeight>
  </starTreeModel>
</rateExchange>
```



### <code>&lt;rateSampleOperator&gt;</code> element

This element returns a rateSample operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>sampleAll</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [RateEvolutionLikelihood](#rateevolutionlikelihood) element (zero or one)

Example:

```html
<rateSampleOperator weight="1.0" sampleAll="true">
  <starTreeModel>
    <transformedTreeModel idref="transformedTreeModel7">
    <rootHeight>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
    </rootHeight>
    <leafHeight taxon="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter6">
    </leafHeight>
  </starTreeModel>
</rateSampleOperator>
```



### <code>&lt;rateScaleOperator&gt;</code> element

This element returns a rateScale operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>noRoot</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<rateScaleOperator scaleFactor="1.0" weight="1.0" autoOptimize="true" noRoot="true">
  <treeModel fixHeights="true" fixTree="true">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
    <rootHeight>
      <complementParameter idref="complementParameter8">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <maskedParameter idref="maskedParameter7">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <complementParameter idref="complementParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <productParameter idref="productParameter8">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <matrixMatrixProduct idref="matrixMatrixProduct4">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixParameter idref="matrixParameter8">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <productParameter idref="productParameter2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter10">
    </leafTrait>
  </treeModel>
</rateScaleOperator>
```



### <code>&lt;rateStatistic&gt;</code> element

A statistic that returns the average of the branch rates

The element takes following attributes:

* <code>internal</code>  is of type [Boolean](#boolean)
: 

* <code>external</code>  is of type [Boolean](#boolean)
: 

* <code>mode</code>  is of type [String](#string)
: "This attribute determines how the rates are summarized, can be one of (mean, variance, coefficientOfVariance)"

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (exactly one)

Example:

```html
<rateStatistic internal="true" external="true" mode="mean" name="foo">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <transformedTreeModel idref="transformedTreeModel6">
    <rootHeight>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter3">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <productParameter idref="productParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter9">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser4">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter4">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <copyParameterValues idref="copyParameterValues6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <dataFromTreeTips idref="dataFromTreeTips10">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundMatrixParameter idref="compoundMatrixParameter7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <duplicatedParameter idref="duplicatedParameter6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <differenceParameter idref="differenceParameter1">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter7">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak6">
    </outbreak>
  </partitionedTreeModel>
  <strictClockBranchRates>
    <rate>
      <compoundParameter idref="compoundParameter2">
    </rate>
  </strictClockBranchRates>
</rateStatistic>
```



### <code>&lt;rateVarianceScaleOperator&gt;</code> element

This element returns a rateScale operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<rateVarianceScaleOperator scaleFactor="1.0" weight="1.0" autoOptimize="true">
  <starTreeModel>
    <argTreeModel idref="argTreeModel8">
    <sharedRootHeight>
      <starTreeModel idref="starTreeModel1">
    </sharedRootHeight>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix10">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter8">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <differenceParameter idref="differenceParameter2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix4">
    </leafTrait>
  </starTreeModel>
  <markovRandomFieldMatrix asCorrelation="true" dim="1">
    <diagonal>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter6">
    </diagonal>
    <offDiagonal>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </offDiagonal>
    <nugget>
      <diagonalMatrix idref="diagonalMatrix8">
    </nugget>
  </markovRandomFieldMatrix>
</rateVarianceScaleOperator>
```



### <code>&lt;ratioStatistic&gt;</code> element

This element returns a statistic that is the ratio of the 2 child statistics.

The element has the following contents:

* [Statistic](#statistic) elements (exactly 2)
: The two operand statistics

Example:

```html
<ratioStatistic>
  <dataFromTreeTips traitName="foo">
    <treeModel idref="treeModel1">
    <traitParameter>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
    </traitParameter>
  </dataFromTreeTips>
  <notStatistic>
    <rateCovarianceStatistic idref="rateCovarianceStatistic5">
  </notStatistic>
</ratioStatistic>
```



### <code>&lt;ratioStatistic&gt;</code> element

This element returns a statistic that is the ratio of the 2 child statistics.

The element has the following contents:

* [Statistic](#statistic) elements (exactly 2)
: The two operand statistics

Example:

```html
<ratioStatistic>
  <hiddenClassRewardParameter class="1" name="foo">
    <markovModulatedSubstitutionModel idref="markovModulatedSubstitutionModel1">
  </hiddenClassRewardParameter>
  <compoundParameter>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix4">
    <matrixVectorProductParameter idref="matrixVectorProductParameter5">
  </compoundParameter>
</ratioStatistic>
```



### <code>&lt;reciprocalStatistic&gt;</code> element

This element returns a statistic that is the element-wise reciprocal of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<reciprocalStatistic>
  <fastMatrixParameter rows="1" columns="1">
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter7">
    <mvPolyaLikelihood idref="mvPolyaLikelihood7">
  </fastMatrixParameter>
</reciprocalStatistic>
```



### <code>&lt;reciprocalStatistic&gt;</code> element

This element returns a statistic that is the element-wise reciprocal of the child statistic.

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<reciprocalStatistic>
  <differenceStatistic absolute="true">
    <ratioStatistic idref="ratioStatistic4">
    <logarithmStatistic idref="logarithmStatistic10">
  </differenceStatistic>
</reciprocalStatistic>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <invgammaPrior shape="1.0" scale="1.0" offset="1.0">
    <continuousDiffusionStatistic idref="continuousDiffusionStatistic1">
    <parsimonyStateStatistic idref="parsimonyStateStatistic10">
    <partitionStatistic idref="partitionStatistic3">
    <treeLengthStatistic idref="treeLengthStatistic8">
  </invgammaPrior>
  <attributeBranchRateModel rateAttribute="foo">
    <partitionedTreeModel idref="partitionedTreeModel2">
  </attributeBranchRateModel>
  <beagleBranchLikelihood/>
</compoundLikelihood>
```



### <code>&lt;regressionGibbsEffectOperator&gt;</code> element

This element returns a multivariate Gibbs operator on an internal node trait.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

* [LinearRegression](#linearregression) element (exactly one)

* Element named <code>&lt;indicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<regressionGibbsEffectOperator weight="1.0">
  <buildCompoundSymmetricMatrix/>
  <dirichletPrior counts="0.5 1.0" sumsTo="1.0">
    <productStatistic idref="productStatistic2">
    <lineageCountStatistic idref="lineageCountStatistic9">
    <matrixInverse idref="matrixInverse4">
    <compatibilityStatistic idref="compatibilityStatistic4">
  </dirichletPrior>
  ERROR!
</regressionGibbsEffectOperator>
```



### <code>&lt;regressionGibbsPrecisionOperator&gt;</code> element

This element returns a multivariate Gibbs operator on an internal node trait.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [DistributionLikelihood](#distributionlikelihood) element (exactly one)

* [LinearRegression](#linearregression) element (exactly one)

Example:

```html
<regressionGibbsPrecisionOperator weight="1.0">
  <designMatrix addIntercept="true" checkIdentifiability="true" form="foo" colDimension="1" rowDimension="1" standardize="true">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter9">
  </designMatrix>
  <modelSpecificPseudoPrior/>
  ERROR!
</regressionGibbsPrecisionOperator>
```



### <code>&lt;regressionMetropolizedIndicatorOperator&gt;</code> element

This element returns a multivariate Gibbs operator on an internal node trait.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

* [LinearRegression](#linearregression) element (exactly one)

* Element named <code>&lt;indicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;mask&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<regressionMetropolizedIndicatorOperator weight="1.0">
  <sumParameter>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter2">
    <diagonalMatrix idref="diagonalMatrix10">
    <compoundParameter idref="compoundParameter8">
  </sumParameter>
  <multivariateDistributionLikelihood dataAsMatrix="true">
    <distribution>
      <wishartGammaDistributionModel idref="wishartGammaDistributionModel10">
    </distribution>
    <transform idref="transform10">
    <composedTransform idref="composedTransform6">
    <transform idref="transform5">
    <transform idref="transform4">
  </multivariateDistributionLikelihood>
  ERROR!
  <indicator>
    <compoundSymmetricMatrix idref="compoundSymmetricMatrix7">
  </indicator>
</regressionMetropolizedIndicatorOperator>
```



### <code>&lt;relaxedDriftModel&gt;</code> element

This element returns a relaxed drift model.

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* Element named <code>&lt;rates&gt;</code>
: The rates parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;rateIndicator&gt;</code>
: The indicator parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;driftRates&gt;</code>
: the drift rates parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<relaxedDriftModel>
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <mulSpeciesTree idref="mulSpeciesTree7">
  </empiricalTreeDistributionModel>
  <rates>
    <designMatrix idref="designMatrix10">
  </rates>
  <rateIndicator>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix2">
  </rateIndicator>
</relaxedDriftModel>
```



### <code>&lt;report&gt;</code> element

Generates a report using the given text and elements

The element takes following attributes:

* <code>type</code> (optional) is of type [String](#string)
: "The format of the report"

* <code>title</code> (optional) is of type [String](#string)
: "The title of the report"

* <code>fileName</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Object](#object) elements (one or more)
: An arbitrary mixture of text and elements to report

Example:

```html
<report type="TEXT" title="Report" fileName="foo">
  <MsatSingleAncestralStateGibbsOperator weight="1.0">
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
    <microsatelliteSamplerTreeModel idref="microsatelliteSamplerTreeModel9">
    ERROR!
    <strictClockBranchRates idref="strictClockBranchRates8">
  </MsatSingleAncestralStateGibbsOperator>
</report>
```



### <code>&lt;rescaledTree&gt;</code> element

This element rescales a given tree with a set of clade heights.

The element takes following attributes:

* <code>height</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;clade&gt;</code>

    Containing:

    * <code>height</code> (optional) is of type [Double](#double)
: 

    * [TaxonList](#taxonlist) element (exactly one)

Example:

```html
<rescaledTree height="1.0">
  <transformedTreeModel version="foo">
    <treeModel idref="treeModel2">
    <differenceParameter idref="differenceParameter2">
  </transformedTreeModel>
  <clade height="1.0">
    <rescaledTree idref="rescaledTree9">
  </clade>
  <clade height="1.0">
    <convert idref="convert1">
  </clade>
  <clade height="1.0">
    <patterns idref="patterns1">
  </clade>
</rescaledTree>
```



### <code>&lt;RPNcalculator&gt;</code> element

This element returns a statistic evaluated from arbitrary expression.

The element has the following contents:

* Element named <code>&lt;expression&gt;</code>

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;variable&gt;</code>

    Containing:

    * [Statistic](#statistic) element (exactly one)

Example:

```html
<RPNcalculator>
  <expression>
    foo
  </expression>
  <variable>
    <productParameter idref="productParameter2">
  </variable>
  <variable>
    <sumParameter idref="sumParameter8">
  </variable>
  <variable>
    <correlation idref="correlation3">
  </variable>
</RPNcalculator>
```



### <code>&lt;sampleNonActiveOperator&gt;</code> element

This element returns a Gibbs operator for the joint distribution of population sizes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* Element named <code>&lt;distribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<sampleNonActiveOperator weight="1.0">
  <distribution>
    <scaledBetaDistributionModel idref="scaledBetaDistributionModel8">
  </distribution>
  <indicators>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
  </indicators>
  <data>
    <complementParameter idref="complementParameter1">
  </data>
</sampleNonActiveOperator>
```



### <code>&lt;scaleData&gt;</code> element

Standardizes the rows of a data matrix

The element has the following contents:

* One of:
    * [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

    * [CompoundParameter](#compoundparameter) element (exactly one)


Example:

```html
<scaleData>
  <approximateFactorAnalysisPrecision>
    <L>
      <matrixParameter idref="matrixParameter3">
    </L>
    <gamma>
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    </gamma>
  </approximateFactorAnalysisPrecision>
</scaleData>
```



### <code>&lt;scaledBetaDistributionModel&gt;</code> element

A model of a beta distribution allowing offset and scale.

The element takes following attributes:

* <code>offset</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* One of:
    * Element named <code>&lt;alpha&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;alpha&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;beta&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;beta&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;length&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;length&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<scaledBetaDistributionModel offset="1.0">
  <alpha>
    <duplicatedParameter idref="duplicatedParameter9">
  </alpha>
  <beta>
    <copyParameterValues idref="copyParameterValues9">
  </beta>
  <length>
    1.0
  </length>
</scaledBetaDistributionModel>
```



### <code>&lt;scaledPiecewisePopulation&gt;</code> element

This element represents a piecewise population model

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

* <code>linear</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<scaledPiecewisePopulation units="years" linear="true">
  <populationSizes>
    <maskedParameter idref="maskedParameter6">
  </populationSizes>
  <populationTree>
    <treeModel idref="treeModel2">
  </populationTree>
</scaledPiecewisePopulation>
```



### <code>&lt;scaledTreeLengthModel&gt;</code> element

This element returns a branch rate model that scales the total length of the tree to specified valued (default=1.0).

The element has the following contents:

* Element named <code>&lt;scalingFactor&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<scaledTreeLengthModel>
  <treeModel fixHeights="true" fixTree="true">
    <transformedTreeModel idref="transformedTreeModel7">
    <rootHeight>
      <parameter idref="parameter8">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter10">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter8">
    </nodeHeights>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser1">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter9">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <differenceMatrixParameter idref="differenceMatrixParameter8">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView10">
    </leafTrait>
  </treeModel>
</scaledTreeLengthModel>
```



### <code>&lt;scaleOperator&gt;</code> element

This element returns a scale operator on a given parameter.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>scaleAll</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scaleAllIndependently</code> (optional) is of type [Boolean](#boolean)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>df</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * <code>pickoneprob</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<scaleOperator scaleFactor="1.0" scaleAll="true" scaleAllIndependently="true" weight="1.0" autoOptimize="true" df="1">
  <elementWiseMatrixMultiplicationParameter/>
</scaleOperator>
```



### <code>&lt;selectorOperator&gt;</code> element

.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<selectorOperator weight="1.0">
  <matrixVectorProductParameter>
    <matrix>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix10">
    </matrix>
    <vector>
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter10">
    </vector>
  </matrixVectorProductParameter>
</selectorOperator>
```



### <code>&lt;sequence&gt;</code> element

A biomolecular sequence.

The element has the following contents:

* [Taxon](#taxon) element (exactly one)

* [String](#string) element (exactly one)
: A character string representing the aligned molecular sequence

Example:

```html
<sequence>
  <sp>
    <taxon idref="taxon10">
  </sp>
    ACGACTAGCATCGAGCTTCG--GATAGCATGC
</sequence>
```



### <code>&lt;sequenceErrorModel&gt;</code> element

This element returns a model that allows for post-mortem DNA damage.

The element takes following attributes:

* <code>type</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* Element named <code>&lt;baseErrorRate&gt;</code>
: The base error rate per site per sequence

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;ageRelatedErrorRate&gt;</code>
: The error rate per site per unit time

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>
: A binary indicator of whether the sequence has errors

    Containing:

    * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;include&gt;</code>
: A set of taxa to which to apply the damage model to

        Containing:

        * [TaxonList](#taxonlist) element (exactly one)

    * Element named <code>&lt;exclude&gt;</code>
: A set of taxa to which to not apply the damage model to

        Containing:

        * [TaxonList](#taxonlist) element (exactly one)


Example:

```html
<sequenceErrorModel type="foo">
  <include>
    <upgmaTree idref="upgmaTree3">
  </include>
</sequenceErrorModel>
```



### <code>&lt;sequenceReassignment&gt;</code> element

Operator which reassigns sequences within an allopolyploid species.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AlloppSpeciesBindings](#alloppspeciesbindings) element (exactly one)

* [AlloppSpeciesNetworkModel](#alloppspeciesnetworkmodel) element (exactly one)

Example:

```html
<sequenceReassignment weight="1.0">
  <alloppspecies minGeneNodeHeight="1.0">
    <apsp idref="apsp4">
    <apsp idref="apsp10">
    <apsp idref="apsp7">
    <geneTrees>
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
      <treeModel idref="treeModel9">
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel9">
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel7">
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
      </gtree>
      <gtree popfactor="1.0">
        <starTreeModel idref="starTreeModel9">
      </gtree>
      <gtree popfactor="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel8">
      </gtree>
      <gtree popfactor="1.0">
        <partitionedTreeModel idref="partitionedTreeModel9">
      </gtree>
    </geneTrees>
  </alloppspecies>
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies9">
    <tipPopulations value="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </tipPopulations>
    <rootPopulations value="1.0">
      <productParameter idref="productParameter10">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <parameter idref="parameter6">
    </hybridPopulations>
  </alloppSpeciesNetwork>
</sequenceReassignment>
```



### <code>&lt;sequenceSimulator&gt;</code> element

A SequenceSimulator that generates random sequences for a given tree, siteratemodel and branch rate model

The element takes following attributes:

* <code>replications</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)

* [SiteModel](#sitemodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [Sequence](#sequence) element (zero or one)

Example:

```html
<sequenceSimulator replications="1">
  <alloppSpeciesNetwork oneHybridization="true" diploidRootIsRoot="true">
    <alloppspecies idref="alloppspecies9">
    <tipPopulations value="1.0">
      <matrixParameter idref="matrixParameter1">
    </tipPopulations>
    <rootPopulations value="1.0">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter2">
    </rootPopulations>
    <hybridPopulations value="1.0">
      <complementParameter idref="complementParameter6">
    </hybridPopulations>
  </alloppSpeciesNetwork>
  ERROR!
</sequenceSimulator>
```



### <code>&lt;setOperator&gt;</code> element

This element represents an operator on a set.

The element takes following attributes:

* <code>set</code>  is of type [Double;](#double;)
: 

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<setOperator set="0.5 1.0" weight="1.0">
  <diagonalContrainedMatrixView constraintValue="1.0">
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
    <mask>
      <complementParameter idref="complementParameter9">
    </mask>
  </diagonalContrainedMatrixView>
</setOperator>
```



### <code>&lt;siteModel&gt;</code> element

A SiteModel that has a gamma distributed rates across sites

The element has the following contents:

* Element named <code>&lt;substitutionModel&gt;</code>

    Containing:

    * [SubstitutionModel](#substitutionmodel) element (exactly one)

* One of:
    * One of:
        * Element named <code>&lt;substitutionRate&gt;</code>

            Containing:

            * [Parameter](#parameter) element (exactly one)

        * Element named <code>&lt;mutationRate&gt;</code>

            Containing:

            * [Parameter](#parameter) element (exactly one)


    * Element named <code>&lt;relativeRate&gt;</code>

        Containing:

        * <code>weight</code> (optional) is of type [Double](#double)
: 

        * [Parameter](#parameter) element (exactly one)


* Element named <code>&lt;gammaShape&gt;</code>

    Containing:

    * <code>gammaCategories</code> (optional) is of type [Integer](#integer)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;proportionInvariant&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<siteModel>
  <mutationRate>
    <maskedMatrixParameter idref="maskedMatrixParameter5">
  </mutationRate>
</siteModel>
```



### <code>&lt;skewNormalDistributionModel&gt;</code> element

A model of a skew normal distribution.

The element has the following contents:

* One of:
    * Element named <code>&lt;location&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;location&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


* One of:
    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Double](#double) element (exactly one)

    * Element named <code>&lt;shape&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)


Example:

```html
<skewNormalDistributionModel>
  <location>
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
  </location>
  <scale>
    1.0
  </scale>
  <shape>
    1.0
  </shape>
</skewNormalDistributionModel>
```



### <code>&lt;gmrfSkyrideLikelihood&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element takes following attributes:

* <code>rescaleByRootHeight</code> (optional) is of type [Boolean](#boolean)
: 

* <code>randomizeTree</code> (optional) is of type [Boolean](#boolean)
: 

* <code>timeAwareSmoothing</code> (optional) is of type [Boolean](#boolean)
: 

* <code>oldSkyride</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;precisionParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;phiParameter&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (one or more)

* Element named <code>&lt;groupSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;singleBeta&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<gmrfSkyrideLikelihood rescaleByRootHeight="true" randomizeTree="true" timeAwareSmoothing="true" oldSkyride="true">
  <populationSizes>
    <matrixParameter idref="matrixParameter7">
  </populationSizes>
  <precisionParameter>
    <diagonalMatrix idref="diagonalMatrix8">
  </precisionParameter>
  <populationTree>
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel10">
    <treeModel idref="treeModel9">
    <partitionedTreeModel idref="partitionedTreeModel6">
  </populationTree>
</gmrfSkyrideLikelihood>
```



### <code>&lt;slidingPatternsOperator&gt;</code> element

This element returns a sliding window operator on alignment sites.

The element takes following attributes:

* <code>windowSize</code>  is of type [Integer](#integer)
: 

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;breakPoints&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [SitePatterns](#sitepatterns) elements ( to 100)

Example:

```html
<slidingPatternsOperator windowSize="1" weight="1" autoOptimize="true">
  <breakPoints>
    <differenceMatrixParameter idref="differenceMatrixParameter1">
  </breakPoints>
  ERROR!
  ERROR!
  ERROR!
  ERROR!
</slidingPatternsOperator>
```



### <code>&lt;sp&gt;</code> element

Taxon in a species tree

The element has the following contents:

* [Taxon](#taxon) elements (one or more)

Example:

```html
<sp>
  <individual>
    <apsp idref="apsp3">
  </individual>
  <sp>
    <sp idref="sp4">
    <apsp idref="apsp2">
    <sp idref="sp2">
  </sp>
  <apsp ploidylevel="1.0">
    <individual idref="individual5">
    <individual idref="individual2">
    <individual idref="individual2">
    <individual idref="individual5">
  </apsp>
</sp>
```



### <code>&lt;spatialKernelFunction&gt;</code> element

This element represents a spatial kernel function with a single parameter.

The element takes following attributes:

* <code>type</code>  is of type [String](#string)
: 

* <code>integratorSteps</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;parameters&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<spatialKernelFunction type="foo" integratorSteps="1">
  <parameters>
    <matrixVectorProductParameter idref="matrixVectorProductParameter8">
    <leafTraitParameter idref="leafTraitParameter4">
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
  </parameters>
</spatialKernelFunction>
```



### <code>&lt;speciationLikelihood&gt;</code> element

This element represents the likelihood of the tree given the speciation.

The element has the following contents:

* Element named <code>&lt;model&gt;</code>

    Containing:

    * [SpeciationModel](#speciationmodel) element (exactly one)

* Element named <code>&lt;speciesTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

* Element named <code>&lt;include&gt;</code>
: One or more subsets of taxa which should be included from calculate the likelihood (the remaining taxa are excluded)

    Containing:

    * [Taxa](#taxa) elements (one or more)

* Element named <code>&lt;exclude&gt;</code>
: One or more subsets of taxa which should be excluded from calculate the likelihood (which is calculated on the remaining subtree)

    Containing:

    * [Taxa](#taxa) elements (one or more)

* Element named <code>&lt;calibration&gt;</code>

    Containing:

    * <code>correction</code> (optional) is of type [String](#string)
: 

    * [Statistic](#statistic) element (zero or one)

    * One of:
        * [Distribution](#distribution) elements (one to 100)

        * [DistributionLikelihood](#distributionlikelihood) elements (one to 100)


    * [Taxa](#taxa) elements (one to 100)

    * Element named <code>&lt;point&gt;</code>

        Containing:

        * <code>forParent</code> (optional) is of type [Boolean](#boolean)
: 

        * One of:
            * [Distribution](#distribution) element (exactly one)

            * [DistributionLikelihood](#distributionlikelihood) element (exactly one)


        * [Taxa](#taxa) element (exactly one)

Example:

```html
<speciationLikelihood>
  <model>
    <yuleModel idref="yuleModel10">
  </model>
  <speciesTree>
    <mulSpeciesTree idref="mulSpeciesTree6">
  </speciesTree>
</speciationLikelihood>
```



### <code>&lt;species&gt;</code> element

Binds taxa in gene trees with species information.

The element has the following contents:

* [SpeciesBindings$SPinfo](#speciesbindings$spinfo) elements ( or more)

* Element named <code>&lt;geneTrees&gt;</code>

    Containing:

    * [TreeModel](#treemodel) elements (zero or more)

    * Element named <code>&lt;gtree&gt;</code>

        Containing:

        * <code>ploidy</code>  is of type [Double](#double)
: 

        * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<species>
  <sp>
    <sp idref="sp4">
    <taxon idref="taxon9">
  </sp>
  <sp>
    <taxon idref="taxon7">
    <sp idref="sp10">
  </sp>
  <geneTrees>
    <gtree ploidy="1.0">
      <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel1">
    </gtree>
  </geneTrees>
</species>
```



### <code>&lt;speciesCoalescent&gt;</code> element

Compute coalecent log-liklihood of a set of gene trees embedded inside one species tree.

The element has the following contents:

* [SpeciesBindings](#speciesbindings) element (exactly one)

* [SpeciesTreeModel](#speciestreemodel) element (exactly one)

Example:

```html
<speciesCoalescent>
  <species>
    <sp idref="sp3">
    <sp idref="sp2">
    <sp idref="sp6">
    <sp idref="sp10">
    <geneTrees/>
  </species>
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species6">
    <sppSplitPopulations value="1.0">
      <differenceParameter idref="differenceParameter3">
    </sppSplitPopulations>
  </speciesTree>
</speciesCoalescent>
```



### <code>&lt;speciesTree&gt;</code> element

Species tree which includes demographic function per branch.

The element takes following attributes:

* <code>bmPrior</code> (optional) is of type [Boolean](#boolean)
: 

* <code>constantRoot</code> (optional) is of type [Boolean](#boolean)
: 

* <code>constantPopulation</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [SpeciesBindings](#speciesbindings) element (exactly one)

* [Tree](#tree) element (zero or one)

* Element named <code>&lt;sppSplitPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;coalescentPointsPopulations&gt;</code>

    Containing:

    * <code>value</code> (optional) is of type [Double](#double)
: 

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;coalescentPointsIndicators&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
  <species>
    <sp idref="sp2">
    <sp idref="sp3">
    <sp idref="sp6">
    <sp idref="sp9">
    <geneTrees>
      <starTreeModel idref="starTreeModel10">
      <gtree ploidy="1.0">
        <treeModel idref="treeModel10">
      </gtree>
      <gtree ploidy="1.0">
        <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
      </gtree>
      <gtree ploidy="1.0">
        <starTreeModel idref="starTreeModel6">
      </gtree>
    </geneTrees>
  </species>
  <sppSplitPopulations value="1.0">
    <maskedMatrixParameter idref="maskedMatrixParameter8">
  </sppSplitPopulations>
</speciesTree>
```



### <code>&lt;speciesTreePopulationPrior&gt;</code> element



The element has the following contents:

* [SpeciesTreeModel](#speciestreemodel) element (exactly one)

* Element named <code>&lt;tipsDistribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;sigma&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<speciesTreePopulationPrior>
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species7">
    <sppSplitPopulations value="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter4">
    </sppSplitPopulations>
  </speciesTree>
  <tipsDistribution>
    <uniformDistributionModel idref="uniformDistributionModel1">
  </tipsDistribution>
  <sigma>
    <originDestinationDesignMatrix idref="originDestinationDesignMatrix8">
  </sigma>
</speciesTreePopulationPrior>
```



### <code>&lt;speciesTreeStatistic&gt;</code> element

A statistic that returns true if the given population tree is compatible with the species tree. Compatibility is defined as the compatibility of the timings of the events, so that incompatibility arises if two individuals in the population tree coalescent before their species do in the species tree.

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* Element named <code>&lt;speciesTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

* Element named <code>&lt;populationTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<speciesTreeStatistic name="foo">
  <speciesTree>
    <tree idref="tree3">
  </speciesTree>
  <populationTree>
    <partitionedTreeModel idref="partitionedTreeModel2">
  </populationTree>
</speciesTreeStatistic>
```



### <code>&lt;splitTraitBySite&gt;</code> element

null

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: 

* <code>scaleByBranchLength</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [AncestralStateTraitProvider](#ancestralstatetraitprovider) element (exactly one)
: The tree which is to be logged

Example:

```html
<splitTraitBySite traitName="foo" scaleByBranchLength="true">
  ERROR!
</splitTraitBySite>
```



### <code>&lt;standardizeTraits&gt;</code> element

null

The element has the following contents:

* [MatrixParameterInterface](#matrixparameterinterface) element (exactly one)

Example:

```html
<standardizeTraits>
  <elementWiseMatrixMultiplicationParameter/>
</standardizeTraits>
```



### <code>&lt;starTreeModel&gt;</code> element

This element represents a model of the tree. The tree model includes and attributes of the nodes including the age (or <i>height</i>) and the rate of evolution at each node in the tree.

The element has the following contents:

* [Tree](#tree) element (exactly one)

* One of:
    * Element named <code>&lt;rootHeight&gt;</code>
: A parameter definition with id only (cannot be a reference!)

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;sharedRootHeight&gt;</code>

        Containing:

        * [TreeModel](#treemodel) element (exactly one)


* Element named <code>&lt;leafHeight&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafTrait&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * <code>name</code>  is of type [String](#string)
: "The name of the trait attribute in the taxa"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

Example:

```html
<!-- the tree model as special sockets for attaching parameters to various aspects of the tree     -->
<!-- The treeModel below shows the standard setup with a parameter associated with the root height -->
<!-- a parameter associated with the internal node heights (minus the root height) and             -->
<!-- a parameter associates with all the internal node heights                                     -->
<!-- Notice that these parameters are overlapping                                                  -->
<!-- The parameters are subsequently used in operators to propose changes to the tree node heights -->
<treeModel id="treeModel1">
	<tree idref="startingTree"/>
	<rootHeight>
		<parameter id="treeModel1.rootHeight"/>
	</rootHeight>
	<nodeHeights internalNodes="true" rootNode="false">
		<parameter id="treeModel1.internalNodeHeights"/>
	</nodeHeights>
	<nodeHeights internalNodes="true" rootNode="true">
		<parameter id="treeModel1.allInternalNodeHeights"/>
	</nodeHeights>
</treeModel>```



### <code>&lt;statistic&gt;</code> element

A statistic of a given name from the specified object.  

The element takes following attributes:

* <code>name</code>  is of type [String](#string)
: "The name of the statistic you wish to extract from the given object"

The element has the following contents:

* [StatisticList](#statisticlist) element (exactly one)

Example:

```html
<statistic name="foo">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <argTreeModel idref="argTreeModel1">
    <rootHeight>
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <parameter idref="parameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedParameter idref="maskedParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <leafTraitParameter idref="leafTraitParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix3">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter10">
    </leafHeight>
    <leafHeight taxon="foo">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <diagonalMatrix idref="diagonalMatrix3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <duplicatedParameter idref="duplicatedParameter2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak7">
    </outbreak>
  </partitionedTreeModel>
</statistic>
```



### <code>&lt;steppingStoneSamplingAnalysis&gt;</code> element

Performs a trace analysis.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The traceName of a BEAST log file (can not include trees, which should be logged separately)"

* <code>resultsFileName</code> (optional) is of type [String](#string)
: "The name of the output file to which the stepping-stone sampling estimate will be written"

The element has the following contents:

* Element named <code>&lt;thetaColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

* Element named <code>&lt;likelihoodColumn&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The column name"

Example:

```html
<steppingStoneSamplingAnalysis fileName="foo" resultsFileName="foo">
  <thetaColumn name="foo"/>
  <likelihoodColumn name="foo"/>
</steppingStoneSamplingAnalysis>
```



### <code>&lt;STPopulationPrior&gt;</code> element



The element takes following attributes:

* <code>log_root</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [SpeciesTreeModel](#speciestreemodel) element (exactly one)

* Element named <code>&lt;tipsDistribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;sigma&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;STsigma&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<STPopulationPrior log_root="true">
  <speciesTree bmPrior="true" constantRoot="true" constantPopulation="true">
    <species idref="species9">
    <sppSplitPopulations value="1.0">
      <duplicatedParameter idref="duplicatedParameter2">
    </sppSplitPopulations>
  </speciesTree>
  <tipsDistribution>
    <uniformDistributionModel idref="uniformDistributionModel6">
  </tipsDistribution>
  <STsigma>
    <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision1">
  </STsigma>
</STPopulationPrior>
```



### <code>&lt;stratifiedTraitLogger&gt;</code> element

A parser to stratify traits to be logged

The element takes following attributes:

* <code>traitName</code>  is of type [String](#string)
: 

* <code>partition</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [TreeTraitProvider](#treetraitprovider) element (exactly one)

Example:

```html
<stratifiedTraitLogger traitName="foo" partition="true">
  <starTreeModel>
    <argTreeModel idref="argTreeModel5">
    <sharedRootHeight>
      <treeModel idref="treeModel3">
    </sharedRootHeight>
    <leafTrait taxon="foo" name="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct1">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <immutableParameter idref="immutableParameter2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <diagonalMatrix idref="diagonalMatrix8">
    </leafTrait>
  </starTreeModel>
  <argLocalClock/>
</stratifiedTraitLogger>
```



### <code>&lt;strictClockBranchRates&gt;</code> element

This element provides a strict clock model. All branches have the same rate of molecular evolution.

The element has the following contents:

* Element named <code>&lt;rate&gt;</code>
: The molecular evolutionary rate parameter

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<strictClockBranchRates>
  <rate>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix5">
  </rate>
</strictClockBranchRates>
```



### <code>&lt;string&gt;</code> element

returns a String. If a prompt attribute exists then the user is prompted for input, otherwise the character contents of the element are returned.

The element has the following contents:

* One of:
    * <code>prompt</code>  is of type [String](#string)
: "A message displayed to the user when entering a value for this string"

    * [String](#string) element (exactly one)


Example:

```html
<string prompt="Enter the name of a dinosaur:"/>
```



### <code>&lt;subStatistic&gt;</code> element

Allows you to choose specific dimensions of a given statistic

The element takes following attributes:

* <code>dimension</code>  is of type [Integer;](#integer;)
: 

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<subStatistic dimension="1 2 4 8">
  <compoundMatrixParameter>
    <matrixParameter idref="matrixParameter1">
    <dataFromTreeTips idref="dataFromTreeTips4">
    <matrixMatrixProduct idref="matrixMatrixProduct5">
  </compoundMatrixParameter>
</subStatistic>
```



### <code>&lt;subtreeJump&gt;</code> element

An operator that jumps a subtree to another edge at the same height.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>bias</code> (optional) is of type [Double](#double)
: 

* <code>arctanTransform</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<subtreeJump weight="1.0" bias="1.0" arctanTransform="true" autoOptimize="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <taxa idref="taxa8">
  </empiricalTreeDistributionModel>
</subtreeJump>
```



### <code>&lt;subtreeLeap&gt;</code> element

An operator that moves subtree a certain distance.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code> (optional) is of type [Double](#double)
: 

* <code>accP</code> (optional) is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<subtreeLeap weight="1.0" size="1.0" accP="1.0" autoOptimize="true">
  <treeModel fixHeights="true" fixTree="true">
    <argTreeModel idref="argTreeModel8">
    <rootHeight>
      <parameter idref="parameter10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <complementParameter idref="complementParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <dataFromTreeTips idref="dataFromTreeTips9">
    </nodeHeights>
    <leafHeight taxon="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix3">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision7">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <dataFromTreeTips idref="dataFromTreeTips3">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <leafTraitParameter idref="leafTraitParameter10">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixParameter idref="matrixParameter5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter1">
    </nodeRates>
  </treeModel>
</subtreeLeap>
```



### <code>&lt;subtreeSlide&gt;</code> element

An operator that slides a subtree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code> (optional) is of type [Double](#double)
: 

* <code>targetAcceptance</code> (optional) is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapInRandomRate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapInRandomTrait</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<subtreeSlide weight="1.0" size="1.0" targetAcceptance="1.0" gaussian="true" swapInRandomRate="true" swapInRandomTrait="true" autoOptimize="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <alignment idref="alignment5">
  </empiricalTreeDistributionModel>
</subtreeSlide>
```



### <code>&lt;sumStatistic&gt;</code> element

This element returns a statistic that is the element-wise sum of the child statistics.

The element takes following attributes:

* <code>elementwise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<sumStatistic elementwise="true" name="foo">
  <partitionStatistic/>
  <matrixInverse>
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter9">
  </matrixInverse>
  <elementWiseMatrixMultiplicationParameter/>
  <expressionStatistic>
    <expression>
      foo
    </expression>
    <variables>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
      <treeHeightStatistic idref="treeHeightStatistic3">
      <diffusionRateCovarianceStatistic idref="diffusionRateCovarianceStatistic8">
    </variables>
  </expressionStatistic>
</sumStatistic>
```



### <code>&lt;sumDerivative&gt;</code> element

null

The element has the following contents:

* [GradientWrtParameterProvider](#gradientwrtparameterprovider) elements (one or more)

Example:

```html
<sumDerivative>
  <sumDerivative>
    <gradient idref="gradient8">
    <multiDimensionalScalingLikelihood idref="multiDimensionalScalingLikelihood3">
    <gradient idref="gradient4">
  </sumDerivative>
  <sumDerivative>
    <sumDerivative idref="sumDerivative9">
    <sumDerivative idref="sumDerivative1">
    <sumDerivative idref="sumDerivative6">
  </sumDerivative>
  <appendedPotentialDerivative>
    <sumDerivative idref="sumDerivative5">
  </appendedPotentialDerivative>
  <gradient>
    <twoPartDistribution idref="twoPartDistribution6">
  </gradient>
</sumDerivative>
```



### <code>&lt;sumParameter&gt;</code> element

A element-wise sum of parameters.

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<sumParameter>
  <markovRandomFieldMatrix asCorrelation="true" dim="1">
    <diagonal>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix10">
    </diagonal>
    <offDiagonal>
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView5">
    </offDiagonal>
    <nugget>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
    </nugget>
  </markovRandomFieldMatrix>
  <vectorSlice sliceDimension="1">
    <matrixParameter idref="matrixParameter3">
    <duplicatedParameter idref="duplicatedParameter2">
    <fastMatrixParameter idref="fastMatrixParameter5">
  </vectorSlice>
</sumParameter>
```



### <code>&lt;sumStatistic&gt;</code> element

This element returns a statistic that is the element-wise sum of the child statistics.

The element takes following attributes:

* <code>elementwise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<sumStatistic elementwise="true" name="foo">
  <meanStatistic>
    <treeHeightStatistic idref="treeHeightStatistic1">
    <monotonicStatistic idref="monotonicStatistic3">
    <compoundMatrixParameter idref="compoundMatrixParameter10">
  </meanStatistic>
</sumStatistic>
```



### <code>&lt;complexSubstitutionModel&gt;</code> element

A general irreversible model of sequence substitution for any data type.

The element takes following attributes:

* <code>randomizeIndicator</code> (optional) is of type [Boolean](#boolean)
: 

* <code>bssvsTolerance</code> (optional) is of type [Double](#double)
: 

* <code>bssvsScalar</code> (optional) is of type [Double](#double)
: 

* <code>checkConditioning</code> (optional) is of type [Boolean](#boolean)
: 

* <code>normalized</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* One of:
    * <code>dataType</code>  is of type [String](#string)
: "The type of sequence data"

    * [DataType](#datatype) element (exactly one)


* One of:
    * Element named <code>&lt;frequencies&gt;</code>

        Containing:

        * [FrequencyModel](#frequencymodel) element (exactly one)

    * Element named <code>&lt;rootFrequencies&gt;</code>

        Containing:

        * [FrequencyModel](#frequencymodel) element (exactly one)


* Element named <code>&lt;rates&gt;</code>

    Containing:

    * [Parameter](#parameter) element (zero or one)

* Element named <code>&lt;rateIndicator&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<complexSubstitutionModel dataType="codon-flatwormMitochondrial" randomizeIndicator="true" bssvsTolerance="1.0" bssvsScalar="1.0" checkConditioning="true" normalized="true">
  <frequencies>
    <frequencyModel idref="frequencyModel5">
  </frequencies>
  <rates/>
</complexSubstitutionModel>
```



### <code>&lt;swapOperator&gt;</code> element

This element represents an operator that swaps values in a multi-dimensional parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code>  is of type [Integer](#integer)
: 

* <code>autoOptimize</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<swapOperator weight="1.0" size="1" autoOptimize="true">
  <copyParameterValues>
    <source>
      <maskedParameter idref="maskedParameter4">
    </source>
    <destination>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix1">
    </destination>
  </copyParameterValues>
</swapOperator>
```



### <code>&lt;taxa&gt;</code> element

Defines a set of taxon objects.

The element has the following contents:

* At least one of:
    * [Taxa](#taxa) elements (one or more)

    * [Taxon](#taxon) elements (one or more)



Example:

```html
<!-- A list of six taxa -->
<taxa id="greatApes">
	<taxon id="human"/>
	<taxon id="chimp"/>
	<taxon id="bonobo"/>
	<taxon id="gorilla"/>
	<taxon id="orangutan"/>
	<taxon id="siamang"/>
</taxa>

<!-- A list of three taxa by references to above taxon objects -->
<taxa id="humanAndChimps">
	<taxon idref="human"/>
	<taxon idref="chimp"/>
	<taxon idref="bonobo"/>
</taxa>
```



### <code>&lt;taxon&gt;</code> element



The element takes following attributes:

* <code>id</code>  is of type [String](#string)
: "A unique identifier for this taxon"

The element has the following contents:

* [Attribute$Default](#attribute$default) element (zero or one)

* [Date](#date) element (zero or one)

* [Location](#location) element (zero or one)

Example:

```html
<taxon id="foo"/>
```



### <code>&lt;teamOperator&gt;</code> element

An arbitrary list of operators; A random subset of size N is aggregated in one operation. Operators may have unequal weights - in that case a subset probability of selection is proportional to the sum of it's members weights.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [MCMCOperator](#mcmcoperator) elements (one or more)

Example:

```html
<teamOperator weight="1.0" size="1">
  <clusterSingleMoveOperator weight="1.0">
    <maskedParameter idref="maskedParameter7">
  </clusterSingleMoveOperator>
  <scaleOperator scaleFactor="1.0" scaleAll="true" scaleAllIndependently="true" weight="1.0" autoOptimize="true" df="1">
    <jointParameter idref="jointParameter8">
  </scaleOperator>
  <narrowExchange weight="1.0">
    <empiricalTreeDistributionModel idref="empiricalTreeDistributionModel3">
  </narrowExchange>
  <teamOperator weight="1.0" size="1">
    <bitFlipOperator idref="bitFlipOperator9">
    <randomWalkIntegerOperator idref="randomWalkIntegerOperator4">
    <randomWalkIntegerOperator idref="randomWalkIntegerOperator1">
    <geoDistributionCollection idref="geoDistributionCollection2">
  </teamOperator>
</teamOperator>
```



### <code>&lt;test&gt;</code> element

This element represents a boolean statistic that returns 1 if the conditions are met and 0 otherwise.

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic, for logging purposes"

The element has the following contents:

* [Attribute](#attribute) element (exactly one)

* One of:
    * Element named <code>&lt;equals&gt;</code>

        Containing:

        * [Attribute](#attribute) element (exactly one)

    * Element named <code>&lt;greaterThan&gt;</code>

        Containing:

        * [Attribute](#attribute) element (exactly one)

    * Element named <code>&lt;lessThan&gt;</code>

        Containing:

        * [Attribute](#attribute) element (exactly one)

    * <code>equals</code>  is of type [Double](#double)
: 

    * <code>greaterThan</code>  is of type [Double](#double)
: 

    * <code>lessThan</code>  is of type [Double](#double)
: 

    * <code>inside</code>  is of type [Double;](#double;)
: 

    * <code>outside</code>  is of type [Double;](#double;)
: 


Example:

```html
<test name="foo" inside="0.5 1.0">
  <differenceStatistic absolute="true">
    <diffusionRateCovarianceStatistic idref="diffusionRateCovarianceStatistic1">
    <popGraph idref="popGraph10">
  </differenceStatistic>
</test>
```



### <code>&lt;threadedCompoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>robustWeight</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements (one or more)

Example:

```html
<threadedCompoundLikelihood robustWeight="1.0">
  <apspCoalescent>
    <alloppspecies idref="alloppspecies7">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork1">
  </apspCoalescent>
  <modelSpecificPseudoPrior/>
</threadedCompoundLikelihood>
```



### <code>&lt;thresholdStatistic&gt;</code> element

This element returns a statistic that thresholds the child statistics.

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>threshold</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) element (exactly one)

Example:

```html
<thresholdStatistic name="foo" threshold="1.0">
  <loggableStatistic>
    <glmModel idref="glmModel10">
  </loggableStatistic>
</thresholdStatistic>
```



### <code>&lt;tipHeightLikelihood&gt;</code> element

Calculates the likelihood of the tipHeights given some parametric or empirical distribution.

The element has the following contents:

* Element named <code>&lt;distribution&gt;</code>

    Containing:

    * [ParametricDistributionModel](#parametricdistributionmodel) element (exactly one)

* Element named <code>&lt;tipHeights&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<tipHeightLikelihood>
  <distribution>
    <skewNormalDistributionModel idref="skewNormalDistributionModel3">
  </distribution>
  <tipHeights>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
  </tipHeights>
</tipHeightLikelihood>
```



### <code>&lt;tipStateSwapOperator&gt;</code> element

This element represents an operator to swap tip states between two random tips.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AncestralStateBeagleTreeLikelihood](#ancestralstatebeagletreelikelihood) element (exactly one)

Example:

```html
<tipStateSwapOperator weight="1.0">
  ERROR!
</tipStateSwapOperator>
```



### <code>&lt;tipTraitSwapOperator&gt;</code> element

This element represents an operator to swap tip traits between two random tips.

The element takes following attributes:

* <code>trait</code>  is of type [String](#string)
: 

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [IntegratedMultivariateTraitLikelihood](#integratedmultivariatetraitlikelihood) element (exactly one)

Example:

```html
<tipTraitSwapOperator trait="foo" weight="1.0">
  ERROR!
</tipTraitSwapOperator>
```



### <code>&lt;tmrcaStatistic&gt;</code> element

A statistic that has as its value the height of the most recent common ancestor of a set of taxa in a given tree. 

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

* <code>absolute</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;mrca&gt;</code>

    Containing:

    * [Taxa](#taxa) element (exactly one)

* At least one of:
    * <code>forParent</code> (optional) is of type [Boolean](#boolean)
: 

    * <code>includeStem</code> (optional) is of type [Boolean](#boolean)
: 



Example:

```html
<tmrcaStatistic name="foo" absolute="true" includeStem="true">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <argTreeModel idref="argTreeModel8">
    <rootHeight>
      <differenceMatrixParameter idref="differenceMatrixParameter7">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundMatrixParameter idref="compoundMatrixParameter3">
    </nodeHeights>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision10">
    </leafHeight>
    <leafHeight taxon="foo">
      <fastMatrixParameter idref="fastMatrixParameter3">
    </leafHeight>
    <leafHeight taxon="foo">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix9">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix5">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView3">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <productParameter idref="productParameter7">
    </nodeTraits>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <duplicatedParameter idref="duplicatedParameter8">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak7">
    </outbreak>
  </partitionedTreeModel>
</tmrcaStatistic>
```



### <code>&lt;TN93Model&gt;</code> element

This element represents an instance of the TN93 (Tamura and Nei 1993) model of nucleotide evolution.

The element has the following contents:

* Element named <code>&lt;frequencies&gt;</code>

    Containing:

    * [FrequencyModel](#frequencymodel) element (exactly one)

* Element named <code>&lt;kappa1&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;kappa2&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<TN93Model>
  <frequencies>
    <frequencyModel idref="frequencyModel3">
  </frequencies>
  <kappa1>
    <fastMatrixParameter idref="fastMatrixParameter7">
  </kappa1>
  <kappa2>
    <productParameter idref="productParameter1">
  </kappa2>
</TN93Model>
```



### <code>&lt;argPartitionOperator&gt;</code> element

An operator that picks a new partitioning uniformly at random.

The element takes following attributes:

* <code>weight</code>  is of type [Integer](#integer)
: 

* <code>tossSize</code> (optional) is of type [Integer](#integer)
: 

* <code>tossAll</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<argPartitionOperator weight="1" tossSize="1" tossAll="true">
  <argTreeModel partitionType="reassortment">
    <argTreeModel idref="argTreeModel3">
    <rootHeight>
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <compoundFastMatrixParameter idref="compoundFastMatrixParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision3">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <sumParameter idref="sumParameter2">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <maskedMatrixParameter idref="maskedMatrixParameter9">
    </nodeHeights>
  </argTreeModel>
</argPartitionOperator>
```



### <code>&lt;traceAnalysis&gt;</code> element

Performs a trace analysis. Estimates the mean of the various statistics in the given log file.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "The name of a BEAST log file (can not include trees, which should be logged separately"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

* <code>stdError</code> (optional) is of type [Boolean](#boolean)
: 

* <code>computeMSE</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;expectation&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: 

    * <code>value</code>  is of type [String](#string)
: 

Example:

```html
<traceAnalysis fileName="foo" burnIn="1" stdError="true" computeMSE="true">
  <expectation name="foo" value="foo"/>
  <expectation name="foo" value="foo"/>
</traceAnalysis>
```



### <code>&lt;traitDataLikelihood&gt;</code> element

This element represents the likelihood of trait data on a tree given a diffusion model.

The element takes following attributes:

* <code>scaleByTime</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useTreeLength</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reciprocalRates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>reconstructTraits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>forceCompletelyMissing</code> (optional) is of type [Boolean](#boolean)
: 

* <code>allowSingular</code> (optional) is of type [Boolean](#boolean)
: 

* <code>forceFullPrecision</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [MultivariateDiffusionModel](#multivariatediffusionmodel) element (exactly one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* Element named <code>&lt;conjugateRootPrior&gt;</code>

    Containing:

    * Element named <code>&lt;meanParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;priorSampleSize&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

* One of:
    * Element named <code>&lt;traitParameter&gt;</code>

        Containing:

        * [Parameter](#parameter) element (exactly one)

    * [ContinuousTraitPartialsProvider](#continuoustraitpartialsprovider) element (exactly one)


* [RestrictedPartials](#restrictedpartials) elements (zero or more)

Example:

```html
<traitDataLikelihood scaleByTime="true" useTreeLength="true" reciprocalRates="true" reconstructTraits="true" forceCompletelyMissing="true" allowSingular="true" forceFullPrecision="true">
  <starTreeModel>
    <mulSpeciesTree idref="mulSpeciesTree10">
    <rootHeight>
      <matrixMatrixProduct idref="matrixMatrixProduct3">
    </rootHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix6">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <jointParameter idref="jointParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <compoundMatrixParameter idref="compoundMatrixParameter10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <vectorSlice idref="vectorSlice9">
    </leafTrait>
  </starTreeModel>
  <greatCircleDiffusionModel>
    <complementParameter idref="complementParameter8">
  </greatCircleDiffusionModel>
  <conjugateRootPrior>
    <meanParameter>
      <compoundParameter idref="compoundParameter2">
    </meanParameter>
    <priorSampleSize>
      <differenceMatrixParameter idref="differenceMatrixParameter1">
    </priorSampleSize>
  </conjugateRootPrior>
  <traitParameter>
    <designMatrix idref="designMatrix6">
  </traitParameter>
  ERROR!
  ERROR!
  ERROR!
  ERROR!
</traitDataLikelihood>
```



### <code>&lt;traitGibbsOperator&gt;</code> element

This element returns a multivariate Gibbs operator on traits for possible all nodes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>onlyInternalNodes</code> (optional) is of type [Boolean](#boolean)
: 

* <code>onlyTipsWithPriors</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [SampledMultivariateTraitLikelihood](#sampledmultivariatetraitlikelihood) element (exactly one)

* [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) elements (zero or more)

* Element named <code>&lt;rootPrior&gt;</code>

    Containing:

    * [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

* [GeoSpatialCollectionModel](#geospatialcollectionmodel) element (zero or one)

Example:

```html
<traitGibbsOperator weight="1.0" onlyInternalNodes="true" onlyTipsWithPriors="true">
  ERROR!
  <multivariateDistributionLikelihood dataAsMatrix="true">
    <distribution>
      <treeTraitNormalDistribution idref="treeTraitNormalDistribution10">
    </distribution>
    <composedTransform idref="composedTransform1">
  </multivariateDistributionLikelihood>
  <flatGeoSpatialPrior taxon="foo" inside="true" union="true" cache="true" kmlFileName="foo">
    <data>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix8">
    </data>
  </flatGeoSpatialPrior>
  <multivariateNormalPrior>
    <meanParameter>
      <vectorSlice idref="vectorSlice8">
    </meanParameter>
    <precisionParameter>
      <compoundMatrixParameter idref="compoundMatrixParameter2">
    </precisionParameter>
    <transform idref="transform9">
    <inverseTransform idref="inverseTransform4">
    <composedTransform idref="composedTransform2">
  </multivariateNormalPrior>
</traitGibbsOperator>
```



### <code>&lt;traitRateGibbsOperator&gt;</code> element

This element returns a multivariate Gibbs operator on traits for possible all nodes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) element (exactly one)

* [ArbitraryBranchRates](#arbitrarybranchrates) element (exactly one)

* [DistributionLikelihood](#distributionlikelihood) element (exactly one)

Example:

```html
<traitRateGibbsOperator weight="1.0">
  <inhibitionLikelihood>
    <treeModel idref="treeModel10">
    <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter5">
    <precision>
      <leafTraitParameter idref="leafTraitParameter10">
    </precision>
  </inhibitionLikelihood>
  <arbitraryBranchRates reciprocal="true" centerAtOne="true" exp="true">
    <partitionedTreeModel idref="partitionedTreeModel8">
    <rates>
      <diagonalMatrix idref="diagonalMatrix2">
    </rates>
  </arbitraryBranchRates>
  <distributionLikelihood>
    <distribution>
      <inverseGaussianDistributionModel idref="inverseGaussianDistributionModel8">
    </distribution>
    <data from="1" to="1">
      <treeHeightStatistic idref="treeHeightStatistic5">
      <ratioStatistic idref="ratioStatistic10">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix1">
    </data>
  </distributionLikelihood>
</traitRateGibbsOperator>
```



### <code>&lt;transform&gt;</code> element

null

The element takes following attributes:

* <code>type</code>  is of type [String](#string)
: 

* <code>start</code> (optional) is of type [Integer](#integer)
: 

* <code>end</code> (optional) is of type [Integer](#integer)
: 

* <code>every</code> (optional) is of type [Integer](#integer)
: 

* <code>inverseTransform</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Transform$ParsedTransform](#transform$parsedtransform) element (zero or one)

* [Parameter](#parameter) elements (zero or more)

Example:

```html
<transform type="foo" start="1" end="1" every="1" inverseTransform="true"/>
```



### <code>&lt;transformedTreeModel&gt;</code> element

This element represents a transformed model of the tree.

The element takes following attributes:

* <code>version</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

* [Parameter](#parameter) element (exactly one)

Example:

```html
<transformedTreeModel version="foo">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <argTreeModel idref="argTreeModel9">
    <rootHeight>
      <vectorSlice idref="vectorSlice5">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision3">
    </nodeHeights>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision7">
    </leafHeight>
    <leafHeight taxon="foo">
      <jointParameter idref="jointParameter3">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <duplicatedParameter idref="duplicatedParameter10">
    </nodeTraits>
    <leafTrait taxon="foo" name="foo">
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <vectorSlice idref="vectorSlice10">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <productParameter idref="productParameter2">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak8">
    </outbreak>
  </partitionedTreeModel>
  <vectorSlice sliceDimension="1">
    <leafTraitParameter idref="leafTraitParameter3">
    <vectorSlice idref="vectorSlice3">
  </vectorSlice>
</transformedTreeModel>
```



### <code>&lt;transmissionExchangeOperatorA&gt;</code> element

This element represents a exchange operator, swapping two random subtrees in such a way that thetransmission tree is unaffected.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionExchangeOperatorA weight="1.0" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel9">
    <maxFirstInfToRoot>
      <immutableParameter idref="immutableParameter2">
    </maxFirstInfToRoot>
    <demographicModel>
      <exponentialGrowth idref="exponentialGrowth1">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionExchangeOperatorA>
```



### <code>&lt;transmissionExchangeOperatorB&gt;</code> element

This element represents a exchange operator, swapping two random subtrees in such a way that subtrees of the transmission tree are also exchanged.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionExchangeOperatorB weight="1.0" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel1">
    <maxFirstInfToRoot>
      <diagonalMatrix idref="diagonalMatrix4">
    </maxFirstInfToRoot>
    <demographicModel>
      <scaledPiecewisePopulation idref="scaledPiecewisePopulation7">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionExchangeOperatorB>
```



### <code>&lt;transmissionHistory&gt;</code> element

Defines a transmission history

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;transmission&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

    * Element named <code>&lt;donor&gt;</code>

        Containing:

        * [Taxon](#taxon) element (exactly one)

    * Element named <code>&lt;recipient&gt;</code>

        Containing:

        * [Taxon](#taxon) element (exactly one)

Example:

```html
<transmissionHistory units="generations">
  <transmission>
    <compoundParameter idref="compoundParameter2">
    <donor>
      <apsp idref="apsp4">
    </donor>
    <recipient>
      <sp idref="sp1">
    </recipient>
  </transmission>
</transmissionHistory>
```



### <code>&lt;transmissionLikelihood&gt;</code> element

This element represents a likelihood function for transmission.

The element has the following contents:

* Element named <code>&lt;sourcePatient&gt;</code>
: This describes the demographic process for the source donor patient.

    Containing:

    * [DemographicModel](#demographicmodel) element (exactly one)

* [TransmissionDemographicModel](#transmissiondemographicmodel) element (exactly one)
: This describes the demographic process for the recipient patients.

* One of:
    * Element named <code>&lt;hostTree&gt;</code>

        Containing:

        * [Tree](#tree) element (exactly one)

    * [TransmissionHistoryModel](#transmissionhistorymodel) element (exactly one)
: This describes the transmission history of the patients.


* Element named <code>&lt;parasiteTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<transmissionLikelihood>
  <sourcePatient>
    <empiricalPiecewise idref="empiricalPiecewise10">
  </sourcePatient>
  <transmissionModel units="months">
    <exponential>
      <doublingTime>
        <hiddenClassRewardParameter idref="hiddenClassRewardParameter7">
      </doublingTime>
      <ancestralProportion>
        <compoundSymmetricMatrix idref="compoundSymmetricMatrix5">
      </ancestralProportion>
    </exponential>
  </transmissionModel>
  <hostTree>
    <speciesTree idref="speciesTree5">
  </hostTree>
  <parasiteTree>
    <transformedTreeModel idref="transformedTreeModel5">
  </parasiteTree>
</transmissionLikelihood>
```



### <code>&lt;transmissionModel&gt;</code> element

A SiteModel that has a gamma distributed rates across sites

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* One of:
    * Element named <code>&lt;constant&gt;</code>

        Containing:

        * Element named <code>&lt;populationSize&gt;</code>
: This parameter represents the carrying capacity (maximum population size). If the shape is very large then the current day population size will be very close to the carrying capacity.

            Containing:

            * [Parameter](#parameter) element (exactly one)

    * One of:
        * Element named <code>&lt;exponential&gt;</code>

            Containing:

            * One of:
                * Element named <code>&lt;growthRate&gt;</code>
: This parameter determines the rate of growth during the exponential phase. See exponentialGrowth for details.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)

                * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time at peak growth rate.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)


            * Element named <code>&lt;ancestralProportion&gt;</code>
: This parameter determines the populaation size at transmission.

                Containing:

                * [Parameter](#parameter) element (exactly one)

        * Element named <code>&lt;logistic&gt;</code>

            Containing:

            * Element named <code>&lt;populationSize&gt;</code>
: This parameter represents the carrying capacity (maximum population size). If the shape is very large then the current day population size will be very close to the carrying capacity.

                Containing:

                * [Parameter](#parameter) element (exactly one)

            * One of:
                * Element named <code>&lt;growthRate&gt;</code>
: This parameter determines the rate of growth during the exponential phase. See exponentialGrowth for details.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)

                * Element named <code>&lt;doublingTime&gt;</code>
: This parameter determines the doubling time at peak growth rate.

                    Containing:

                    * [Parameter](#parameter) element (exactly one)


            * Element named <code>&lt;ancestralProportion&gt;</code>
: This parameter determines the populaation size at transmission.

                Containing:

                * [Parameter](#parameter) element (exactly one)



Example:

```html
<transmissionModel units="generations">
  <exponential>
    <growthRate>
      <duplicatedParameter idref="duplicatedParameter1">
    </growthRate>
    <ancestralProportion>
      <maskedParameter idref="maskedParameter5">
    </ancestralProportion>
  </exponential>
</transmissionModel>
```



### <code>&lt;transmissionStatistic&gt;</code> element

A statistic that returns true if the given parasite tree is compatible with the host tree.

The element takes following attributes:

* <code>name</code>  is of type [String](#string)
: "A name for this statistic for the purpose of logging"

The element has the following contents:

* One of:
    * Element named <code>&lt;hostTree&gt;</code>

        Containing:

        * [Tree](#tree) element (exactly one)

    * [TransmissionHistoryModel](#transmissionhistorymodel) element (exactly one)
: This describes the transmission history of the patients.


* Element named <code>&lt;parasiteTree&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<transmissionStatistic name="foo">
  <transmissionHistory units="years">
    <transmission>
      <mvPolyaLikelihood idref="mvPolyaLikelihood1">
      <donor>
        <taxon idref="taxon8">
      </donor>
      <recipient>
        <sp idref="sp1">
      </recipient>
    </transmission>
    <transmission>
      <designMatrix idref="designMatrix7">
      <donor>
        <taxon idref="taxon9">
      </donor>
      <recipient>
        <sp idref="sp5">
      </recipient>
    </transmission>
  </transmissionHistory>
  <parasiteTree>
    <upgmaTree idref="upgmaTree3">
  </parasiteTree>
</transmissionStatistic>
```



### <code>&lt;transmissionSubtreeSlideA&gt;</code> element

An operator that slides a phylogenetic subtree, preserving the transmission tree topology.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code> (optional) is of type [Double](#double)
: 

* <code>targetAcceptance</code> (optional) is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapInRandomRate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapInRandomTrait</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionSubtreeSlideA weight="1.0" size="1.0" targetAcceptance="1.0" gaussian="true" swapInRandomRate="true" swapInRandomTrait="true" autoOptimize="true" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel3">
    <maxFirstInfToRoot>
      <jointParameter idref="jointParameter1">
    </maxFirstInfToRoot>
    <demographicModel>
      <constantLogistic idref="constantLogistic7">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionSubtreeSlideA>
```



### <code>&lt;transmissionSubtreeSlideB&gt;</code> element

An operator that slides a phylogenetic subtree and a transmission subtree simultaneously.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>size</code> (optional) is of type [Double](#double)
: 

* <code>targetAcceptance</code> (optional) is of type [Double](#double)
: 

* <code>gaussian</code>  is of type [Boolean](#boolean)
: 

* <code>swapInRandomRate</code> (optional) is of type [Boolean](#boolean)
: 

* <code>swapInRandomTrait</code> (optional) is of type [Boolean](#boolean)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionSubtreeSlideB weight="1.0" size="1.0" targetAcceptance="1.0" gaussian="true" swapInRandomRate="true" swapInRandomTrait="true" autoOptimize="true" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel10">
    <maxFirstInfToRoot>
      <designMatrix idref="designMatrix10">
    </maxFirstInfToRoot>
    <demographicModel>
      <transmissionModel idref="transmissionModel5">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionSubtreeSlideB>
```



### <code>&lt;transmissionWilsonBaldingA&gt;</code> element

This element represents a Wilson-Balding move operator, such that the transplantation of the subtree does not affect the topology of the transmission tree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionWilsonBaldingA weight="1.0" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel6">
    <maxFirstInfToRoot>
      <dataFromTreeTips idref="dataFromTreeTips7">
    </maxFirstInfToRoot>
    <demographicModel>
      <exponentialExponential idref="exponentialExponential4">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionWilsonBaldingA>
```



### <code>&lt;transmissionWilsonBaldingB&gt;</code> element

This element represents a Wilson-Balding move operator, such that the transplantation of the phylogenetic subtree is also transplantation of a transmission subtree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>resampleInfectionTimes</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [CaseToCaseTreeLikelihood](#casetocasetreelikelihood) element (exactly one)

Example:

```html
<transmissionWilsonBaldingB weight="1.0" resampleInfectionTimes="true">
  <withinCaseCoalescent truncate="true">
    <partitionedTreeModel idref="partitionedTreeModel8">
    <maxFirstInfToRoot>
      <productParameter idref="productParameter2">
    </maxFirstInfToRoot>
    <demographicModel>
      <constantLogistic idref="constantLogistic7">
    </demographicModel>
  </withinCaseCoalescent>
</transmissionWilsonBaldingB>
```



### <code>&lt;tree&gt;</code> element

This element represents a rooted binary tree and associated attributes.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* [SimpleNode](#simplenode) element (exactly one)

Example:

```html
<tree units="months">
  <node height="1.0" rate="1.0">
    <sp idref="sp10">
  </node>
</tree>
```



### <code>&lt;treeBitMoveOperator&gt;</code> element

This element returns a bit-move operator on a given parameter.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>indicatorTrait</code> (optional) is of type [String](#string)
: 

* <code>trait2</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeBitMoveOperator weight="1.0" indicatorTrait="foo" trait2="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <attributePatterns idref="attributePatterns3">
  </empiricalTreeDistributionModel>
</treeBitMoveOperator>
```



### <code>&lt;treeBitRandomWalk&gt;</code> element

This element returns a bit-random walk operator on a random indicator/variable pair in the tree.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>indicatorTrait</code> (optional) is of type [String](#string)
: 

* <code>trait2</code> (optional) is of type [String](#string)
: 

* <code>swapTrait2</code> (optional) is of type [Boolean](#boolean)
: 

* <code>k</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeBitRandomWalk weight="1.0" indicatorTrait="foo" trait2="foo" swapTrait2="true" k="1">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <speciesTree idref="speciesTree2">
    <rootHeight>
      <duplicatedParameter idref="duplicatedParameter8">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalMatrix idref="diagonalMatrix1">
    </nodeHeights>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <matrixParameter idref="matrixParameter9">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <sumParameter idref="sumParameter5">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <matrixVectorProductParameter idref="matrixVectorProductParameter4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix3">
    </nodeRates>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak5">
    </outbreak>
  </partitionedTreeModel>
</treeBitRandomWalk>
```



### <code>&lt;treeDataLikelihood&gt;</code> element

This element represents the likelihood of data on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scalingScheme</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* At least one of:
    * All of:
        * [PatternList](#patternlist) element (zero or one)

        * [SiteRateModel](#siteratemodel) element (zero or one)

        * [FrequencyModel](#frequencymodel) element (zero or one)

        * [BranchModel](#branchmodel) element (zero or one)



    * Element named <code>&lt;partition&gt;</code>

        Containing:

        * [PatternList](#patternlist) element (exactly one)

        * [SiteRateModel](#siteratemodel) element (exactly one)

        * [FrequencyModel](#frequencymodel) element (zero or one)

        * [BranchModel](#branchmodel) element (zero or one)



* [BranchRateModel](#branchratemodel) element (zero or one)

* [TreeModel](#treemodel) element (exactly one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

Example:

```html
<treeDataLikelihood useAmbiguities="true" scalingScheme="foo">
  <partition>
    <microsatelliteSimulator idref="microsatelliteSimulator5">
    <siteModel idref="siteModel4">
  </partition>
  <partition>
    <microsatellitePattern idref="microsatellitePattern1">
    <siteModel idref="siteModel1">
  </partition>
  <partition>
    <hypermutantAlignment idref="hypermutantAlignment10">
    <siteModel idref="siteModel8">
  </partition>
  <partition>
    <categoryOutbreak idref="categoryOutbreak8">
    <siteModel idref="siteModel4">
  </partition>
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <rescaledTree idref="rescaledTree10">
    <rootHeight>
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix2">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </nodeHeights>
    <leafHeight taxon="foo">
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter10">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix8">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <copyParameterValues idref="copyParameterValues7">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundSymmetricMatrix idref="compoundSymmetricMatrix1">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter1">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <maskedMatrixParameter idref="maskedMatrixParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips10">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak9">
    </outbreak>
  </partitionedTreeModel>
</treeDataLikelihood>
```



### <code>&lt;diffusionRateCovarianceStatistic&gt;</code> element

A statistic that returns the average of the branch rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>greatCircleDistance</code> (optional) is of type [Boolean](#boolean)
: 

* <code>diffusionCoefficient</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [MultivariateTraitTree](#multivariatetraittree) element (exactly one)

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) elements (one or more)

Example:

```html
<diffusionRateCovarianceStatistic name="foo" greatCircleDistance="true" diffusionCoefficient="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <upgmaTree idref="upgmaTree9">
  </empiricalTreeDistributionModel>
  <inhibitionLikelihood>
    <treeModel idref="treeModel3">
    <designMatrix idref="designMatrix2">
    <precision>
      <compoundMatrixParameter idref="compoundMatrixParameter6">
    </precision>
  </inhibitionLikelihood>
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <maskedParameter idref="maskedParameter1">
    </traitParameter>
    <multivariateTDiffusionModel idref="multivariateTDiffusionModel4">
    <starTreeModel idref="starTreeModel9">
    ERROR!
  </multivariateTraitLikelihood>
</diffusionRateCovarianceStatistic>
```



### <code>&lt;continuousDiffusionStatistic&gt;</code> element

A statistic that returns the average of the branch diffusion rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

* <code>greatCircleDistance</code> (optional) is of type [Boolean](#boolean)
: 

* <code>mode</code> (optional) is of type [String](#string)
: 

* <code>statistic</code> (optional) is of type [String](#string)
: 

* <code>discreteState</code> (optional) is of type [String](#string)
: 

* <code>heightUpper</code> (optional) is of type [Double](#double)
: 

* <code>heightLower</code> (optional) is of type [Double](#double)
: 

* <code>heightLowerSerie</code> (optional) is of type [String](#string)
: 

* <code>dimension</code> (optional) is of type [Double](#double)
: 

* <code>cumulative</code> (optional) is of type [Boolean](#boolean)
: 

* <code>noise</code> (optional) is of type [Boolean](#boolean)
: 

* <code>branchSet</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TaxonList](#taxonlist) element (zero or one)

* [AbstractMultivariateTraitLikelihood](#abstractmultivariatetraitlikelihood) elements (one or more)

* [MarkovJumpsBeagleTreeLikelihood](#markovjumpsbeagletreelikelihood) element (zero or one)

Example:

```html
<continuousDiffusionStatistic name="foo" greatCircleDistance="true" mode="foo" statistic="foo" discreteState="foo" heightUpper="1.0" heightLower="1.0" heightLowerSerie="foo" dimension="1.0" cumulative="true" noise="true" branchSet="foo">
  <inhibitionLikelihood>
    <starTreeModel idref="starTreeModel3">
    <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView6">
    <precision>
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter3">
    </precision>
  </inhibitionLikelihood>
  <multivariateTraitLikelihood traitName="foo" integrateInternalTraits="true" cut="0.5 1.0" reportAsMultivariate="true" useTreeLength="true" scaleByTime="true" reciprocalRates="true" cacheBranches="true" randomSample="1" ignorePhylogeny="true" exchangeableTips="true" sampleMissingTraits="true">
    <traitParameter>
      <productParameter idref="productParameter9">
    </traitParameter>
    <greatCircleDiffusionModel idref="greatCircleDiffusionModel2">
    <starTreeModel idref="starTreeModel9">
  </multivariateTraitLikelihood>
</continuousDiffusionStatistic>
```



### <code>&lt;treeHeightStatistic&gt;</code> element

A statistic that returns the height of the tree

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeHeightStatistic name="foo">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <hypermutantAlignment idref="hypermutantAlignment3">
  </empiricalTreeDistributionModel>
</treeHeightStatistic>
```



### <code>&lt;treeLengthStatistic&gt;</code> element

A statistic that returns the average of the branch rates

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeLengthStatistic name="foo">
  <treeModel fixHeights="true" fixTree="true">
    <argTreeModel idref="argTreeModel2">
    <rootHeight>
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixMatrixProduct idref="matrixMatrixProduct5">
    </nodeHeights>
    <leafHeight taxon="foo">
      <dataFromTreeTips idref="dataFromTreeTips9">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true" asMatrix="true">
      <maskedParameter idref="maskedParameter4">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundMatrixParameter idref="compoundMatrixParameter1">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips3">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <immutableParameter idref="immutableParameter5">
    </leafTrait>
  </treeModel>
</treeLengthStatistic>
```



### <code>&lt;treeLikelihood&gt;</code> element

This element represents the likelihood of a patternlist on a tree given the site model.

The element takes following attributes:

* <code>useAmbiguities</code> (optional) is of type [Boolean](#boolean)
: 

* <code>scalingScheme</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [PatternList](#patternlist) element (exactly one)

* [TreeModel](#treemodel) element (exactly one)

* [GammaSiteRateModel](#gammasiteratemodel) element (exactly one)

* [BranchModel](#branchmodel) element (zero or one)

* [SubstitutionModel](#substitutionmodel) element (zero or one)

* [BranchRateModel](#branchratemodel) element (zero or one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

* Element named <code>&lt;partialsRestriction&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)

    * [Parameter](#parameter) element (exactly one)

* [TipStatesModel](#tipstatesmodel) element (zero or one)

* [FrequencyModel](#frequencymodel) element (zero or one)

Example:

```html
<treeLikelihood useAmbiguities="true" scalingScheme="foo">
  <hypermutantAlignment type="both">
    <hypermutantAlignment idref="hypermutantAlignment8">
  </hypermutantAlignment>
  <starTreeModel>
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork3">
    <rootHeight>
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix3">
    </rootHeight>
    <leafHeight taxon="foo">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision2">
    </leafHeight>
    <leafHeight taxon="foo">
      <differenceParameter idref="differenceParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
    </leafHeight>
    <leafTrait taxon="foo" name="foo">
      <differenceMatrixParameter idref="differenceMatrixParameter8">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <leafTraitParameter idref="leafTraitParameter5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <designMatrix idref="designMatrix2">
    </leafTrait>
  </starTreeModel>
  <siteModel>
    <relativeRate weight="1.0">
      <blockUpperTriangularMatrixParameter idref="blockUpperTriangularMatrixParameter8">
    </relativeRate>
  </siteModel>
</treeLikelihood>
```



### <code>&lt;treeMetricStatistic&gt;</code> element

A statistic that returns the distance between two trees.  with method="topology", return a 0 for identity and a 1 for difference. With other methods return the distance metric associated with that method.

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

* <code>type</code> (optional) is of type [String](#string)
: "tree metric name"

The element has the following contents:

* Element named <code>&lt;target&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

* Element named <code>&lt;reference&gt;</code>

    Containing:

    * [Tree](#tree) element (exactly one)

Example:

```html
<treeMetricStatistic name="foo" type="foo">
  <target>
    <mulSpeciesTree idref="mulSpeciesTree2">
  </target>
  <reference>
    <tree idref="tree10">
  </reference>
</treeMetricStatistic>
```



### <code>&lt;treeModel&gt;</code> element

This element represents a model of the tree. The tree model includes and attributes of the nodes including the age (or <i>height</i>) and the rate of evolution at each node in the tree.

The element takes following attributes:

* <code>fixHeights</code> (optional) is of type [Boolean](#boolean)
: 

* <code>fixTree</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [Tree](#tree) element (exactly one)

* Element named <code>&lt;rootHeight&gt;</code>
: A parameter definition with id only (cannot be a reference!)

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;nodeHeights&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root height is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node heights (minus the root) are included in the parameter"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafHeight&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;nodeTraits&gt;</code>

    Containing:

    * <code>name</code>  is of type [String](#string)
: "The name of the trait attribute in the taxa"

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root trait is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node traits (minus the root) are included in the parameter"

    * <code>leafNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the leaf node traits are included in the parameter"

    * <code>traitDimension</code> (optional) is of type [Integer](#integer)
: "The number of dimensions (if multivariate)"

    * <code>initialValue</code> (optional) is of type [Double](#double)
: "The initial value(s)"

    * <code>fireTreeEvents</code> (optional) is of type [Boolean](#boolean)
: "Whether to fire tree events if the traits change"

    * <code>asMatrix</code> (optional) is of type [Boolean](#boolean)
: "Whether to return parameter as a matrix"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;nodeRates&gt;</code>

    Containing:

    * <code>rootNode</code> (optional) is of type [Boolean](#boolean)
: "If true the root rate is included in the parameter"

    * <code>internalNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the internal node rate (minus the root) are included in the parameter"

    * <code>leafNodes</code> (optional) is of type [Boolean](#boolean)
: "If true the leaf node rate are included in the parameter"

    * <code>initialValue</code> (optional) is of type [Double](#double)
: "The initial value(s)"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafTrait&gt;</code>

    Containing:

    * <code>taxon</code>  is of type [String](#string)
: "The name of the taxon for the leaf"

    * <code>name</code>  is of type [String](#string)
: "The name of the trait attribute in the taxa"

    * [Parameter](#parameter) element (exactly one)
: A parameter definition with id only (cannot be a reference!)

* Element named <code>&lt;leafHeights&gt;</code>

    Containing:

    * [TaxonList](#taxonlist) element (exactly one)
: A set of taxa for which leaf heights are required

    * [Parameter](#parameter) element (exactly one)
: A compound parameter containing the leaf heights

Example:

```html
<!-- the tree model as special sockets for attaching parameters to various aspects of the tree     -->
<!-- The treeModel below shows the standard setup with a parameter associated with the root height -->
<!-- a parameter associated with the internal node heights (minus the root height) and             -->
<!-- a parameter associates with all the internal node heights                                     -->
<!-- Notice that these parameters are overlapping                                                  -->
<!-- The parameters are subsequently used in operators to propose changes to the tree node heights -->
<treeModel id="treeModel1">
	<tree idref="startingTree"/>
	<rootHeight>
		<parameter id="treeModel1.rootHeight"/>
	</rootHeight>
	<nodeHeights internalNodes="true" rootNode="false">
		<parameter id="treeModel1.internalNodeHeights"/>
	</nodeHeights>
	<nodeHeights internalNodes="true" rootNode="true">
		<parameter id="treeModel1.allInternalNodeHeights"/>
	</nodeHeights>
</treeModel>```



### <code>&lt;treeShapeStatistics&gt;</code> element

A statistic that reports a handful of tree shape statistics on the given target tree.

The element takes following attributes:

* <code>name</code> (optional) is of type [String](#string)
: "A name for this statistic primarily for the purposes of logging"

The element has the following contents:

* Element named <code>&lt;target&gt;</code>

    Containing:

    * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeShapeStatistics name="foo">
  <target>
    <treeModel idref="treeModel3">
  </target>
</treeShapeStatistics>
```



### <code>&lt;treeTraceAnalysis&gt;</code> element

Analyses and reports on a trace consisting of trees.

The element takes following attributes:

* <code>fileName</code>  is of type [String](#string)
: "name of a tree log file"

* <code>burnIn</code> (optional) is of type [Integer](#integer)
: 

* <code>minCladeProbability</code> (optional) is of type [Double](#double)
: 

* <code>credSetProbability</code> (optional) is of type [Double](#double)
: 

* <code>shortReport</code> (optional) is of type [Boolean](#boolean)
: 

* <code>referenceTree</code> (optional) is of type [String](#string)
: 

Example:

```html
<treeTraceAnalysis fileName="trees.log" burnIn="1" minCladeProbability="1.0" credSetProbability="1.0" shortReport="true" referenceTree="foo"/>
```



### <code>&lt;treeTraitNormalDistribution&gt;</code> element

Parses TreeTraitNormalDistributionModel

The element takes following attributes:

* <code>conditionOnRoot</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [FullyConjugateMultivariateTraitLikelihood](#fullyconjugatemultivariatetraitlikelihood) element (exactly one)

Example:

```html
<treeTraitNormalDistribution conditionOnRoot="true">
  ERROR!
</treeTraitNormalDistribution>
```



### <code>&lt;treeTraitNormalDistributionLikelihood&gt;</code> element

Calculates the likelihood of some data under a given multivariate-gamma distribution.

The element has the following contents:

* [TreeTraitNormalDistributionModel](#treetraitnormaldistributionmodel) element (exactly one)

* Element named <code>&lt;data&gt;</code>

    Containing:

    * [Parameter](#parameter) elements (one or more)

Example:

```html
<treeTraitNormalDistributionLikelihood>
  <treeTraitNormalDistribution conditionOnRoot="true">
    ERROR!
  </treeTraitNormalDistribution>
  <data>
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter8">
    <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter5">
  </data>
</treeTraitNormalDistributionLikelihood>
```



### <code>&lt;treeUniform&gt;</code> element

Simultanouesly change height of two nodes.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>count</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<treeUniform weight="1.0" count="1">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <alloppSpeciesNetwork idref="alloppSpeciesNetwork10">
  </empiricalTreeDistributionModel>
</treeUniform>
```



### <code>&lt;twoEpoch&gt;</code> element

A demographic model of two epochs.

The element takes following attributes:

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;modernEpoch&gt;</code>
: The demographic model for the recent epoch.

    Containing:

    * [DemographicModel](#demographicmodel) element (exactly one)

* Element named <code>&lt;ancientEpoch&gt;</code>
: The demographic model for the ancient epoch.

    Containing:

    * [DemographicModel](#demographicmodel) element (exactly one)

* Element named <code>&lt;transitionTime&gt;</code>
: The time that splits the two epochs.

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<twoEpoch units="generations">
  <modernEpoch>
    <twoEpoch idref="twoEpoch7">
  </modernEpoch>
  <ancientEpoch>
    <transmissionModel idref="transmissionModel4">
  </ancientEpoch>
  <transitionTime>
    <designMatrix idref="designMatrix7">
  </transitionTime>
</twoEpoch>
```



### <code>&lt;twoPartDistribution&gt;</code> element

Calculates the likelihood of some data given some parametric or empirical distribution.

Example:

```html
<twoPartDistribution/>
```



### <code>&lt;uniformDistributionModel&gt;</code> element

Describes a uniform distribution with a given lower and upper bounds 

The element has the following contents:

* Element named <code>&lt;lower&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


* Element named <code>&lt;upper&gt;</code>

    Containing:

    * One of:
        * [Parameter](#parameter) element (exactly one)

        * [Double](#double) element (exactly one)


Example:

```html
<uniformDistributionModel>
  <lower>
    1.0
  </lower>
  <upper>
    <matrixMatrixProduct idref="matrixMatrixProduct10">
  </upper>
</uniformDistributionModel>
```



### <code>&lt;uniformGeoSpatialOperator&gt;</code> element

An operator that picks new parameter values uniformly at random.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

* One of:
    * [MultivariateDistributionLikelihood](#multivariatedistributionlikelihood) element (exactly one)

    * [CachedDistributionLikelihood](#cacheddistributionlikelihood) element (exactly one)


Example:

```html
<uniformGeoSpatialOperator weight="1.0">
  <compoundFastMatrixParameter>
    <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix4">
    <compoundMatrixParameter idref="compoundMatrixParameter2">
    <designMatrix idref="designMatrix8">
  </compoundFastMatrixParameter>
  <dirichletPrior counts="0.5 1.0" sumsTo="1.0">
    <leafTraitParameter idref="leafTraitParameter8">
    <RPNcalculator idref="RPNcalculator8">
  </dirichletPrior>
</uniformGeoSpatialOperator>
```



### <code>&lt;uniformIntegerOperator&gt;</code> element

An operator that picks new parameter values uniformly at random.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>upper</code> (optional) is of type [Double](#double)
: 

* <code>lower</code> (optional) is of type [Double](#double)
: 

* <code>count</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Variable](#variable) element (exactly one)

Example:

```html
<uniformIntegerOperator weight="1.0" upper="1.0" lower="1.0" count="1.0">
  <maskedParameter complement="true" build="true" from="1" to="1" every="1">
    <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter4">
  </maskedParameter>
</uniformIntegerOperator>
```



### <code>&lt;uniformNodeHeightPrior&gt;</code> element

This element represents the likelihood of the tree given the demographic function.

The element takes following attributes:

* <code>analytic</code> (optional) is of type [Boolean](#boolean)
: 

* <code>maxRootHeight</code> (optional) is of type [Double](#double)
: 

* <code>mcSampleSize</code> (optional) is of type [Integer](#integer)
: 

* <code>marginal</code> (optional) is of type [Boolean](#boolean)
: 

* <code>approximate</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<uniformNodeHeightPrior analytic="true" maxRootHeight="1.0" mcSampleSize="1" marginal="true" approximate="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <patternSubSet idref="patternSubSet1">
  </empiricalTreeDistributionModel>
</uniformNodeHeightPrior>
```



### <code>&lt;uniformOperator&gt;</code> element

An operator that picks new parameter values uniformly at random.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

* <code>lower</code> (optional) is of type [Double](#double)
: 

* <code>upper</code> (optional) is of type [Double](#double)
: 

The element has the following contents:

* [Parameter](#parameter) element (exactly one)

Example:

```html
<uniformOperator weight="1.0" lower="1.0" upper="1.0">
  <matrixParameter rows="1" columns="1" transpose="true" asCompoundParameter="true" test="true">
    <parameter idref="parameter5">
    <markovRandomFieldMatrix idref="markovRandomFieldMatrix4">
  </matrixParameter>
</uniformOperator>
```



### <code>&lt;uniformPartitionLikelihood&gt;</code> element

null

The element has the following contents:

* [ARGModel](#argmodel) element (exactly one)

Example:

```html
<uniformPartitionLikelihood>
  <argTreeModel partitionType="reassortment">
    <rescaledTree idref="rescaledTree3">
    <rootHeight>
      <productParameter idref="productParameter5">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice4">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <diagonalContrainedMatrixView idref="diagonalContrainedMatrixView1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter5">
    </nodeHeights>
  </argTreeModel>
</uniformPartitionLikelihood>
```



### <code>&lt;uniformPrior&gt;</code> element

Calculates the prior probability of some data under a given uniform distribution.

The element takes following attributes:

* <code>lower</code>  is of type [Double](#double)
: 

* <code>upper</code>  is of type [Double](#double)
: 

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<uniformPrior lower="1.0" upper="1.0">
  <sumParameter>
    <matrixParameter idref="matrixParameter8">
    <vectorSlice idref="vectorSlice7">
  </sumParameter>
  <originDestinationDesignMatrix latitudeTrait="foo" longitudeTrait="foo">
    <designMatrix idref="designMatrix4">
    <kStateType idref="kStateType3">
  </originDestinationDesignMatrix>
</uniformPrior>
```



### <code>&lt;uniformNodeHeightPrior&gt;</code> element

This element represents the likelihood of the tree given the demographic function.

The element takes following attributes:

* <code>analytic</code> (optional) is of type [Boolean](#boolean)
: 

* <code>maxRootHeight</code> (optional) is of type [Double](#double)
: 

* <code>mcSampleSize</code> (optional) is of type [Integer](#integer)
: 

* <code>marginal</code> (optional) is of type [Boolean](#boolean)
: 

* <code>approximate</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<uniformNodeHeightPrior analytic="true" maxRootHeight="1.0" mcSampleSize="1" marginal="true" approximate="true">
  <empiricalTreeDistributionModel startingTree="1" iterate="true" fileName="foo">
    <tree idref="tree10">
  </empiricalTreeDistributionModel>
</uniformNodeHeightPrior>
```



### <code>&lt;upDownOperator&gt;</code> element

This element represents an operator that scales two parameters in different directions. Each operation involves selecting a scale uniformly at random between scaleFactor and 1/scaleFactor. The up parameter is multipled by this scale and the down parameter is divided by this scale.

The element takes following attributes:

* <code>scaleFactor</code>  is of type [Double](#double)
: 

* <code>weight</code>  is of type [Double](#double)
: 

* <code>autoOptimize</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;up&gt;</code>

    Containing:

    * [Scalable](#scalable) element (zero or one)

    * [Parameter](#parameter) element (zero or one)

    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * <code>count</code> (optional) is of type [Integer](#integer)
: 

        * <code>df</code> (optional) is of type [Integer](#integer)
: 

        * [Scalable](#scalable) element (exactly one)

* Element named <code>&lt;down&gt;</code>

    Containing:

    * [Scalable](#scalable) element (zero or one)

    * [Parameter](#parameter) element (zero or one)

    * Element named <code>&lt;scale&gt;</code>

        Containing:

        * <code>count</code> (optional) is of type [Integer](#integer)
: 

        * <code>df</code> (optional) is of type [Integer](#integer)
: 

        * [Scalable](#scalable) element (exactly one)

Example:

```html
<upDownOperator scaleFactor="1.0" weight="1.0" autoOptimize="true">
  <up/>
  <up/>
  <up/>
  <down/>
  <down/>
  <down/>
  <down/>
</upDownOperator>
```



### <code>&lt;upgmaTree&gt;</code> element

This element returns a UPGMA tree generated from the given distances.

The element takes following attributes:

* <code>usingDates</code> (optional) is of type [Boolean](#boolean)
: 

* <code>rootHeight</code> (optional) is of type [Double](#double)
: 

* <code>nonzeroBranchLengths</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* [DistanceMatrix](#distancematrix) element (exactly one)

Example:

```html
<upgmaTree usingDates="true" rootHeight="1.0" nonzeroBranchLengths="true">
  <distanceMatrix correction="none">
    <categoryOutbreak idref="categoryOutbreak7">
  </distanceMatrix>
</upgmaTree>
```



### <code>&lt;variableDemographic&gt;</code> element

This element represents the likelihood of the tree given the population size vector.

The element takes following attributes:

* <code>type</code> (optional) is of type [String](#string)
: 

* <code>logUnits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useMidpoints</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;populationSizes&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;indicators&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;trees&gt;</code>

    Containing:

    * Element named <code>&lt;ptree&gt;</code>

        Containing:

        * <code>ploidy</code> (optional) is of type [Double](#double)
: 

        * [TreeModel](#treemodel) element (exactly one)

Example:

```html
<variableDemographic type="foo" logUnits="true" useMidpoints="true">
  <populationSizes>
    <productParameter idref="productParameter5">
  </populationSizes>
  <indicators>
    <differenceMatrixParameter idref="differenceMatrixParameter10">
  </indicators>
  <trees>
    <ptree ploidy="1.0">
      <treeModel idref="treeModel7">
    </ptree>
  </trees>
</variableDemographic>
```



### <code>&lt;varianceStatistic&gt;</code> element

This element returns a statistic that is the variance of the child statistics.

The element has the following contents:

* [Statistic](#statistic) elements (one or more)

Example:

```html
<varianceStatistic>
  <matrixMatrixProduct>
    <left>
      <compoundMatrixParameter idref="compoundMatrixParameter3">
    </left>
    <right>
      <vectorSlice idref="vectorSlice8">
    </right>
  </matrixMatrixProduct>
</varianceStatistic>
```



### <code>&lt;VDAnalysis&gt;</code> element

reconstruct population graph from EBSP run.

The element takes following attributes:

* <code>burnIn</code> (optional) is of type [Double](#double)
: "The number of states (not sampled states, but actual states) that are discarded from the beginning of the trace and are excluded from the analysis"

* <code>Confidencelevels</code> (optional) is of type [Double;](#double;)
: 

* <code>useQuantiles</code> (optional) is of type [Boolean](#boolean)
: 

* <code>logUnits</code> (optional) is of type [Boolean](#boolean)
: 

* <code>useMidpoints</code> (optional) is of type [Boolean](#boolean)
: 

* <code>nBins</code> (optional) is of type [Integer](#integer)
: 

* <code>nChanges</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* Element named <code>&lt;logFileName&gt;</code>
: The name of a BEAST log file

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;treeFileNames&gt;</code>

    Containing:

    * Element named <code>&lt;treeOfLoci&gt;</code>
: The name of a BEAST trees log file

        Containing:

        * [String](#string) element (exactly one)

* Element named <code>&lt;populationModelType&gt;</code>
: population model type (stepwise, linear ...

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;populationFirstColumn&gt;</code>
: Name of first column of population size

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;indicatorsFirstColumn&gt;</code>
: Name of first column of population indicators

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;rootheightColumn&gt;</code>
: Name of trace column of root height

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;allDemographicsFileName&gt;</code>
: Name of file to output all demographic functions

    Containing:

    * [String](#string) element (exactly one)

Example:

```html
<VDAnalysis burnIn="1.0" Confidencelevels="0.5 1.0" useQuantiles="true" logUnits="true" useMidpoints="true" nBins="1" nChanges="1">
  <logFileName>
    foo
  </logFileName>
  <treeFileNames>
    <treeOfLoci>
      foo
    </treeOfLoci>
    <treeOfLoci>
      foo
    </treeOfLoci>
    <treeOfLoci>
      foo
    </treeOfLoci>
  </treeFileNames>
  <populationModelType>
    foo
  </populationModelType>
  <populationFirstColumn>
    foo
  </populationFirstColumn>
  <indicatorsFirstColumn>
    foo
  </indicatorsFirstColumn>
</VDAnalysis>
```



### <code>&lt;vectorSlice&gt;</code> element

A vector parameter constructed from a slice of component parameters.

The element takes following attributes:

* <code>sliceDimension</code>  is of type [Integer](#integer)
: 

The element has the following contents:

* [Parameter](#parameter) elements (one or more)

Example:

```html
<vectorSlice sliceDimension="1">
  <fastBlockUpperTriangularMatrixParameterParser transpose="true" columns="1" rows="1"/>
  <buildCompoundSymmetricMatrix/>
</vectorSlice>
```



### <code>&lt;vonMisesFisherDiffusionModel&gt;</code> element

Describes a von Mises-Fisher distributed diffusion process on a sphere.

The element has the following contents:

* Element named <code>&lt;kappa&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<vonMisesFisherDiffusionModel>
  <kappa>
    <sumParameter idref="sumParameter4">
  </kappa>
</vonMisesFisherDiffusionModel>
```



### <code>&lt;wideExchange&gt;</code> element

This element represents a wide exchange operator. This operator swaps two random subtrees.

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<wideExchange weight="1.0">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <upgmaTree idref="upgmaTree4">
    <rootHeight>
      <differenceMatrixParameter idref="differenceMatrixParameter6">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <complementParameter idref="complementParameter6">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <jointParameter idref="jointParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <matrixParameter idref="matrixParameter4">
    </nodeHeights>
    <leafHeight taxon="foo">
      <productParameter idref="productParameter8">
    </leafHeight>
    <leafHeight taxon="foo">
      <mvPolyaLikelihood idref="mvPolyaLikelihood3">
    </leafHeight>
    <leafHeight taxon="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix9">
    </leafHeight>
    <leafHeight taxon="foo">
      <elementWiseMatrixMultiplicationParameter idref="elementWiseMatrixMultiplicationParameter2">
    </leafHeight>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <productParameter idref="productParameter6">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <matrixMatrixProduct idref="matrixMatrixProduct2">
    </nodeTraits>
    <nodeTraits name="foo" rootNode="true" internalNodes="true" leafNodes="true" traitDimension="1" initialValue="1.0" fireTreeEvents="true">
      <leafTraitParameter idref="leafTraitParameter4">
    </nodeTraits>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <markovRandomFieldMatrix idref="markovRandomFieldMatrix6">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <compoundMatrixParameter idref="compoundMatrixParameter3">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <vectorSlice idref="vectorSlice2">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix2">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <complementParameter idref="complementParameter7">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <originDestinationDesignMatrix idref="originDestinationDesignMatrix5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <productParameter idref="productParameter10">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak8">
    </outbreak>
  </partitionedTreeModel>
</wideExchange>
```



### <code>&lt;wilsonBalding&gt;</code> element

An operator which performs the Wilson-Balding move on a tree

The element takes following attributes:

* <code>weight</code>  is of type [Double](#double)
: 

The element has the following contents:

* [TreeModel](#treemodel) element (exactly one)

Example:

```html
<wilsonBalding weight="1.0">
  <treeModel fixHeights="true" fixTree="true">
    <partitionedTreeModel idref="partitionedTreeModel10">
    <rootHeight>
      <parameter idref="parameter10">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <leafTraitParameter idref="leafTraitParameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <fastMatrixParameter idref="fastMatrixParameter9">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <duplicatedParameter idref="duplicatedParameter8">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix9">
    </nodeHeights>
    <leafHeight taxon="foo">
      <sumParameter idref="sumParameter10">
    </leafHeight>
    <leafHeight taxon="foo">
      <duplicatedParameter idref="duplicatedParameter5">
    </leafHeight>
    <leafHeight taxon="foo">
      <maskedParameter idref="maskedParameter2">
    </leafHeight>
    <leafHeight taxon="foo">
      <parameter idref="parameter7">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <approximateFactorAnalysisPrecision idref="approximateFactorAnalysisPrecision4">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <buildCompoundSymmetricMatrix idref="buildCompoundSymmetricMatrix4">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <dataFromTreeTips idref="dataFromTreeTips5">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser9">
    </leafTrait>
    <leafTrait taxon="foo" name="foo">
      <fastMatrixParameter idref="fastMatrixParameter8">
    </leafTrait>
  </treeModel>
</wilsonBalding>
```



### <code>&lt;wishartGammaDistributionModel&gt;</code> element

more magic

The element takes following attributes:

* <code>fixMixing</code> (optional) is of type [Boolean](#boolean)
: 

The element has the following contents:

* Element named <code>&lt;df&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;mixing&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;scale&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<wishartGammaDistributionModel fixMixing="true">
  <df>
    <matrixMatrixProduct idref="matrixMatrixProduct5">
  </df>
  <mixing>
    <fastMatrixParameter idref="fastMatrixParameter3">
  </mixing>
  <scale>
    <duplicatedParameter idref="duplicatedParameter7">
  </scale>
</wishartGammaDistributionModel>
```



### <code>&lt;wishartStatistics&gt;</code> element

null

The element takes following attributes:

* <code>traitName</code> (optional) is of type [String](#string)
: 

The element has the following contents:

* [TreeDataLikelihood](#treedatalikelihood) element (exactly one)

Example:

```html
<wishartStatistics traitName="foo">
  <traitDataLikelihood scaleByTime="true" useTreeLength="true" reciprocalRates="true" reconstructTraits="true" forceCompletelyMissing="true" allowSingular="true" forceFullPrecision="true">
    <starTreeModel idref="starTreeModel4">
    <cartogramDiffusionModel idref="cartogramDiffusionModel7">
    <conjugateRootPrior>
      <meanParameter>
        <diagonalMatrix idref="diagonalMatrix8">
      </meanParameter>
      <priorSampleSize>
        <fastBlockUpperTriangularMatrixParameterParser idref="fastBlockUpperTriangularMatrixParameterParser7">
      </priorSampleSize>
    </conjugateRootPrior>
    <traitParameter>
      <adaptableSizeFastMatrixParameter idref="adaptableSizeFastMatrixParameter8">
    </traitParameter>
  </traitDataLikelihood>
</wishartStatistics>
```



### <code>&lt;withinCaseCoalescent&gt;</code> element

This element provides a tree prior for a partitioned tree, with each partitioned tree generatedby a coalescent process

The element takes following attributes:

* <code>truncate</code>  is of type [Boolean](#boolean)
: 

The element has the following contents:

* [PartitionedTreeModel](#partitionedtreemodel) element (exactly one)
: The tree

* [CategoryOutbreak](#categoryoutbreak) element (zero or one)
: The set of cases

* [CategoryOutbreak](#categoryoutbreak) element (zero or one)
: The set of cases

* Element named <code>&lt;startingNetwork&gt;</code>
: A CSV file containing a specified starting network

    Containing:

    * [String](#string) element (exactly one)

* Element named <code>&lt;maxFirstInfToRoot&gt;</code>
: The maximum time from the first infection tothe root node

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;demographicModel&gt;</code>
: The demographic model for within-caseevolution

    Containing:

    * [DemographicModel](#demographicmodel) element (exactly one)

Example:

```html
<withinCaseCoalescent truncate="true">
  <partitionedTreeModel startingTransmissionTreeFile="foo">
    <starTreeModel idref="starTreeModel6">
    <rootHeight>
      <productParameter idref="productParameter9">
    </rootHeight>
    <nodeHeights rootNode="true" internalNodes="true">
      <productParameter idref="productParameter1">
    </nodeHeights>
    <nodeHeights rootNode="true" internalNodes="true">
      <vectorSlice idref="vectorSlice2">
    </nodeHeights>
    <leafHeight taxon="foo">
      <complementParameter idref="complementParameter2">
    </leafHeight>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <hiddenClassRewardParameter idref="hiddenClassRewardParameter9">
    </nodeRates>
    <nodeRates rootNode="true" internalNodes="true" leafNodes="true" initialValue="1.0">
      <mvPolyaLikelihood idref="mvPolyaLikelihood4">
    </nodeRates>
    <leafTrait taxon="foo" name="foo">
      <parameter idref="parameter6">
    </leafTrait>
    <outbreak>
      <categoryOutbreak idref="categoryOutbreak9">
    </outbreak>
  </partitionedTreeModel>
  <maxFirstInfToRoot>
    <compoundFastMatrixParameter idref="compoundFastMatrixParameter6">
  </maxFirstInfToRoot>
  <demographicModel>
    <multiEpochExponential idref="multiEpochExponential3">
  </demographicModel>
</withinCaseCoalescent>
```



### <code>&lt;compoundLikelihood&gt;</code> element

A likelihood function which is simply the product of its component likelihood functions.

The element takes following attributes:

* <code>threads</code> (optional) is of type [Integer](#integer)
: 

The element has the following contents:

* [Likelihood](#likelihood) elements ( or more)

Example:

```html
<compoundLikelihood threads="1">
  <BrownianMotion logUnits="true">
    <sigma>
      <compoundMatrixParameter idref="compoundMatrixParameter9">
    </sigma>
    <variableDemographic idref="variableDemographic5">
  </BrownianMotion>
  <logitTransformedNormalReferencePrior fileName="foo" parameterColumn="foo" burnin="1" dimension="1" upperLimit="1.0">
    <speciesTreeStatistic idref="speciesTreeStatistic4">
    <parsimonyStateStatistic idref="parsimonyStateStatistic1">
    <argTimingStatistic idref="argTimingStatistic2">
  </logitTransformedNormalReferencePrior>
</compoundLikelihood>
```



### <code>&lt;yangCodonModel&gt;</code> element

This element represents the Yang model of codon evolution.

The element takes following attributes:

* <code>geneticCode</code> (optional) is of type [String](#string)
: "The genetic code to use"

The element has the following contents:

* Element named <code>&lt;omega&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* Element named <code>&lt;kappa&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

* [FrequencyModel](#frequencymodel) element (exactly one)

Example:

```html
<yangCodonModel geneticCode="echinodermMitochondrial">
  <omega>
    <leafTraitParameter idref="leafTraitParameter3">
  </omega>
  <kappa>
    <copyParameterValues idref="copyParameterValues4">
  </kappa>
  <frequencyModel composition="3x4" normalize="true" compress="true" dataType="hiddenAminoAcid3">
    <frequencies>
      <jointParameter idref="jointParameter3">
    </frequencies>
  </frequencyModel>
</yangCodonModel>
```



### <code>&lt;yuleModel&gt;</code> element

A speciation model of a simple constant rate Birth-death process.

The element takes following attributes:

* <code>conditionalOnRoot</code> (optional) is of type [Boolean](#boolean)
: 

* <code>units</code>  is of type [String](#string)
: "the units"

The element has the following contents:

* Element named <code>&lt;birthRate&gt;</code>

    Containing:

    * [Parameter](#parameter) element (exactly one)

Example:

```html
<yuleModel conditionalOnRoot="true" units="mutations">
  <birthRate>
    <leafTraitParameter idref="leafTraitParameter2">
  </birthRate>
</yuleModel>
```



## BEAST types

The following is a list of generic types that elements represent in a beast file.

### ARGModel

Elements of this type include:

- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)

### ARGPartitionLikelihood

Elements of this type include:

- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)

### ARGRatePrior

Elements of this type include:

- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)

### AbstractBranchRateModel

Elements of this type include:

- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)

### AbstractDistributionLikelihood

Elements of this type include:

- [&lt;cachedPrior&gt; element](#codeltcachedpriorgtcode-element)
- [&lt;coalescentHeightsReferencePrior&gt; element](#codeltcoalescentheightsreferencepriorgtcode-element)
- [&lt;dirichletPrior&gt; element](#codeltdirichletpriorgtcode-element)
- [&lt;distributionLikelihood&gt; element](#codeltdistributionlikelihoodgtcode-element)
- [&lt;flatGeoSpatialPrior&gt; element](#codeltflatgeospatialpriorgtcode-element)
- [&lt;modelSpecificPseudoPrior&gt; element](#codeltmodelspecificpseudopriorgtcode-element)
- [&lt;multivariateDistributionLikelihood&gt; element](#codeltmultivariatedistributionlikelihoodgtcode-element)
- [&lt;multivariateGammaPrior&gt; element](#codeltmultivariategammapriorgtcode-element)
- [&lt;multivariateNormalPrior&gt; element](#codeltmultivariatenormalpriorgtcode-element)
- [&lt;treeTraitNormalDistributionLikelihood&gt; element](#codelttreetraitnormaldistributionlikelihoodgtcode-element)
- [&lt;twoPartDistribution&gt; element](#codelttwopartdistributiongtcode-element)

### AbstractModel

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [TN93Model](#tn93model)
- [&lt;alloppNetworkPriorModel&gt; element](#codeltalloppnetworkpriormodelgtcode-element)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;aminoAcidModel&gt; element](#codeltaminoacidmodelgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;betaSplittingModel&gt; element](#codeltbetasplittingmodelgtcode-element)
- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;binaryCovarionModel&gt; element](#codeltbinarycovarionmodelgtcode-element)
- [&lt;binarySubstitutionModel&gt; element](#codeltbinarysubstitutionmodelgtcode-element)
- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)
- [&lt;birthDeathEpidemiology&gt; element](#codeltbirthdeathepidemiologygtcode-element)
- [&lt;birthDeathModel&gt; element](#codeltbirthdeathmodelgtcode-element)
- [&lt;birthDeathSerialSampling&gt; element](#codeltbirthdeathserialsamplinggtcode-element)
- [&lt;branchSpecificSubstitutionModel&gt; element](#codeltbranchspecificsubstitutionmodelgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;cataclysm&gt; element](#codeltcataclysmgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;constExpConst&gt; element](#codeltconstexpconstgtcode-element)
- [&lt;constantExponential&gt; element](#codeltconstantexponentialgtcode-element)
- [&lt;constantLogistic&gt; element](#codeltconstantlogisticgtcode-element)
- [&lt;constantSize&gt; element](#codeltconstantsizegtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;emergingEpidemic&gt; element](#codeltemergingepidemicgtcode-element)
- [&lt;empiricalCodonModel&gt; element](#codeltempiricalcodonmodelgtcode-element)
- [&lt;empiricalPiecewise&gt; element](#codeltempiricalpiecewisegtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;expConstExp&gt; element](#codeltexpconstexpgtcode-element)
- [&lt;expansion&gt; element](#codeltexpansiongtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;exponentialExponential&gt; element](#codeltexponentialexponentialgtcode-element)
- [&lt;exponentialGrowth&gt; element](#codeltexponentialgrowthgtcode-element)
- [&lt;exponentialLogistic&gt; element](#codeltexponentiallogisticgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialSawtooth&gt; element](#codeltexponentialsawtoothgtcode-element)
- [&lt;externalInternalBranchModel&gt; element](#codeltexternalinternalbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;frequencyModel&gt; element](#codeltfrequencymodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;gtrModel&gt; element](#codeltgtrmodelgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;hkyModel&gt; element](#codelthkymodelgtcode-element)
- [&lt;hypermutantErrorModel&gt; element](#codelthypermutanterrormodelgtcode-element)
- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;lewisMk&gt; element](#codeltlewismkgtcode-element)
- [&lt;lineageSpecificBranchModel&gt; element](#codeltlineagespecificbranchmodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;logisticGrowth&gt; element](#codeltlogisticgrowthgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovModulatedYangCodonModel&gt; element](#codeltmarkovmodulatedyangcodonmodelgtcode-element)
- [&lt;microsatelliteSamplerTreeModel&gt; element](#codeltmicrosatellitesamplertreemodelgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multiEpochExponential&gt; element](#codeltmultiepochexponentialgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;museGautCodonModel&gt; element](#codeltmusegautcodonmodelgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;pcaCodonModel&gt; element](#codeltpcacodonmodelgtcode-element)
- [&lt;piecewisePopulation&gt; element](#codeltpiecewisepopulationgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;positiveDefiniteSubstitutionModel&gt; element](#codeltpositivedefinitesubstitutionmodelgtcode-element)
- [&lt;randomBranchModel&gt; element](#codeltrandombranchmodelgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;scaledPiecewisePopulation&gt; element](#codeltscaledpiecewisepopulationgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;sequenceErrorModel&gt; element](#codeltsequenceerrormodelgtcode-element)
- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;spatialKernelFunction&gt; element](#codeltspatialkernelfunctiongtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;species&gt; element](#codeltspeciesgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;transmissionHistory&gt; element](#codelttransmissionhistorygtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)
- [&lt;twoEpoch&gt; element](#codelttwoepochgtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)
- [&lt;wishartGammaDistributionModel&gt; element](#codeltwishartgammadistributionmodelgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)
- [&lt;yangCodonModel&gt; element](#codeltyangcodonmodelgtcode-element)
- [&lt;yuleModel&gt; element](#codeltyulemodelgtcode-element)

### AbstractMultivariateTraitLikelihood

Elements of this type include:

- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)

### AbstractOutbreak

Elements of this type include:

- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)

### AbstractPeriodPriorDistribution

Elements of this type include:

- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)

### Alignment

Elements of this type include:

- [&lt;alignment&gt; element](#codeltalignmentgtcode-element)
- [&lt;convert&gt; element](#codeltconvertgtcode-element)
- [&lt;hypermutantAlignment&gt; element](#codelthypermutantalignmentgtcode-element)
- [&lt;sequenceSimulator&gt; element](#codeltsequencesimulatorgtcode-element)

### AlloppNetworkPriorModel

Elements of this type include:

- [&lt;alloppNetworkPriorModel&gt; element](#codeltalloppnetworkpriormodelgtcode-element)

### AlloppSpeciesBindings

Elements of this type include:

- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)

### AlloppSpeciesBindings$ApSpInfo

Elements of this type include:

- [&lt;apsp&gt; element](#codeltapspgtcode-element)

### AlloppSpeciesBindings$Individual

Elements of this type include:

- [&lt;individual&gt; element](#codeltindividualgtcode-element)

### AlloppSpeciesNetworkModel

Elements of this type include:

- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)

### AncestralStateBeagleTreeLikelihood

Elements of this type include:


### AncestralStateTraitProvider

Elements of this type include:


### ArbitraryBranchRates

Elements of this type include:

- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)

### Attribute

Elements of this type include:

- [RPNcalculator](#rpncalculator)
- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;alloppNumHybsStatistic&gt; element](#codeltalloppnumhybsstatisticgtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;argReassortmentNodeCount&gt; element](#codeltargreassortmentnodecountgtcode-element)
- [&lt;argTimingStatistic&gt; element](#codeltargtimingstatisticgtcode-element)
- [&lt;argTotalLengthStatistic&gt; element](#codeltargtotallengthstatisticgtcode-element)
- [&lt;argTreeCount&gt; element](#codeltargtreecountgtcode-element)
- [&lt;attr&gt; element](#codeltattrgtcode-element)
- [&lt;bdcNClustersStatistic&gt; element](#codeltbdcnclustersstatisticgtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;coalescentEventsStatistic&gt; element](#codeltcoalescenteventsstatisticgtcode-element)
- [&lt;coalescentIntervalStatistic&gt; element](#codeltcoalescentintervalstatisticgtcode-element)
- [&lt;compatibilityStatistic&gt; element](#codeltcompatibilitystatisticgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;continuousDiffusionStatistic&gt; element](#codeltcontinuousdiffusionstatisticgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;correlation&gt; element](#codeltcorrelationgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;date&gt; element](#codeltdategtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;differenceStatistic&gt; element](#codeltdifferencestatisticgtcode-element)
- [&lt;diffusionRateCovarianceStatistic&gt; element](#codeltdiffusionratecovariancestatisticgtcode-element)
- [&lt;driftedLocationsStatistic&gt; element](#codeltdriftedlocationsstatisticgtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;exponentialStatistic&gt; element](#codeltexponentialstatisticgtcode-element)
- [&lt;expressionStatistic&gt; element](#codeltexpressionstatisticgtcode-element)
- [&lt;externalLengthStatistic&gt; element](#codeltexternallengthstatisticgtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;generalizedSkylinePopSizeStatistic&gt; element](#codeltgeneralizedskylinepopsizestatisticgtcode-element)
- [&lt;gmrfHeightsStatistic&gt; element](#codeltgmrfheightsstatisticgtcode-element)
- [&lt;gmrfPopSizeStatistic&gt; element](#codeltgmrfpopsizestatisticgtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;lineageCountStatistic&gt; element](#codeltlineagecountstatisticgtcode-element)
- [&lt;logarithmStatistic&gt; element](#codeltlogarithmstatisticgtcode-element)
- [&lt;loggableStatistic&gt; element](#codeltloggablestatisticgtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;matrixInverse&gt; element](#codeltmatrixinversegtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;meanStatistic&gt; element](#codeltmeanstatisticgtcode-element)
- [&lt;monophylyStatistic&gt; element](#codeltmonophylystatisticgtcode-element)
- [&lt;monotonicStatistic&gt; element](#codeltmonotonicstatisticgtcode-element)
- [&lt;mrcaTraitStatistic&gt; element](#codeltmrcatraitstatisticgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;negativeStatistic&gt; element](#codeltnegativestatisticgtcode-element)
- [&lt;nodeHeightsStatistic&gt; element](#codeltnodeheightsstatisticgtcode-element)
- [&lt;notBooleanStatistic&gt; element](#codeltnotbooleanstatisticgtcode-element)
- [&lt;notStatistic&gt; element](#codeltnotstatisticgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;parsimonyStateStatistic&gt; element](#codeltparsimonystatestatisticgtcode-element)
- [&lt;parsimonyStatistic&gt; element](#codeltparsimonystatisticgtcode-element)
- [&lt;partitionStatistic&gt; element](#codeltpartitionstatisticgtcode-element)
- [&lt;popGraph&gt; element](#codeltpopgraphgtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;productStatistic&gt; element](#codeltproductstatisticgtcode-element)
- [&lt;rateCovarianceStatistic&gt; element](#codeltratecovariancestatisticgtcode-element)
- [&lt;rateStatistic&gt; element](#codeltratestatisticgtcode-element)
- [&lt;ratioStatistic&gt; element](#codeltratiostatisticgtcode-element)
- [&lt;reciprocalStatistic&gt; element](#codeltreciprocalstatisticgtcode-element)
- [&lt;speciesTreeStatistic&gt; element](#codeltspeciestreestatisticgtcode-element)
- [&lt;statistic&gt; element](#codeltstatisticgtcode-element)
- [&lt;subStatistic&gt; element](#codeltsubstatisticgtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;sumStatistic&gt; element](#codeltsumstatisticgtcode-element)
- [&lt;test&gt; element](#codelttestgtcode-element)
- [&lt;thresholdStatistic&gt; element](#codeltthresholdstatisticgtcode-element)
- [&lt;tmrcaStatistic&gt; element](#codelttmrcastatisticgtcode-element)
- [&lt;transmissionStatistic&gt; element](#codelttransmissionstatisticgtcode-element)
- [&lt;treeHeightStatistic&gt; element](#codelttreeheightstatisticgtcode-element)
- [&lt;treeLengthStatistic&gt; element](#codelttreelengthstatisticgtcode-element)
- [&lt;treeMetricStatistic&gt; element](#codelttreemetricstatisticgtcode-element)
- [&lt;treeShapeStatistics&gt; element](#codelttreeshapestatisticsgtcode-element)
- [&lt;varianceStatistic&gt; element](#codeltvariancestatisticgtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)

### Attribute$Default

Elements of this type include:


### BayesianSkylineLikelihood

Elements of this type include:

- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)

### BayesianStochasticSearchVariableSelection

Elements of this type include:

- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)

### BeagleTreeLikelihood

Elements of this type include:


### BinaryLatentLiabilityLikelihood

Elements of this type include:

- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)

### BirthDeathCollapseModel

Elements of this type include:

- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)

### Boolean

Elements of this type include:


### BooleanStatistic

Elements of this type include:

- [&lt;compatibilityStatistic&gt; element](#codeltcompatibilitystatisticgtcode-element)
- [&lt;monophylyStatistic&gt; element](#codeltmonophylystatisticgtcode-element)
- [&lt;monotonicStatistic&gt; element](#codeltmonotonicstatisticgtcode-element)
- [&lt;notBooleanStatistic&gt; element](#codeltnotbooleanstatisticgtcode-element)
- [&lt;test&gt; element](#codelttestgtcode-element)

### BranchModel

Elements of this type include:

- [&lt;branchSpecificSubstitutionModel&gt; element](#codeltbranchspecificsubstitutionmodelgtcode-element)
- [&lt;externalInternalBranchModel&gt; element](#codeltexternalinternalbranchmodelgtcode-element)
- [&lt;lineageSpecificBranchModel&gt; element](#codeltlineagespecificbranchmodelgtcode-element)
- [&lt;randomBranchModel&gt; element](#codeltrandombranchmodelgtcode-element)

### BranchRateModel

Elements of this type include:

- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)

### BranchingModel

Elements of this type include:

- [&lt;betaSplittingModel&gt; element](#codeltbetasplittingmodelgtcode-element)

### CachedDistributionLikelihood

Elements of this type include:


### CaseToCaseTreeLikelihood

Elements of this type include:

- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)

### CategoryOutbreak

Elements of this type include:

- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)

### CoalescentIntervalProvider

Elements of this type include:

- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)

### CoalescentLikelihood

Elements of this type include:

- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)

### CodonPartitionedRobustCounting

Elements of this type include:

- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)

### ColourSamplerModel

Elements of this type include:


### Columns

Elements of this type include:

- [&lt;column&gt; element](#codeltcolumngtcode-element)

### CompoundParameter

Elements of this type include:

- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)

### ConjugateWishartStatisticsProvider

Elements of this type include:

- [&lt;wishartStatistics&gt; element](#codeltwishartstatisticsgtcode-element)

### ContinuousTraitPartialsProvider

Elements of this type include:

- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)

### CountableBranchCategoryProvider

Elements of this type include:

- [&lt;branchCategories&gt; element](#codeltbranchcategoriesgtcode-element)

### DataType

Elements of this type include:

- [&lt;compositeDataType&gt; element](#codeltcompositedatatypegtcode-element)
- [&lt;extendedDataType&gt; element](#codeltextendeddatatypegtcode-element)
- [&lt;generalDataType&gt; element](#codeltgeneraldatatypegtcode-element)
- [&lt;hiddenNucleotides&gt; element](#codelthiddennucleotidesgtcode-element)
- [&lt;kStateType&gt; element](#codeltkstatetypegtcode-element)
- [&lt;microsatellite&gt; element](#codeltmicrosatellitegtcode-element)

### Date

Elements of this type include:

- [&lt;date&gt; element](#codeltdategtcode-element)

### DemographicModel

Elements of this type include:

- [&lt;cataclysm&gt; element](#codeltcataclysmgtcode-element)
- [&lt;constExpConst&gt; element](#codeltconstexpconstgtcode-element)
- [&lt;constantExponential&gt; element](#codeltconstantexponentialgtcode-element)
- [&lt;constantLogistic&gt; element](#codeltconstantlogisticgtcode-element)
- [&lt;constantSize&gt; element](#codeltconstantsizegtcode-element)
- [&lt;emergingEpidemic&gt; element](#codeltemergingepidemicgtcode-element)
- [&lt;empiricalPiecewise&gt; element](#codeltempiricalpiecewisegtcode-element)
- [&lt;expConstExp&gt; element](#codeltexpconstexpgtcode-element)
- [&lt;expansion&gt; element](#codeltexpansiongtcode-element)
- [&lt;exponentialExponential&gt; element](#codeltexponentialexponentialgtcode-element)
- [&lt;exponentialGrowth&gt; element](#codeltexponentialgrowthgtcode-element)
- [&lt;exponentialLogistic&gt; element](#codeltexponentiallogisticgtcode-element)
- [&lt;exponentialSawtooth&gt; element](#codeltexponentialsawtoothgtcode-element)
- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;logisticGrowth&gt; element](#codeltlogisticgrowthgtcode-element)
- [&lt;multiEpochExponential&gt; element](#codeltmultiepochexponentialgtcode-element)
- [&lt;piecewisePopulation&gt; element](#codeltpiecewisepopulationgtcode-element)
- [&lt;scaledPiecewisePopulation&gt; element](#codeltscaledpiecewisepopulationgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)
- [&lt;twoEpoch&gt; element](#codelttwoepochgtcode-element)
- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)

### DesignMatrix

Elements of this type include:

- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)

### DiagonalMatrix

Elements of this type include:


### DistanceMatrix

Elements of this type include:

- [&lt;distanceMatrix&gt; element](#codeltdistancematrixgtcode-element)

### Distribution

Elements of this type include:

- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)

### DistributionLikelihood

Elements of this type include:

- [&lt;cachedPrior&gt; element](#codeltcachedpriorgtcode-element)
- [&lt;distributionLikelihood&gt; element](#codeltdistributionlikelihoodgtcode-element)
- [&lt;modelSpecificPseudoPrior&gt; element](#codeltmodelspecificpseudopriorgtcode-element)
- [&lt;twoPartDistribution&gt; element](#codelttwopartdistributiongtcode-element)

### Double

Elements of this type include:

- [&lt;double&gt; element](#codeltdoublegtcode-element)
- [&lt;multiLociDistance&gt; element](#codeltmultilocidistancegtcode-element)

### Double;

Elements of this type include:


### EmpiricalTreeDistributionModel

Elements of this type include:

- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)

### FrequencyModel

Elements of this type include:

- [&lt;frequencyModel&gt; element](#codeltfrequencymodelgtcode-element)

### FullyConjugateMultivariateTraitLikelihood

Elements of this type include:


### GMRFSkyrideLikelihood

Elements of this type include:

- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)

### GammaSiteRateModel

Elements of this type include:

- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)

### GaussianProcessRandomGenerator

Elements of this type include:

- [&lt;compoundGaussianProcess&gt; element](#codeltcompoundgaussianprocessgtcode-element)
- [&lt;gaussianProcessFromTree&gt; element](#codeltgaussianprocessfromtreegtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)

### GeneralizedLinearModel

Elements of this type include:

- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)

### GeoSpatialCollectionModel

Elements of this type include:


### GradientWrtParameterProvider

Elements of this type include:

- [&lt;appendedPotentialDerivative&gt; element](#codeltappendedpotentialderivativegtcode-element)
- [&lt;gradient&gt; element](#codeltgradientgtcode-element)
- [&lt;maskedGradient&gt; element](#codeltmaskedgradientgtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;sumDerivative&gt; element](#codeltsumderivativegtcode-element)

### HistoryFilter

Elements of this type include:

- [&lt;historyFilter&gt; element](#codelthistoryfiltergtcode-element)

### HypermutantAlignment

Elements of this type include:


### Identifiable

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [MetagenomeData](#metagenomedata)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [RPNcalculator](#rpncalculator)
- [STPopulationPrior](#stpopulationprior)
- [TN93Model](#tn93model)
- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;alignment&gt; element](#codeltalignmentgtcode-element)
- [&lt;alloppNetworkPriorModel&gt; element](#codeltalloppnetworkpriormodelgtcode-element)
- [&lt;alloppNumHybsStatistic&gt; element](#codeltalloppnumhybsstatisticgtcode-element)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;aminoAcidModel&gt; element](#codeltaminoacidmodelgtcode-element)
- [&lt;ancestralTreeLikelihood&gt; element](#codeltancestraltreelikelihoodgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;apsp&gt; element](#codeltapspgtcode-element)
- [&lt;apspCoalescent&gt; element](#codeltapspcoalescentgtcode-element)
- [&lt;apspNetworkPrior&gt; element](#codeltapspnetworkpriorgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argReassortmentNodeCount&gt; element](#codeltargreassortmentnodecountgtcode-element)
- [&lt;argTimingStatistic&gt; element](#codeltargtimingstatisticgtcode-element)
- [&lt;argTotalLengthStatistic&gt; element](#codeltargtotallengthstatisticgtcode-element)
- [&lt;argTreeCount&gt; element](#codeltargtreecountgtcode-element)
- [&lt;argTreeLikelihood&gt; element](#codeltargtreelikelihoodgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;ascertainedPatterns&gt; element](#codeltascertainedpatternsgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;attributePatterns&gt; element](#codeltattributepatternsgtcode-element)
- [&lt;bdcNClustersStatistic&gt; element](#codeltbdcnclustersstatisticgtcode-element)
- [&lt;beagleBranchLikelihood&gt; element](#codeltbeaglebranchlikelihoodgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;benchmarker&gt; element](#codeltbenchmarkergtcode-element)
- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;betaPrior&gt; element](#codeltbetapriorgtcode-element)
- [&lt;betaSplittingModel&gt; element](#codeltbetasplittingmodelgtcode-element)
- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;binaryCovarionModel&gt; element](#codeltbinarycovarionmodelgtcode-element)
- [&lt;binarySubstitutionModel&gt; element](#codeltbinarysubstitutionmodelgtcode-element)
- [&lt;binomialLikelihood&gt; element](#codeltbinomiallikelihoodgtcode-element)
- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)
- [&lt;birthDeathEpidemiology&gt; element](#codeltbirthdeathepidemiologygtcode-element)
- [&lt;birthDeathModel&gt; element](#codeltbirthdeathmodelgtcode-element)
- [&lt;birthDeathSerialSampling&gt; element](#codeltbirthdeathserialsamplinggtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;booleanLikelihood&gt; element](#codeltbooleanlikelihoodgtcode-element)
- [&lt;branchSpecificSubstitutionModel&gt; element](#codeltbranchspecificsubstitutionmodelgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;cachedPrior&gt; element](#codeltcachedpriorgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;cataclysm&gt; element](#codeltcataclysmgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;coalescentConstantLikelihood&gt; element](#codeltcoalescentconstantlikelihoodgtcode-element)
- [&lt;coalescentEventsStatistic&gt; element](#codeltcoalescenteventsstatisticgtcode-element)
- [&lt;coalescentHeightsReferencePrior&gt; element](#codeltcoalescentheightsreferencepriorgtcode-element)
- [&lt;coalescentIntervalStatistic&gt; element](#codeltcoalescentintervalstatisticgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;compatibilityStatistic&gt; element](#codeltcompatibilitystatisticgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundLikelihood&gt; element](#codeltcompoundlikelihoodgtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;conditionalCladeProbability&gt; element](#codeltconditionalcladeprobabilitygtcode-element)
- [&lt;constExpConst&gt; element](#codeltconstexpconstgtcode-element)
- [&lt;constantDecreasedVariancePrior&gt; element](#codeltconstantdecreasedvariancepriorgtcode-element)
- [&lt;constantExponential&gt; element](#codeltconstantexponentialgtcode-element)
- [&lt;constantLikelihood&gt; element](#codeltconstantlikelihoodgtcode-element)
- [&lt;constantLogistic&gt; element](#codeltconstantlogisticgtcode-element)
- [&lt;constantPatterns&gt; element](#codeltconstantpatternsgtcode-element)
- [&lt;constantSize&gt; element](#codeltconstantsizegtcode-element)
- [&lt;constantTreeTopologyPrior&gt; element](#codeltconstanttreetopologypriorgtcode-element)
- [&lt;contemporaneousCoalescentConstantLikelihood&gt; element](#codeltcontemporaneouscoalescentconstantlikelihoodgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousDiffusionStatistic&gt; element](#codeltcontinuousdiffusionstatisticgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;convert&gt; element](#codeltconvertgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;correlation&gt; element](#codeltcorrelationgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;differenceStatistic&gt; element](#codeltdifferencestatisticgtcode-element)
- [&lt;diffusionRateCovarianceStatistic&gt; element](#codeltdiffusionratecovariancestatisticgtcode-element)
- [&lt;dirichletParameterPrior&gt; element](#codeltdirichletparameterpriorgtcode-element)
- [&lt;dirichletPrior&gt; element](#codeltdirichletpriorgtcode-element)
- [&lt;dirichletProcessLikelihood&gt; element](#codeltdirichletprocesslikelihoodgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discreteUniformPrior&gt; element](#codeltdiscreteuniformpriorgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;distanceMatrix&gt; element](#codeltdistancematrixgtcode-element)
- [&lt;distributionLikelihood&gt; element](#codeltdistributionlikelihoodgtcode-element)
- [&lt;driftedLocationsStatistic&gt; element](#codeltdriftedlocationsstatisticgtcode-element)
- [&lt;dummyLikelihood&gt; element](#codeltdummylikelihoodgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;emergingEpidemic&gt; element](#codeltemergingepidemicgtcode-element)
- [&lt;empiricalCodonModel&gt; element](#codeltempiricalcodonmodelgtcode-element)
- [&lt;empiricalDistributionLikelihood&gt; element](#codeltempiricaldistributionlikelihoodgtcode-element)
- [&lt;empiricalPiecewise&gt; element](#codeltempiricalpiecewisegtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;expConstExp&gt; element](#codeltexpconstexpgtcode-element)
- [&lt;expansion&gt; element](#codeltexpansiongtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;exponentialExponential&gt; element](#codeltexponentialexponentialgtcode-element)
- [&lt;exponentialGrowth&gt; element](#codeltexponentialgrowthgtcode-element)
- [&lt;exponentialLogistic&gt; element](#codeltexponentiallogisticgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialPrior&gt; element](#codeltexponentialpriorgtcode-element)
- [&lt;exponentialSawtooth&gt; element](#codeltexponentialsawtoothgtcode-element)
- [&lt;exponentialStatistic&gt; element](#codeltexponentialstatisticgtcode-element)
- [&lt;expressionStatistic&gt; element](#codeltexpressionstatisticgtcode-element)
- [&lt;externalInternalBranchModel&gt; element](#codeltexternalinternalbranchmodelgtcode-element)
- [&lt;externalLengthStatistic&gt; element](#codeltexternallengthstatisticgtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;flatGeoSpatialPrior&gt; element](#codeltflatgeospatialpriorgtcode-element)
- [&lt;frequencyModel&gt; element](#codeltfrequencymodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;gammaPrior&gt; element](#codeltgammapriorgtcode-element)
- [&lt;gammaReferencePrior&gt; element](#codeltgammareferencepriorgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;generalizedSkylinePopSizeStatistic&gt; element](#codeltgeneralizedskylinepopsizestatisticgtcode-element)
- [&lt;glmModel&gt; element](#codeltglmmodelgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;glmSubstitutionModelNew&gt; element](#codeltglmsubstitutionmodelnewgtcode-element)
- [&lt;gmrfHeightsStatistic&gt; element](#codeltgmrfheightsstatisticgtcode-element)
- [&lt;gmrfPopSizeStatistic&gt; element](#codeltgmrfpopsizestatisticgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;gtrModel&gt; element](#codeltgtrmodelgtcode-element)
- [&lt;halfNormalPrior&gt; element](#codelthalfnormalpriorgtcode-element)
- [&lt;halfTPrior&gt; element](#codelthalftpriorgtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;hierarchicalGraphLikelihood&gt; element](#codelthierarchicalgraphlikelihoodgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;hkyModel&gt; element](#codelthkymodelgtcode-element)
- [&lt;hypermutantAlignment&gt; element](#codelthypermutantalignmentgtcode-element)
- [&lt;hypermutantErrorModel&gt; element](#codelthypermutanterrormodelgtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;individual&gt; element](#codeltindividualgtcode-element)
- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integerParameter&gt; element](#codeltintegerparametergtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;integratedMixtureModel&gt; element](#codeltintegratedmixturemodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;invgammaPrior&gt; element](#codeltinvgammapriorgtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;laplacePrior&gt; element](#codeltlaplacepriorgtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;lewisMk&gt; element](#codeltlewismkgtcode-element)
- [&lt;lineageCountStatistic&gt; element](#codeltlineagecountstatisticgtcode-element)
- [&lt;lineageSpecificBranchModel&gt; element](#codeltlineagespecificbranchmodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;location&gt; element](#codeltlocationgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;logNormalPrior&gt; element](#codeltlognormalpriorgtcode-element)
- [&lt;logTransformedNormalReferencePrior&gt; element](#codeltlogtransformednormalreferencepriorgtcode-element)
- [&lt;logarithmStatistic&gt; element](#codeltlogarithmstatisticgtcode-element)
- [&lt;loggableStatistic&gt; element](#codeltloggablestatisticgtcode-element)
- [&lt;logisticGrowth&gt; element](#codeltlogisticgrowthgtcode-element)
- [&lt;logitTransformedNormalReferencePrior&gt; element](#codeltlogittransformednormalreferencepriorgtcode-element)
- [&lt;marginalLikelihoodEstimator&gt; element](#codeltmarginallikelihoodestimatorgtcode-element)
- [&lt;markovJumpsTreeLikelihood&gt; element](#codeltmarkovjumpstreelikelihoodgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovModulatedYangCodonModel&gt; element](#codeltmarkovmodulatedyangcodonmodelgtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;maskedPatterns&gt; element](#codeltmaskedpatternsgtcode-element)
- [&lt;matrixInverse&gt; element](#codeltmatrixinversegtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;mcmc&gt; element](#codeltmcmcgtcode-element)
- [&lt;meanStatistic&gt; element](#codeltmeanstatisticgtcode-element)
- [&lt;mergePatterns&gt; element](#codeltmergepatternsgtcode-element)
- [&lt;microsatellitePattern&gt; element](#codeltmicrosatellitepatterngtcode-element)
- [&lt;microsatelliteSamplerTreeModel&gt; element](#codeltmicrosatellitesamplertreemodelgtcode-element)
- [&lt;microsatelliteSimulator&gt; element](#codeltmicrosatellitesimulatorgtcode-element)
- [&lt;mixedDistributionLikelihood&gt; element](#codeltmixeddistributionlikelihoodgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;mixtureModel&gt; element](#codeltmixturemodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;mixtureModelLikelihood&gt; element](#codeltmixturemodellikelihoodgtcode-element)
- [&lt;modelSpecificPseudoPrior&gt; element](#codeltmodelspecificpseudopriorgtcode-element)
- [&lt;monophylyStatistic&gt; element](#codeltmonophylystatisticgtcode-element)
- [&lt;monotonicStatistic&gt; element](#codeltmonotonicstatisticgtcode-element)
- [&lt;mrcaTraitStatistic&gt; element](#codeltmrcatraitstatisticgtcode-element)
- [&lt;mulMSCoalescent&gt; element](#codeltmulmscoalescentgtcode-element)
- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;mulSpeciesTreePrior&gt; element](#codeltmulspeciestreepriorgtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multiEpochExponential&gt; element](#codeltmultiepochexponentialgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateDistributionLikelihood&gt; element](#codeltmultivariatedistributionlikelihoodgtcode-element)
- [&lt;multivariateGammaPrior&gt; element](#codeltmultivariategammapriorgtcode-element)
- [&lt;multivariateInverseWishartPrior&gt; element](#codeltmultivariateinversewishartpriorgtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;multivariateNormalPrior&gt; element](#codeltmultivariatenormalpriorgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;multivariateWishartPrior&gt; element](#codeltmultivariatewishartpriorgtcode-element)
- [&lt;museGautCodonModel&gt; element](#codeltmusegautcodonmodelgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;negativeBinomialPrior&gt; element](#codeltnegativebinomialpriorgtcode-element)
- [&lt;negativeStatistic&gt; element](#codeltnegativestatisticgtcode-element)
- [&lt;neighborJoiningTree&gt; element](#codeltneighborjoiningtreegtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;newick&gt; element](#codeltnewickgtcode-element)
- [&lt;nodeHeightsStatistic&gt; element](#codeltnodeheightsstatisticgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;normalPrior&gt; element](#codeltnormalpriorgtcode-element)
- [&lt;normalReferencePrior&gt; element](#codeltnormalreferencepriorgtcode-element)
- [&lt;notBooleanStatistic&gt; element](#codeltnotbooleanstatisticgtcode-element)
- [&lt;notStatistic&gt; element](#codeltnotstatisticgtcode-element)
- [&lt;oneOnXPrior&gt; element](#codeltoneonxpriorgtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;optimizedBeagleTreeLikelihood&gt; element](#codeltoptimizedbeagletreelikelihoodgtcode-element)
- [&lt;optimizer&gt; element](#codeltoptimizergtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;parsimonyStateStatistic&gt; element](#codeltparsimonystatestatisticgtcode-element)
- [&lt;parsimonyStatistic&gt; element](#codeltparsimonystatisticgtcode-element)
- [&lt;partitionStatistic&gt; element](#codeltpartitionstatisticgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;pathLikelihood&gt; element](#codeltpathlikelihoodgtcode-element)
- [&lt;patternSubSet&gt; element](#codeltpatternsubsetgtcode-element)
- [&lt;patterns&gt; element](#codeltpatternsgtcode-element)
- [&lt;pcaCodonModel&gt; element](#codeltpcacodonmodelgtcode-element)
- [&lt;piecewisePopulation&gt; element](#codeltpiecewisepopulationgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;poissonPrior&gt; element](#codeltpoissonpriorgtcode-element)
- [&lt;popGraph&gt; element](#codeltpopgraphgtcode-element)
- [&lt;positiveDefiniteSubstitutionModel&gt; element](#codeltpositivedefinitesubstitutionmodelgtcode-element)
- [&lt;productOfExponentials&gt; element](#codeltproductofexponentialsgtcode-element)
- [&lt;productOfExponentialsPosteriorMeans&gt; element](#codeltproductofexponentialsposteriormeansgtcode-element)
- [&lt;productOfExponentialsPosteriorMeansLoess&gt; element](#codeltproductofexponentialsposteriormeansloessgtcode-element)
- [&lt;productOfExponentialsSufficientStatistics&gt; element](#codeltproductofexponentialssufficientstatisticsgtcode-element)
- [&lt;productOfGammas&gt; element](#codeltproductofgammasgtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;productStatistic&gt; element](#codeltproductstatisticgtcode-element)
- [&lt;randomBranchModel&gt; element](#codeltrandombranchmodelgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateCovarianceStatistic&gt; element](#codeltratecovariancestatisticgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;rateStatistic&gt; element](#codeltratestatisticgtcode-element)
- [&lt;ratioStatistic&gt; element](#codeltratiostatisticgtcode-element)
- [&lt;reciprocalStatistic&gt; element](#codeltreciprocalstatisticgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;rescaledTree&gt; element](#codeltrescaledtreegtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;scaledPiecewisePopulation&gt; element](#codeltscaledpiecewisepopulationgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;sequence&gt; element](#codeltsequencegtcode-element)
- [&lt;sequenceErrorModel&gt; element](#codeltsequenceerrormodelgtcode-element)
- [&lt;sequenceSimulator&gt; element](#codeltsequencesimulatorgtcode-element)
- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;sp&gt; element](#codeltspgtcode-element)
- [&lt;spatialKernelFunction&gt; element](#codeltspatialkernelfunctiongtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;species&gt; element](#codeltspeciesgtcode-element)
- [&lt;speciesCoalescent&gt; element](#codeltspeciescoalescentgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;speciesTreePopulationPrior&gt; element](#codeltspeciestreepopulationpriorgtcode-element)
- [&lt;speciesTreeStatistic&gt; element](#codeltspeciestreestatisticgtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;statistic&gt; element](#codeltstatisticgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;subStatistic&gt; element](#codeltsubstatisticgtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;sumStatistic&gt; element](#codeltsumstatisticgtcode-element)
- [&lt;taxa&gt; element](#codelttaxagtcode-element)
- [&lt;taxon&gt; element](#codelttaxongtcode-element)
- [&lt;test&gt; element](#codelttestgtcode-element)
- [&lt;threadedCompoundLikelihood&gt; element](#codeltthreadedcompoundlikelihoodgtcode-element)
- [&lt;thresholdStatistic&gt; element](#codeltthresholdstatisticgtcode-element)
- [&lt;tipHeightLikelihood&gt; element](#codelttipheightlikelihoodgtcode-element)
- [&lt;tmrcaStatistic&gt; element](#codelttmrcastatisticgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;transmissionHistory&gt; element](#codelttransmissionhistorygtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)
- [&lt;transmissionStatistic&gt; element](#codelttransmissionstatisticgtcode-element)
- [&lt;tree&gt; element](#codelttreegtcode-element)
- [&lt;treeDataLikelihood&gt; element](#codelttreedatalikelihoodgtcode-element)
- [&lt;treeHeightStatistic&gt; element](#codelttreeheightstatisticgtcode-element)
- [&lt;treeLengthStatistic&gt; element](#codelttreelengthstatisticgtcode-element)
- [&lt;treeLikelihood&gt; element](#codelttreelikelihoodgtcode-element)
- [&lt;treeMetricStatistic&gt; element](#codelttreemetricstatisticgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;treeShapeStatistics&gt; element](#codelttreeshapestatisticsgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)
- [&lt;treeTraitNormalDistributionLikelihood&gt; element](#codelttreetraitnormaldistributionlikelihoodgtcode-element)
- [&lt;twoEpoch&gt; element](#codelttwoepochgtcode-element)
- [&lt;twoPartDistribution&gt; element](#codelttwopartdistributiongtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;uniformPrior&gt; element](#codeltuniformpriorgtcode-element)
- [&lt;upgmaTree&gt; element](#codeltupgmatreegtcode-element)
- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)
- [&lt;varianceStatistic&gt; element](#codeltvariancestatisticgtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)
- [&lt;wishartGammaDistributionModel&gt; element](#codeltwishartgammadistributionmodelgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)
- [&lt;yangCodonModel&gt; element](#codeltyangcodonmodelgtcode-element)
- [&lt;yuleModel&gt; element](#codeltyulemodelgtcode-element)

### Integer

Elements of this type include:

- [&lt;integer&gt; element](#codeltintegergtcode-element)

### Integer;

Elements of this type include:


### IntegratedMultivariateTraitLikelihood

Elements of this type include:


### KMLCoordinates

Elements of this type include:

- [&lt;coordinates&gt; element](#codeltcoordinatesgtcode-element)

### LatentTruncation

Elements of this type include:

- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)

### Likelihood

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [STPopulationPrior](#stpopulationprior)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;ancestralTreeLikelihood&gt; element](#codeltancestraltreelikelihoodgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;apspCoalescent&gt; element](#codeltapspcoalescentgtcode-element)
- [&lt;apspNetworkPrior&gt; element](#codeltapspnetworkpriorgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argTreeLikelihood&gt; element](#codeltargtreelikelihoodgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;beagleBranchLikelihood&gt; element](#codeltbeaglebranchlikelihoodgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;benchmarker&gt; element](#codeltbenchmarkergtcode-element)
- [&lt;betaPrior&gt; element](#codeltbetapriorgtcode-element)
- [&lt;binomialLikelihood&gt; element](#codeltbinomiallikelihoodgtcode-element)
- [&lt;booleanLikelihood&gt; element](#codeltbooleanlikelihoodgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;cachedPrior&gt; element](#codeltcachedpriorgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;coalescentConstantLikelihood&gt; element](#codeltcoalescentconstantlikelihoodgtcode-element)
- [&lt;coalescentHeightsReferencePrior&gt; element](#codeltcoalescentheightsreferencepriorgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;compoundLikelihood&gt; element](#codeltcompoundlikelihoodgtcode-element)
- [&lt;conditionalCladeProbability&gt; element](#codeltconditionalcladeprobabilitygtcode-element)
- [&lt;constantDecreasedVariancePrior&gt; element](#codeltconstantdecreasedvariancepriorgtcode-element)
- [&lt;constantLikelihood&gt; element](#codeltconstantlikelihoodgtcode-element)
- [&lt;constantTreeTopologyPrior&gt; element](#codeltconstanttreetopologypriorgtcode-element)
- [&lt;contemporaneousCoalescentConstantLikelihood&gt; element](#codeltcontemporaneouscoalescentconstantlikelihoodgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;dirichletParameterPrior&gt; element](#codeltdirichletparameterpriorgtcode-element)
- [&lt;dirichletPrior&gt; element](#codeltdirichletpriorgtcode-element)
- [&lt;dirichletProcessLikelihood&gt; element](#codeltdirichletprocesslikelihoodgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discreteUniformPrior&gt; element](#codeltdiscreteuniformpriorgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;distributionLikelihood&gt; element](#codeltdistributionlikelihoodgtcode-element)
- [&lt;dummyLikelihood&gt; element](#codeltdummylikelihoodgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;empiricalDistributionLikelihood&gt; element](#codeltempiricaldistributionlikelihoodgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialPrior&gt; element](#codeltexponentialpriorgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;flatGeoSpatialPrior&gt; element](#codeltflatgeospatialpriorgtcode-element)
- [&lt;gammaPrior&gt; element](#codeltgammapriorgtcode-element)
- [&lt;gammaReferencePrior&gt; element](#codeltgammareferencepriorgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;glmModel&gt; element](#codeltglmmodelgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;halfNormalPrior&gt; element](#codelthalfnormalpriorgtcode-element)
- [&lt;halfTPrior&gt; element](#codelthalftpriorgtcode-element)
- [&lt;hierarchicalGraphLikelihood&gt; element](#codelthierarchicalgraphlikelihoodgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;invgammaPrior&gt; element](#codeltinvgammapriorgtcode-element)
- [&lt;laplacePrior&gt; element](#codeltlaplacepriorgtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logNormalPrior&gt; element](#codeltlognormalpriorgtcode-element)
- [&lt;logTransformedNormalReferencePrior&gt; element](#codeltlogtransformednormalreferencepriorgtcode-element)
- [&lt;logitTransformedNormalReferencePrior&gt; element](#codeltlogittransformednormalreferencepriorgtcode-element)
- [&lt;markovJumpsTreeLikelihood&gt; element](#codeltmarkovjumpstreelikelihoodgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;mixedDistributionLikelihood&gt; element](#codeltmixeddistributionlikelihoodgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;modelSpecificPseudoPrior&gt; element](#codeltmodelspecificpseudopriorgtcode-element)
- [&lt;mulMSCoalescent&gt; element](#codeltmulmscoalescentgtcode-element)
- [&lt;mulSpeciesTreePrior&gt; element](#codeltmulspeciestreepriorgtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multivariateDistributionLikelihood&gt; element](#codeltmultivariatedistributionlikelihoodgtcode-element)
- [&lt;multivariateGammaPrior&gt; element](#codeltmultivariategammapriorgtcode-element)
- [&lt;multivariateInverseWishartPrior&gt; element](#codeltmultivariateinversewishartpriorgtcode-element)
- [&lt;multivariateNormalPrior&gt; element](#codeltmultivariatenormalpriorgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;multivariateWishartPrior&gt; element](#codeltmultivariatewishartpriorgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;negativeBinomialPrior&gt; element](#codeltnegativebinomialpriorgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;normalPrior&gt; element](#codeltnormalpriorgtcode-element)
- [&lt;normalReferencePrior&gt; element](#codeltnormalreferencepriorgtcode-element)
- [&lt;oneOnXPrior&gt; element](#codeltoneonxpriorgtcode-element)
- [&lt;optimizedBeagleTreeLikelihood&gt; element](#codeltoptimizedbeagletreelikelihoodgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;pathLikelihood&gt; element](#codeltpathlikelihoodgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;poissonPrior&gt; element](#codeltpoissonpriorgtcode-element)
- [&lt;productOfExponentials&gt; element](#codeltproductofexponentialsgtcode-element)
- [&lt;productOfExponentialsPosteriorMeans&gt; element](#codeltproductofexponentialsposteriormeansgtcode-element)
- [&lt;productOfExponentialsPosteriorMeansLoess&gt; element](#codeltproductofexponentialsposteriormeansloessgtcode-element)
- [&lt;productOfExponentialsSufficientStatistics&gt; element](#codeltproductofexponentialssufficientstatisticsgtcode-element)
- [&lt;productOfGammas&gt; element](#codeltproductofgammasgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;speciesCoalescent&gt; element](#codeltspeciescoalescentgtcode-element)
- [&lt;speciesTreePopulationPrior&gt; element](#codeltspeciestreepopulationpriorgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;threadedCompoundLikelihood&gt; element](#codeltthreadedcompoundlikelihoodgtcode-element)
- [&lt;tipHeightLikelihood&gt; element](#codelttipheightlikelihoodgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;treeDataLikelihood&gt; element](#codelttreedatalikelihoodgtcode-element)
- [&lt;treeLikelihood&gt; element](#codelttreelikelihoodgtcode-element)
- [&lt;treeTraitNormalDistributionLikelihood&gt; element](#codelttreetraitnormaldistributionlikelihoodgtcode-element)
- [&lt;twoPartDistribution&gt; element](#codelttwopartdistributiongtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;uniformPrior&gt; element](#codeltuniformpriorgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)

### LinearRegression

Elements of this type include:


### LinkageConstraints

Elements of this type include:


### Location

Elements of this type include:

- [&lt;location&gt; element](#codeltlocationgtcode-element)

### Loggable

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [RPNcalculator](#rpncalculator)
- [STPopulationPrior](#stpopulationprior)
- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;alloppNumHybsStatistic&gt; element](#codeltalloppnumhybsstatisticgtcode-element)
- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;ancestralTrait&gt; element](#codeltancestraltraitgtcode-element)
- [&lt;ancestralTreeLikelihood&gt; element](#codeltancestraltreelikelihoodgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;apspCoalescent&gt; element](#codeltapspcoalescentgtcode-element)
- [&lt;apspNetworkPrior&gt; element](#codeltapspnetworkpriorgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argReassortmentNodeCount&gt; element](#codeltargreassortmentnodecountgtcode-element)
- [&lt;argTimingStatistic&gt; element](#codeltargtimingstatisticgtcode-element)
- [&lt;argTotalLengthStatistic&gt; element](#codeltargtotallengthstatisticgtcode-element)
- [&lt;argTreeCount&gt; element](#codeltargtreecountgtcode-element)
- [&lt;argTreeLikelihood&gt; element](#codeltargtreelikelihoodgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;bdcNClustersStatistic&gt; element](#codeltbdcnclustersstatisticgtcode-element)
- [&lt;beagleBranchLikelihood&gt; element](#codeltbeaglebranchlikelihoodgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;benchmarker&gt; element](#codeltbenchmarkergtcode-element)
- [&lt;betaPrior&gt; element](#codeltbetapriorgtcode-element)
- [&lt;binomialLikelihood&gt; element](#codeltbinomiallikelihoodgtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;booleanLikelihood&gt; element](#codeltbooleanlikelihoodgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;cachedPrior&gt; element](#codeltcachedpriorgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;coalescentConstantLikelihood&gt; element](#codeltcoalescentconstantlikelihoodgtcode-element)
- [&lt;coalescentEventsStatistic&gt; element](#codeltcoalescenteventsstatisticgtcode-element)
- [&lt;coalescentHeightsReferencePrior&gt; element](#codeltcoalescentheightsreferencepriorgtcode-element)
- [&lt;coalescentIntervalStatistic&gt; element](#codeltcoalescentintervalstatisticgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;compatibilityStatistic&gt; element](#codeltcompatibilitystatisticgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundLikelihood&gt; element](#codeltcompoundlikelihoodgtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;conditionalCladeProbability&gt; element](#codeltconditionalcladeprobabilitygtcode-element)
- [&lt;constantDecreasedVariancePrior&gt; element](#codeltconstantdecreasedvariancepriorgtcode-element)
- [&lt;constantLikelihood&gt; element](#codeltconstantlikelihoodgtcode-element)
- [&lt;constantTreeTopologyPrior&gt; element](#codeltconstanttreetopologypriorgtcode-element)
- [&lt;contemporaneousCoalescentConstantLikelihood&gt; element](#codeltcontemporaneouscoalescentconstantlikelihoodgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousDiffusionStatistic&gt; element](#codeltcontinuousdiffusionstatisticgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;correlation&gt; element](#codeltcorrelationgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;dNdSLogger&gt; element](#codeltdndsloggergtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;dataLikelihood&gt; element](#codeltdatalikelihoodgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;differenceStatistic&gt; element](#codeltdifferencestatisticgtcode-element)
- [&lt;diffusionRateCovarianceStatistic&gt; element](#codeltdiffusionratecovariancestatisticgtcode-element)
- [&lt;dirichletParameterPrior&gt; element](#codeltdirichletparameterpriorgtcode-element)
- [&lt;dirichletPrior&gt; element](#codeltdirichletpriorgtcode-element)
- [&lt;dirichletProcessLikelihood&gt; element](#codeltdirichletprocesslikelihoodgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discreteUniformPrior&gt; element](#codeltdiscreteuniformpriorgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;distributionLikelihood&gt; element](#codeltdistributionlikelihoodgtcode-element)
- [&lt;driftedLocationsStatistic&gt; element](#codeltdriftedlocationsstatisticgtcode-element)
- [&lt;dummyLikelihood&gt; element](#codeltdummylikelihoodgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;empiricalDistributionLikelihood&gt; element](#codeltempiricaldistributionlikelihoodgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialPrior&gt; element](#codeltexponentialpriorgtcode-element)
- [&lt;exponentialStatistic&gt; element](#codeltexponentialstatisticgtcode-element)
- [&lt;expressionStatistic&gt; element](#codeltexpressionstatisticgtcode-element)
- [&lt;externalLengthStatistic&gt; element](#codeltexternallengthstatisticgtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;flatGeoSpatialPrior&gt; element](#codeltflatgeospatialpriorgtcode-element)
- [&lt;gammaPrior&gt; element](#codeltgammapriorgtcode-element)
- [&lt;gammaReferencePrior&gt; element](#codeltgammareferencepriorgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;generalizedSkylinePopSizeStatistic&gt; element](#codeltgeneralizedskylinepopsizestatisticgtcode-element)
- [&lt;glmModel&gt; element](#codeltglmmodelgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;gmrfHeightsStatistic&gt; element](#codeltgmrfheightsstatisticgtcode-element)
- [&lt;gmrfPopSizeStatistic&gt; element](#codeltgmrfpopsizestatisticgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;halfNormalPrior&gt; element](#codelthalfnormalpriorgtcode-element)
- [&lt;halfTPrior&gt; element](#codelthalftpriorgtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;hierarchicalGraphLikelihood&gt; element](#codelthierarchicalgraphlikelihoodgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;invgammaPrior&gt; element](#codeltinvgammapriorgtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;laplacePrior&gt; element](#codeltlaplacepriorgtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;lineageCountStatistic&gt; element](#codeltlineagecountstatisticgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logNormalPrior&gt; element](#codeltlognormalpriorgtcode-element)
- [&lt;logTransformedNormalReferencePrior&gt; element](#codeltlogtransformednormalreferencepriorgtcode-element)
- [&lt;logarithmStatistic&gt; element](#codeltlogarithmstatisticgtcode-element)
- [&lt;loggableStatistic&gt; element](#codeltloggablestatisticgtcode-element)
- [&lt;logitTransformedNormalReferencePrior&gt; element](#codeltlogittransformednormalreferencepriorgtcode-element)
- [&lt;marginalLikelihoodEstimator&gt; element](#codeltmarginallikelihoodestimatorgtcode-element)
- [&lt;markovJumpsTreeLikelihood&gt; element](#codeltmarkovjumpstreelikelihoodgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;matrixInverse&gt; element](#codeltmatrixinversegtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;mcmc&gt; element](#codeltmcmcgtcode-element)
- [&lt;meanStatistic&gt; element](#codeltmeanstatisticgtcode-element)
- [&lt;mixedDistributionLikelihood&gt; element](#codeltmixeddistributionlikelihoodgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;modelSpecificPseudoPrior&gt; element](#codeltmodelspecificpseudopriorgtcode-element)
- [&lt;monophylyStatistic&gt; element](#codeltmonophylystatisticgtcode-element)
- [&lt;monotonicStatistic&gt; element](#codeltmonotonicstatisticgtcode-element)
- [&lt;mrcaTraitStatistic&gt; element](#codeltmrcatraitstatisticgtcode-element)
- [&lt;mulMSCoalescent&gt; element](#codeltmulmscoalescentgtcode-element)
- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)
- [&lt;mulSpeciesTreePrior&gt; element](#codeltmulspeciestreepriorgtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multivariateDistributionLikelihood&gt; element](#codeltmultivariatedistributionlikelihoodgtcode-element)
- [&lt;multivariateGammaPrior&gt; element](#codeltmultivariategammapriorgtcode-element)
- [&lt;multivariateInverseWishartPrior&gt; element](#codeltmultivariateinversewishartpriorgtcode-element)
- [&lt;multivariateNormalPrior&gt; element](#codeltmultivariatenormalpriorgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;multivariateWishartPrior&gt; element](#codeltmultivariatewishartpriorgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;negativeBinomialPrior&gt; element](#codeltnegativebinomialpriorgtcode-element)
- [&lt;negativeStatistic&gt; element](#codeltnegativestatisticgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;nodeHeightsStatistic&gt; element](#codeltnodeheightsstatisticgtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;normalPrior&gt; element](#codeltnormalpriorgtcode-element)
- [&lt;normalReferencePrior&gt; element](#codeltnormalreferencepriorgtcode-element)
- [&lt;notBooleanStatistic&gt; element](#codeltnotbooleanstatisticgtcode-element)
- [&lt;notStatistic&gt; element](#codeltnotstatisticgtcode-element)
- [&lt;oneOnXPrior&gt; element](#codeltoneonxpriorgtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)
- [&lt;operators&gt; element](#codeltoperatorsgtcode-element)
- [&lt;optimizedBeagleTreeLikelihood&gt; element](#codeltoptimizedbeagletreelikelihoodgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;parsimonyStateStatistic&gt; element](#codeltparsimonystatestatisticgtcode-element)
- [&lt;parsimonyStatistic&gt; element](#codeltparsimonystatisticgtcode-element)
- [&lt;partitionStatistic&gt; element](#codeltpartitionstatisticgtcode-element)
- [&lt;pathLikelihood&gt; element](#codeltpathlikelihoodgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;poissonPrior&gt; element](#codeltpoissonpriorgtcode-element)
- [&lt;popGraph&gt; element](#codeltpopgraphgtcode-element)
- [&lt;positiveDefiniteSubstitutionModel&gt; element](#codeltpositivedefinitesubstitutionmodelgtcode-element)
- [&lt;productOfExponentials&gt; element](#codeltproductofexponentialsgtcode-element)
- [&lt;productOfExponentialsPosteriorMeans&gt; element](#codeltproductofexponentialsposteriormeansgtcode-element)
- [&lt;productOfExponentialsPosteriorMeansLoess&gt; element](#codeltproductofexponentialsposteriormeansloessgtcode-element)
- [&lt;productOfExponentialsSufficientStatistics&gt; element](#codeltproductofexponentialssufficientstatisticsgtcode-element)
- [&lt;productOfGammas&gt; element](#codeltproductofgammasgtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;productStatistic&gt; element](#codeltproductstatisticgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateCovarianceStatistic&gt; element](#codeltratecovariancestatisticgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;rateStatistic&gt; element](#codeltratestatisticgtcode-element)
- [&lt;ratioStatistic&gt; element](#codeltratiostatisticgtcode-element)
- [&lt;reciprocalStatistic&gt; element](#codeltreciprocalstatisticgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;speciesCoalescent&gt; element](#codeltspeciescoalescentgtcode-element)
- [&lt;speciesTreePopulationPrior&gt; element](#codeltspeciestreepopulationpriorgtcode-element)
- [&lt;speciesTreeStatistic&gt; element](#codeltspeciestreestatisticgtcode-element)
- [&lt;statistic&gt; element](#codeltstatisticgtcode-element)
- [&lt;stratifiedTraitLogger&gt; element](#codeltstratifiedtraitloggergtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;subStatistic&gt; element](#codeltsubstatisticgtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;sumStatistic&gt; element](#codeltsumstatisticgtcode-element)
- [&lt;test&gt; element](#codelttestgtcode-element)
- [&lt;threadedCompoundLikelihood&gt; element](#codeltthreadedcompoundlikelihoodgtcode-element)
- [&lt;thresholdStatistic&gt; element](#codeltthresholdstatisticgtcode-element)
- [&lt;tipHeightLikelihood&gt; element](#codelttipheightlikelihoodgtcode-element)
- [&lt;tmrcaStatistic&gt; element](#codelttmrcastatisticgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;transmissionStatistic&gt; element](#codelttransmissionstatisticgtcode-element)
- [&lt;treeDataLikelihood&gt; element](#codelttreedatalikelihoodgtcode-element)
- [&lt;treeHeightStatistic&gt; element](#codelttreeheightstatisticgtcode-element)
- [&lt;treeLengthStatistic&gt; element](#codelttreelengthstatisticgtcode-element)
- [&lt;treeLikelihood&gt; element](#codelttreelikelihoodgtcode-element)
- [&lt;treeMetricStatistic&gt; element](#codelttreemetricstatisticgtcode-element)
- [&lt;treeShapeStatistics&gt; element](#codelttreeshapestatisticsgtcode-element)
- [&lt;treeTraitNormalDistributionLikelihood&gt; element](#codelttreetraitnormaldistributionlikelihoodgtcode-element)
- [&lt;twoPartDistribution&gt; element](#codelttwopartdistributiongtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;uniformPrior&gt; element](#codeltuniformpriorgtcode-element)
- [&lt;varianceStatistic&gt; element](#codeltvariancestatisticgtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)

### Logger

Elements of this type include:

- [&lt;completeHistoryLogger&gt; element](#codeltcompletehistoryloggergtcode-element)
- [&lt;log&gt; element](#codeltloggtcode-element)
- [&lt;logArg&gt; element](#codeltlogarggtcode-element)
- [&lt;logArgTree&gt; element](#codeltlogargtreegtcode-element)
- [&lt;logML&gt; element](#codeltlogmlgtcode-element)
- [&lt;logPartitionedTree&gt; element](#codeltlogpartitionedtreegtcode-element)
- [&lt;logTree&gt; element](#codeltlogtreegtcode-element)
- [&lt;randomLocalLogger&gt; element](#codeltrandomlocalloggergtcode-element)

### Long

Elements of this type include:


### MCLogger

Elements of this type include:

- [&lt;log&gt; element](#codeltloggtcode-element)
- [&lt;logArg&gt; element](#codeltlogarggtcode-element)
- [&lt;logArgTree&gt; element](#codeltlogargtreegtcode-element)
- [&lt;logML&gt; element](#codeltlogmlgtcode-element)
- [&lt;logPartitionedTree&gt; element](#codeltlogpartitionedtreegtcode-element)
- [&lt;logTree&gt; element](#codeltlogtreegtcode-element)
- [&lt;randomLocalLogger&gt; element](#codeltrandomlocalloggergtcode-element)

### MCMC

Elements of this type include:

- [&lt;marginalLikelihoodEstimator&gt; element](#codeltmarginallikelihoodestimatorgtcode-element)
- [&lt;mcmc&gt; element](#codeltmcmcgtcode-element)

### MCMCOperator

Elements of this type include:

- [ARGEventOperator](#argeventoperator)
- [FixedNodeheightSubtreePruneRegraft](#fixednodeheightsubtreepruneregraft)
- [GibbsIndependentCoalescentOperator](#gibbsindependentcoalescentoperator)
- [GibbsIndependentGammaOperator](#gibbsindependentgammaoperator)
- [GibbsIndependentNormalDistributionOperator](#gibbsindependentnormaldistributionoperator)
- [GibbsPruneAndRegraft](#gibbspruneandregraft)
- [GibbsSubtreeSwap](#gibbssubtreeswap)
- [HamiltonianMonteCarloOperator](#hamiltonianmontecarlooperator)
- [HierarchicalBitFlipOperator](#hierarchicalbitflipoperator)
- [ImportanceNarrowExchange](#importancenarrowexchange)
- [ImportancePruneAndRegraft](#importancepruneandregraft)
- [ImportanceSubtreeSwap](#importancesubtreeswap)
- [MsatFullAncestryImportanceSamplingOperator](#msatfullancestryimportancesamplingoperator)
- [MsatSingleAncestralStateGibbsOperator](#msatsingleancestralstategibbsoperator)
- [NearestNeighborInterchange](#nearestneighborinterchange)
- [&lt;adaptableVarianceMultivariateNormalOperator&gt; element](#codeltadaptablevariancemultivariatenormaloperatorgtcode-element)
- [&lt;addremoveARGEvent&gt; element](#codeltaddremoveargeventgtcode-element)
- [&lt;argNarrowExchange&gt; element](#codeltargnarrowexchangegtcode-element)
- [&lt;argPartitionOperator&gt; element](#codeltargpartitionoperatorgtcode-element)
- [&lt;argSubtreeSlide&gt; element](#codeltargsubtreeslidegtcode-element)
- [&lt;argSwapOperator&gt; element](#codeltargswapoperatorgtcode-element)
- [&lt;argWideExchange&gt; element](#codeltargwideexchangegtcode-element)
- [&lt;bitFlipInSubstitutionModelOperator&gt; element](#codeltbitflipinsubstitutionmodeloperatorgtcode-element)
- [&lt;bitFlipOperator&gt; element](#codeltbitflipoperatorgtcode-element)
- [&lt;bitMoveOperator&gt; element](#codeltbitmoveoperatorgtcode-element)
- [&lt;bitSwapOperator&gt; element](#codeltbitswapoperatorgtcode-element)
- [&lt;centeredScale&gt; element](#codeltcenteredscalegtcode-element)
- [&lt;changeNumHybridizations&gt; element](#codeltchangenumhybridizationsgtcode-element)
- [&lt;clusterSingleMoveOperator&gt; element](#codeltclustersinglemoveoperatorgtcode-element)
- [&lt;clusterSplitMergeOperator&gt; element](#codeltclustersplitmergeoperatorgtcode-element)
- [&lt;deltaExchange&gt; element](#codeltdeltaexchangegtcode-element)
- [&lt;deltaMixOperator&gt; element](#codeltdeltamixoperatorgtcode-element)
- [&lt;dirichletProcessOperator&gt; element](#codeltdirichletprocessoperatorgtcode-element)
- [&lt;dirtyLikelihood&gt; element](#codeltdirtylikelihoodgtcode-element)
- [&lt;discretizedLocationOperator&gt; element](#codeltdiscretizedlocationoperatorgtcode-element)
- [&lt;distanceDependentCRPGibbsOperator&gt; element](#codeltdistancedependentcrpgibbsoperatorgtcode-element)
- [&lt;ellipticalSliceSampler&gt; element](#codeltellipticalslicesamplergtcode-element)
- [&lt;empiricalTreeDistributionOperator&gt; element](#codeltempiricaltreedistributionoperatorgtcode-element)
- [&lt;fireParameterChanged&gt; element](#codeltfireparameterchangedgtcode-element)
- [&lt;gaussianProcessOperator&gt; element](#codeltgaussianprocessoperatorgtcode-element)
- [&lt;generalizedSkylineGibbsOperator&gt; element](#codeltgeneralizedskylinegibbsoperatorgtcode-element)
- [&lt;geoDistributionCollection&gt; element](#codeltgeodistributioncollectiongtcode-element)
- [&lt;gibbsSampleMissingTraitsOperator&gt; element](#codeltgibbssamplemissingtraitsoperatorgtcode-element)
- [&lt;gmrfBlockUpdateOperator&gt; element](#codeltgmrfblockupdateoperatorgtcode-element)
- [&lt;gmrfFixedEffectsGibbsOperator&gt; element](#codeltgmrffixedeffectsgibbsoperatorgtcode-element)
- [&lt;hybPopSizesScaleOperator&gt; element](#codelthybpopsizesscaleoperatorgtcode-element)
- [&lt;infectionBranchMovementOperator&gt; element](#codeltinfectionbranchmovementoperatorgtcode-element)
- [&lt;invariantOperator&gt; element](#codeltinvariantoperatorgtcode-element)
- [&lt;jitter&gt; element](#codeltjittergtcode-element)
- [&lt;jointOperator&gt; element](#codeltjointoperatorgtcode-element)
- [&lt;latentLiabilityGibbsOperator&gt; element](#codeltlatentliabilitygibbsoperatorgtcode-element)
- [&lt;logRandomWalkOperator&gt; element](#codeltlograndomwalkoperatorgtcode-element)
- [&lt;microsatUpDownOperator&gt; element](#codeltmicrosatupdownoperatorgtcode-element)
- [&lt;modeFindOperator&gt; element](#codeltmodefindoperatorgtcode-element)
- [&lt;modeIndependenceOperator&gt; element](#codeltmodeindependenceoperatorgtcode-element)
- [&lt;moveLegs&gt; element](#codeltmovelegsgtcode-element)
- [&lt;msatModelSelectOperator&gt; element](#codeltmsatmodelselectoperatorgtcode-element)
- [&lt;msatModelSwitchOperator&gt; element](#codeltmsatmodelswitchoperatorgtcode-element)
- [&lt;mulTreeNodeReHeight&gt; element](#codeltmultreenodereheightgtcode-element)
- [&lt;mulTreeSequenceReassignment&gt; element](#codeltmultreesequencereassignmentgtcode-element)
- [&lt;mvnOperator&gt; element](#codeltmvnoperatorgtcode-element)
- [&lt;mvouOperator&gt; element](#codeltmvouoperatorgtcode-element)
- [&lt;narrowExchange&gt; element](#codeltnarrowexchangegtcode-element)
- [&lt;networkNodeReHeight&gt; element](#codeltnetworknodereheightgtcode-element)
- [&lt;newARGEvent&gt; element](#codeltnewargeventgtcode-element)
- [&lt;nodeReHeight&gt; element](#codeltnodereheightgtcode-element)
- [&lt;normalGammaPrecisionGibbsOperator&gt; element](#codeltnormalgammaprecisiongibbsoperatorgtcode-element)
- [&lt;normalNormalMeanGibbsOperator&gt; element](#codeltnormalnormalmeangibbsoperatorgtcode-element)
- [&lt;oldLatentLiabilityGibbsOperator&gt; element](#codeltoldlatentliabilitygibbsoperatorgtcode-element)
- [&lt;poolSwapOperator&gt; element](#codeltpoolswapoperatorgtcode-element)
- [&lt;precisionGibbsOperator&gt; element](#codeltprecisiongibbsoperatorgtcode-element)
- [&lt;randomWalkIntegerNodeHeightWeightedOperator&gt; element](#codeltrandomwalkintegernodeheightweightedoperatorgtcode-element)
- [&lt;randomWalkIntegerOperator&gt; element](#codeltrandomwalkintegeroperatorgtcode-element)
- [&lt;randomWalkIntegerSetSizeWeightedOperator&gt; element](#codeltrandomwalkintegersetsizeweightedoperatorgtcode-element)
- [&lt;randomWalkOnMapOperator&gt; element](#codeltrandomwalkonmapoperatorgtcode-element)
- [&lt;randomWalkOperator&gt; element](#codeltrandomwalkoperatorgtcode-element)
- [&lt;rateBitExchangeOperator&gt; element](#codeltratebitexchangeoperatorgtcode-element)
- [&lt;rateExchange&gt; element](#codeltrateexchangegtcode-element)
- [&lt;rateSampleOperator&gt; element](#codeltratesampleoperatorgtcode-element)
- [&lt;rateScaleOperator&gt; element](#codeltratescaleoperatorgtcode-element)
- [&lt;rateVarianceScaleOperator&gt; element](#codeltratevariancescaleoperatorgtcode-element)
- [&lt;regressionGibbsEffectOperator&gt; element](#codeltregressiongibbseffectoperatorgtcode-element)
- [&lt;regressionGibbsPrecisionOperator&gt; element](#codeltregressiongibbsprecisionoperatorgtcode-element)
- [&lt;regressionMetropolizedIndicatorOperator&gt; element](#codeltregressionmetropolizedindicatoroperatorgtcode-element)
- [&lt;sampleNonActiveOperator&gt; element](#codeltsamplenonactiveoperatorgtcode-element)
- [&lt;scaleOperator&gt; element](#codeltscaleoperatorgtcode-element)
- [&lt;selectorOperator&gt; element](#codeltselectoroperatorgtcode-element)
- [&lt;sequenceReassignment&gt; element](#codeltsequencereassignmentgtcode-element)
- [&lt;setOperator&gt; element](#codeltsetoperatorgtcode-element)
- [&lt;slidingPatternsOperator&gt; element](#codeltslidingpatternsoperatorgtcode-element)
- [&lt;subtreeJump&gt; element](#codeltsubtreejumpgtcode-element)
- [&lt;subtreeLeap&gt; element](#codeltsubtreeleapgtcode-element)
- [&lt;subtreeSlide&gt; element](#codeltsubtreeslidegtcode-element)
- [&lt;swapOperator&gt; element](#codeltswapoperatorgtcode-element)
- [&lt;teamOperator&gt; element](#codeltteamoperatorgtcode-element)
- [&lt;tipStateSwapOperator&gt; element](#codelttipstateswapoperatorgtcode-element)
- [&lt;tipTraitSwapOperator&gt; element](#codelttiptraitswapoperatorgtcode-element)
- [&lt;traitGibbsOperator&gt; element](#codelttraitgibbsoperatorgtcode-element)
- [&lt;traitRateGibbsOperator&gt; element](#codelttraitrategibbsoperatorgtcode-element)
- [&lt;transmissionExchangeOperatorA&gt; element](#codelttransmissionexchangeoperatoragtcode-element)
- [&lt;transmissionExchangeOperatorB&gt; element](#codelttransmissionexchangeoperatorbgtcode-element)
- [&lt;transmissionSubtreeSlideA&gt; element](#codelttransmissionsubtreeslideagtcode-element)
- [&lt;transmissionSubtreeSlideB&gt; element](#codelttransmissionsubtreeslidebgtcode-element)
- [&lt;transmissionWilsonBaldingA&gt; element](#codelttransmissionwilsonbaldingagtcode-element)
- [&lt;transmissionWilsonBaldingB&gt; element](#codelttransmissionwilsonbaldingbgtcode-element)
- [&lt;treeBitMoveOperator&gt; element](#codelttreebitmoveoperatorgtcode-element)
- [&lt;treeBitRandomWalk&gt; element](#codelttreebitrandomwalkgtcode-element)
- [&lt;treeUniform&gt; element](#codelttreeuniformgtcode-element)
- [&lt;uniformGeoSpatialOperator&gt; element](#codeltuniformgeospatialoperatorgtcode-element)
- [&lt;uniformIntegerOperator&gt; element](#codeltuniformintegeroperatorgtcode-element)
- [&lt;uniformOperator&gt; element](#codeltuniformoperatorgtcode-element)
- [&lt;upDownOperator&gt; element](#codeltupdownoperatorgtcode-element)
- [&lt;wideExchange&gt; element](#codeltwideexchangegtcode-element)
- [&lt;wilsonBalding&gt; element](#codeltwilsonbaldinggtcode-element)

### MapDiffusionModel

Elements of this type include:


### MarkovJumpsBeagleTreeLikelihood

Elements of this type include:


### MarkovJumpsTraitProvider

Elements of this type include:


### MarkovModulatedSubstitutionModel

Elements of this type include:

- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)

### MatrixParameter

Elements of this type include:

- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)

### MatrixParameterInterface

Elements of this type include:

- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)

### Microsatellite

Elements of this type include:

- [&lt;microsatellite&gt; element](#codeltmicrosatellitegtcode-element)

### MicrosatelliteModel

Elements of this type include:


### MicrosatelliteSamplerTreeModel

Elements of this type include:

- [&lt;microsatelliteSamplerTreeModel&gt; element](#codeltmicrosatellitesamplertreemodelgtcode-element)

### Model

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [TN93Model](#tn93model)
- [&lt;alloppNetworkPriorModel&gt; element](#codeltalloppnetworkpriormodelgtcode-element)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;aminoAcidModel&gt; element](#codeltaminoacidmodelgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;betaSplittingModel&gt; element](#codeltbetasplittingmodelgtcode-element)
- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;binaryCovarionModel&gt; element](#codeltbinarycovarionmodelgtcode-element)
- [&lt;binarySubstitutionModel&gt; element](#codeltbinarysubstitutionmodelgtcode-element)
- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)
- [&lt;birthDeathEpidemiology&gt; element](#codeltbirthdeathepidemiologygtcode-element)
- [&lt;birthDeathModel&gt; element](#codeltbirthdeathmodelgtcode-element)
- [&lt;birthDeathSerialSampling&gt; element](#codeltbirthdeathserialsamplinggtcode-element)
- [&lt;branchSpecificSubstitutionModel&gt; element](#codeltbranchspecificsubstitutionmodelgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;cataclysm&gt; element](#codeltcataclysmgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;constExpConst&gt; element](#codeltconstexpconstgtcode-element)
- [&lt;constantExponential&gt; element](#codeltconstantexponentialgtcode-element)
- [&lt;constantLogistic&gt; element](#codeltconstantlogisticgtcode-element)
- [&lt;constantSize&gt; element](#codeltconstantsizegtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;emergingEpidemic&gt; element](#codeltemergingepidemicgtcode-element)
- [&lt;empiricalCodonModel&gt; element](#codeltempiricalcodonmodelgtcode-element)
- [&lt;empiricalPiecewise&gt; element](#codeltempiricalpiecewisegtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;expConstExp&gt; element](#codeltexpconstexpgtcode-element)
- [&lt;expansion&gt; element](#codeltexpansiongtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;exponentialExponential&gt; element](#codeltexponentialexponentialgtcode-element)
- [&lt;exponentialGrowth&gt; element](#codeltexponentialgrowthgtcode-element)
- [&lt;exponentialLogistic&gt; element](#codeltexponentiallogisticgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialSawtooth&gt; element](#codeltexponentialsawtoothgtcode-element)
- [&lt;externalInternalBranchModel&gt; element](#codeltexternalinternalbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;frequencyModel&gt; element](#codeltfrequencymodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;glmSubstitutionModelNew&gt; element](#codeltglmsubstitutionmodelnewgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;gtrModel&gt; element](#codeltgtrmodelgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;hkyModel&gt; element](#codelthkymodelgtcode-element)
- [&lt;hypermutantErrorModel&gt; element](#codelthypermutanterrormodelgtcode-element)
- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;integratedMixtureModel&gt; element](#codeltintegratedmixturemodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;lewisMk&gt; element](#codeltlewismkgtcode-element)
- [&lt;lineageSpecificBranchModel&gt; element](#codeltlineagespecificbranchmodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;logisticGrowth&gt; element](#codeltlogisticgrowthgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovModulatedYangCodonModel&gt; element](#codeltmarkovmodulatedyangcodonmodelgtcode-element)
- [&lt;microsatelliteSamplerTreeModel&gt; element](#codeltmicrosatellitesamplertreemodelgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;mixtureModel&gt; element](#codeltmixturemodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;mixtureModelLikelihood&gt; element](#codeltmixturemodellikelihoodgtcode-element)
- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multiEpochExponential&gt; element](#codeltmultiepochexponentialgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;museGautCodonModel&gt; element](#codeltmusegautcodonmodelgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;pcaCodonModel&gt; element](#codeltpcacodonmodelgtcode-element)
- [&lt;piecewisePopulation&gt; element](#codeltpiecewisepopulationgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;positiveDefiniteSubstitutionModel&gt; element](#codeltpositivedefinitesubstitutionmodelgtcode-element)
- [&lt;randomBranchModel&gt; element](#codeltrandombranchmodelgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;scaledPiecewisePopulation&gt; element](#codeltscaledpiecewisepopulationgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;sequenceErrorModel&gt; element](#codeltsequenceerrormodelgtcode-element)
- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;spatialKernelFunction&gt; element](#codeltspatialkernelfunctiongtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;species&gt; element](#codeltspeciesgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;transmissionHistory&gt; element](#codelttransmissionhistorygtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)
- [&lt;twoEpoch&gt; element](#codelttwoepochgtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)
- [&lt;wishartGammaDistributionModel&gt; element](#codeltwishartgammadistributionmodelgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)
- [&lt;yangCodonModel&gt; element](#codeltyangcodonmodelgtcode-element)
- [&lt;yuleModel&gt; element](#codeltyulemodelgtcode-element)

### MulSpeciesBindings

Elements of this type include:

- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)

### MulSpeciesTreeModel

Elements of this type include:

- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)

### MultiDimensionalScalingLikelihood

Elements of this type include:

- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)

### MultiDimensionalScalingMM

Elements of this type include:


### MultivariateDiffusionModel

Elements of this type include:

- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)

### MultivariateDistributionLikelihood

Elements of this type include:

- [&lt;coalescentHeightsReferencePrior&gt; element](#codeltcoalescentheightsreferencepriorgtcode-element)
- [&lt;dirichletPrior&gt; element](#codeltdirichletpriorgtcode-element)
- [&lt;flatGeoSpatialPrior&gt; element](#codeltflatgeospatialpriorgtcode-element)
- [&lt;multivariateDistributionLikelihood&gt; element](#codeltmultivariatedistributionlikelihoodgtcode-element)
- [&lt;multivariateGammaPrior&gt; element](#codeltmultivariategammapriorgtcode-element)
- [&lt;multivariateNormalPrior&gt; element](#codeltmultivariatenormalpriorgtcode-element)
- [&lt;treeTraitNormalDistributionLikelihood&gt; element](#codelttreetraitnormaldistributionlikelihoodgtcode-element)

### MultivariateTraitTree

Elements of this type include:

- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)

### MutationDeathType

Elements of this type include:

- [&lt;extendedDataType&gt; element](#codeltextendeddatatypegtcode-element)

### NormalDistributionModel

Elements of this type include:

- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)

### OldAbstractCoalescentLikelihood

Elements of this type include:

- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)

### OperatorSchedule

Elements of this type include:

- [&lt;operators&gt; element](#codeltoperatorsgtcode-element)

### OrderedLatentLiabilityLikelihood

Elements of this type include:

- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)

### Parameter

Elements of this type include:

- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)

### ParametricDistributionModel

Elements of this type include:

- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)

### ParametricMultivariateDistributionModel

Elements of this type include:

- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)
- [&lt;wishartGammaDistributionModel&gt; element](#codeltwishartgammadistributionmodelgtcode-element)

### PartitionedTreeModel

Elements of this type include:

- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)

### PathLikelihood

Elements of this type include:


### PatternList

Elements of this type include:

- [&lt;alignment&gt; element](#codeltalignmentgtcode-element)
- [&lt;ascertainedPatterns&gt; element](#codeltascertainedpatternsgtcode-element)
- [&lt;attributePatterns&gt; element](#codeltattributepatternsgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;constantPatterns&gt; element](#codeltconstantpatternsgtcode-element)
- [&lt;convert&gt; element](#codeltconvertgtcode-element)
- [&lt;hypermutantAlignment&gt; element](#codelthypermutantalignmentgtcode-element)
- [&lt;maskedPatterns&gt; element](#codeltmaskedpatternsgtcode-element)
- [&lt;mergePatterns&gt; element](#codeltmergepatternsgtcode-element)
- [&lt;microsatellitePattern&gt; element](#codeltmicrosatellitepatterngtcode-element)
- [&lt;microsatelliteSimulator&gt; element](#codeltmicrosatellitesimulatorgtcode-element)
- [&lt;patternSubSet&gt; element](#codeltpatternsubsetgtcode-element)
- [&lt;patterns&gt; element](#codeltpatternsgtcode-element)
- [&lt;sequenceSimulator&gt; element](#codeltsequencesimulatorgtcode-element)

### Patterns

Elements of this type include:

- [&lt;microsatellitePattern&gt; element](#codeltmicrosatellitepatterngtcode-element)
- [&lt;microsatelliteSimulator&gt; element](#codeltmicrosatellitesimulatorgtcode-element)

### Polygon2D

Elements of this type include:

- [&lt;circle&gt; element](#codeltcirclegtcode-element)
- [&lt;polygon&gt; element](#codeltpolygongtcode-element)

### ProductStatistic

Elements of this type include:

- [&lt;productStatistic&gt; element](#codeltproductstatisticgtcode-element)

### RandomGenerator

Elements of this type include:

- [&lt;compoundGaussianProcess&gt; element](#codeltcompoundgaussianprocessgtcode-element)
- [&lt;gaussianProcessFromTree&gt; element](#codeltgaussianprocessfromtreegtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)

### RandomLocalTreeVariable

Elements of this type include:

- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)

### RateEvolutionLikelihood

Elements of this type include:


### RestrictedPartials

Elements of this type include:


### SampledMultivariateTraitLikelihood

Elements of this type include:


### Scalable

Elements of this type include:

- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)

### Sequence

Elements of this type include:

- [&lt;sequence&gt; element](#codeltsequencegtcode-element)

### SimpleMCMCOperator

Elements of this type include:

- [ARGEventOperator](#argeventoperator)
- [FixedNodeheightSubtreePruneRegraft](#fixednodeheightsubtreepruneregraft)
- [HamiltonianMonteCarloOperator](#hamiltonianmontecarlooperator)
- [HierarchicalBitFlipOperator](#hierarchicalbitflipoperator)
- [ImportanceNarrowExchange](#importancenarrowexchange)
- [ImportancePruneAndRegraft](#importancepruneandregraft)
- [ImportanceSubtreeSwap](#importancesubtreeswap)
- [MsatFullAncestryImportanceSamplingOperator](#msatfullancestryimportancesamplingoperator)
- [MsatSingleAncestralStateGibbsOperator](#msatsingleancestralstategibbsoperator)
- [NearestNeighborInterchange](#nearestneighborinterchange)
- [&lt;addremoveARGEvent&gt; element](#codeltaddremoveargeventgtcode-element)
- [&lt;argNarrowExchange&gt; element](#codeltargnarrowexchangegtcode-element)
- [&lt;argPartitionOperator&gt; element](#codeltargpartitionoperatorgtcode-element)
- [&lt;argSubtreeSlide&gt; element](#codeltargsubtreeslidegtcode-element)
- [&lt;argSwapOperator&gt; element](#codeltargswapoperatorgtcode-element)
- [&lt;argWideExchange&gt; element](#codeltargwideexchangegtcode-element)
- [&lt;bitFlipOperator&gt; element](#codeltbitflipoperatorgtcode-element)
- [&lt;bitMoveOperator&gt; element](#codeltbitmoveoperatorgtcode-element)
- [&lt;bitSwapOperator&gt; element](#codeltbitswapoperatorgtcode-element)
- [&lt;centeredScale&gt; element](#codeltcenteredscalegtcode-element)
- [&lt;changeNumHybridizations&gt; element](#codeltchangenumhybridizationsgtcode-element)
- [&lt;clusterSingleMoveOperator&gt; element](#codeltclustersinglemoveoperatorgtcode-element)
- [&lt;clusterSplitMergeOperator&gt; element](#codeltclustersplitmergeoperatorgtcode-element)
- [&lt;dirichletProcessOperator&gt; element](#codeltdirichletprocessoperatorgtcode-element)
- [&lt;dirtyLikelihood&gt; element](#codeltdirtylikelihoodgtcode-element)
- [&lt;distanceDependentCRPGibbsOperator&gt; element](#codeltdistancedependentcrpgibbsoperatorgtcode-element)
- [&lt;empiricalTreeDistributionOperator&gt; element](#codeltempiricaltreedistributionoperatorgtcode-element)
- [&lt;fireParameterChanged&gt; element](#codeltfireparameterchangedgtcode-element)
- [&lt;generalizedSkylineGibbsOperator&gt; element](#codeltgeneralizedskylinegibbsoperatorgtcode-element)
- [&lt;geoDistributionCollection&gt; element](#codeltgeodistributioncollectiongtcode-element)
- [&lt;gibbsSampleMissingTraitsOperator&gt; element](#codeltgibbssamplemissingtraitsoperatorgtcode-element)
- [&lt;gmrfFixedEffectsGibbsOperator&gt; element](#codeltgmrffixedeffectsgibbsoperatorgtcode-element)
- [&lt;hybPopSizesScaleOperator&gt; element](#codelthybpopsizesscaleoperatorgtcode-element)
- [&lt;infectionBranchMovementOperator&gt; element](#codeltinfectionbranchmovementoperatorgtcode-element)
- [&lt;invariantOperator&gt; element](#codeltinvariantoperatorgtcode-element)
- [&lt;jointOperator&gt; element](#codeltjointoperatorgtcode-element)
- [&lt;logRandomWalkOperator&gt; element](#codeltlograndomwalkoperatorgtcode-element)
- [&lt;microsatUpDownOperator&gt; element](#codeltmicrosatupdownoperatorgtcode-element)
- [&lt;modeFindOperator&gt; element](#codeltmodefindoperatorgtcode-element)
- [&lt;moveLegs&gt; element](#codeltmovelegsgtcode-element)
- [&lt;mulTreeNodeReHeight&gt; element](#codeltmultreenodereheightgtcode-element)
- [&lt;mulTreeSequenceReassignment&gt; element](#codeltmultreesequencereassignmentgtcode-element)
- [&lt;mvouOperator&gt; element](#codeltmvouoperatorgtcode-element)
- [&lt;narrowExchange&gt; element](#codeltnarrowexchangegtcode-element)
- [&lt;networkNodeReHeight&gt; element](#codeltnetworknodereheightgtcode-element)
- [&lt;newARGEvent&gt; element](#codeltnewargeventgtcode-element)
- [&lt;nodeReHeight&gt; element](#codeltnodereheightgtcode-element)
- [&lt;poolSwapOperator&gt; element](#codeltpoolswapoperatorgtcode-element)
- [&lt;randomWalkIntegerNodeHeightWeightedOperator&gt; element](#codeltrandomwalkintegernodeheightweightedoperatorgtcode-element)
- [&lt;randomWalkIntegerOperator&gt; element](#codeltrandomwalkintegeroperatorgtcode-element)
- [&lt;randomWalkIntegerSetSizeWeightedOperator&gt; element](#codeltrandomwalkintegersetsizeweightedoperatorgtcode-element)
- [&lt;rateExchange&gt; element](#codeltrateexchangegtcode-element)
- [&lt;rateSampleOperator&gt; element](#codeltratesampleoperatorgtcode-element)
- [&lt;rateScaleOperator&gt; element](#codeltratescaleoperatorgtcode-element)
- [&lt;rateVarianceScaleOperator&gt; element](#codeltratevariancescaleoperatorgtcode-element)
- [&lt;sampleNonActiveOperator&gt; element](#codeltsamplenonactiveoperatorgtcode-element)
- [&lt;scaleOperator&gt; element](#codeltscaleoperatorgtcode-element)
- [&lt;selectorOperator&gt; element](#codeltselectoroperatorgtcode-element)
- [&lt;sequenceReassignment&gt; element](#codeltsequencereassignmentgtcode-element)
- [&lt;setOperator&gt; element](#codeltsetoperatorgtcode-element)
- [&lt;subtreeJump&gt; element](#codeltsubtreejumpgtcode-element)
- [&lt;subtreeLeap&gt; element](#codeltsubtreeleapgtcode-element)
- [&lt;subtreeSlide&gt; element](#codeltsubtreeslidegtcode-element)
- [&lt;swapOperator&gt; element](#codeltswapoperatorgtcode-element)
- [&lt;teamOperator&gt; element](#codeltteamoperatorgtcode-element)
- [&lt;tipStateSwapOperator&gt; element](#codelttipstateswapoperatorgtcode-element)
- [&lt;tipTraitSwapOperator&gt; element](#codelttiptraitswapoperatorgtcode-element)
- [&lt;transmissionExchangeOperatorA&gt; element](#codelttransmissionexchangeoperatoragtcode-element)
- [&lt;transmissionExchangeOperatorB&gt; element](#codelttransmissionexchangeoperatorbgtcode-element)
- [&lt;transmissionSubtreeSlideA&gt; element](#codelttransmissionsubtreeslideagtcode-element)
- [&lt;transmissionSubtreeSlideB&gt; element](#codelttransmissionsubtreeslidebgtcode-element)
- [&lt;transmissionWilsonBaldingA&gt; element](#codelttransmissionwilsonbaldingagtcode-element)
- [&lt;transmissionWilsonBaldingB&gt; element](#codelttransmissionwilsonbaldingbgtcode-element)
- [&lt;treeUniform&gt; element](#codelttreeuniformgtcode-element)
- [&lt;uniformGeoSpatialOperator&gt; element](#codeltuniformgeospatialoperatorgtcode-element)
- [&lt;uniformIntegerOperator&gt; element](#codeltuniformintegeroperatorgtcode-element)
- [&lt;uniformOperator&gt; element](#codeltuniformoperatorgtcode-element)
- [&lt;upDownOperator&gt; element](#codeltupdownoperatorgtcode-element)
- [&lt;wideExchange&gt; element](#codeltwideexchangegtcode-element)
- [&lt;wilsonBalding&gt; element](#codeltwilsonbaldinggtcode-element)

### SimpleNode

Elements of this type include:

- [&lt;node&gt; element](#codeltnodegtcode-element)

### SiteList

Elements of this type include:

- [&lt;alignment&gt; element](#codeltalignmentgtcode-element)
- [&lt;convert&gt; element](#codeltconvertgtcode-element)
- [&lt;hypermutantAlignment&gt; element](#codelthypermutantalignmentgtcode-element)
- [&lt;sequenceSimulator&gt; element](#codeltsequencesimulatorgtcode-element)

### SiteModel

Elements of this type include:


### SitePatterns

Elements of this type include:


### SiteRateModel

Elements of this type include:

- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)

### SpatialKernel

Elements of this type include:

- [&lt;spatialKernelFunction&gt; element](#codeltspatialkernelfunctiongtcode-element)

### SpeciationModel

Elements of this type include:

- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)
- [&lt;birthDeathEpidemiology&gt; element](#codeltbirthdeathepidemiologygtcode-element)
- [&lt;birthDeathModel&gt; element](#codeltbirthdeathmodelgtcode-element)
- [&lt;birthDeathSerialSampling&gt; element](#codeltbirthdeathserialsamplinggtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;yuleModel&gt; element](#codeltyulemodelgtcode-element)

### SpeciesBindings

Elements of this type include:

- [&lt;species&gt; element](#codeltspeciesgtcode-element)

### SpeciesBindings$SPinfo

Elements of this type include:

- [&lt;sp&gt; element](#codeltspgtcode-element)

### SpeciesTreeModel

Elements of this type include:

- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)

### Statistic

Elements of this type include:

- [RPNcalculator](#rpncalculator)
- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;alloppNumHybsStatistic&gt; element](#codeltalloppnumhybsstatisticgtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;argReassortmentNodeCount&gt; element](#codeltargreassortmentnodecountgtcode-element)
- [&lt;argTimingStatistic&gt; element](#codeltargtimingstatisticgtcode-element)
- [&lt;argTotalLengthStatistic&gt; element](#codeltargtotallengthstatisticgtcode-element)
- [&lt;argTreeCount&gt; element](#codeltargtreecountgtcode-element)
- [&lt;bdcNClustersStatistic&gt; element](#codeltbdcnclustersstatisticgtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;coalescentEventsStatistic&gt; element](#codeltcoalescenteventsstatisticgtcode-element)
- [&lt;coalescentIntervalStatistic&gt; element](#codeltcoalescentintervalstatisticgtcode-element)
- [&lt;compatibilityStatistic&gt; element](#codeltcompatibilitystatisticgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;continuousDiffusionStatistic&gt; element](#codeltcontinuousdiffusionstatisticgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;correlation&gt; element](#codeltcorrelationgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;differenceStatistic&gt; element](#codeltdifferencestatisticgtcode-element)
- [&lt;diffusionRateCovarianceStatistic&gt; element](#codeltdiffusionratecovariancestatisticgtcode-element)
- [&lt;driftedLocationsStatistic&gt; element](#codeltdriftedlocationsstatisticgtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;exponentialStatistic&gt; element](#codeltexponentialstatisticgtcode-element)
- [&lt;expressionStatistic&gt; element](#codeltexpressionstatisticgtcode-element)
- [&lt;externalLengthStatistic&gt; element](#codeltexternallengthstatisticgtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;generalizedSkylinePopSizeStatistic&gt; element](#codeltgeneralizedskylinepopsizestatisticgtcode-element)
- [&lt;gmrfHeightsStatistic&gt; element](#codeltgmrfheightsstatisticgtcode-element)
- [&lt;gmrfPopSizeStatistic&gt; element](#codeltgmrfpopsizestatisticgtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;lineageCountStatistic&gt; element](#codeltlineagecountstatisticgtcode-element)
- [&lt;logarithmStatistic&gt; element](#codeltlogarithmstatisticgtcode-element)
- [&lt;loggableStatistic&gt; element](#codeltloggablestatisticgtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;matrixInverse&gt; element](#codeltmatrixinversegtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;meanStatistic&gt; element](#codeltmeanstatisticgtcode-element)
- [&lt;monophylyStatistic&gt; element](#codeltmonophylystatisticgtcode-element)
- [&lt;monotonicStatistic&gt; element](#codeltmonotonicstatisticgtcode-element)
- [&lt;mrcaTraitStatistic&gt; element](#codeltmrcatraitstatisticgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;negativeStatistic&gt; element](#codeltnegativestatisticgtcode-element)
- [&lt;nodeHeightsStatistic&gt; element](#codeltnodeheightsstatisticgtcode-element)
- [&lt;notBooleanStatistic&gt; element](#codeltnotbooleanstatisticgtcode-element)
- [&lt;notStatistic&gt; element](#codeltnotstatisticgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;parsimonyStateStatistic&gt; element](#codeltparsimonystatestatisticgtcode-element)
- [&lt;parsimonyStatistic&gt; element](#codeltparsimonystatisticgtcode-element)
- [&lt;partitionStatistic&gt; element](#codeltpartitionstatisticgtcode-element)
- [&lt;popGraph&gt; element](#codeltpopgraphgtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;productStatistic&gt; element](#codeltproductstatisticgtcode-element)
- [&lt;rateCovarianceStatistic&gt; element](#codeltratecovariancestatisticgtcode-element)
- [&lt;rateStatistic&gt; element](#codeltratestatisticgtcode-element)
- [&lt;ratioStatistic&gt; element](#codeltratiostatisticgtcode-element)
- [&lt;reciprocalStatistic&gt; element](#codeltreciprocalstatisticgtcode-element)
- [&lt;speciesTreeStatistic&gt; element](#codeltspeciestreestatisticgtcode-element)
- [&lt;statistic&gt; element](#codeltstatisticgtcode-element)
- [&lt;subStatistic&gt; element](#codeltsubstatisticgtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;sumStatistic&gt; element](#codeltsumstatisticgtcode-element)
- [&lt;test&gt; element](#codelttestgtcode-element)
- [&lt;thresholdStatistic&gt; element](#codeltthresholdstatisticgtcode-element)
- [&lt;tmrcaStatistic&gt; element](#codelttmrcastatisticgtcode-element)
- [&lt;transmissionStatistic&gt; element](#codelttransmissionstatisticgtcode-element)
- [&lt;treeHeightStatistic&gt; element](#codelttreeheightstatisticgtcode-element)
- [&lt;treeLengthStatistic&gt; element](#codelttreelengthstatisticgtcode-element)
- [&lt;treeMetricStatistic&gt; element](#codelttreemetricstatisticgtcode-element)
- [&lt;treeShapeStatistics&gt; element](#codelttreeshapestatisticsgtcode-element)
- [&lt;varianceStatistic&gt; element](#codeltvariancestatisticgtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)

### StatisticList

Elements of this type include:

- [BrownianMotion](#brownianmotion)
- [NPAntigenicLikelihood](#npantigeniclikelihood)
- [Ornstein-Uhlenbeck](#ornstein-uhlenbeck)
- [TN93Model](#tn93model)
- [&lt;alloppNetworkPriorModel&gt; element](#codeltalloppnetworkpriormodelgtcode-element)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;alloppspecies&gt; element](#codeltalloppspeciesgtcode-element)
- [&lt;alsTreeLikelihood&gt; element](#codeltalstreelikelihoodgtcode-element)
- [&lt;aminoAcidModel&gt; element](#codeltaminoacidmodelgtcode-element)
- [&lt;antigenicDriftPrior&gt; element](#codeltantigenicdriftpriorgtcode-element)
- [&lt;antigenicLikelihood&gt; element](#codeltantigeniclikelihoodgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argCoalescentLikelihood&gt; element](#codeltargcoalescentlikelihoodgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;argRatePrior&gt; element](#codeltargratepriorgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;argUniformPrior&gt; element](#codeltarguniformpriorgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;beagleOperationReport&gt; element](#codeltbeagleoperationreportgtcode-element)
- [&lt;betaDistributionModel&gt; element](#codeltbetadistributionmodelgtcode-element)
- [&lt;betaSplittingModel&gt; element](#codeltbetasplittingmodelgtcode-element)
- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;binaryCovarionModel&gt; element](#codeltbinarycovarionmodelgtcode-element)
- [&lt;binarySubstitutionModel&gt; element](#codeltbinarysubstitutionmodelgtcode-element)
- [&lt;birthDeathCollapseModel&gt; element](#codeltbirthdeathcollapsemodelgtcode-element)
- [&lt;birthDeathEpidemiology&gt; element](#codeltbirthdeathepidemiologygtcode-element)
- [&lt;birthDeathModel&gt; element](#codeltbirthdeathmodelgtcode-element)
- [&lt;birthDeathSerialSampling&gt; element](#codeltbirthdeathserialsamplinggtcode-element)
- [&lt;branchSpecificSubstitutionModel&gt; element](#codeltbranchspecificsubstitutionmodelgtcode-element)
- [&lt;branchingLikelihood&gt; element](#codeltbranchinglikelihoodgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;caseToCaseTransmissionLikelihood&gt; element](#codeltcasetocasetransmissionlikelihoodgtcode-element)
- [&lt;cataclysm&gt; element](#codeltcataclysmgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;coalescentLikelihood&gt; element](#codeltcoalescentlikelihoodgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;constExpConst&gt; element](#codeltconstexpconstgtcode-element)
- [&lt;constantExponential&gt; element](#codeltconstantexponentialgtcode-element)
- [&lt;constantLogistic&gt; element](#codeltconstantlogisticgtcode-element)
- [&lt;constantSize&gt; element](#codeltconstantsizegtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;ctmcScalePrior&gt; element](#codeltctmcscalepriorgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;dummyModel&gt; element](#codeltdummymodelgtcode-element)
- [&lt;emergingEpidemic&gt; element](#codeltemergingepidemicgtcode-element)
- [&lt;empiricalCodonModel&gt; element](#codeltempiricalcodonmodelgtcode-element)
- [&lt;empiricalPiecewise&gt; element](#codeltempiricalpiecewisegtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;expConstExp&gt; element](#codeltexpconstexpgtcode-element)
- [&lt;expansion&gt; element](#codeltexpansiongtcode-element)
- [&lt;exponentialDistributionModel&gt; element](#codeltexponentialdistributionmodelgtcode-element)
- [&lt;exponentialExponential&gt; element](#codeltexponentialexponentialgtcode-element)
- [&lt;exponentialGrowth&gt; element](#codeltexponentialgrowthgtcode-element)
- [&lt;exponentialLogistic&gt; element](#codeltexponentiallogisticgtcode-element)
- [&lt;exponentialMarkovLikelihood&gt; element](#codeltexponentialmarkovlikelihoodgtcode-element)
- [&lt;exponentialSawtooth&gt; element](#codeltexponentialsawtoothgtcode-element)
- [&lt;externalInternalBranchModel&gt; element](#codeltexternalinternalbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;frequencyModel&gt; element](#codeltfrequencymodelgtcode-element)
- [&lt;gammaDistributionModel&gt; element](#codeltgammadistributionmodelgtcode-element)
- [&lt;generalizedSkyLineLikelihood&gt; element](#codeltgeneralizedskylinelikelihoodgtcode-element)
- [&lt;glmModelNew&gt; element](#codeltglmmodelnewgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;gmrfSkyrideLikelihood&gt; element](#codeltgmrfskyridelikelihoodgtcode-element)
- [&lt;gmrfTestLikelihood&gt; element](#codeltgmrftestlikelihoodgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;gtrModel&gt; element](#codeltgtrmodelgtcode-element)
- [&lt;hierarchicalPartitionLikelihood&gt; element](#codelthierarchicalpartitionlikelihoodgtcode-element)
- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;hkyModel&gt; element](#codelthkymodelgtcode-element)
- [&lt;hypermutantErrorModel&gt; element](#codelthypermutanterrormodelgtcode-element)
- [&lt;individualPrior&gt; element](#codeltindividualpriorgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;integratedFactorModel&gt; element](#codeltintegratedfactormodelgtcode-element)
- [&lt;intervalLatentLiabilityLikelihood&gt; element](#codeltintervallatentliabilitylikelihoodgtcode-element)
- [&lt;inverseGammaDistributionModel&gt; element](#codeltinversegammadistributionmodelgtcode-element)
- [&lt;inverseGaussianDistributionModel&gt; element](#codeltinversegaussiandistributionmodelgtcode-element)
- [&lt;knownVarianceNormalPeriodPriorDistribution&gt; element](#codeltknownvariancenormalperiodpriordistributiongtcode-element)
- [&lt;latentFactorModel&gt; element](#codeltlatentfactormodelgtcode-element)
- [&lt;latentLiabilityLikelihood&gt; element](#codeltlatentliabilitylikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;lewisMk&gt; element](#codeltlewismkgtcode-element)
- [&lt;lineageSpecificBranchModel&gt; element](#codeltlineagespecificbranchmodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logNormalDistributionModel&gt; element](#codeltlognormaldistributionmodelgtcode-element)
- [&lt;logisticGrowth&gt; element](#codeltlogisticgrowthgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovModulatedYangCodonModel&gt; element](#codeltmarkovmodulatedyangcodonmodelgtcode-element)
- [&lt;microsatelliteSamplerTreeModel&gt; element](#codeltmicrosatellitesamplertreemodelgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;mulSpecies&gt; element](#codeltmulspeciesgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;multiDimensionalScalingLikelihood&gt; element](#codeltmultidimensionalscalinglikelihoodgtcode-element)
- [&lt;multiEpochExponential&gt; element](#codeltmultiepochexponentialgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateNormalDistributionModel&gt; element](#codeltmultivariatenormaldistributionmodelgtcode-element)
- [&lt;multivariateOUModel&gt; element](#codeltmultivariateoumodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;museGautCodonModel&gt; element](#codeltmusegautcodonmodelgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;negativeBinomialDistributionModel&gt; element](#codeltnegativebinomialdistributionmodelgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;normalDistributionModel&gt; element](#codeltnormaldistributionmodelgtcode-element)
- [&lt;normalPeriodPriorDistribution&gt; element](#codeltnormalperiodpriordistributiongtcode-element)
- [&lt;oneOverStDevPeriodPriorDistribution&gt; element](#codeltoneoverstdevperiodpriordistributiongtcode-element)
- [&lt;onePGammaDistributionModel&gt; element](#codeltonepgammadistributionmodelgtcode-element)
- [&lt;orderedLatentLiabilityLikelihood&gt; element](#codeltorderedlatentliabilitylikelihoodgtcode-element)
- [&lt;ovariableSkyLineLikelihood&gt; element](#codeltovariableskylinelikelihoodgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;pcaCodonModel&gt; element](#codeltpcacodonmodelgtcode-element)
- [&lt;piecewisePopulation&gt; element](#codeltpiecewisepopulationgtcode-element)
- [&lt;poissonDistributionModel&gt; element](#codeltpoissondistributionmodelgtcode-element)
- [&lt;poissonPartitionLikelihood&gt; element](#codeltpoissonpartitionlikelihoodgtcode-element)
- [&lt;positiveDefiniteSubstitutionModel&gt; element](#codeltpositivedefinitesubstitutionmodelgtcode-element)
- [&lt;randomBranchModel&gt; element](#codeltrandombranchmodelgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;randomWalk&gt; element](#codeltrandomwalkgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledBetaDistributionModel&gt; element](#codeltscaledbetadistributionmodelgtcode-element)
- [&lt;scaledPiecewisePopulation&gt; element](#codeltscaledpiecewisepopulationgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;sequenceErrorModel&gt; element](#codeltsequenceerrormodelgtcode-element)
- [&lt;siteModel&gt; element](#codeltsitemodelgtcode-element)
- [&lt;skewNormalDistributionModel&gt; element](#codeltskewnormaldistributionmodelgtcode-element)
- [&lt;spatialKernelFunction&gt; element](#codeltspatialkernelfunctiongtcode-element)
- [&lt;speciationLikelihood&gt; element](#codeltspeciationlikelihoodgtcode-element)
- [&lt;species&gt; element](#codeltspeciesgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;transmissionHistory&gt; element](#codelttransmissionhistorygtcode-element)
- [&lt;transmissionLikelihood&gt; element](#codelttransmissionlikelihoodgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)
- [&lt;twoEpoch&gt; element](#codelttwoepochgtcode-element)
- [&lt;uniformDistributionModel&gt; element](#codeltuniformdistributionmodelgtcode-element)
- [&lt;uniformNodeHeightPrior&gt; element](#codeltuniformnodeheightpriorgtcode-element)
- [&lt;uniformPartitionLikelihood&gt; element](#codeltuniformpartitionlikelihoodgtcode-element)
- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)
- [&lt;wishartGammaDistributionModel&gt; element](#codeltwishartgammadistributionmodelgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)
- [&lt;yangCodonModel&gt; element](#codeltyangcodonmodelgtcode-element)
- [&lt;yuleModel&gt; element](#codeltyulemodelgtcode-element)

### String

Elements of this type include:

- [&lt;string&gt; element](#codeltstringgtcode-element)

### String;

Elements of this type include:


### SubstitutionModel

Elements of this type include:

- [TN93Model](#tn93model)
- [&lt;aminoAcidModel&gt; element](#codeltaminoacidmodelgtcode-element)
- [&lt;binaryCovarionModel&gt; element](#codeltbinarycovarionmodelgtcode-element)
- [&lt;binarySubstitutionModel&gt; element](#codeltbinarysubstitutionmodelgtcode-element)
- [&lt;complexSubstitutionModel&gt; element](#codeltcomplexsubstitutionmodelgtcode-element)
- [&lt;empiricalCodonModel&gt; element](#codeltempiricalcodonmodelgtcode-element)
- [&lt;glmSubstitutionModel&gt; element](#codeltglmsubstitutionmodelgtcode-element)
- [&lt;glmSubstitutionModelNew&gt; element](#codeltglmsubstitutionmodelnewgtcode-element)
- [&lt;gtrModel&gt; element](#codeltgtrmodelgtcode-element)
- [&lt;hkyModel&gt; element](#codelthkymodelgtcode-element)
- [&lt;lewisMk&gt; element](#codeltlewismkgtcode-element)
- [&lt;markovModulatedSubstitutionModel&gt; element](#codeltmarkovmodulatedsubstitutionmodelgtcode-element)
- [&lt;markovModulatedYangCodonModel&gt; element](#codeltmarkovmodulatedyangcodonmodelgtcode-element)
- [&lt;museGautCodonModel&gt; element](#codeltmusegautcodonmodelgtcode-element)
- [&lt;mutationDeathModel&gt; element](#codeltmutationdeathmodelgtcode-element)
- [&lt;pcaCodonModel&gt; element](#codeltpcacodonmodelgtcode-element)
- [&lt;yangCodonModel&gt; element](#codeltyangcodonmodelgtcode-element)

### TabularData

Elements of this type include:

- [VDAnalysis](#vdanalysis)
- [&lt;logFileTrace&gt; element](#codeltlogfiletracegtcode-element)

### Taxa

Elements of this type include:

- [&lt;taxa&gt; element](#codelttaxagtcode-element)

### Taxon

Elements of this type include:

- [&lt;apsp&gt; element](#codeltapspgtcode-element)
- [&lt;individual&gt; element](#codeltindividualgtcode-element)
- [&lt;sp&gt; element](#codeltspgtcode-element)
- [&lt;taxon&gt; element](#codelttaxongtcode-element)

### TaxonList

Elements of this type include:

- [&lt;alignment&gt; element](#codeltalignmentgtcode-element)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;ascertainedPatterns&gt; element](#codeltascertainedpatternsgtcode-element)
- [&lt;attributePatterns&gt; element](#codeltattributepatternsgtcode-element)
- [&lt;categoryOutbreak&gt; element](#codeltcategoryoutbreakgtcode-element)
- [&lt;constantPatterns&gt; element](#codeltconstantpatternsgtcode-element)
- [&lt;convert&gt; element](#codeltconvertgtcode-element)
- [&lt;distanceMatrix&gt; element](#codeltdistancematrixgtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;hypermutantAlignment&gt; element](#codelthypermutantalignmentgtcode-element)
- [&lt;maskedPatterns&gt; element](#codeltmaskedpatternsgtcode-element)
- [&lt;mergePatterns&gt; element](#codeltmergepatternsgtcode-element)
- [&lt;microsatellitePattern&gt; element](#codeltmicrosatellitepatterngtcode-element)
- [&lt;microsatelliteSimulator&gt; element](#codeltmicrosatellitesimulatorgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;neighborJoiningTree&gt; element](#codeltneighborjoiningtreegtcode-element)
- [&lt;newick&gt; element](#codeltnewickgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;patternSubSet&gt; element](#codeltpatternsubsetgtcode-element)
- [&lt;patterns&gt; element](#codeltpatternsgtcode-element)
- [&lt;rescaledTree&gt; element](#codeltrescaledtreegtcode-element)
- [&lt;sequenceSimulator&gt; element](#codeltsequencesimulatorgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;taxa&gt; element](#codelttaxagtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;tree&gt; element](#codelttreegtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;upgmaTree&gt; element](#codeltupgmatreegtcode-element)

### TipStatesModel

Elements of this type include:

- [&lt;hypermutantErrorModel&gt; element](#codelthypermutanterrormodelgtcode-element)
- [&lt;sequenceErrorModel&gt; element](#codeltsequenceerrormodelgtcode-element)

### Transform$MultivariableTransformWithParameter

Elements of this type include:

- [&lt;compoundTransform&gt; element](#codeltcompoundtransformgtcode-element)
- [&lt;orderedLatentLiabilityTransform&gt; element](#codeltorderedlatentliabilitytransformgtcode-element)

### Transform$ParsedTransform

Elements of this type include:

- [&lt;composedTransform&gt; element](#codeltcomposedtransformgtcode-element)
- [&lt;inverseTransform&gt; element](#codeltinversetransformgtcode-element)
- [&lt;transform&gt; element](#codelttransformgtcode-element)

### TransmissionDemographicModel

Elements of this type include:

- [&lt;hierarchicalTransmissionModel&gt; element](#codelthierarchicaltransmissionmodelgtcode-element)
- [&lt;transmissionModel&gt; element](#codelttransmissionmodelgtcode-element)

### TransmissionHistoryModel

Elements of this type include:

- [&lt;transmissionHistory&gt; element](#codelttransmissionhistorygtcode-element)

### Tree

Elements of this type include:

- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;argTreeModel&gt; element](#codeltargtreemodelgtcode-element)
- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;neighborJoiningTree&gt; element](#codeltneighborjoiningtreegtcode-element)
- [&lt;newick&gt; element](#codeltnewickgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;rescaledTree&gt; element](#codeltrescaledtreegtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;transformedTreeModel&gt; element](#codelttransformedtreemodelgtcode-element)
- [&lt;tree&gt; element](#codelttreegtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)
- [&lt;upgmaTree&gt; element](#codeltupgmatreegtcode-element)

### TreeAttributeProvider

Elements of this type include:

- [&lt;biasedMultivariateDiffusionModel&gt; element](#codeltbiasedmultivariatediffusionmodelgtcode-element)
- [&lt;bifractionalDiffusionModel&gt; element](#codeltbifractionaldiffusionmodelgtcode-element)
- [&lt;cartogramDiffusionModel&gt; element](#codeltcartogramdiffusionmodelgtcode-element)
- [&lt;greatCircleDiffusionModel&gt; element](#codeltgreatcirclediffusionmodelgtcode-element)
- [&lt;mixtureCartogramDiffusionModel&gt; element](#codeltmixturecartogramdiffusionmodelgtcode-element)
- [&lt;multivariateDiffusionModel&gt; element](#codeltmultivariatediffusionmodelgtcode-element)
- [&lt;multivariateTDiffusionModel&gt; element](#codeltmultivariatetdiffusionmodelgtcode-element)
- [&lt;vonMisesFisherDiffusionModel&gt; element](#codeltvonmisesfisherdiffusionmodelgtcode-element)

### TreeDataLikelihood

Elements of this type include:

- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)

### TreeLogger$LogUpon

Elements of this type include:

- [ImportanceNarrowExchange](#importancenarrowexchange)
- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)

### TreeModel

Elements of this type include:

- [&lt;empiricalTreeDistributionModel&gt; element](#codeltempiricaltreedistributionmodelgtcode-element)
- [&lt;partitionedTreeModel&gt; element](#codeltpartitionedtreemodelgtcode-element)
- [&lt;starTreeModel&gt; element](#codeltstartreemodelgtcode-element)
- [&lt;treeModel&gt; element](#codelttreemodelgtcode-element)

### TreeTraitNormalDistributionModel

Elements of this type include:

- [&lt;treeTraitNormalDistribution&gt; element](#codelttreetraitnormaldistributiongtcode-element)

### TreeTraitProvider

Elements of this type include:

- [&lt;alloppSpeciesNetwork&gt; element](#codeltalloppspeciesnetworkgtcode-element)
- [&lt;arbitraryBranchRates&gt; element](#codeltarbitrarybranchratesgtcode-element)
- [&lt;argDiscretizedBranchRates&gt; element](#codeltargdiscretizedbranchratesgtcode-element)
- [&lt;argLocalClock&gt; element](#codeltarglocalclockgtcode-element)
- [&lt;attributeBranchRateModel&gt; element](#codeltattributebranchratemodelgtcode-element)
- [&lt;branchSpecificTrait&gt; element](#codeltbranchspecifictraitgtcode-element)
- [&lt;codonPartitionedRobustCounting&gt; element](#codeltcodonpartitionedrobustcountinggtcode-element)
- [&lt;compoundBranchRateModel&gt; element](#codeltcompoundbranchratemodelgtcode-element)
- [&lt;continuousBranchRates&gt; element](#codeltcontinuousbranchratesgtcode-element)
- [&lt;continuousTraitRateModel&gt; element](#codeltcontinuoustraitratemodelgtcode-element)
- [&lt;countableMixtureBranchRates&gt; element](#codeltcountablemixturebranchratesgtcode-element)
- [&lt;discreteTraitRateModel&gt; element](#codeltdiscretetraitratemodelgtcode-element)
- [&lt;discretizedBranchRates&gt; element](#codeltdiscretizedbranchratesgtcode-element)
- [&lt;driftedTraits&gt; element](#codeltdriftedtraitsgtcode-element)
- [&lt;epochBranchModel&gt; element](#codeltepochbranchmodelgtcode-element)
- [&lt;fixedDriftModel&gt; element](#codeltfixeddriftmodelgtcode-element)
- [&lt;inhibitionLikelihood&gt; element](#codeltinhibitionlikelihoodgtcode-element)
- [&lt;latentStateBranchRateModel&gt; element](#codeltlatentstatebranchratemodelgtcode-element)
- [&lt;localClockModel&gt; element](#codeltlocalclockmodelgtcode-element)
- [&lt;logAllTraits&gt; element](#codeltlogalltraitsgtcode-element)
- [&lt;mixtureModelBranchRates&gt; element](#codeltmixturemodelbranchratesgtcode-element)
- [&lt;mulSpeciesTree&gt; element](#codeltmulspeciestreegtcode-element)
- [&lt;multivariateTraitLikelihood&gt; element](#codeltmultivariatetraitlikelihoodgtcode-element)
- [&lt;newTreeDataLikelihood&gt; element](#codeltnewtreedatalikelihoodgtcode-element)
- [&lt;randomLocalClockModel&gt; element](#codeltrandomlocalclockmodelgtcode-element)
- [&lt;randomLocalYuleModel&gt; element](#codeltrandomlocalyulemodelgtcode-element)
- [&lt;rateEpochBranchRates&gt; element](#codeltrateepochbranchratesgtcode-element)
- [&lt;relaxedDriftModel&gt; element](#codeltrelaxeddriftmodelgtcode-element)
- [&lt;scaledTreeLengthModel&gt; element](#codeltscaledtreelengthmodelgtcode-element)
- [&lt;speciesTree&gt; element](#codeltspeciestreegtcode-element)
- [&lt;splitTraitBySite&gt; element](#codeltsplittraitbysitegtcode-element)
- [&lt;strictClockBranchRates&gt; element](#codeltstrictclockbranchratesgtcode-element)
- [&lt;traitDataLikelihood&gt; element](#codelttraitdatalikelihoodgtcode-element)
- [&lt;withinCaseCoalescent&gt; element](#codeltwithincasecoalescentgtcode-element)

### ValuesPool

Elements of this type include:


### Variable

Elements of this type include:

- [&lt;adaptableSizeFastMatrixParameter&gt; element](#codeltadaptablesizefastmatrixparametergtcode-element)
- [&lt;approximateFactorAnalysisPrecision&gt; element](#codeltapproximatefactoranalysisprecisiongtcode-element)
- [&lt;blockUpperTriangularMatrixParameter&gt; element](#codeltblockuppertriangularmatrixparametergtcode-element)
- [&lt;buildCompoundSymmetricMatrix&gt; element](#codeltbuildcompoundsymmetricmatrixgtcode-element)
- [&lt;complementParameter&gt; element](#codeltcomplementparametergtcode-element)
- [&lt;compoundFastMatrixParameter&gt; element](#codeltcompoundfastmatrixparametergtcode-element)
- [&lt;compoundMatrixParameter&gt; element](#codeltcompoundmatrixparametergtcode-element)
- [&lt;compoundParameter&gt; element](#codeltcompoundparametergtcode-element)
- [&lt;compoundSymmetricMatrix&gt; element](#codeltcompoundsymmetricmatrixgtcode-element)
- [&lt;copyParameterValues&gt; element](#codeltcopyparametervaluesgtcode-element)
- [&lt;dataFromTreeTips&gt; element](#codeltdatafromtreetipsgtcode-element)
- [&lt;designMatrix&gt; element](#codeltdesignmatrixgtcode-element)
- [&lt;diagonalContrainedMatrixView&gt; element](#codeltdiagonalcontrainedmatrixviewgtcode-element)
- [&lt;diagonalMatrix&gt; element](#codeltdiagonalmatrixgtcode-element)
- [&lt;differenceMatrixParameter&gt; element](#codeltdifferencematrixparametergtcode-element)
- [&lt;differenceParameter&gt; element](#codeltdifferenceparametergtcode-element)
- [&lt;duplicatedParameter&gt; element](#codeltduplicatedparametergtcode-element)
- [&lt;elementWiseMatrixMultiplicationParameter&gt; element](#codeltelementwisematrixmultiplicationparametergtcode-element)
- [&lt;fastBlockUpperTriangularMatrixParameterParser&gt; element](#codeltfastblockuppertriangularmatrixparameterparsergtcode-element)
- [&lt;fastMatrixParameter&gt; element](#codeltfastmatrixparametergtcode-element)
- [&lt;hiddenClassRewardParameter&gt; element](#codelthiddenclassrewardparametergtcode-element)
- [&lt;immutableParameter&gt; element](#codeltimmutableparametergtcode-element)
- [&lt;integerParameter&gt; element](#codeltintegerparametergtcode-element)
- [&lt;jointParameter&gt; element](#codeltjointparametergtcode-element)
- [&lt;leafTraitParameter&gt; element](#codeltleaftraitparametergtcode-element)
- [&lt;markovRandomFieldMatrix&gt; element](#codeltmarkovrandomfieldmatrixgtcode-element)
- [&lt;maskedMatrixParameter&gt; element](#codeltmaskedmatrixparametergtcode-element)
- [&lt;maskedParameter&gt; element](#codeltmaskedparametergtcode-element)
- [&lt;matrixMatrixProduct&gt; element](#codeltmatrixmatrixproductgtcode-element)
- [&lt;matrixParameter&gt; element](#codeltmatrixparametergtcode-element)
- [&lt;matrixVectorProductParameter&gt; element](#codeltmatrixvectorproductparametergtcode-element)
- [&lt;mvPolyaLikelihood&gt; element](#codeltmvpolyalikelihoodgtcode-element)
- [&lt;originDestinationDesignMatrix&gt; element](#codeltorigindestinationdesignmatrixgtcode-element)
- [&lt;parameter&gt; element](#codeltparametergtcode-element)
- [&lt;productParameter&gt; element](#codeltproductparametergtcode-element)
- [&lt;sumParameter&gt; element](#codeltsumparametergtcode-element)
- [&lt;vectorSlice&gt; element](#codeltvectorslicegtcode-element)

### VariableDemographicModel

Elements of this type include:

- [&lt;variableDemographic&gt; element](#codeltvariabledemographicgtcode-element)


{% include links.html %}
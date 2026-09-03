---
title: Phylodynamic inference under the episodic birth-death-sampling model
keywords: phylodynamics, birth-death, EBDS, SARS-CoV-2, influenza, reproductive number, tutorial
last_updated: August 24, 2026
tags: [tutorial, workshop]
summary: "This tutorial describes how to specify an episodic birth-death-sampling (EBDS) tree prior in a BEAST XML file. The EBDS model treats sampling times as data and estimates piecewise-constant birth, death and sampling rates, from which the effective reproductive number is obtained directly as a function of time. BEAUti does not currently generate this tree prior, so the relevant XML elements are constructed by hand from a BEAUti-generated coalescent analysis. The first exercise applies the model to the SARS-CoV-2 alpha (B.1.1.7) data set of the <a href=\"workshop_respiratory_virus_phylodynamics\">respiratory virus phylodynamics tutorial</a> using three epochs; the second applies it to the influenza A/H3N2 data set of the same tutorial using seventy-two epochs, and illustrates how the epoch configuration and its priors are adapted to a longer time series."
sidebar: beast_sidebar
permalink: workshop_episodic_birth_death_sampling.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/workshop_episodic_birth_death_sampling/{% endcapture %}


## Introduction

Coalescent tree priors work backwards from the sample, describing its genealogy through a single quantity, the effective population size through time, and treating the sampling times as information external to the model. Birth-death-sampling priors instead describe the epidemic forwards in time, as a branching process with three kinds of event: transmission, removal and sampling. The phylogeny is a partial record of that process, its tips being sampled hosts and its internal nodes transmission events, with the unsampled remainder integrated out analytically.

The **episodic birth-death-sampling (EBDS)** model is the piecewise-constant member of this family (Stadler et al., 2013): the time axis is divided into contiguous intervals, or *epochs*, and each rate takes a separate value in each epoch. The EBDS model relates to the constant-rate birth-death process as the Skygrid model does to the constant-size coalescent, letting the data determine how the dynamics change over the course of predefined intervals, rather than imposing a shape such as exponential growth in advance.

### The model

The process begins at the origin, at which a single lineage is infectious, and runs forwards to the present. While infectious, each lineage independently transmits at rate λ, producing a second infectious lineage; becomes uninfectious without being observed at rate μ; and is sampled at rate ψ, upon which it is removed from the infectious population with probability r, the treatment probability, and remains infectious otherwise. At each epoch boundary, every lineage still infectious may in addition be sampled with probability ρ, representing a cross-sectional survey rather than continuous surveillance.

The observed phylogeny is the tree connecting the sampled lineages; its likelihood is available in closed form and can be evaluated in time linear in both the number of sequences and the number of epochs.

Two consequences matter in practice. The sampling times enter the likelihood directly rather than only calibrating the tree, so the distribution of tips through time carries information about the rate at which lineages leave the infectious population. And the epidemiological quantities of interest are functions of the three rates, so they are estimated within the chain rather than derived afterwards. BEAST parameterizes them as

$$ R_0 = \frac{\lambda}{\mu + \psi}, \qquad D = \mu + \psi, \qquad S = \frac{\psi}{\mu + \psi}, $$

representing the reproductive number, the total removal rate and the proportion of removals that are sampled; either triple may serve as the primary parameterization. The exercises below sample λ, μ and ψ, and log the first of these quantities epoch by epoch as the effective reproductive number.

Each epoch carries its own λ, μ and ψ, and these are strongly correlated, so the parameter space is high-dimensional and poorly conditioned. BEAST supplies analytic gradients of the tree likelihood with respect to the rate parameters and uses them to drive a Hamiltonian Monte Carlo (HMC) transition kernel, which is what makes joint estimation tractable (Shao et al., 2024).

{% include callout.html type="primary" content="If you use the <code>episodicBirthDeathSamplingModel</code> element, please cite Shao et al. (2024) for the gradients and the HMC sampler, and Magee et al. (2020) for the Markov random field prior and the empirical Bayes prior construction described below." %}

To undertake this tutorial you will need the following software:

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include note.html content='This tutorial assumes that the <a href="workshop_respiratory_virus_phylodynamics">Phylodynamic inference of respiratory viruses</a> tutorial has been completed. Both exercises reuse its data sets and its BEAUti settings, and the exercises here present replacements for the coalescent tree priors used in the previous tutorial.' %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The completed XML files and the log files of long runs for both exercises <a href="{{ root_url }}files/EBDS_tutorial.zip">can be downloaded here</a>.
</div>

## EXERCISE 1: The effective reproductive number of SARS-CoV-2 alpha through time

### Generating the base XML

The first exercise uses the SARS-CoV-2 alpha (B.1.1.7) data set of the [respiratory virus tutorial](workshop_respiratory_virus_phylodynamics), a set of 976 genomes sampled in England during the emergence of the lineage (Hill et al., 2022).

Load [`b.1.1.7.fasta`]({{ site.tutorials_root_url }}/workshop_respiratory_virus_phylodynamics/files/b.1.1.7.fasta) into BEAUti and configure the `Tips`, `Sites`, `Clocks` and `MCMC` panels exactly as described there. The tree prior selected in the `Trees` panel is immaterial, since it will be replaced; leaving it at `Coalescent: Exponential Growth` means that the elements to be deleted are the ones listed below. Set the `File name stem:` to <samp>B.1.1.7_EBDS</samp> and generate the XML.

{% include callout.html type="warning" content="Parsing the tip dates is not optional under this model. Under a coalescent tree prior, unparsed dates produce a poorly calibrated but internally consistent analysis. Under EBDS the sampling times are part of the likelihood, and collapsing all tips to the present removes the information that identifies the sampling rate. Verify the <code>Date</code> column in the <code>Tips</code> panel before generating the XML.<br /><br />" %}

### Removing the coalescent tree prior and adjusting the starting tree

We need to replace the coalescent prior by the EBDS prior.
We could consider deleting or commenting out the exponentialGrowth model, 

```xml
<exponentialGrowth id="exponential" units="years"> 
    ... 
</exponentialGrowth>
```

but this model is still used to generate a starting tree, so we will keep it just for this. 
Concerning the starting tree, we note that the tree likelihood is invalid whenever the origin of the birth-death process (`ebds.origin`) is younger than the root height. Proposals that violate the constraint are rejected, but the initial state must nonetheless be valid. To have the chain begin from a valid initial state, the randomly generated starting tree must be constrained by enforcing a `height` that is smaller than initial `ebds.origin` of 0.5 (which is specified in `episodicBirthDeathSamplingModel` in the next section):

```xml
<coalescentSimulator id="startingTree" height="0.3">
    <taxa idref="taxa"/>
    <exponentialGrowth idref="exponential"/>
</coalescentSimulator>
```

An invalid initial likelihood on startup usually indicates either that this constraint is missing or that the tip dates were not parsed.

In case you selected to log the doubling time and R0 when constructing the exponential growth xml, delete or comment out these elements as they are not useful anymore:

```xml
<doublingTime id="doublingTime" timeUnits="days"> 
    ... 
</doublingTime>
```

```xml
<R0 id="R0">
    ... 
</R0>
```

Delete or comment out the coalescent likelihood associated with the coalescent tree prior:

```xml
<coalescentLikelihood id="coalescent"> 
    ... 
</coalescentLikelihood>
```

Next, delete the two operators acting on `exponential.popSize` and `exponential.growthRate` (likely a `scaleOperator` and a `randomWalkOperator`, respectively), the two priors for `exponential.popSize` and `exponential.growthRate` (likely a `gammaPrior` and the `laplacePrior`, respectively) and the `<coalescentLikelihood idref="coalescent"/>` entries within the `<prior>` element, and any corresponding `parameter` entries in `<log id="fileLog">` and `<log id="screenLog">`, including for `doublingTime` and `R0` if those are present.

All remaining elements generated by BEAUti are unaffected.

### The tree prior

The tree prior consists of two elements. The first specifies the model (`episodicBirthDeathSamplingModel`) and is preceded by parameter specifications for the model:

```xml
<compoundParameter id="birthRate.increments">
    <parameter id="birthRateAtPresent" value="-2.0"/>
    <parameter id="birthRateDelta" dimension="2" value="0.01"/>
</compoundParameter>

<transformedVectorSumTransform id="ebds.birthRate" incrementTransformType="log">
    <compoundParameter idref="birthRate.increments"/>
</transformedVectorSumTransform>

<compoundParameter id="deathRate.increments">
    <parameter id="deathRateAtPresent" value="-2.0"/>
    <parameter id="deathRateDelta" dimension="2" value="0"/>
</compoundParameter>

<transformedVectorSumTransform id="ebds.deathRate" incrementTransformType="log">
    <compoundParameter idref="deathRate.increments"/>
</transformedVectorSumTransform>

<compoundParameter id="samplingRate.increments">
    <parameter id="samplingRateAtPresent" value="-2.0"/>
    <parameter id="samplingRateDelta" dimension="2" value="0.01"/>
</compoundParameter>

<transformedVectorSumTransform id="ebds.samplingRate" incrementTransformType="log">
    <compoundParameter idref="samplingRate.increments"/>
</transformedVectorSumTransform>

<episodicBirthDeathSamplingModel id="ebds" units="years" conditionOnSurvival="false">
    <birthRate>
        <parameter idref="ebds.birthRate"/>
    </birthRate>
    <deathRate gradientFlag="false">
        <parameter idref="ebds.deathRate"/>
    </deathRate>
    <samplingRate>
        <parameter idref="ebds.samplingRate"/>
    </samplingRate>
    <samplingProbability gradientFlag="false">
        <compoundParameter id="ebds.samplingProbability">
            <parameter id="samplingAtPresent" value="0" dimension="1" lower="0.0" upper="1.0"/>
            <parameter id="otherSampling"    value="0" dimension="2" lower="0.0" upper="1.0"/>
        </compoundParameter>
    </samplingProbability>
    <treatmentProbability gradientFlag="false">
        <parameter id="ebds.treatmentProbability" value="1.0" dimension="3"
                   lower="0.0" upper="1.0"/>
    </treatmentProbability>
    <origin>
        <parameter id="ebds.origin" value="0.5" lower="0.0"/>
    </origin>
    <cutOff>
        <parameter value="0.35"/>
    </cutOff>
    <numGridPoints>
        <parameter value="3"/>
    </numGridPoints>
</episodicBirthDeathSamplingModel>
```
These xml elements can be put after the `coalescentSimulator`.
The second computes the likelihood of the tree under it, replacing the deleted `coalescentLikelihood`:

```xml
<birthDeathLikelihood id="birthDeathLikelihood" useNewLoop="true">
    <model>
        <episodicBirthDeathSamplingModel idref="ebds"/>
    </model>
    <tree>
        <treeModel idref="treeModel"/>
    </tree>
</birthDeathLikelihood>
```

`useNewLoop` should be set to `true`, here and on the gradient elements below: it selects the tree traversal that supports the analytic gradients, and it defaults to `false`.

The `birthRate`, `deathRate` and `samplingRate` elements hold λ, μ and ψ, and are the rate vectors constructed in the next section. The model may equivalently be driven by the compound parameterization, in which case `R0`, `D` and `S` are supplied in their place. Each of these parameters must have dimension either 1 or *N*, the number of epochs.

The `samplingProbability` and `treatmentProbability` elements hold ρ and *r* and are always required. Both exercises analyze genomes collected continuously through time (rather than having large sampling events at epoch boundaries), which are described entirely by ψ, so ρ = 0 in every epoch; and both set *r* = 1, meaning that sampling always removes an individual from the infectious population, so that no sampled tip may be the direct ancestor of another. Values of *r* below 1 admit **sampled ancestors** (Gavryushkina et al., 2014). Having ρ = 0 and *r* = 1 is typically a reasonable assumption and also helps with identifiability. Here *N* = 3, so both vectors have three elements; the sampling probability is assembled from a `compoundParameter` only so that its present-day element can be given its own identifier.

The remaining elements describe the timeline. `origin` is the time at which the process starts and must exceed the root height. `numGridPoints` gives the number of epochs *N*, which defaults to 1, and `cutOff` sets their spacing as described below; alternatively a `grids` element may supply the boundaries explicitly. Finally, setting `conditionOnSurvival` to `true` conditions the likelihood on the process having yielded at least one sample.

#### The epoch grid

Times are measured backwards from the most recent sample, in the units of the clock. Given *N* epochs and a cut-off *C*, the epoch boundaries are placed at 0, *C*/*N*, 2*C*/*N*, … , (*N*−1)*C*/*N*, and the final epoch extends from (*N*−1)*C*/*N* back to infinity. Two points here are easily overlooked: *C* itself is never a boundary, and the last epoch is not bounded by the cut-off, so the extent of the process is set by the origin alone.

With *N* = 3 and *C* = 0.35 the boundaries fall at 0.1167 and 0.2333 years before the most recent sample, which was collected on 31 December 2020. The three epochs therefore cover 18 November to 31 December 2020, 7 October to 18 November 2020, and everything from the origin up to 7 October 2020. Roughly six weeks of the epidemic is resolved by each of the two younger epochs, with the third absorbing the remainder.

{% include callout.html type="warning" content="Epoch 1 is the <b>most recent</b> epoch. Every rate vector, and every logged column, is indexed in this order.<br /><br />" %}

Boundaries may alternatively be given explicitly, which is useful when they should fall on dated events, such as the introduction of a control measure, rather than on a regular grid. The following places them at 0.08 and 0.15 years before the most recent sample, giving a short middle epoch bracketed by a recent and an older one:

```xml
<grids>
    <parameter value="0.0 0.08 0.15"/>
</grids>
```

The vector gives the start of each epoch measured backwards from the present, so its first element is 0 and its length must equal `numGridPoints`, which is still required. When a `grids` element is present the `cutOff` value is ignored.

#### Gradient flags

The `gradientFlag` attribute controls whether gradients are computed with respect to a given parameter. Setting it to `false` omits that parameter from the gradient evaluation and makes it unavailable to the HMC operator, so that it requires a conventional operator instead. Here gradients are computed for the birth and sampling rates only.

The death rate is deliberately excluded, and its increments are fixed at zero in the following section, so that μ is constant across epochs with only its level estimated. The reason is identifiability. Louca et al. (2021) prove that the likelihood of a timetree under a birth-death-sampling model depends on λ, μ and ψ only through two derived functions of them, so infinitely many distinct rate trajectories are statistically indistinguishable however large the data set. Stadler et al. (2013) state that with three rates in each of the *N* epochs the parameters cannot all be estimated freely, and at least one must be constrained if the credible intervals are to be confined.

Holding μ constant is also the natural epidemiological choice, since the duration of infectiousness reflects the pathogen and the isolation practices surrounding it and varies far less over a few months than transmission or surveillance effort. Where that fails, across a change in isolation policy for instance, the increments can be freed and given a prior of their own.

### Parameterizing the rates

According to the parameter specifications before the `episodicBirthDeathSamplingModel`, each rate vector is parameterized as a value in the most recent epoch followed by increments on the log scale:

```xml
<compoundParameter id="birthRate.increments">
    <parameter id="birthRateAtPresent" value="-2.0"/>
    <parameter id="birthRateDelta" dimension="2" value="0.01"/>
</compoundParameter>

<transformedVectorSumTransform id="ebds.birthRate" incrementTransformType="log">
    <compoundParameter idref="birthRate.increments"/>
</transformedVectorSumTransform>
```

with equivalent pairs of elements for `deathRate.increments` / `ebds.deathRate` and `samplingRate.increments` / `ebds.samplingRate`. The `transformedVectorSumTransform` element forms the running sum of the vector it is given and then exponentiates it. Writing θ for `birthRateAtPresent` and δ<sub>1</sub>, … , δ<sub>*N*−1</sub> for the elements of `birthRateDelta`, the birth rate in epoch *k* is therefore

$$ \lambda_k = \exp\left(\theta + \sum_{j<k} \delta_j\right), \qquad k = 1, \ldots, N. $$

θ is the log birth rate in the most recent epoch, and δ<sub>*j*</sub> = log λ<sub>*j*+1</sub> − log λ<sub>*j*</sub> is the log-fold change between epoch *j* and the epoch preceding it in time. The order of the children of the `compoundParameter` matters, since it is the first element that is treated as the anchor (*e.g.*, `birthRateAtPresent`). `ebds.birthRate` is the resulting rate vector on its natural scale, and is the quantity referenced by the model and written to the log.

This parameterization places a rate on the positive half-line (*i.e.*, is always positive) for any value of the parameters, and it lets the smoothing prior act on the changes between epochs rather than on the rates themselves. It is also the scale on which the sampler works: the gradient with respect to the rates is converted by the chain rule into a gradient with respect to θ and the increments, which are the quantities the HMC operator updates.

### Setting up the priors

A tree alone identifies the three rates only weakly, and it is their combinations rather than their individual values that the data constrain, so the priors on λ, μ and ψ do a substantial amount of work. Each of the three anchor parameters, the log-rate in the most recent epoch, receives a normal prior, which is equivalent to a lognormal prior on the rate itself. Following Magee et al. (2020), these are constructed by an empirical Bayes recipe of three steps: derive a point estimate of the rate from a quantity that is known or can be guessed before the analysis, take its logarithm as the prior mean, and set the standard deviation from the width of the interval one is willing to entertain around it. A standard deviation of log(10)/(2 × 1.96) ≈ 0.587405 gives a 95% prior interval spanning one order of magnitude, and twice that value, 1.17481, spans two orders of magnitude.

The **birth rate** is anchored on the size of the tree. Under a pure birth process started from the two lineages present at the root, the expected number of lineages after time *t* is 2e<sup>λ*t*</sup>; equating this to the observed number of tips *n* and solving for the rate gives [log(*n* + 2) − log 2] / *t*, the offset in *n* being a small-sample correction. Preliminary estimates of *t* = 0.331 years and *n* = 976 tips give 18.7 yr<sup>-1</sup>, so the prior on the log birth rate is centered on log(18.7) and is therefore Normal(2.928936, 1.17481). Because the derivation ignores death and sampling altogether, it is a crude estimate, which is why the interval is deliberately allowed to span two orders of magnitude.

The **death rate** is anchored on the infectious period, of which it is the reciprocal. Rather than a single guess, a plausible range of durations is treated as a 95% interval: the prior mean is the average of the two implied log-rates and the standard deviation is their difference divided by 2 × 1.96. Taking 10 to 16 days, that is 22.8 to 36.5 yr<sup>-1</sup>, gives Normal(3.362995, 0.1198989). This prior is far tighter than the other two, by design: it is the assumption that fixes the removal timescale.

The **sampling rate** is anchored on the sampling proportion. Inverting *s* = ψ / (μ + ψ) gives ψ = μ*s* / (1 − *s*), so a guess at the fraction of infections that were sequenced translates into a rate. Taking *s* = 0.0015 with the death rate (note that this is the exponentiated average of the two log-rates, exp([log(22.8) + log(36.5)]/2) ≈ 28.8 yr<sup>-1</sup>, rather than the arithmetic average of the two absolute rates) above gives ψ = 28.8 × 0.0015 / (1 − 0.0015) ≈ 0.043 yr<sup>-1</sup> and a prior of Normal(−3.137794, 0.587405), spanning one order of magnitude.

Each prior is declared as a `distributionLikelihood`, which is the form required by the gradient elements that follow:

```xml
<distributionLikelihood id="birthRateAtPresentPrior">
    <data>
        <parameter idref="birthRateAtPresent"/>
    </data>
    <distribution>
        <normalDistributionModel id="birthRateAtPresentPriorDistribution">
            <mean>  <parameter value="2.928936"/> </mean>
            <stdev> <parameter value="1.17481" lower="0.0"/> </stdev>
        </normalDistributionModel>
    </distribution>
</distributionLikelihood>
```

with `deathRateAtPresentPrior` and `samplingRateAtPresentPrior` following the same pattern and taking the values derived above:

```xml
<distributionLikelihood id="deathRateAtPresentPrior">
    <data>
        <parameter idref="deathRateAtPresent"/>
    </data>
	<distribution>
		<normalDistributionModel id="deathRateAtPresentPriorDistribution">
			<mean>
				<parameter value="3.362995"/>
			</mean>
			<stdev>
				<parameter value="0.1198989" lower="0.0"/>
			</stdev>
		</normalDistributionModel>
	</distribution>
</distributionLikelihood>
```

```xml
<distributionLikelihood id="samplingRateAtPresentPrior">
	<data>
		<parameter idref="samplingRateAtPresent"/>
	</data>
	<distribution>
		<normalDistributionModel id="samplingRateAtPresentPriorDistribution">
			<mean>
				<parameter value="-3.137794"/>
			</mean>
			<stdev>
				<parameter value="0.587405" lower="0.0"/>
			</stdev>
		</normalDistributionModel>
	</distribution>
</distributionLikelihood>
```

These three `distributionLikelihood` blocks can be put after the `birthDeathLikelihood`.
Next, paste the following prior specifications after the `distributionLikelihood` blocks:

```xml
<bayesianBridge id="birthRateDeltaPrior">
    <parameter idref="birthRateDelta"/>
    <globalScale>
        <parameter id="birthRateDeltaPrior.globalScale" value="0.1" lower="0.0"/>
    </globalScale>
    <localScale>
        <parameter id="birthRateDeltaPrior.localScale" value="1" dimension="2"/>
    </localScale>
    <exponent>
        <parameter value="2.0"/>
    </exponent>
</bayesianBridge>

<gammaPrior id="birthRateDeltaGlobalScalePrior" shape="1" scale="1">
    <parameter idref="birthRateDeltaPrior.globalScale"/>
</gammaPrior>

<bayesianBridge id="samplingRateDeltaPrior">
    <parameter idref="samplingRateDelta"/>
    <globalScale>
        <parameter id="samplingRateDeltaPrior.globalScale" value="0.1" lower="0.0"/>
    </globalScale>
    <localScale>
        <parameter id="samplingRateDeltaPrior.localScale" value="1" dimension="2"/>
    </localScale>
    <exponent>
        <parameter value="2.0"/>
    </exponent>
</bayesianBridge>

<gammaPrior id="samplingRateDeltaGlobalScalePrior" shape="1" scale="1">
    <parameter idref="samplingRateDeltaPrior.globalScale"/>
</gammaPrior>
```
According to these specifications, the increments receive a Bayesian bridge prior (Nishimura and Suchard, 2023) with exponent 2, which is equivalent to a Gaussian Markov random field on the log-rates, together with a `Gamma(1,1)` prior on its global scale.
An equivalent pair is specified for `samplingRateDelta`. The global scale governs the magnitude of change permitted between adjacent epochs and is estimated. Reducing the exponent below 2 yields heavier-tailed shrinkage, which admits occasional abrupt shifts against an otherwise flat trajectory. No bridge is applied to `deathRateDelta`, whose elements remain at their initial value of zero.
We note that these Bayesian bridge priors are already specified here because they are incorporated in the gradient specifications (next section), which in turn are used in the HMC operator (also next section). 

### Gradients and operators

Next, paste the following `compoundGradient` elements after the previous prior additions:

```xml
<compoundGradient id="grad.ebds.prior">
    <gradient>
        <multivariateDistributionLikelihood idref="birthRateAtPresentPrior"/>
        <parameter idref="birthRateAtPresent"/>
    </gradient>
    <bayesianBridge idref="birthRateDeltaPrior"/>
    <gradient>
        <multivariateDistributionLikelihood idref="samplingRateAtPresentPrior"/>
        <parameter idref="samplingRateAtPresent"/>
    </gradient>
    <bayesianBridge idref="samplingRateDeltaPrior"/>
</compoundGradient>

<compoundGradient id="grad.ebdsIncrements.likelihood">
    <gradientWrtIncrements1D id="grad.birthRateIncrements" incrementTransformType="log">
        <birthDeathLikelihoodGradient wrtParameter="birthRate" useNewLoop="true">
            <birthDeathLikelihood idref="birthDeathLikelihood"/>
            <treeModel idref="treeModel"/>
        </birthDeathLikelihoodGradient>
        <compoundParameter idref="birthRate.increments"/>
    </gradientWrtIncrements1D>
    <gradientWrtIncrements1D id="grad.samplingRateIncrements" incrementTransformType="log">
        <birthDeathLikelihoodGradient wrtParameter="samplingRate" useNewLoop="true">
            <birthDeathLikelihood idref="birthDeathLikelihood"/>
            <treeModel idref="treeModel"/>
        </birthDeathLikelihoodGradient>
        <compoundParameter idref="samplingRate.increments"/>
    </gradientWrtIncrements1D>
</compoundGradient>
```

Two `compoundGradient` elements assemble the gradient of the log posterior with respect to the increment parameters, the first from the priors and the second from the tree likelihood.

`birthDeathLikelihoodGradient` differentiates the tree likelihood with respect to the rate named in `wrtParameter`, and `gradientWrtIncrements1D` applies the chain rule to convert that gradient to the increment scale. Each `incrementTransformType` must match the corresponding `transformedVectorSumTransform`.

In the operator block, add the following HMC operator:

```xml
<hamiltonianMonteCarloOperator weight="1" nSteps="15" stepSize="0.01" mode="vanilla"
                               drawVariance="1.0" autoOptimize="true"
                               targetAcceptanceProbability="0.7"
                               preconditioningUpdateFrequency="3" preconditioningDelay="0">
    <jointGradient>
        <compoundGradient idref="grad.ebds.prior"/>
        <compoundGradient idref="grad.ebdsIncrements.likelihood"/>
    </jointGradient>
    <preconditioner>
        <compoundPriorPreconditioner id="priorPreconditioner">
            <normalDistributionModel     idref="birthRateAtPresentPriorDistribution"/>
            <bayesianBridgeDistribution  idref="birthRateDeltaPrior"/>
            <normalDistributionModel     idref="samplingRateAtPresentPriorDistribution"/>
            <bayesianBridgeDistribution  idref="samplingRateDeltaPrior"/>
        </compoundPriorPreconditioner>
    </preconditioner>
</hamiltonianMonteCarloOperator>
```

The operator concatenates the gradients into a single parameter vector, so the two `compoundGradient` elements and the components of the preconditioner must all be listed in the same order. The preconditioner rescales the parameters by their prior variances, so that a common step size is appropriate across parameters that differ substantially in scale.

Also add the following conventional operators for parameters excluded from HMC:

```xml
<randomWalkOperator windowSize="1.0" weight="1.0">
    <parameter idref="deathRateAtPresent"/>
</randomWalkOperator>
<randomWalkOperator windowSize="1.0" weight="1.0">
    <parameter idref="ebds.origin"/>
</randomWalkOperator>
<randomWalkOperator windowSize="1.0" weight="1.0">
    <parameter idref="birthRateDeltaPrior.globalScale"/>
</randomWalkOperator>
<randomWalkOperator windowSize="1.0" weight="1.0">
    <parameter idref="samplingRateDeltaPrior.globalScale"/>
</randomWalkOperator>
```

### Assembling the prior element

The following entries need to be added to the `<prior>` element:

```xml
<distributionLikelihood idref="birthRateAtPresentPrior"/>
<bayesianBridge          idref="birthRateDeltaPrior"/>
<distributionLikelihood idref="samplingRateAtPresentPrior"/>
<bayesianBridge          idref="samplingRateDeltaPrior"/>
<distributionLikelihood idref="deathRateAtPresentPrior"/>
<normalPrior mean="0.3" stdev="0.1">
    <parameter idref="ebds.origin"/>
</normalPrior>
<gammaPrior idref="birthRateDeltaGlobalScalePrior"/>
<gammaPrior idref="samplingRateDeltaGlobalScalePrior"/>
<birthDeathLikelihood idref="birthDeathLikelihood"/>
```

Except for the normal prior, these have already been defined so we are referring to their specification.
The origin (`ebds.origin`) receives a weakly informative normal prior.


### Logging

Add the following elements to `<log id="fileLog">`: 

```xml
<parameter idref="ebds.birthRate"/>
<parameter idref="ebds.deathRate"/>
<parameter idref="ebds.samplingRate"/>
<parameter idref="ebds.origin"/>
<parameter idref="birthRateDeltaPrior.globalScale"/>
<parameter idref="samplingRateDeltaPrior.globalScale"/>
<birthDeathCompoundParameterLogger id="effectiveReproductiveNumber" compoundParameterType = "effectiveReproductiveNumber">
	<episodicBirthDeathSamplingModel idref="ebds"/>
</birthDeathCompoundParameterLogger>
<birthDeathLikelihood idref="birthDeathLikelihood"/>
```

The rate vectors rather than the increments are the quantities useful to summarize.  The effective reproductive number is computed from the sampled rates by a dedicated logger, which requires no prior or operator of its own.

Finally, delete or comment out the reference to the `coalescentLikelihood` in file log:
```xml
<coalescentLikelihood idref="coalescent"/>
```

A version of the xml in which the necessary elements have been commented out and all the new ones added can be found [here]({{ root_url }}files/b.1.1.7.xml), which can be useful for checking.

### Running BEAST

{% include icon-callout.html file='icons/beast-icon.png' content='Run <a href="beast">BEAST</a> on the edited XML file.' %}

As with the coalescent analysis, a converged run requires far longer than a practical session allows; the log file of a run of 100 million states, sampled every 1000, is provided as <samp>B.1.1.7_EBDS.log</samp> and can be loaded into Tracer.

{% include question.html content='<br>
Questions<br>
1. How is the birth rate changing over time? Why do you think that happened? <br>
2. How does the posterior death rate compare to the prior death rate? <br>
3. How does the effective reproductive number relate to the birth rate? <br> 
4. How do you interpret the origin value compared to the age(root) value? <br>
5. If you look at the previous <a href="workshop_respiratory_virus_phylodynamics">tutorial on respiratory viruses</a>, how do the effective reproductive numbers compare? What about the clock rate? What do you think is causing these differences?'%}


## EXERCISE 2: Influenza A/H3N2 in New York State

The second exercise applies the same tree prior to the 165 haemagglutinin sequences of `NewYork.HA.2000-2003.nex` (Rambaut et al., 2008), spanning three northern hemisphere epidemic seasons. It is presented as an alternative to the Bayesian SkyGrid tree prior of the second exercise of the [respiratory virus tutorial](workshop_respiratory_virus_phylodynamics).

Configure BEAUti as described there, including gamma-distributed rate variation among sites, and generate the XML with any coalescent tree prior. Remove that tree prior as in Exercise 1, and insert the same elements with the modifications below.

### Matching the epoch grid to the SkyGrid

The SkyGrid analysis uses 72 intervals over the 6 years preceding the most recent sample of 2003.98, that is, 12 intervals per year. Specifying the same grid for the EBDS model makes the two reconstructions directly comparable:

```xml
<origin>
    <parameter id="ebds.origin" value="6.5" lower="0.0"/>
</origin>
<cutOff>
    <parameter value="6"/>
</cutOff>
<numGridPoints>
    <parameter value="72"/>
</numGridPoints>
```

Every parameter of dimension *N* must be resized accordingly: the increment vectors to 71, the local scale parameters of the bridge priors to 71, and the sampling and treatment probability vectors to 72.

```xml
<compoundParameter id="birthRate.increments">
    <parameter id="birthRateAtPresent" value="-2.0"/>
    <parameter id="birthRateDelta" dimension="71" value="0.01"/>
</compoundParameter>
```

```xml
<treatmentProbability gradientFlag="false">
    <parameter id="ebds.treatmentProbability" value="1.0" dimension="72"
               lower="0.0" upper="1.0"/>
</treatmentProbability>
```

Nothing else about the model, the gradients or the operators changes. The same two `compoundGradient` elements and the same HMC operator sample 144 birth and sampling parameters here, as against 6 in Exercise 1.

### Priors

The three anchor priors follow the same construction, recomputed for this data set. A preliminary root age of *t* = 6.28 years with *n* = 165 tips gives a birth rate of 0.705 yr<sup>-1</sup> and a prior of Normal(−0.3501344, 0.587405) on its logarithm. An assumed infectious duration of 1 to 11 days, that is 33.2 to 365.3 yr<sup>-1</sup>, gives Normal(4.701634, 0.611708) on the log death rate; note that this range is far wider in relative terms than the SARS-CoV-2 one, reflecting genuinely greater uncertainty. Retaining *s* = 0.0015 then gives a sampling rate of 0.165 yr<sup>-1</sup> and Normal(−1.799155, 0.587405) on its logarithm.

The origin prior is rescaled to the longer timescale, and the starting tree height must again be set below the initial origin:

```xml
<normalPrior mean="6.5" stdev="1">
    <parameter idref="ebds.origin"/>
</normalPrior>
```

The chain length should be increased substantially; the reference run used 700 million states and is provided as <samp>all_h3n2_hmc_1.log</samp>.

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The completed influenza XML and the log file of a long run are included in the <a href="{{ root_url }}files/EBDS_tutorial.zip">archive for this tutorial</a>.</div>

{% include question.html content='<br>
Questions<br>
1. How do the birth rate and sampling rate trajectories compare? <br> 
2. How does the trajectory of the effective reproductive number compare to that of the effective population size from the H3N2 Bayesian SkyGrid reconstruction in the <a href="workshop_respiratory_virus_phylodynamics">tutorial on respiratory viruses</a>?'%}


## References

- Gavryushkina A, Welch D, Stadler T, Drummond AJ (2014) Bayesian inference of sampled ancestor trees for epidemiology and fossil calibration. PLoS Computational Biology 10(12): e1003919. https://doi.org/10.1371/journal.pcbi.1003919
- Hill V, Du Plessis L, Peacock TP, et al. (2022) The origins and molecular evolution of SARS-CoV-2 lineage B.1.1.7 in the UK. Virus Evolution 8(2): veac080. https://doi.org/10.1093/ve/veac080
- Louca S, McLaughlin A, MacPherson A, Joy JB, Pennell MW (2021) Fundamental identifiability limits in molecular epidemiology. Molecular Biology and Evolution 38(9): 4010-4024. https://doi.org/10.1093/molbev/msab149
- Magee AF, Höhna S, Vasylyeva TI, Leaché AD, Minin VN (2020) Locally adaptive Bayesian birth-death model successfully detects slow and rapid rate shifts. PLoS Computational Biology 16(10): e1007999. https://doi.org/10.1371/journal.pcbi.1007999
- Nishimura A, Suchard MA (2023) Shrinkage with shrunken shoulders: Gibbs sampling shrinkage model posteriors with guaranteed convergence rates. Bayesian Analysis 18(2): 367-390. https://doi.org/10.1214/22-BA1308
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature 453: 615-619. https://doi.org/10.1038/nature06945
- Shao Y, Magee AF, Vasylyeva TI, Suchard MA (2024) Scalable gradients enable Hamiltonian Monte Carlo sampling for phylodynamic inference under episodic birth-death-sampling models. PLoS Computational Biology 20(3): e1011640. https://doi.org/10.1371/journal.pcbi.1011640
- Stadler T, Kühnert D, Bonhoeffer S, Drummond AJ (2013) Birth-death skyline plot reveals temporal changes of epidemic spread in HIV and hepatitis C virus (HCV). PNAS 110(1): 228-233. https://doi.org/10.1073/pnas.1207965110

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

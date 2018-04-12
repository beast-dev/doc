---
title: Identifying convergence problems using Tracer
keywords: tracer, tutorial
last_updated: April 12, 2018
tags: [how-to]
summary: "Convergence diagnostics using Tracer"
sidebar: beast_sidebar
permalink: tracer_convergence.html
folder: beast
---

## Identifying convergence problems using Tracer

In a [previous tutorial](analysing_beast_output), analysing the output of a standard BEAST analysis using Tracer 1.7 was discussed.
Here, this tutorial is extended towards analysing multiple independent runs, using different starting seeds (which leads to different random draws for all parameters involved to act as the initial estimates), in Tracer 1.7.

AWTY (Nylander et al., 2007) and its R counterpart RWTY (Warren et al., 2017) provide visual aids to diagnose phylogenetic MCMC convergence, focusing on convergence of the tree topology by comparing different replicates of an analysis.
As such, these tools are considered to be complementary to Tracer's functionality.

Note also that various tree metrics are available through BEAST, in a stand-alone program called TopologyTracer, which takes a .trees file and computes tree metrics for each tree.
TopologyTracer will generate an output .log file, which can then be loaded into Tracer 1.7.


### Data set information

Here, we take a look at an analysis of a (n unpublished) simulated data set based on an empirical hepatitis C virus (HCV) data set, which comprises 378 taxa sampled between 1965 and July 2012.
The original data set was analysed using a Bayesian skygrid coalescent model (Gill et al., 2013) and unlinked general time-reversible substitution models with among-site rate heterogeneity and relative rates across the three codon positions.
A tree from the posterior distribution was selected to serve as the reference tree for the simulation process using πBUSS (Bielejec et al., 2014).
The same substitution model setup was used for the simulation process, but relative rates across codon positions were set to 1.
The Bayesian skyline model (Drummond et al., 2005) serves as the coalescent model of choice to perform Bayesian inference on the simulated data set.

Two independent BEAST analyses (i.e. with different starting seeds) were performed on the simulated data set, each comprising 90 million iterations.


### Loading output files into Tracer

We start by loading the output .log files of both replicates of the same BEAST XML into Tracer 1.7.
To load the BEAST log file(s), select the Open option from the File menu or drag and drop the log file into the Tracer window.





Comparison of marginal distributions and/or traces from multiple replicate chains can assist in diagnosing problems with phylogenetic MCMC analyses, given that well-behaved replicate chains will lead to similar posterior distributions.



{% include image.html file="convergence_1.png" prefix="/tutorials/howtos/" %}<br />





### Citing Tracer

The recommended citation for this program is:

Rambaut A, Drummond AJ, Xie D, Baele G and Suchard MA (2018) Tracer v1.7, Available from [http://beast.community/tracer](http://beast.community/tracer)


## References

Nylander, J. A. A., Wilgenbusch, J. C., Warren D. L., Swofford, D. L. (2007) AWTY (Are We There Yet?): a system for graphical exploration of MCMC convergence in Bayesian phylogenetics. Bioinformatics 24(4):581-583.

Warren, D. L, Geneva, A. J., Lanfear, R. (2017) RWTY (R We There Yet): an R package for examining convergence of Bayesian phylogenetic analyses. Mol. Biol. Evol. 34(4):1016-1020.

Gill, M. S., Lemey, P., Faria, N. R., Rambaut, A., Shapiro, B., & Suchard, M. A. (2012). Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Molecular biology and evolution, 30(3), 713-724.

Bielejec, F., Lemey, P., Carvalho, L. M., Baele, G., Rambaut, A., Suchard, M. A. (2014) πBUSS: a parallel BEAST/BEAGLE utility for sequence simulation under complex evolutionary scenarios. BMC Bioinformatics 15:133.

Drummond, A., Rambaut, A., Shapiro, B., Pybus, O. (2005) Bayesian coalescent inference of past population dynamics from molecular sequences. Mol. Biol. Evol. 22:1185-1192.

{% include links.html %}
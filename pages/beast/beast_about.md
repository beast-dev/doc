---
title: About BEAST
keywords: beast, authors, developers
last_updated: July 4, 2017
tags: [getting-started]
summary: BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees.
sidebar: beast_sidebar
permalink: about.html
toc: true
folder: beast
---


[Details about the individual programs that make up the BEAST package can be found here.](programs)

## What does BEAST do?
This is a list of some of the models and features in BEAST:

: **Time-scaled phylogenies** \| While BEAST focuses on estimating rooted and time-measured phylogenies, it can analyse both contemporaneous (isochronous) and non-contemporaneous (heterochronous) sequences.

: **Tip-dated analyses** \| For non-contemporaneous sequences, when the differences in the dates associated with the sequences comprise a significant proportion of the age of the entire tree, these dates can be incorporated into the model providing a source of information about the rate of substitution.

: **Relaxed molecular clocks** \| Constant (strict), variable rate (relaxed) and local (allowing different clades in the tree to have different rates) molecular clock models.

: **Wide range of substitution models** \| Available substitution models include JC, HKY, TN93 and GTR for nucleotides, Blosum62, CPREV, JTT, MTREV, WAG, LG and Dayhoff for amino acids and the models of Goldman and Yang (1994) and Muse and Gaut (1994) for codons.

: **Substitution model heterogeneity across sites** \| Different substitution models can be specified for different sets of sites. For example, each codon position can be allowed a different substitution matrix and gamma model of rate heterogeneity.

: **Flexible model specification** \| The model-specification file format allows considerable flexibility. 
For example, it is possible to specify that each codon position has a different rate, a different degree of rate heterogeneity but the same transition/transversion ratio.

: **Flexible choice of priors on parameters** \| Any estimable parameter can be given a prior probability distribution from a wide range of options. Priors can also be used to introduce information --- i.e., a known distribution for a substitution rate.

: **Coalescent models of population size and growth** \| Various parametric models of coalescent population growth can be used including constant population size, expansion growth, exponential growth, and logistic growth. Additionally, multi-epoch parametric coalescent models are also available: constant-logistic, constant-exponential-constant, exponential-constant, etc.
                  
    A range of implementations of multi-change-point, non-parametric coalescent models are available such as the Bayesian skyline, skyride, and skygrid (the latter, with or without covariates).

    These models basically act as priors on the ages of nodes in the tree but their parameters can be sampled and estimated.

: **Multi-locus coalescent models** \| Two or more unlinked genes can be given the same coalescent population model but a different substitution process and tree, allowing the production of multi-locus coalescent inference.

: **Phylogeographic models** \| .

: **Discrete and continuous traits and the comparative method** \| .

: **Hierarchical models** \| .

: **Bayesian model selection and testing** \| .


## Acknowledgements

### Developers

BEAST was designed and developed by Alexei J. Drummond, Andrew Rambaut and Marc A. Suchard:
: **Alexei J. Drummond** \| Department of Computer Science \| University of Auckland <br />
[http://compevol.auckland.ac.nz](http://compevol.auckland.ac.nz) <br />
alexei--at-cs.auckland.ac.nz
                              
: **Andrew Rambaut** \| Institute of Evolutionary Biology \| University of Edinburgh <br />
[http://tree.bio.ed.ac.uk](http://tree.bio.ed.ac.uk) <br />
a.rambaut---at---ed.ac.uk
                              
: **Marc A. Suchard** \| David Geffen School of Medicine \| University of California, Los Angeles <br />
[http://faculty.biomath.ucla.edu/msuchard/](http://faculty.biomath.ucla.edu/msuchard/) (Warning: 1990's style)<br />
msuchard--@--ucla.edu                              

BEAST and modules within it have developed by

: Alex Alekseyenko, Daniel Ayres, Guy Baele, Trevor Bedford, Filip Bielejec, Erik Bloomquist, Aaron Darling, Matthew Hall, Joseph Heled, Sebastian Hoehna, Philippe Lemey, Wai Lok Sibon Li, Sidney Markowitz, Vladimir Minin, Michael Defoin Platel, Walter Xie

As an Open Source project, BEAST has benefited from contributions and assistance from a large number of people over the years. In particular we would like to thank:

: Peter Beerli, Gytis Dudas, Roald Forsberg, Jess Hedge, Simon Ho, Mark Holder, Denise Kuehnert, Paul Lewis, Gerton Lunter, Sam Lycett, Oliver Pybus, Tulio de Oliveira, Jayna Ragwani, Beth Shapiro, Korbinian Strimmer, David Swofford, Ziheng Yang

### Funding

BEAST has been supported at various times by:

<div class="bs-callout bs-callout-primary">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
<a class="noCrossRef" href="http://erc.europa.eu">
<img src="images/logos/erc-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;" />
<img src="images/logos/eu-flag.png" style="max-height: 64px; margin: 0px 10px 0px 10px;"/>
</a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">The European Research Council</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">"Phylo" to Philippe Lemey, Marc Suchard and Andrew Rambaut</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">"ReservoirDOCs" to Philippe Lemey, Marc Suchard and Andrew Rambaut</div>
        </div>
    </div>
</div>
</div>

<div class="bs-callout bs-callout-default">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
 <a class="noCrossRef" href="http://nih.gov">
 <img src="images/logos/nih-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;"/>
 </a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">The National Institutes of Health</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">XXX and XXX to Marc Suchard</div>
        </div>
    </div>
</div>
</div>

<div class="bs-callout bs-callout-danger">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
<a class="noCrossRef" href="http://wellcome.ac.uk">
<img src="images/logos/wellcome-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;"/>
</a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">The Wellcome Trust</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">"XXXX" to Andrew Rambaut</div>
        </div>
    </div>
</div>
</div>

<div class="bs-callout bs-callout-primary">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
<a class="noCrossRef" href="http://bbsrc.ac.uk">
<img src="images/logos/bbsrc-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;"/>
</a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">BBSRC</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">"XXXX" to Andrew Rambaut</div>
        </div>
    </div>
</div>
</div>

<div class="bs-callout bs-callout-danger">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
<a class="noCrossRef" href="http://royalsociety.org">
<img src="images/logos/roysoc-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;" />
</a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">The Royal Society of London</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">University Research Fellowship to Andrew Rambaut</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">Newton Fellowship to Trevor Bedford</div>
        </div>
    </div>
</div>
</div>

<div class="bs-callout bs-callout-warning">
<div style="width: 100%; display: table;">
    <div style="display: table-row">
        <div style="width: 30%; display: table-cell; text-align: right">
<a class="noCrossRef" href="http://royalsociety.org.nz/what-we-do/funds-and-opportunities/marsden/">
<img src="images/logos/marsden-logo.png" style="max-height: 64px; margin: 0px 10px 0px 10px;" />
</a>
        </div>
        <div style="width: 70%; display: table-cell; vertical-align: top;">
<div style="font-size: 150%; padding-top: 40px; margin-top: -45px">The Marsden Fund</div>
<div style="font-size: 80%; font-weight: normal; font-style: italic;">Grant to Alexei Drummond & Marc Suchard</div>
        </div>
    </div>
</div>
</div>

### The BEAST logo

{% include image.html file="beast-medium.png" width="320px" url="http://beast-dev.github.io/doc" alt="logo" caption="The BEAST logo is from a plate in Ernst Haeckel's Kunstformen der Natur (Artforms of nature) (1904)." %}

{% include links.html %}

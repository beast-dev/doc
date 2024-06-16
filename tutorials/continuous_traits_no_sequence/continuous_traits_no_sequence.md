---
title: Analysing Continuous Traits without Sequence Data
keywords: beast, tutorial, continuous, traits
last_updated: May 17, 2024
tags: [tutorial]
summary: "How to estimate the coevolutionary patterns of morphological traits."
sidebar: beast_sidebar
permalink: continuous_traits_no_sequence.html
folder: beast
redirect_from: "/continuous-traits-no-sequence"
---

## Loading the trait data

Starting with BEAST X, it is possible to import trait data directly without any sequence data.
To start, select the `Create partition from trait...` at the bottom of the panel.


{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image1.png" %}



Next import the trait data from the file examples/continuousTraits/mammals.txt.
This is a tab-delimited text file with the first column having taxon names (to match those in the sequence data) and each subsequent column having trait values.
The first row contains the names of the traits (the first column of the first row is ignored and can be empty).
Missing values can be coded as "NA" or "?".



<!-- 

The data is as shown here:

{% include table.html content="
|  | wingL | tarsusL | culmenL | beakD | gonysW|
|--:|:--|
| Geospiza magnirostris | 4.4042 | 3.03895 | 2.724667 | 2.823767 | 2.675983 |
| Geospiza conirostris | 4.349867 | 2.9842 | 2.6544 | 2.5138 | 2.360167 |
| Geospiza difficilis | 4.224067 | 2.898917 | 2.277183 | 2.0111 | 1.929983 |
| Geospiza scandens | 4.261222 | 2.929033 | 2.621789 | 2.1447 | 2.036944 |
| Geospiza fortis | 4.244008 | 2.894717 | 2.407025 | 2.362658 | 2.221867 |
| Geospiza fuliginosa | 4.132957 | 2.806514 | 2.094971 | 1.941157 | 1.845379 |
| Cactospiza pallida | 4.265425 | 3.08945 | 2.43025 | 2.01635 | 1.949125 |
| Certhidea olivacea | 3.975393 | 2.936536 | 2.051843 | 1.191264 | 1.401186 |
| Camarhynchus parvulus | 4.1316 | 2.97306 | 1.97442 | 1.87354 | 1.81334 |
| Camarhynchus pauper | 4.2325 | 3.0359 | 2.187 | 2.0734 | 1.9621 |
| Pinaroloxias inornata | 4.1886 | 2.9802 | 2.3111 | 1.5475 | 1.6301 |
| Platyspiza crassirostris | 4.419686 | 3.270543 | 2.331471 | 2.347471 | 2.282443 |
| Camarhynchus psittacula | 4.23502 | 3.04912 | 2.25964 | 2.23004 | 2.07394 |
" caption="DarwinsFinchesTraits.txt" %} -->

<!-- The actual file looks like this with the species name in the first column and the names of the traits in the first row.
Each item is separated by a tab character:

```
	wingL	tarsusL	culmenL	beakD	gonysW
Geospiza magnirostris	4.4042	3.03895	2.724667	2.823767	2.675983
Geospiza conirostris	4.349867	2.9842	2.6544	2.5138	2.360167
Geospiza difficilis	4.224067	2.898917	2.277183	2.0111	1.929983
Geospiza scandens	4.261222	2.929033	2.621789	2.1447	2.036944
Geospiza fortis	4.244008	2.894717	2.407025	2.362658	2.221867
Geospiza fuliginosa	4.132957	2.806514	2.094971	1.941157	1.845379
Cactospiza pallida	4.265425	3.08945	2.43025	2.01635	1.949125
Certhidea olivacea	3.975393	2.936536	2.051843	1.191264	1.401186
Camarhynchus parvulus	4.1316	2.97306	1.97442	1.87354	1.81334
Camarhynchus pauper	4.2325	3.0359	2.187	2.0734	1.9621
Pinaroloxias inornata	4.1886	2.9802	2.3111	1.5475	1.6301
Platyspiza crassirostris	4.419686	3.270543	2.331471	2.347471	2.282443
Camarhynchus psittacula	4.23502	3.04912	2.25964	2.23004	2.07394
``` -->

Highlight all the traits you want to include in the analysis (in this case all of them).
Select a name for the traits (in this case "life history") and click `OK`.
If you want to treat traits independently, you can check the box `New partition for each trait`, but do not check that box for the purposes of this tutorial.

{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image2.png" %}

You should now see that the traits have been imported as a partition:

{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image3.png" %}


## Setting up the trait model

Switch to the Sites panel to select the evolutionary model for the trait partition.
This tutorial uses the default `Brownian random walk model`.

You can optionally specify a model extension.
The `Residual variance` extension assumes either 1) some measurement error in the observed traits or 2) that the process on the tree does not fully capture the variation in the traits.
This model permits estimates of trait-specific phylogenetic heritability.

The `Latent factor model` (also known as phylogenetic factor analysis / PFA) assumes a low-dimensional process on the tree that maps to high-dimensional traits.
For example, the mammals dataset has 11 traits, but it is possible that there are fewer (e.g., 2 or 3) evolutionary processes that are responsible for the variation in these 11 traits.
PFA maps the 11-dimensional traits to k-dimensional factors that evolve on the tree.
This model is particularly useful when computation is constrained by a large number of traits.
Specifically, non-PFA models scale cubically in the number of traits and may be computationally intractable with many traits.
However, PFA scales linearly and remains computationally feasable for even thousands of continuous traits.

We do not select either model extension for this tutorial, but want users to be aware of their existence.


{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image5.png" %}

## Importing the tree

Often trait-only analyses rely on a fixed tree that has been previously inferred using sequence data or other features.
You can import a tree as a newick format (extension `.nwk`) from the `Trees` panel, by selecting `Import additional tree(s) from file...`.
After importing the examples/continuousTraits/mammals.nwk file, you can set the `Tree Model` the `User-specified starting tree`: `mammals`

{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image4.png" %}


## Disabling tree sampling

As mentioned above, many trait-only analyses rely on fixed trees.
To ensure that BEAST keeps the supplied tree fixed and does not sample from the posterior of trees, go to the `Operators` tab and select `fixed tree` in the `Operator mix` dropdown menu.

{% include image.html prefix="tutorials/continuous_traits_no_sequence/" file="image6.png" %}

## Generating the XML and Analysing the Data

See the [Analysing Continuous Traits](continuous_traits) tutorial for information on generating the BEAST XML and analysing the data.
The process is the same, except that many of the tree-specific paramters (e.g. `treeModel.rootHeight` will be constant).
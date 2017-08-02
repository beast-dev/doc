---
title: How to sample the dates of sequences
keywords: beast, tutorial
last_updated: August 2, 2017
tags: [howto]
summary: "Tutorial on how to estimate the sampling dates of observed sequences."
sidebar: beast_sidebar
permalink: tip_date_sampling.html
folder: beast
---

## Tip Date Sampling

In this tutorial, we will show various approaches to accommodate uncertainty in sampling dates using data from the West Nile virus (WNV) invasion across North America (Pybus et al., 2012). 
The data consists of a set of viral genome sequences which have been isolated at different points in time (heterochronous data) in different US counties. 
WNV is a mosquito-borne RNA virus whose primary host is birds, and was first detected in the United States in New York City in August 1999. 
The data are 104 genomes collected between 1999 and 2008.
The taxon labels contain the sampling dates for all the sequences in the data set, as can be seen in the figure below.

{% include image.html file="WNV_dates" prefix="tutorials/howtos/" alt="WNV sampling dates" caption="WNV dates as parsed from the taxon labels" %}

**Note:** To inform BEAUti/BEAST about the sampling dates of the sequences, check out the [tutorial on how to extract dates from taxon labels](tip_dates).



## References

Pybus et al. (2012) Unifying the spatial epidemiology and molecular evolution of emerging epidemics. Proc. Natl. Acad. Sci. USA 109(37): 15066-15071.

{% include links.html %}

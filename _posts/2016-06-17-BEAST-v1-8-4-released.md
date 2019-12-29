---
title:  "BEAST v1.8.4 released"
categories: release
permalink: 2016-06-17_BEAST_v1.8.4_released.html
sidebar: beast_sidebar
tags: [news]
---

BEAST v1.8.4 has been released: 

[Download BEAST v1.8.4 binaries for Mac, Windows and UNIX/Linux](installing.html)

```
Version 1.8.4 released 17th June 2016
New Features:

    New structured list of citations printed to screen before running.
    Option ('-citation_file') to write citation list to file.
    Option in BEAUti Priors panel to set parameters to 'Fixed Value'

Bug Fixes:

    Issue 808: Set autoOptimize to false in the randomWalkOperator on 
               Pagel's lambda
    Issue 806: SRD06 in BEAUTi selecting incorrect options.
    Issue 799: Relative rate parameters for partitions were not being 
               created. All partitions within a clock model have a 
               relative rate if their substitution models are unlinked.
    Issue 798: Calculating pairwise distances was slow for big data sets -
               removed this (but initial values no longer suggested based
               on data).
    Issue 797: Removed 'meanRate' from Priors tab in BEAUti.
    Issue 794: Running with empty command line causes error.
    Issue 792: Check to see that the same likelihood isn't included multiple
               times into the density.
```

{% include links.html %}

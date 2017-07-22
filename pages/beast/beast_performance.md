---
title: Optimizing Performance
permalink: performance.html
sidebar: beast_sidebar
tags: [getting-started]
keywords: software, performance, GPU, multi-core, beast
last_updated: July 22, 2017
summary: "Optimizing Performance"
toc: true
folder: beast
---

## Optimizing Performance

### Default transition kernels

Before commencing this guide, we refer to the page on [how to use BEAGLE with BEAST](beagle.html).

We will here assume the following system setup, which is shown by BEAGLE to be the following: 

```bash
BEAGLE resources available:
0 : CPU
    Flags: PRECISION_SINGLE PRECISION_DOUBLE ...
    
1 : Intel(R) HD Graphics 530
    Global memory (MB): 1536
    Clock speed (Ghz): 1.05
    Number of compute units: 24
    Flags: PRECISION_SINGLE COMPUTATION_SYNCH ...

2 : Tesla K40c
    Global memory (MB): 11520
    Clock speed (Ghz): 0.74
    Number of cores: 2880
    Flags: PRECISION_SINGLE PRECISION_DOUBLE ...
```

In other words, this system contains a CPU, an Intel integrated graphics processor (IGP) and one NVidia Tesla GPU card fit for scientific computing. 




### Adaptive MCMC

{% include links.html %}
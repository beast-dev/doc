---
title: Optimizing Performance
permalink: performance.html
sidebar: beast_sidebar
tags: [reference]
keywords: software, performance, GPU, multi-core, beast
last_updated: July 22, 2017
summary: "Optimizing Performance"
toc: true
folder: beast
---

## Optimizing Performance

### Nucleotide data sets

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
    
3 : Tesla K40c
    Global memory (MB): 11520
    Clock speed (Ghz): 0.74
    Number of cores: 2880
    Flags: PRECISION_SINGLE PRECISION_DOUBLE ...
```

In other words, this system contains a CPU (resource 0), an Intel integrated graphics processor (IGP; resource 1) and two NVidia Tesla GPU cards (resources 2 and 3) fit for scientific computing. 

#### CPU

By default, the likelihood evaluation for each data partition will occur on CPU (i.e. on resource 0).

In the case of multiple sequence data partitions, a separate BEAGLE instance will be created per partition, ensuring that each partition is run in parallel on a different processor core (as long as the number of available processor cores exceeds the number of data partitions).
Users can manually limit the number of threads that can be used by BEAGLE (by using the <samp>-threads</samp> option), but in general there is no reason to do so. 

In the case of sufficiently large data partitions (in terms of the number of unique site patterns), each partition can be split into 2 or more subpartitions for matters of efficiency using the <samp>-beagle_instances</samp> option.
Note that the  <samp>-beagle_instances</samp> option holds for every partition, i.e. every data partition will be split into the same specified amount of subpartitions.
This option is hence the most popular when analysing a single large data partition or multiple large data partitions of similar size (again in terms of their number of unique site patterns).
For example, to split one or more data partitions into 4 subpartitions, the likelihood of which will be computed in parallel on a separate processor, the following command can be used:

```bash
beast -beagle_instances 4
```

For analysing nucleotide data sets of small to mediocre size, using multi-core CPU configurations will deliver adequate computational efficiency.
Performance gains may be achieved by using automated load balancing, which tries to determine the optimal subpartitioning strategy to deliver optimal performance on a multi-core CPU setup.
This feature is typically used within an [adaptive MCMC framework](adaptive_mcmc_tutorial.html) (and is explained in the respective [tutorial](adaptive_mcmc_tutorial.html)), but can also be applied to single-partition data sets.
While there is nothing to prevent this approach from working with a partitioned data set, transition kernels that work on a single partition at a time will not fully benefit from such a strategy.

#### GPU



#### CPU & GPU


### Codon data sets



{% include links.html %}
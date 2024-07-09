---
title: Optimizing Performance
permalink: performance.html
sidebar: beast_sidebar
tags: [reference, tutorial]
keywords: software, performance, GPU, multi-core, beast
last_updated: July 24, 2017
summary: "Optimizing Performance"
toc: true
folder: beast
---

## Optimizing Performance

{% include note.html content='This tutorial was written before the release of BEAGLE 3, which focuses on efficient evaluation of multiple data partitions in parallel on one single GPU.' %}

### Nucleotide data sets

Before commencing this guide, we refer to the page on [how to use BEAGLE with BEAST](beagle).

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
Users can manually limit the number of threads that can be used by BEAGLE (by using the <samp>-threads</samp> option), but in general there is no reason to do so (unless to prevent the BEAST analysis taking up too much resources). 

In the case of sufficiently large data partitions (in terms of the number of unique site patterns), each partition can be split into 2 or more subpartitions for matters of efficiency using the <samp>-beagle_instances</samp> option.
Note that the <samp>-beagle_instances</samp> option holds for every partition, i.e. every data partition will be split into the same specified amount of subpartitions.
This option is hence the most popular when analysing a single large data partition or multiple large data partitions of similar size (again in terms of their number of unique site patterns).
For example, to split one or more data partitions into 4 subpartitions, the likelihood of which will be computed in parallel on a separate processor, the following command can be used:

```bash
beast -beagle_instances 4
```

In other words, if your data set has 1 partition, the command above will create 4 subpartitions.
If your data set has 3 partitions, a total of 12 subpartitions will be created, which will only be useful when each partition is sufficiently large and in the presence of a large multi-core CPU system.

#### Automated load balancing (CPU)

For analysing nucleotide data sets of small to mediocre size, using multi-core CPU configurations will deliver adequate computational efficiency.
Performance gains may be achieved by using automated load balancing, which tries to determine the optimal subpartitioning strategy to deliver optimal performance on a multi-core CPU setup.
This feature is typically used within an [adaptive MCMC framework](adaptive_mcmc) (and is explained in the respective [tutorial](adaptive_mcmc)), but can also be applied to single-partition data sets.
While there is nothing to prevent this approach from working with a partitioned data set, transition kernels that work on a single partition at a time will not fully benefit from such a strategy.

#### GPU

For analysing large nucleotide data sets, the use of one or more GPUs may prove more efficient than using multi-core CPUs.
In the case of multiple partitions, it's highly advised to split the likelihood computations over multiple GPU devices.
For example, in the case of 4 partitions, the following options would evaluate the likelihoods of partitions 1 and 3 on a first GPU (resource 2) and the likelihoods of partitions 2 and 4 on a second GPU (resource 3):

```bash
beast -beagle_gpu -beagle_order 2,3,2,3
```

**Important:** likelihood computations for different partitions are performed in sequential fashion on a single GPU, not in parallel.
Hence, in the case of a single partition, the use of the <samp>-beagle_instances</samp> option will result in a decrease in performance compared to not artificially partitioning the data.

#### CPU & GPU

For a single-partition data set, we do not advise to use the <samp>-beagle_instances</samp> option and then split the resulting calculations across a mixture of CPU and GPU.
However, if your data already has multiple partitions, it may be possible to attain performance gains by using both the CPU and one or more GPUs.
The idea then is to put the smallest partition(s) on the CPU and the large(r) partitions on the GPU(s).
For example, in the case of a small first partitions and four larger subsequent partitions, we suggest to use the following command:

```bash
beast -beagle_gpu -beagle_order 0,2,3,2,3
```

or:

```bash
beast -beagle_gpu -beagle_order 0,2,2,3,3
```

### Codon data sets

Codon data sets benefit the most from using one or more GPUs, drastically and consistently outperforming multi-core CPU configurations.
While artificially dividing the data into subpartitions to run on a single GPU (this will actually deteriorate performance), the data can be split into a number of subpartitions equal to the number of GPU devices for optimal performance.
In the case of the system setup in this tutorial, one could use the following options for a single-partition data set:

```bash
beast -beagle_instances 2 -beagle_order 2,3
```

When dealing with multiple data partitions, each of which need to be analysed using a codon model, it's best to balance the number of unique site patterns evenly across the GPU devices.
Again, for example, in the case of 4 partitions, the following options would evaluate the likelihoods of partitions 1 and 3 on a first GPU (resource 2) and the likelihoods of partitions 2 and 4 on a second GPU (resource 3):

```bash
beast -beagle_gpu -beagle_order 2,3,2,3
```

On a system configuration with multiple GPUs, independent analyses can be run simultaneously on the individual GPUs as follows:

```bash
beast -beagle_gpu -beagle_order 2 dataset_1.xml
beast -beagle_gpu -beagle_order 3 dataset_2.xml
```

### Discrete trait data

When performing phylogeographic or phylodynamic analyses, one or more discrete trait partitions can be part of the overall data with specific parameters that need to be estimated.
The most popular example is a set of discrete location states, such as countries or districts.
In the case of only a limited number of possible states (i.e. &lt; 15), CPUs are able to outperform powerful GPUs when evaluating the likelihood of such a trait partition.
This makes sense, as only a single column of trait data needs to be evaluated (compared to hundreds or thousands of sequence data columns) and this will not outweigh the overhead of off-loading the computations onto a GPU.

When multiple discrete trait partitions and multiple GPUs are present, it can be very useful to split those partitions across different GPUs so they can be evaluated in parallel.
This is no different than dealing with sequence data partitions.
For example, in the case of 1 sequence data partitions and 2 discrete trait partitions, a sensible approach would be to evaluate the sequence data likelihood on the CPU (resource 0) and each of the discrete trait data likelihoods on a separate GPU (resources 2 and 3) as follows:

```bash
beast -beagle_gpu -beagle_order 0,2,3
```

**Important:** the <samp>-beagle_instances</samp> option only divides up sequence data partitions.
In any case, as there is typically only a single column of trait data, splitting such a trait partition would not be possible any way.

## Running BEAST on an Amazon AWS GPU instance

Eric J. Ma has created a very nice tutorial on how to install and run BEAST on an Amazon AWS GPU instance.
The tutorial can be found here: [https://ericmjl.github.io/beast-gpu-tutorial/](https://ericmjl.github.io/beast-gpu-tutorial/)

## References

G. Baele, D. L. Ayres, A. Rambaut, M. A. Suchard and P. Lemey (2017) High-performance computing in Bayesian phylogenetics and phylodynamics. (in preparation)

{% include links.html %}
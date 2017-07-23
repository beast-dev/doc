---
title: BEAGLE
permalink: beagle.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, beagle, beast
last_updated: July 13, 2017
summary: "BEAGLE"
toc: true
folder: beast/programs
---

## Using BEAGLE with BEAST

BEAGLE is a high-performance library that can perform the core calculations at the heart of most Bayesian and Maximum Likelihood phylogenetics package. 
It can make use of highly-parallel processors such as those in graphics processing units (GPUs) found in many PCs. 

**The current version of BEAGLE will only work with BEAST v1.6 or later**

BEAGLE is an independent project and its website is [https://github.com/beagle-dev/beagle-lib](https://github.com/beagle-dev/beagle-lib), where binary installers and installation instructions for different operating systems are available.

## Testing the BEAGLE installation 

To test the installation, run BEAST and when the options dialog box appears, select "Use BEAGLE library" and "Show list of available BEAGLE resources":           

{% include image.html file="installing/beagle-options.png" indent="64px" width="450px" alt="beagle options" caption="The BEAGLE options available in the BEAST dialog box." %}

You don't need to specify a BEAST input file as the information about BEAGLE will be displayed and then BEAST will stop. For the commandline version of BEAST, type:

```bash
beast -beagle_info
```

When run, it should show a list of available resources that BEAGLE has detected:

```
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

This shows the CPU (which should always be available), an Intel integrated graphics processor (this is the graphics chip that is used to run the computer display) and one NVidia Tesla GPU card specifically designed for scientific computing. 

## Running BEAST with BEAGLE 

You are now ready to run BEAST using BEAGLE. Just run BEAST again and select "Use BEAGLE library" but not the "Show list of available BEAGLE resources" option. 
When running, as part of the initial pre-amble text, BEAGLE will say what resource it is using:

```
Using BEAGLE TreeLikelihood
  Branch rate model used: strictClockBranchRates
  Using BEAGLE resource 0: CPU
    with instance flags:  PRECISION_DOUBLE COMPUTATION_SYNCH EIGEN_REAL SCALING_MANUAL SCALERS_RAW VECTOR_SSE THREADING_NONE PROCESSOR_CPU FRAMEWORK_CPU
  Ignoring ambiguities in tree likelihood.
  With 191 unique site patterns.
  Using rescaling scheme : dynamic (rescaling every 100 evaluations, delay rescaling until first overflow)
```

This shows that BEAGLE will be using the primary CPU and gives some details about the options it will be using. The default options will be optimal for most machines but [see this page for information about optimizing BEAST computational performance](performance).

## Running BEAST/BEAGLE on command line 

If you are running BEAST on Linux or wish to have more control of the BEAGLE performance options on Mac OS X or Windows you will need to run BEAST from the command line.

Running BEAST from the command line allows you to select which resource needs to be used for your analysis by using a command-line option.
For example, in order to ensure that resource 1 (see above) will be used when running BEAST, you can use the following command:

```bash
beast -beagle_gpu -beagle_order 1 data.xml
```

The full list of command-line BEAGLE options can be listed using ```beast -help``` and are listed here:
  
```
    -beagle_off Dont use the BEAGLE library
    -beagle Use BEAGLE library if available (default on)
    -beagle_info BEAGLE: show information on available resources
    -beagle_order BEAGLE: set order of resource use
    -beagle_instances BEAGLE: divide site patterns amongst instances
    -beagle_CPU BEAGLE: use CPU instance
    -beagle_GPU BEAGLE: use GPU instance if available
    -beagle_SSE BEAGLE: use SSE extensions if available
    -beagle_SSE_off BEAGLE: turn off use of SSE extensions
    -beagle_cuda BEAGLE: use CUDA parallization if available
    -beagle_opencl BEAGLE: use OpenCL parallization if available
    -beagle_single BEAGLE: use single precision if available
    -beagle_double BEAGLE: use double precision if available
    -beagle_async BEAGLE: use asynchronous kernels if available
    -beagle_scaling BEAGLE: specify scaling scheme to use
    -beagle_rescale BEAGLE: frequency of rescaling (dynamic scaling only)
```

{% include links.html %}
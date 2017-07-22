---
title: BEAGLE
permalink: beagle.html
sidebar: beast_sidebar
tags: [getting-started]
keywords: software, beagle, beast
last_updated: July 13, 2017
summary: "BEAGLE"
toc: true
folder: beast
---

## Using BEAGLE with BEAST

BEAGLE is a high-performance library that can perform the core calculations at the heart of most Bayesian and Maximum Likelihood phylogenetics package. 
It can make use of highly-parallel processors such as those in graphics processing units (GPUs) found in many PCs. 

**The current version of BEAGLE will only work with BEAST v1.6 or later**

BEAGLE is an independent project and its website is [https://github.com/beagle-dev/beagle-lib](https://github.com/beagle-dev/beagle-lib), where binary installers and installation instructions for different operating systems are available.

## Testing the BEAGLE installation 

To test the installation, run BEAST and when the options dialog box appears, select "Use BEAGLE library" and "Show list of available BEAGLE resources". 
You don't need to specify a BEAST input file as the information about BEAGLE will be displayed and then BEAST will stop:

When run, it should show a list of available resources that BEAGLE has detected:

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

This shows the CPU (which should always be available), an Intel integrated graphics processor (IGP) and one NVidia Tesla GPU card fit for scientific computing. 

## Running BEAST with BEAGLE 

You are now ready to run BEAST using BEAGLE. Just run BEAST again and select "Use BEAGLE library" but not the "Show list of available BEAGLE resources" option. 
When running, BEAGLE will say what resource it is using:

```bash
Using BEAGLE TreeLikelihood
  Branch rate model used: discretizedBranchRates
  Using BEAGLE resource 1: Tesla K40c
    Global memory (MB): 11520
    Clock speed (Ghz): 0.74
    Number of cores: 2880
    with instance flags:  PRECISION_DOUBLE COMPUTATION_SYNCH EIGEN_REAL SCALING_MANUAL SCALERS_RAW ...
  Ignoring ambiguities in tree likelihood.
  With 2366 unique site patterns.
  Using rescaling scheme : dynamic (rescaling every 100 evaluations, delay rescaling until first overflow)
```

Unless you have a high-specification NVIDIA GPU installed, it is suggested you use the 'Prefer use of: CPU' and 'Prefer precision: double'.

## Running BEAST/BEAGLE on command line 

If you are running BEAST on Linux or wish to have more control of the BEAGLE performance options on Mac OS X or Windows you will need to run BEAST from the command line.

Running BEAST from the command line allows you to select which resource needs to be used for your analysis by using a command-line option.
For example, in order to ensure that resource 1 (see above) will be used when running BEAST, you can use the following command:
```bash
java -jar beast.jar -beagle_gpu -beagle_order 1 data.xml
```

For more information on how to improve computational performance when using BEAST with BEAGLE, we refer to [this page](performance.html).

{% include links.html %}
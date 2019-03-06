---
title: Sequential Monte Carlo BEAST Tutorial
keywords: online, sequential monte carlo, tutorial
last_updated: March 6, 2019
tags: [tutorial]
summary: "Using Sequential Monte Carlo to add sequences to an ongoing analysis in BEAST."
sidebar: beast_sidebar
permalink: smc_online_inference.html
folder: beast
---

## Sequential Monte Carlo (SMC) BEAST Tutorial

Oftentimes, when a phylogenetic analysis has finished or even while it's still running, new sequence data become available and need to be incorporated into the analysis that has been run or that's still running.
Many widely-used software packages for phylogenetic inference assume all of the data have already been completely observed prior to starting the actual inference procedure.
This means that, when new sequence data become available, the entire phylodynamic analyses is rerun from scratch with the full data set, which then includes the new sequence data.
Restarting phylodynamic analyses over and over again can be extremely time-consuming and delay the time to results by days or even weeks.

To tackle these issues, we are working towards a Sequential Monte Carlo (SMC) implementation in BEAST [v1.10](installing).



## Generating a collection of state (or checkpoint) files in BEAST

To write a state file to disk at a given iteration number, add the following program argument: **'-save_at iteration#'** (without the quotation marks).
This will create a time-stamped file 'beast_state_xxxx.xx.xx' containing all the necessary information.
For example, to generate a state file at iteration 2.000.000 for an XML file epiWeekX1.xml, the following command can be used:

```bash
beast -save_at 2000000 epiWeekX1.xml
```

This command will, for example, create a file called: 

```bash
beast_state_2018.11.11.17.14.47
```

{% include note.html content="Do not provide an output file name for the state file with this option, as BEAST will then not start the analysis. We mainly view this feature as a way to store the final state of a BEAST analysis."  %}


To write a state file to disk every x iterations, add the following program argument: **'-save_every x'** (without the quotation marks).
If no file name has been provided and there is at least 1 second time difference between the previous attempt to write to file, a new time-stamped file will be created every time the information needs to be written to disk.

For example, to generate a series of state files every 20.000th iteration for an XML file epiWeekX1.xml, you can use the following command:

```bash
beast -save_every 20000 epiWeekX1.xml
```

For an analysis of 100.000 iterations, this command will then generate 5 state files with a time stamp in the file name:

```bash
beast_state_2018.11.12.10.30.23
beast_state_2018.11.12.10.30.54
beast_state_2018.11.12.10.31.27
beast_state_2018.11.12.10.32.00
beast_state_2018.11.12.10.32.32
```

As you can see, a new (and unique) state file is created roughly every 30 seconds (but this will depend upon how fast the analysis is running).
Alternatively, you can provide a stem file name using the following program argument: **'-save_stem filestem'** (without the quotation marks).
This will generate a series of state files with file names made up of the provided stem file name and the iteration number.
For example, you can use the following command to do so:

```bash
beast -save_every 20000 -save_stem custom epiWeekX1.xml
```

This will, for an analysis of 100.000 iterations, generate the following state files:

```bash
custom_20000
custom_40000
custom_60000
custom_80000
custom_100000
```


## Current testing of BEAST procedure to load a set of particles

Assume we have a system with (say) 10 nodes (each node being a BEAGLE resource - i.e., a GPU or a multi-core processor), and we wish to use 1.000 particles.


### Generating a collection of state files using standard BEAST

Current testing involves the use of a modified version of benchmark1.xml (BEAST 1.10 compatible and run for 1 million iterations) in order to first generate a collection of state files:

```bash
beast -save_every 1000 -save_stem particle benchmark1.xml
```

This command will generate 1.000 state files, of which one can remove a subset that corresponds to the burn-in.
Assume for simplicity that each of the 1.000 state files represents a sample from the posterior distribution, each spaced 1.000 iterations apart.


### Using SMC in BEAST to incorporate new sequences into the existing analysis

Our 1.000 posterior samples are updated using SMC to incorporate the new sequence data, and hence to generate a collection of 1.000 particles.
The SMC process will hence create 1.000 particle files, e.g.:

```bash
particle_1000.part
particle_2000.part
...
particle_999000.part
particle_1000000.part
```


### Perform a short additional BEAST analysis on each of the 1.000 updated particles

We'll create a separate directory containing 100 particles each, so that we end up with 10 different particles directories (which will each be evaluated on one of the 10 available compute nodes / BEAGLE resources), e.g.:

```bash
1-100
101-200
201-300
301-400
401-500
501-600
601-700
701-800
801-900
901-1000
```

We can now launch a number of BEAST analyses equal to the number of directories that hold particles, i.e. 10 in the case of this particular example as this number corresponds to our number of available BEAGLE resources.
For the first directory containing particles, we can do this as follows (with ```1-100``` being the directory that holds the first 100 particles):

```bash
beast -particles 1-100 benchmark1.xml
```

The previous command runs an additional (short) BEAST analysis on each particle in a sequential manner, exploiting the BEAGLE library for maximal parallellisation on the compute node.


```
particle_1000.part
particle_1000.part.out
particle_2000.part
particle_2000.part.out
...
particle_100000.part
particle_100000.part.out
```

Collecting all output files (or updated particles) from each of the 10 compute nodes then yields a full collection of updated particles.
Note that the output files constitute BEAST state (or checkpoint) files and that no typical BEAST .log nor .trees output files will be generated when loading a collection of particle files.



## References

V. Dinh, A. E. Darling, F. A. Matsen IV (2018) Online Bayesian phylogenetic inference: theoretical foundations. Syst. Biol. 67(3):503–517.

M. Fourment, B. C. Claywell, V. Dinh, C. McCoy, F. A. Matsen IV, A. E. Darling (2018) Effective online Bayesian phylogenetics via Sequential Monte Carlo with guided proposals. Syst. Biol. 67(3):490–502.

M. S. Gill, P. Lemey, M. A. Suchard, A. Rambaut, G. Baele (2019) Online Bayesian phylodynamic inference in BEAST with application to epidemic reconstruction. In preparation.

M. A. Suchard, P. Lemey, G. Baele, D. L. Ayres, A. J. Drummond, A. Rambaut (2018) Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution 4(1): vey016.

{% include links.html %}
---
title: Online Bayesian Phylodynamic Inference Tutorial
keywords: online, checkpoint, resume, tutorial
last_updated: February 27, 2020
tags: [tutorial]
summary: "Using online Bayesian phylodynamic inference to add sequences to an ongoing analysis in BEAST."
sidebar: beast_sidebar
permalink: online_inference.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/online_inference/{% endcapture %}

## Online Bayesian Phylodynamic Inference Tutorial

Oftentimes, when a phylogenetic analysis has finished or even while it's still running, new sequence data become available and need to be incorporated into the analysis that has been run or that's still running.
Many widely-used software packages for phylogenetic inference assume all of the data have already been completely observed prior to starting the actual inference procedure.
This means that, when new sequence data become available, the entire phylodynamic analyses is rerun from scratch with the full data set, which then includes the new sequence data.
Restarting phylodynamic analyses over and over again can be extremely time-consuming and delay the time to results by days or even weeks.

As of version [v1.10.4](installing), BEAST comes equipped with an online Bayesian phylodynamic inference procedure.
Briefly, this means that BEAST will generate a state file during each ongoing analysis, which can then be used to plug in new sequence data and resume the ongoing analysis without having to completely restart it.
The state file can be kept up to date during the analysis by generating a new version at regular intervals.


## Generating a state (or checkpoint) file in BEAST

To write a state file to disk at a given iteration number, add the following program argument: **'-save_at iteration#'** (without the quotation marks).
This will create a time-stamped file 'beast_state_xxxx.xx.xx' containing all the necessary information.
For example, to generate a state file at iteration 2,000,000 for an XML file epiWeekX1.xml, the following command can be used:

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

For example, to generate a series of state files every 20,000th iteration for an XML file epiWeekX1.xml, you can use the following command:

```bash
beast -save_every 20000 epiWeekX1.xml
```

For an analysis of 100,000 iterations, this command will then generate 5 state files with a time stamp in the file name:

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

This will, for an analysis of 100,000 iterations, generate the following state files:

```bash
custom_20000
custom_40000
custom_60000
custom_80000
custom_100000
```

If you only want a single state file with the latest state information of the BEAST analysis (e.g. at the final iteration of the analysies you're currently performing), you will also have to provide a file name using the **'-save_state filename'** argument (without the quotation marks).
To this end, you can use the following command, with checkpoint.state being the desired checkpoint file name::

```bash
beast -save_every 20000 -save_state checkpoint.state epiWeekX1.xml
```

This way, only one single state file (with the provided file name) will be generated and the file's content will be overwritten every xth iteration.


## Loading a previously generated state (or checkpoint) file in BEAST

To load a BEAST state file from disk and resume a previous analysis, add the following program argument: **-'load_state filename'** (without the quotation marks) to the ```beast``` command.
For example, the following command will load the checkpoint.state file generated in the previous section of this tutorial:

```bash
beast -load_state checkpoint.state epiWeekX1.xml
```

{% include note.html content="You still have to provide the XML file you used to generate the state file in the first place. Certain adjustments to this XML file, such as increasing the number of iterations, are possible before restarting the checkpointed analysis."  %}

{% include note.html content="Importantly, you can resume an analysis with different (manually provided) starting seeds from a single state file to generate multiple independent replicates. If you don't explicitly provide such a starting seed, the original starting seed will be restored and hence each resumed run will lead to the same output."  %}

Note that you can combine the **-'load_state filename'** and **'-save_state newfilename'** arguments (but best to use different file names for both arguments).
This would restore the state from a previous analysis and continue running that same analysis, creating new state (or checkpoint) files for the resumed run:

```bash
beast -load_state checkpoint.state -save_every 20000 -save_state resumed.state epiWeekX1.xml
```

Should resuming the checkpointed state fail because of a small difference in the recomputed posterior value, you can force BEAST to ignore this problem by using the **-'force_resume'** (without the quotation marks) argument:

```bash
beast -load_state checkpoint.state -save_every 20000 -save_state resumed.state -force_resume epiWeekX1.xml
```


## How to add sequences to the obtained phylogeny

A typical use case for adding sequences to an existing Bayesian phylogenetic or phylodynamic reconstruction constitutes the collection of DNA sequences during an ongoing outbreak.
Suppose you have run a BEAST analysis using all available data up to a certain epi week, with a certain collection of models, contained within the XML file: epiWeekX1.xml. 
When new sequence data become available, you construct an updated XML file with the exact same collection of models, but an updated alignment: epiWeekX2.xml.

Our approach consists in using the newly created XML file to update a checkpointed file with this newly obtained sequence information.
BEAST [v1.10.4](installing) contains a new application, called CheckPointUpdaterApp, to achieve this using an existing checkpoint file and the updated XML file.
Suppose we use the checkpoint file from the previous section (checkpoint.state), along with the updated XML file (epiWeekX2.xml), to generate a modified checkpoint file (updated.checkpoint.state):

```bash
java -cp beast.jar dr.app.realtime.CheckPointUpdaterApp -BEAST_XML epiWeekX2.xml -load_state checkpoint.state -output_file updated.checkpoint.state -update_choice JC69Distance
```

There are currently three possible distances measures for the **update_choice** argument:
* JC69Distance: the distance matrix uses the JC69 model (Jukes and Cantor, 1969)
* F84Distance: the distance matrix uses the F84 model (Felsenstein and Churchill, 1996)
* Simple: a custom distance matrix that counts the nucleotide differences between two sequences, when neither position is a gap nor an ambiguity

{% include note.html content="There is no need to provide the original XML file for this step, as all of its information will be contained with the checkpoint state file."  %}


## How to resume the previous analysis with the added sequences

Now that an updated checkpoint (or state) file has been generated, all that is left to do is load this new state file into BEAST, along with the updated XML file:

```bash
beast -load_state updated.checkpoint.state -save_every 20000 -save_state updated.state epiWeekX2.xml
```

In anticipation of (even) more data becoming available, we suggest to keep using the **'-save_every x'** (without the quotation marks) and **'-save_state newfilename'** (without the quotation marks) arguments.


## BEAST XML files

We make available [10 BEAST XML files]({{ root_url }}files/XMLs.zip) accompanying our paper on this online Bayesian phylodynamic inference framework.





## References

M. S. Gill, P. Lemey, M. A. Suchard, A. Rambaut, G. Baele (2020) Online Bayesian phylodynamic inference in BEAST with application to epidemic reconstruction. Molecular Biology and Evolution (in press). DOI: [https://doi.org/10.1093/molbev/msaa047](https://doi.org/10.1093/molbev/msaa047)

M. A. Suchard, P. Lemey, G. Baele, D. L. Ayres, A. J. Drummond, A. Rambaut (2018) Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution 4(1): vey016. DOI: [https://doi.org/10.1093/ve/vey016](https://doi.org/10.1093/ve/vey016)

T. H. Jukes, C. R. Cantor (1969) Evolution of protein molecules. New York: Academic Press pp. 21–132.

J. Felsenstein, G. A. Churchill (1996) A hidden Markov Model approach to variation among sites in rate of evolution. Molecular Biology and Evolution 13(1): 93–104.

{% include links.html %}
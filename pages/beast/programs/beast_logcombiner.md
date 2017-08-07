---
title: LogCombiner
permalink: logcombiner.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, logcombiner, beast
last_updated: July 13, 2017
summary: "LogCombiner allows you to combine log and tree files from multiple independent runs of BEAST. It can be run with a user-interface or as a command-line utility."
toc: true
folder: beast/programs
---

## User-interface

{% include icon-callout.html file='icons/utility-icon.png' url='logcombiner' content='LogCombiner is a program for combining the output from multiple runs of BEAST and for other processing tasks.' %}

Double-clicking the LogCombiner icon will result in a dialog box appearing:

{% include image.html file='logcombiner1.png' width='80%' %}

### The options

#### File Type

This combo menu allows you to select either the log or tree file type that you will be importing into LogCombiner.

#### Convert numbers from scientific to decimal notation

BEAST will often write numbers in scientific notation to maintain precision. Some software programs may have problems with this, so this option will convert these to decimal numbers.

#### Renumber output states

If selected, this will renumber the output states to a sequential series.

#### Resample states at lower frequency

This option allows you to resample your posterior distribution at a lower frequency than in previous BEAST runs. This should be specified as a multiple of the existing sampling frequency (i.e., if your original file sampled every 1000 states, you could change this to 2000, 3000, etc.).

#### Select input files

Here you can select using the “+” button the input files that you wish to combine (or just select one if you wish to just change the file using the options above).
These will appear in the sub-window with the file name and the BurnIn period.

To determine a suitable burnin for each individual file, it is advisable to check each independently in [Tracer].

{% include warning.html content='The files you have selected must be from independent runs of BEAST from the same XML file. If the log files differ an error will occur stating that the number of columns in the first file does not match that of the second file.' %}

#### Output file

This option allows you to select a new log file that the combined log data will be saved to.

Once ready to run the dialog box will look something like this:

{% include image.html file='logcombiner2.png' width='80%' %}

### Running LogCombiner

When you click `Run`, the text window will show the progress as it processes the files:

```
     LogCombiner v1.10
                    MCMC Output Combiner
                             by
           Andrew Rambaut and Alexei J. Drummond

             Institute of Evolutionary Biology
                  University of Edinburgh
                     a.rambaut@ed.ac.uk

               Department of Computer Science
                   University of Auckland
                  alexei@cs.auckland.ac.nz


Creating combined log file: '/Users/rambaut/Projects/BEAST/tests/Dengue4.combined.log'


Combining file: '/Users/rambaut/Projects/BEAST/tests/Dengue4.run1.log' removing burnin: 1000000
Combining file: '/Users/rambaut/Projects/BEAST/tests/Dengue4.run2.log' removing burnin: 1000000
Finished - Quit program to exit.
```

Combining trees files can be much slower than log files due to the large size of these files. When the program says 'Finished', the combined log file you selected, above, will be ready. Close the program by selecting the `Quit` option.

Once LogCombiner has finished you can analyse the combined log file in Tracer.

## Command-line use

To run logcombiner on the command-line you can use the shell script installed in `/bin` of the BEAST package. Use the help command to see a list of options:

```bin/logcombiner -help```


```
LogCombiner v1.10, 2002-2017
                       MCMC Output Combiner
                                by
              Andrew Rambaut and Alexei J. Drummond

                Institute of Evolutionary Biology
                     University of Edinburgh
                        a.rambaut@ed.ac.uk

                  Department of Computer Science
                      University of Auckland
                     alexei@cs.auckland.ac.nz


     Usage: logcombiner [-trees] [-decimal] [-burnin <i>] [-resample <i>] [-scale <r>] [-strip] [-renumber] [-help] <input-file-name1> [<input-file-name2> ...] <output-file-name>
       -trees use this option to combine tree log files
       -decimal this option converts numbers from scientific to decimal notation
       -burnin the number of states to be considered as 'burn-in'
       -resample resample the log files to this frequency (the original sampling frequency must be a factor of this value)
       -scale a scaling factor that will multiply any time units by this value
       -strip strip out all annotations (trees only)
       -renumber this option renumbers output states consecutively
       -help option to print this message

     Example: logcombiner test1.log test2.log combined.log
     Example: logcombiner -burnin 10000 test1.log test2.log combined.log
```

Notes:

- There are some options (scale & strip) that are not available in the user-interface.

- On the other hand with the command-line interface it is not possible to specify different burnins for different files (although it would be possible to process each in turn, removing an appropriate burnin and then combining the resulting files --- you would then use a burnin of 0).

- Just typing `logcombiner` with no additional options will bring up the user-interface dialog box.

{% include links.html %}
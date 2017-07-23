---
title: LogCombiner
permalink: logcombiner.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, logcombiner, beast
last_updated: July 13, 2017
summary: "LogCombiner"
toc: true
folder: beast/programs
---

## LogCombiner

LogCombiner allows you to combine log and tree files from multiple independent runs of BEAST. 
When this program is opened the LogCombiner user interface and a JAVA LogCombiner window will appear.

**Important: It does not make sense to combine log files from MCMC analyses of different models or different data sets.**

### File Type

This combo menu allows you to select either the log or tree file type that you will be importing into LogCombiner.

### Resample states at lower frequency

This option allows you to resample your posterior distribution at a lower fre- quency than in previous BEAST runs.

### Select input files

Here you can select using the “+” button the input files that you wish to combine. 
These will appear in the sub-window with the file name and the BurnIn period (by default 10%).

### Output file

This option allows you to select a log file or create a new log file that the combined log data will be saved to. 
When you click “Run”, the log files you have selected will be combined in the JAVA LogCombiner window. 
The files you have selected must be from independent runs of BEAST from the same XML file, otherwise an error will occur stating that the number of columns in the first file does not match that of the second file. 
Once LogCombiner has finished you can analyse the combined log file in Tracer.

{% include links.html %}
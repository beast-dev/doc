---
title: The BEAST program
permalink: beast.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, beast
last_updated: August 2, 2017
summary: "This program takes as input an XML command file and returns as output log files. 
          The log files record a sample of the states that the Markov chain encountered. 
          This output must be analyzed to produce estimates of the parameters of interest (evolutionary rates, divergence times, population sizes and tree topologies). 
          A careful examination of this output is also necessary to determine whether the Markov chain has been run long enough to obtain accurate estimates of the parameters. "
toc: false
folder: beast/programs
---

{% include icon-callout.html file='icons/beast-icon.png' content='Run BEAST by double clicking on the BEAST icon in the package you downloaded.' %}

When you run BEAST with a graphical user interface you will see the following dialog box appear:

{% include image.html prefix="tutorials/first_tutorial/" file="image12.png" %}

`BEAST XML File`
: The name of the selected BEAST XML file. You can drag a file to this box or click `Choose File...`.

`Allow overwriting of log files`
: By default, BEAST will not overwrite existing log or trees files to protect the data. If you wish, you can override this by selecting this option.

`Random number seed`
: Like all computer software, BEAST uses a pseudo-random number generator. The random numbers are used to generate the random starting tree, to propose new states in the MCMC tree and to accept or reject these proposals. Th algorithm used produces an excellent sequence of random numbers (in that it is impossible to predict one number from the previous one) but the sequence is dependent on the starting 'seed'. Two runs with the same seed will produce exactly the same results. By default, BEAST uses the number of milliseconds since 1970 as the seed so no two runs will be identical. In some cases you might want to recreate a run done previously (perhaps the log files were lost) in which case you could use the seed previously used. 

`Thread pool size`
: This specifies the number of threads that BEAST will use to divide up the computation amongst cores and processors on the computer. By default, it will use as many threads as required. This option can be used to **restrict** the number of cores that BEAST uses. This may be useful to avoid a BEAST run taking over an entire computer if it is shared with other users. [See this page for details about optimizing the performance of BEAST](performance).

`Use BEAGLE library if available`
: This option and the rest of the dialog box is used to tell BEAST to use the [BEAGLE library](beagle) and control the options for its use. [See the page on BEAGLE for more information](beagle).

`Run`
: Clicking this button will start the analysis which will run until completion. To interrupt the run press 'Control-C' or click 'Quit'. 

Equivalent options (and many more) are available in the [command line version of BEAST](install_on_unix).

{% include links.html %}
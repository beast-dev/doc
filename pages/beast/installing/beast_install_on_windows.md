---
title: Downloading and installing BEAST on Windows
keywords: beast, install, download, windows
last_updated: July 12, 2017
tags: [installing]
summary: "BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees."
sidebar: beast_sidebar
permalink: install_on_windows.html
folder: beast/installing
---

## Downloading BEAST

BEAST can be downloaded from the following link:

- [BEAST v{{ site.beast_version }} - Windows version 86.2MB]({{ site.beast_windows_download_url }})

This will download a compressed ZIP archive (a '.zip' file). 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

## Installing JAVA

To get the latest version of Java you will need to download the Java JDK from [http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html). 
Download and install the 'JRE' - this is the Java Runtime Environment. 
If you want to compile Java code you can install the JDK (Java Development Kit) instead. 
Once installed, you will automatically get updates to the latest version.

**Important:** when given the choice, we strongly suggest you to install the 64-bit version of Java.

{% include warning.html content="Do not install the Java software offered on the http://java.com website. This will install java only as a plug in to your web browser. This version of Java will not be able to run BEAST." %}

## Installing BEAST

Unzip the downloaded compressed ZIP archive (currently `BEAST.v{{ site.beast_version }}.zip`).
The unzipped files contain executable binaries for [BEAST](beast), [BEAUti](beauti), [LogCombiner](logcombiner), [TreeAnnotator](treeannotator) and [TreeStat](treestat).
Double-clicking on those files will automatically start the corresponding program.

### BEAGLE acceleration library

We also strongly recommend that you install the BEAGLE library to accelerate BEAST's computation (indeed some analyses are not possible without BEAGLE). 
[For more information about BEAGLE and information about installing it, see here](beagle).
In the case of a correct 64-bit installation of Java and BEAGLE, BEAST will automatically detect where BEAGLE has been installed.

{% include links.html %}

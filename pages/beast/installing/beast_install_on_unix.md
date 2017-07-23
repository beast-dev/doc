---
title: Downloading and installing BEAST on UNIX/Linux
keywords: beast, install, download, unix, linux
last_updated: July 12, 2017
tags: [getting_started]
summary: "BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees."
sidebar: beast_sidebar
permalink: install_on_unix.html
folder: beast/installing
---

## Downloading BEAST

{% include tip.html content="If you want to install BEAST on the Mac OS X command-line, we strongly recommend using the Homebrew package manager. [See below for instructions for this](#homebrew-package-manager-for-mac-os-x)." %}

BEAST can be downloaded from the following link:

- [BEAST v1.8.4 - UNIX/Linux version 18.9MB](https://github.com/beast-dev/beast-mcmc/releases/download/v1.8.4/BEASTv1.8.4.tgz)

This will download a compressed tar archive (a '.tgz' file). 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

## Installing JAVA

## Installing BEAST

### Installing BEAST on Linux

To add: 

- Unpacking tarball.
- Moving directory to /usr/local/ or some such place. 
- Describing the shell scripts in /bin. 
- Creating symbolic links? 
- Running directly using the .jar file (to allow JavaVM options). 
- Running without command-line options to bring up GUI.

### Homebrew package manager for Mac OS X

The above instructions will also work to install BEAST as a command-line tool in Mac OS X. However, the recommended way of installing BEAST for use in the Mac OS X Terminal is to use the Homebrew package manager.


If you use the Mac OS X command-line you are probably familiar with [Homebrew](https://brew.sh). This is a simple and convenient way of installing and updating command-line software on the Mac. [Homebrew](https://brew.sh) provides a huge range of science and bioinformatics software [and a list of packages can be found here](https://github.com/Homebrew/homebrew-science/wiki/List-of-homebrew-science-formulae). [See the Homebrew website to get it installed](https://brew.sh).

To install BEAST using HomeBrew type:

```bash
brew tap homebrew/science
brew install beast
```

To check BEAST is installed type:

```bash
beast -help
```

If a new version of BEAST is released, to update you just need to type:

```bash
brew upgrade beast
```


{% include links.html %}

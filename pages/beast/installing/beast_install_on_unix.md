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

- [BEAST v{{ site.beast_version }} - UNIX/Linux version 18.9MB]({{ beast_mac_download_url }})

This will download a compressed tar archive (a '.tgz' file). 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

## Installing JAVA

### Installing OpenJDK 8

Ubuntu-based linux operating systems have Open JDK installed as their default Java installation.
To install Open JDK 8 (both JRE and JDK), you can run the following commands:

```bash
sudo apt-get install openjdk-8-jre
sudo apt-get install openjdk-8-jdk
```

### Installing Oracle Java 8

If you'd like to use Oracle Java instead of Open JDK, you will require the PPA maintained by Webupd8 Team before proceeding with the installation:

```bash
sudo apt-add-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

**Note:** if the apt-add-repository command is not found, first install the following:

```bash
sudo apt-get install software-properties-common
```

The PPA also contains a package to automatically set Java environment variables, by simply running the following command:

```bash
sudo apt-get install oracle-java8-set-default
```

You can now edit the  /etc/environment configuration file and add the following entries to set JAVA_HOME and JRE_HOME environment variables:

```bash
JAVA_HOME=/usr/lib/jvm/java-8-oracle
JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
```

## Installing BEAST

### Installing BEAST on Linux

To add: 

- Unpacking tarball.
- Moving directory to /usr/local/ or some such place. 
- Describing the shell scripts in /bin. 
- Creating symbolic links? 
- Running directly using the .jar file (to allow JavaVM options). 
- Running without command-line options to bring up GUI.


{% include links.html %}

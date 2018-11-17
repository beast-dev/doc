---
title: Downloading and installing BEAST on UNIX/Linux
keywords: beast, install, download, unix, linux
last_updated: July 12, 2017
tags: [installing]
summary: "BEAST is a software package for phylogenetic analysis with an emphasis on time-scaled trees."
sidebar: beast_sidebar
permalink: install_on_unix.html
folder: beast/installing
---

## Downloading BEAST

{% include tip.html content="If you want to install BEAST on the Mac OS X command-line, we strongly recommend using the Homebrew package manager. [See below for instructions for this](#homebrew-package-manager-for-mac-os-x)." %}

BEAST can be downloaded from the following link:

- [BEAST v{{ site.beast_version }} - UNIX/Linux version 18.9MB]({{ site.beast_linux_download_url }})

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

You can now edit the /etc/environment configuration file and add the following entries to set JAVA_HOME and JRE_HOME environment variables:

```bash
JAVA_HOME=/usr/lib/jvm/java-8-oracle
JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
```

## Installing BEAST

### Downloading and running BEAST on Linux

Start by downloading and unpacking the compressed .tar.gz file:

```bash
tar -zxvf BEASTv{{ site.beast_version }}.tgz
```

You can now go to the /bin directory and run BEAUti and BEAST from this directory:

```bash
cd BEASTv{{ site.beast_version }}/bin
./beauti
./beast
```

### Adding the executables to the system path

To add the BEAUti and BEAST executables to the system's path (to run from outside the /bin directory), you need to edit your system's profile:

```bash
nano ~/.bash_profile
```

and add the path to the /bin directory:

```bash
export PATH=$PATH:$HOME/BEASTv{{ site.beast_version }}/bin/
```

To reload the changes to the profile immediately without logging out or restarting your computer, run the following:

```bash
source ~/.bash_profile
```

Verify your current system's path settings by typing:

```bash
echo $PATH
```

### Creating symbolic links in a directory of choice

```bash
ln -s Downloads/BEASTv{{ site.beast_version }}/bin/beauti beauti
ln -s Downloads/BEASTv{{ site.beast_version }}/bin/beast beast
```

# Running BEAST from a jar file (with GUI)

Go to the /lib directory where you extracted the linux .tar.gz file:

```bash
cd BEASTv{{ site.beast_version }}/lib
java -jar beauti.jar
java -jar beast.jar
```


### Running BEAUti and BEAST from a jar file (without GUI)

In that same /lib directory, provide command-line options for BEAST to run with:

```bash
java -jar beast.jar -seed 1234 example.xml
```



{% include links.html %}

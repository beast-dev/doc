---
title: Installing BEAST on Mac OS X
keywords: beast, install, download, mac
last_updated: July 15, 2024
tags: [installing]
summary: "How to download and install BEAST on Mac OS X."
sidebar: beast_sidebar
permalink: install_on_mac.html
folder: beast/installing
---

## Downloading BEAST

BEAST can be downloaded from the following link:

- [BEAST X v{{ site.beast_version }} - Mac OS X binary 114MB]({{ site.beast_mac_download_url }})

This will download a disk image (a '.dmg' file) probably into your Downloads folder. 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

## Installing JAVA

To run BEAST on Mac OS X, you will need to have [Java](http://go.java.com) installed. Older versions of Mac OS had Java installed by default but this is no longer the case. You can install the latest version of Java which is distributed free by [Oracle](http://java.com). BEAST currently requires at least version 8 of Java.
  
### Installing Oracle Java 8

To get the latest version of Java you will need to download the Java JDK from [http://www.oracle.com/technetwork/java/javase/downloads/index.html](http://www.oracle.com/technetwork/java/javase/downloads/index.html). Download and install the 'JRE' - this is the Java Runtime Environment. If you want to compile Java code you can install the JDK (Java Development Kit) instead. Once installed, you will automatically get updates to the latest version.

{% include warning.html content="Do not install the Java software offered on the http://java.com website. This will install java only as a plug in to your web browser. This version of Java will not be able to run BEAST." %}

## Installing BEAST

Double-clicking the disk image file will open a virtual 'disk' in a Finder window. At this point the applications are still on the 'disk' created by the disk image. We suggest that you drag the entire folder into your ```Applications``` folder (either the main Applications folder or the one in your user folder). You can drag the folder by clicking, holding and then dragging the little white icon at the top of the disk image finder window.
 
### Mac OS X security

When opening the downloaded disk image (`.dmg` file) or running any of the applications in the BEAST package for the first time you may see a security dialog box. This is Mac OS X's security  protecting your system from unknown software:
 
{% include image.html file="installing/mac-security.png" indent="64px" width="320px" alt="mac security" caption="The Mac OS X security dialog. This prevents software from outside the App Store being run unless explicily overruled." %}

For Mac OS X 15 (Sequoia) and later, you will need to allow the application to run by clicking "Done" and then going to `System Preferences` > `Security & Privacy` and clicking the `Open Anyway` button next to the message about BEAST. This will allow you to run the application. Unfortunately you will have to do this for each application in the BEAST package.

{% include image.html file="installing/mac-security-2.png" indent="64px" width="320px" alt="mac security" caption="The security restrictions on running this software can be overruled in the Security & Privacy section of System Preferences." %}

### Older Max OS X versions

For versions of Mac OS X prior to Sequoia you may be able to use the following approach: Rather than double-clicking to open the application for the first time, you can control-click (or right-click) on the application icon and select ```Open```. This will bring up a similar dialog box to the one about but this time it will have an ```Open``` button which will override the security for this application only. You will only need to do this the first time you open an application but you will need to do it individually for each of the applications in the BEAST package.

You can then drag the icons into your Dock if you want quick access to them.

### BEAGLE acceleration library

We also strongly recommend that you install the BEAGLE library to accelerate BEAST's computation (indeed some analyses are not possible without BEAGLE). [For more information about BEAGLE and information about installing it, see here](beagle).

## Installing a command-line version of BEAST

Mac OS X is particularly popular in computational biology because it is built upon a UNIX operating system which gives it access to a wide range of scientific software. BEAST can also be installed to run within the command-line environment provided by the Mac OS X Terminal.app. [For instructions on installing BEAST for a UNIX command line see this page](install_on_unix).

### Homebrew package manager for Mac OS X

The above instructions will also work to install BEAST as a command-line tool in Mac OS X. However, the recommended way of installing BEAST for use in the Mac OS X Terminal is to use the Homebrew package manager.


If you use the Mac OS X command-line you are probably familiar with [Homebrew](https://brew.sh). This is a simple and convenient way of installing and updating command-line software on the Mac. [Homebrew](https://brew.sh) provides a huge range of science and bioinformatics software [and a list of packages can be found here](https://github.com/Homebrew/homebrew-science/wiki/List-of-homebrew-science-formulae). [See the Homebrew website to get it installed](https://brew.sh).

To install BEAST using HomeBrew type:

```bash
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

You can also install the latest development version but this is at your own risk:

```bash
brew install --HEAD beast
```

### Conda environment for Mac OS X

Finally, you can install a command-line version of BEAST and BEAGLE using the `conda` environment manager. See the [UNIX installation page](install_on_unix) for details.

{% include links.html %}

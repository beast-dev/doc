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

- [BEAST X v{{ site.beast_version }} - Mac OS X binary 228MB]({{ site.beast_mac_download_url }})

This will download a disk image (a '.dmg' file) probably into your Downloads folder. 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

This version includes a Java virtual machine (JVM) and the BEAGLE library so no additional installation is required.

Note - this version will only work on Macs with Apple Silicon (ARM64 cpus). To run on older Intel powered Macs use the Universal version:

- [BEAST X v{{ site.beast_version }} - Mac OS X binary 228MB]({{ site.beast_mac_universal_download_url }})

This version will require an independent installation of Java and the BEAGLE library.

## Installing BEAST

Double-clicking the disk image file will open a virtual 'disk' in a Finder window. At this point the applications are still on the 'disk' created by the disk image. We suggest that you drag the entire folder into your ```Applications``` folder (either the main Applications folder or the one in your user folder). You can drag the folder by clicking, holding and then dragging the little white icon at the top of the disk image finder window.

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

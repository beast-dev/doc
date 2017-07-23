---
title: Installing BEAST on Mac OS X
keywords: beast, install, download, mac
last_updated: July 22, 2017
tags: [getting_started installing]
summary: "How to download and install BEAST on Mac OS X."
sidebar: beast_sidebar
permalink: install_on_mac.html
folder: beast
---

## Downloading BEAST

BEAST can be downloaded from the following link:

- [BEAST v1.8.4 - Mac OS X binary 66.1MB](https://github.com/beast-dev/beast-mcmc/releases/download/v1.8.4/BEAST.v1.8.4.dmg)

This will download a disk image (a '.dmg' file) probably into your Downloads folder. 

{% include callout.html content="The latest version of BEAST can always be found here: [https://github.com/beast-dev/beast-mcmc/releases/latest](https://github.com/beast-dev/beast-mcmc/releases/latest)" %}

## Installing BEAST

Double-clicking the disk image file will open the a virtual 'disk' in a Finder window. At this point the applications are still on the 'disk' created by the disk image. We suggest that you drag the entire folder into your ```Applications``` folder (either the main Applications folder or the one in your user folder). You can drag the folder by clicking, holding and then dragging the little white icon at the top of the disk image finder window.
 
### Mac OS X security

When running any of the applications in the BEAST package for the first time you may see a security dialog box. This is Mac OS X's security  protecting your system from unknown software:
 
{% include image.html file="installing/mac-security.png" indent="64px" width="640px" alt="beagle options" caption="The Mac OS X security dialog. By default it only allows you to run software from developers registered with Apple. For more information about this, click the question mark button." %}
 
Rather than double-clicking to run the application for the first time, you can control-click (or right-click) on the application icon and select ```Open```. This will bring up a similar dialog box to the one about but this time it will have an ```Open``` button which will override the security for this application only. You will only need to do this the first time you open an application but you will need to do it individually for each of the applications in the BEAST package.

You can then drag the icons into your Dock if you want quick access to them.

### BEAGLE acceleration library

We also strongly recommend that you install the BEAGLE library to accelerate BEAST's computation (indeed some analyses are not possible without BEAGLE). [For more information about BEAGLE and information about installing it, see here](beagle).

### Installing a command-line version of BEAST

Mac OS X is particularly popular in computational biology because it is built upon a UNIX operating system which gives it access to a wide range of scientific software. BEAST can also be installed to run within the command-line environment provided by the Mac OS X Terminal.app. [For instructions on installing BEAST for a UNIX command line see this page](install_on_unix).

{% include links.html %}

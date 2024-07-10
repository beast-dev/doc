---
title: spread.gl
permalink: spreadgl.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, visualisation, spread.gl, beast
last_updated: July 9, 2024
summary: "spread.gl"
toc: true
folder: beast/programs
---

## spread.gl

spread.gl (Spatial Phylogenetic Reconstruction of Evolutionary Dynamics built on kepler.gl) is a major update to [SPREAD](spread) and [SpreaD3](spread3) and constitutes a package for analysis and visualisation of pathogen pylodynamic reconstructions.


### Using spread.gl

spread.gl is compatible with popular browsers (Chrome, Firefox, Safari, Edge). 
A tutorial on how to install and use spread.gl is available here: [https://github.com/GuyBaele/SpreadGL](https://github.com/GuyBaele/SpreadGL), along with a series of visualisation examples for both discrete and continuous phylogeographic inference for different pathogens.

The example below shows the dispersal within China of porcine epidemic diarrhea virus (PEDV), as estimated using a discrete phylogeographic analysis (He et al., 2022).
Each province is colored according to pork consumption per province, but any type of environmental data can be used (and in spread.gl you can toggle between different environmental variables). 
Note that the visualisation makes use of a sliding time window, but that an incremental time window can easily be set as well.

<video src="files/Porcine.epidemic.diarrhea.virus.PEDV.in.China.slidingwindow.mp4" width="800" controls></video>

For more visualisation examples, we refer to [https://github.com/GuyBaele/SpreadGL](https://github.com/GuyBaele/SpreadGL).


### Citing spread.gl

Li, Y., Bollen, N., Hong, S. L., Brusselmans, M. Gambaro, F., Suchard, M. A., Rambaut, A., Lemey, P., Dellicour, S., Baele, G. spread.gl: visualising pathogen dispersal in a high-performance browser application. medRxiv [https://doi.org/10.1101/2024.06.04.24308447](https://doi.org/10.1101/2024.06.04.24308447).

{% include links.html %}
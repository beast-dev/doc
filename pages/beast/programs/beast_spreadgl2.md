---
title: SpreadGL2
permalink: spreadgl2.html
sidebar: beast_sidebar
tags: [programs]
keywords: software, visualisation, spread.gl, beast
last_updated: August 8, 2026
summary: "SpreadGL2"
toc: true
folder: beast/programs
---

## SpreadGL2

SpreadGL2 (Spatial Phylogenetic Reconstruction of Evolutionary Dynamics built on deck.gl, version 2) is a major update to [spread.gl](beast_spreadgl) and is a client-side browser-based application for visualizing time-scaled phylogenies alongside their inferred geographic spread in linked tree and map views.

SpreadGL2 supports:
- Discrete and continuous phylogeography, including geographic highest posterior density (HPD) regions
- Lineage-through-time curves, migration transition counts, and Bayes factors from Bayesian stochastic search variable selection (BSSVS)
- GeoJSON boundaries, choropleths with environmental data, and raster overlays
- Built-in gazetteer with automatic location matching and interactive coordinate assignment

Tree, log, overlay, and project files are all processed locally. SpreadGL2 has no accounts, data uploads, or telemetry.


### Loading SpreadGL2 (online)

Follow the prompts for data inputs [here](https://spreadgl2.github.io).


### Using SpreadGL2

A stepwise overview on how to use SpreadGL2 is available here: [https://github.com/spreadgl2/spreadgl2.github.io#readme](https://github.com/spreadgl2/spreadgl2.github.io#readme).

The example below shows the dispersal within the United Kingdom of SARS-CoV-2 Delta, as estimated using a continuous phylogeographic analysis (McCrone et al., 2022).
Note that the visualisation makes use of an incremental time window, but that a sliding time window can easily be set as well.

<video src="files/SpreadGL2-SARSCoV2-UK.mp4" width="800" controls></video>


### Citing SpreadGL2

*Manuscript in preparation.*


### References

McCrone, J. T., Hill, V., Bajaj, S., Evans Pena, R., Lambert, B. C., Inward, R., Bhatt, S., Volz, E., Ruis, C., Dellicour, S., Baele, G., Zarebski, A. E., Sadilek, A., Wu, N., Schneider, A., Ji, X., Raghwani, J., Jackson, B., Colquhoun, R., O’Toole, A., Peacock, T. P., Twohig, K., Thelwall, S., Dabrera, G., Myers, R., The COVID-19 genomics UK (COG-UK) consortium, Faria, N. R., Huber, C., Bogoch, I. I., Khan, K., du Plessis, L., Barrett, J. C., Aanensen, D. M., Barclay, W. S., Chand, M., Connor, T., Loman, N. J., Suchard, M. A., Pybus, O. G., Rambaut, A., Kraemer, M. U. G. (2022) Context-specific emergence and growth of the SARS-CoV-2 Delta variant. Nature 610: 154–160.

{% include links.html %}

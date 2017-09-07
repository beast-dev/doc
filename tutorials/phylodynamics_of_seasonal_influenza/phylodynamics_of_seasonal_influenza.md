---
title: Revealing the fluctuating evolutionary dynamics of seasonal influenza
keywords: phylodynamics, influenza, tutorial
last_updated: August 8, 2017
tags: [tutorial]
summary: "This tutorial provides a step-by-step explanation on how to reconstruct the evolutionary dynamics of seasonal influenza based on a set of H3N2 virus sequences which have been isolated over several seasons in New York State. The data is a subset of a comprehensive data set spanning several epidemic seasons in the New York state, which has been used to unravel the genomic and epidemiological dynamics of this virus (Rambaut et al., 2008). We will examine how H3N2 diversity fluctuates through time."
sidebar: beast_sidebar
permalink: phylodynamics_of_seasonal_influenza.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/phylodynamics_of_seasonal_influenza/{% endcapture %}

In this tutorial, we will reconstruct a [Bayesian skygrid](tree_priors#skygrid) of human influenza A, H3N2 subtype, over three northern hemisphere epidemic seasons. The data set contains 165 Hemagglutinin gene sequences and can take a few hours to run so this tutorial will discuss how to set up this analysis and then how to summarize the results based on runs, already performed, that can be downloaded from this site.

{% include note.html content='This tutorial builds on the previous tutorials which should be completed first. In particular the <a href="rates_and_dates">"Estimating rates and dates from time-stamped sequences"</a>, and <a href="phylodynamics_of_epidemic_influenza">"The evolutionary dynamics of a influenza epidemic"</a> provide details of steps that are skipped over here.' %}
                
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The data file is called '<samp>NewYork.HA.2000-2003.nex</samp>' and <a href="{{ root_url }}files/NewYork.HA.2000-2003.nex">can be downloaded from here</a>.</div>
                
## Running BEAUti

Run BEAUti, load the nexus file (<samp>NewYork.HA.2000-2003.nex</samp>) and set the `Tips` panel's `Parse Dates` to the last numerical field in the sequence names as previously. Set the same evolutionary model (including gamma distributed rate variation) and clock model as in the previous exercise. In the `Trees` tab, select a `Coalescent: Bayesian SkyGrid` as the `Tree Prior`. We will construct a grid of <samp>50</samp> intervals over 5 years (`Time at last point:` <samp>5</samp>) before  the most recent sampling date (<samp>2003.98</samp> in our case, so going back to about 1999) thus estimating 10 population sizes per year. The panel should look like this:

{% include image.html file="image19.png" prefix=root_url %}

At this point we would usually generate the BEAST XML file, load it into BEAST and run it. However, this data set is a bit bigger than before and the model is a bit more computationally intensive so rather than waiting around for it to finish, you can go straight on an analyse some results files that have already been run.
 
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> The log files for the long run <a href="{{ root_url }}files/Long_Run_H3N2_SkyGrid.zip">can be downloaded from here</a>.</div>

## Analyzing the BEAST output

Using Tracer, we can analyze the run based on the output files provided (load the file called <samp>NewYork.HA.2000-2003.log</samp>). This has been run with a chain length of 50,000,000 sampling every 5,000 steps so a total of 10,000 samples:

{% include image.html file="image20.png" prefix=root_url %}

To reconstruct the Bayesian skygrid plot, select `SkyGrid reconstruction...` under the `Analysis` menu. The following window should appear:

{% include image.html file="image21.png" prefix=root_url  max-width="50%" align="center"%}

Set the manual bin range from <samp>1999</samp> to <samp>2004</samp> and specify <samp>2003.98</samp> as the `Age of the youngest tip` at the bottom. Press `OK` and after some time, the following Bayesian skyGrid reconstruction should appear (with solid interval selected):

{% include image.html file="image22.png" prefix=root_url %}

By default the y-axis is in a log scale. Press the `Axes` button and turn off `Log axis` for the `Y axis`. You will also need to set the `Manual range` because the upper HPD bounds will be very large. Set this to <samp>0</samp> to <samp>100</samp> and you get the following:

{% include image.html file="image23.png" prefix=root_url %}

Here you can see that the seasonal peaks very strong (but that the uncertainty denoted by the credible intervale is also very large). 

## References

- Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
- Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.

## Help and documentation

The BEAST website: [http://beast.community](http://beast.community)

Tutorials: [http://beast.community/tutorials](http://beast.community/tutorials)

Frequently asked questions: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

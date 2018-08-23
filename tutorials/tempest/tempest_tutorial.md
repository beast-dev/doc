---
title: TempEst Tutorial
keywords: tempest, tutorial
last_updated: Aug 23, 2018
tags: [tempest, tutorial]
summary: "This tutorial describes the use of TempEst to examine the temporal signal of a data set and to look for problematic or erroneous sequences."
sidebar: beast_sidebar
permalink: tempest_tutorial.html
folder: beast
---

In this tutorial, .

## Building a non-molecular clock tree

To examine the relationship between genetic divergence and time (temporal signal) we require a phylogenetic tree constructed without assuming a molecular clock. There is a wide range of suitable software packages (i.e., Phyml, RAXML, Garli) but for this tutorial we are going to use [IQ-Tree](http://www.iqtree.org) which i 

<div class="alert alert-success" role="alert"><div>The data for this tutorial was compiled for this paper: Worobey (2009) Phylogenetic Evidence against Evolutionary Stasis and Natural Abiotic Reservoirs of Influenza A Virus. <i>Journal of Virology</i>, <b>82</b>, 3769–3774. <a href="http://doi.org/10.1128/JVI.02207-07">DOI: 10.1128/JVI.02207-07</a>. This was a response to an earlier paper (Zhang et al (2006) <i>J Virol</i> <b>80</b>, 12229–12235 <a href="http://doi.org/10.1128/JVI.00986-06">DOI: 10.1128/JVI.00986-06</a> ) which claimed to have isolated and sequenced influenza viruses from glacial ice.</div> 

<br/><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses.fasta"><i class="fa fa-download fa-lg"></i> You can download the file, <code class="highlighter-rouge">ice_viruses.fasta</code>, here</a>.</div>
</div>

Install **IQ-Tree** using [the instructions on the website](http://www.iqtree.org) and open a command-line prompt, navigating to the directory containting the data file `ice_viruses.fasta`.

To build a maximum likelihood phylogenetic tree using the GTR+gamma model type:

```bash
iqtree -s ice_viruses.fasta -m GTR+G 
```

This will create a set of files in the directory containing various outputs and results:

```
ice_viruses.fasta.bionj
ice_viruses.fasta.ckp.gz
ice_viruses.fasta.iqtree
ice_viruses.fasta.log
ice_viruses.fasta.mldist
ice_viruses.fasta.treefile
ice_viruses.fasta.uniqueseq.phy
```

For our purposes we only need the maximum likelihood tree file `ice_viruses.fasta.treefile`. You can delete the other files if you like. 

## Running TempEst and loading the tree

{% include icon-callout.html file='icons/tempest-icon.png' content='Run <a href="tempest">TempEst</a> by double clicking on its icon. TempEst is an interactive graphical application for examining the temporal signal in a tree of time-stamped sequences by plotting the divergence of each tip from the root against the date of sampling (a root-to-tip plot).' %}


Once running, TempEst will look similar irrespective of which computer system it is running on. For this tutorial, the Mac OS X version will be shown but the Linux & Windows versions will have exactly the same layout and functionality.

When started, TempEst will immediately display a file selection dialog box in which you can select the tree that you made in the previous section.

{% include image.html prefix="/tutorials/tempest/" width="90%" file="fig1_open_dialog.png" %}

Select `ice_viruses.fasta.treefile` and click `Open`.

## Parsing dates of sampling

Once the tree is loaded the main window will appear and look like this: 

{% include image.html prefix="/tutorials/tempest/" file="fig2_taxon_table.png" %}

Ignore the panel on the left for the moment. The first thing that needs doing is to give the date of sampling to each of the sequences. 

The actual year of sampling is given at the end of the name of each taxon and to specify the dates of the sequences in BEAUti we will use the `Parse Dates` button at the top of the panel. Clicking this will make a dialog box appear:

{% include image.html prefix="/tutorials/tempest/" width="90%" file="fig3_parse_dates_dialog.png" %}

This operation attempts to extract the dates are from the taxon names. It works by trying to find a numerical field within each name. This dialog box is the same as that in [BEAUti](beauti) and there are a wide range of options for doing this - [See this page for details about the various options for setting dates in this panel](tip_dates). For these sequences you can set the options to look like the figure above: `Defined just by its order`, `Order: last` and `Parse as a number` option.

When parsing a number, you can ask BEAUti to add a fixed value to each date which can be useful for [transforming a 2 digit year into a 4 digit year](tip_dates). Because all dates are specified in a four digit format in this case, no additional settings are needed.  So, we can press `OK`.

The table will now have the year of sampling for each virus in the `Dates` column. Click on the `Dates` column header to sort the dates and check that they are all correct.

{% include image.html prefix="/tutorials/tempest/" file="fig4_dated_taxon_table.png" %}

## The temporal signal and rooting

We can now explore the data using the tabs at the top of the window - `Tree`, `Root-to-tip` & `Residuals`. If you click on the `Tree` tab you will see the tree as loaded from the tree file. Because we constructed this tree using a non-molecular-clock model, it will arbitrarily rooted. If you look at the dates of each virus in the tree you will see that there is no correlation with the horizontal position:

{% include image.html prefix="/tutorials/tempest/" file="fig5_unrooted_tree.png" %}

Now switch to the `Root-to-tip` panel. This shows a plot of the divergence from the root of the tree against time of sampling (a so-called 'Root to tip plot'):

{% include image.html prefix="/tutorials/tempest/" file="fig6_unrooted_root_to_tip.png" %}

You can see that there is very little correlation in this plot (the line is the best-fit regression). In the table on the left you can see the `Correlation Coefficient` is `0.35`. This lack of correlation is expected as the root is arbitrarily set by the phylogeny reconstruction software and thus divergence from root is meaningless. **TempEst** can try to find the root of the tree that optimizes the temporal signal. It does this by trying all possible roots and picks the one that produces the optimal value of a range of statistics. The function it uses is selected in the menu at the top left. The options are to minimize the mean of the squares of the residuals (`residual-mean-squared`), or to maximize the correlation coefficient (`correlation`) or R^2 (`R squared`). These are all _ad hoc_ procedures and no particular one is best but `residual-mean-squared` may be most consistent with the investigations here.

Click `Best-fitting root` to root the tree at the place that minimizes the mean of the squares of the residuals. 

{% include image.html prefix="/tutorials/tempest/" file="fig7_rooted_root_to_tip.png" %}

Now there is a better correlation between the dates of the tips and the divergence from the root (the correlation coefficient has nearly doubled). Return to the tree to look where the root was placed:

{% include image.html prefix="/tutorials/tempest/" file="fig8_rooted_tree.png" %}

To make the tree easier to view, switch the `Order` option in the panel at the bottom to `increasing`. This rotates each node so the branch with the most tips is at the top. You can see now that there are 3 main lineages in this influenza tree - the human lineage at the top starting with the BrevigMission virus from 1918, the swine lineage in the middle and the avian lineage at the bottom.

## Finding and interpreting problematic sequences

Switch to the `Root-to-tip` panel. Look for the point furthest from the line in the top left hand quadrant. If you click and drag you pointer over the point it will be hilighted in a blue colour:

{% include image.html prefix="/tutorials/tempest/" file="fig9_positive_outlier_hilighted.png" %}

If you now switch to the `Residual` panel you will see a plot all the residual (the tangental deviation from the regression line). The virus we selected will still be hilighted and you can see it is an outlier. It is often easiest to select outliers in this plot.

{% include image.html prefix="/tutorials/tempest/" file="fig10_positive_residual_hilighted.png" %}

If we now go back to the `Tree` panel you will see the label of the selected virus hilighted. You can use the `Zoom` slider in the bottom panel to zoom in on the area of the tree and the `Font Size` selector to increase the size of the label:

{% include image.html prefix="/tutorials/tempest/" file="fig11_tree_1917_hilighted.png" %}

Looking at this part of the tree you should be able to see why `A.BrantGoose.1.1917` is such an outlier. Although it is supposedly sampled from 1917, it is actually identical to a bunch of 4 other bird viruses from Ohio in 1999. This suggests that this virus sequence was the result of contamination by one of the other viruses in the same lab (another possibility is the mis-labelling of samples). 

{% include note.html content="The influenza virus sequence, `A.BrantGoose.1.1917`, was published in a paper entitled ['1917 Avian Influenza Virus Sequences Suggest that the 1918 Pandemic Virus Did Not Acquire Its Hemagglutinin Directly from Birds'](https://jvi.asm.org/content/76/15/7860.long). This paper used the fact that this sequence, from prior to the 1918 human pandemic, phylogenetically grouped with viruses from 'modern' birds to suggest that the 1918 pandemic was not a direct cross-over from birds. Clearly this interpretation is unsupported because of the likelihood of lab contamination as a source of the virus."  %}

One further tool is available that can be useful to find problematic sequences. Turn on the `Show ancestor traces` option at the bottom of the panel:
  
{% include image.html prefix="/tutorials/tempest/" file="fig12_positive_outlier_ancestor_line.png" %}

This option draws a green line from the selected virus to the point on the regression line where the immediate ancestor should lie (i.e., given its divergence from the root). 

Tree shows blue for tips with +ve residuals, red for -ve.


{% include links.html %}

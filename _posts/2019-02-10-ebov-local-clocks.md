---
title: "Ebola Virus Local Clock Analysis"
author: Andrew Rambaut
categories: release
permalink: ebov_local_clocks.html
tags: [news]
---

{% capture root_url %}{{ site.tutorials_root_url }}/first_tutorial/{% endcapture %}

In 2014 there was another outbreak of Ebola virus disease in the Democratic Republic of Congo. 
When the first genome sequences were published (Maganga et al. 2014) it was noticed that the amount of divergence from the earliest EBOV genomes from the 1970s was considerably less than for the West African epidemic genomes (Baize et al. 2014) which were from the same year. 
This caused speculation that the DRC lineage had exhibited a substantially lower rate of evolution (Lam et al. 2015). 
Lam et al speculated that this may be due to it being in a different host species with different evolutionary forces at work. 

However, during the West African outbreak, a number of examples of long-term latency were observed where someone who had recovered from EVD months later transmitted the virus to another individual -- usually a sexual partner (Blackley et al. 2016). 
In the most extreme example, there was a 15 month interval between the acute infection and the onward transmission (Diallo et al. 2016). 
It was noticed that these cases were often associated with a short branch length suggesting a reduced rate of evolution or a form of latency with reduced replication for much of the period. 
This suggests that a similar process could be at work for EBOV in the non-human animal hosts over longer timescales.

Sequences from the last 3 DRC outbreaks (in 2017, summer 2018 and the currently ongoing one in the North East of the country) also exhibit this apparently reduced branch length. 
[See this post for a tree produced by the INRB and USAMRIID that shows this effect](http://virological.org/t/drc-2018-viral-genome-characterization/230) and also [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5). 

Most EBOV genomes have been sampled from human cases so we have included one genome per outbreak, preferring those with precise dates of sampling. 
A list of sequences used is given in Table 1 along with their Genbank accession numbers and, where available, a reference to the published work describing them.

<div class="small-text"  markdown='1'>

| **accession** | **country** | **name** | **date** | **outbreak** | **reference** |
|---|---|---|---|---|---|
| [KR063671](https://www.ncbi.nlm.nih.gov/nuccore/KR063671) | DRC | Yambuku-Mayinga | 1976-10-01 | Yambuku/1976 |
| [KC242791](https://www.ncbi.nlm.nih.gov/nuccore/KC242791) | DRC | Bonduni | 1977-06 | Bonduni/1977 | [Carroll et al. 2013](https://www.ncbi.nlm.nih.gov/pubmed/23255795) |
| [KC242792](https://www.ncbi.nlm.nih.gov/nuccore/KC242792) | GAB | Gabon | 1994-12-27 | Minkebe/1994 | [Carroll et al. 2013](https://www.ncbi.nlm.nih.gov/pubmed/23255795) | 
| [KU182905](https://www.ncbi.nlm.nih.gov/nuccore/KU182905) | DRC | Kikwit-9510621 | 1995-05-04 | Kikwit/1995 |
| [KC242793](https://www.ncbi.nlm.nih.gov/nuccore/KC242793) | GAB | 1Eko | 1996-02 | Mayibout/1996 | [Carroll et al. 2013](https://www.ncbi.nlm.nih.gov/pubmed/23255795) | 
| [KC242798](https://www.ncbi.nlm.nih.gov/nuccore/KC242798) | GAB | 1Ikot | 1996-10-27 | Booue/1996 | [Carroll et al. 2013](https://www.ncbi.nlm.nih.gov/pubmed/23255795) | 
| [KC242800](https://www.ncbi.nlm.nih.gov/nuccore/KC242800) | GAB | Ilembe | 2002-02-23 | Mekambo/2001 | [Carroll et al. 2013](https://www.ncbi.nlm.nih.gov/pubmed/23255795) | 
| [KF113529](https://www.ncbi.nlm.nih.gov/nuccore/KF113529) | COG | Kelle_2 | 2003-10 | Mbomo/2003 | Chiu et al. 2013 |
| [HQ613403](https://www.ncbi.nlm.nih.gov/nuccore/HQ613403) | DRC | M-M | 2007-08-31 | Luebo/2007 | [Grard et al. 2011](http://doi.org/10.1093/infdis/jir364) |
| [HQ613402](https://www.ncbi.nlm.nih.gov/nuccore/HQ613402) | DRC | 034-KS | 2008-12-31 | Luebo/2008 | [Grard et al. 2011](http://doi.org/10.1093/infdis/jir364) |
| [KJ660347](https://www.ncbi.nlm.nih.gov/nuccore/KJ660347) | GIN | Makona-Gueckedou-C07 | 2014-03-20 | West_Africa/2013 | [Baize et al. 2014](https://www.ncbi.nlm.nih.gov/pubmed/24738640) | 
| [KP271018](https://www.ncbi.nlm.nih.gov/nuccore/KP271018) | DRC | Lomela-Lokolia16 | 2014-08-20 | Boende-Lokolia/2014 | Naccache et al. 2014 |
| [MH613311](https://www.ncbi.nlm.nih.gov/nuccore/MH613311) | DRC | Muembe.1 | 2017-05-07 | Likati/2017 | [Nsio et al. 2018](https://doi.org/10.1093/infdis/jiz107) |
| [MH733477](https://www.ncbi.nlm.nih.gov/nuccore/MH733477) | DRC | BIK009 | 2018-05-10 | Bikoro-Mbandaka/2018 | [Mbala-Kingebeni et al. 2019a](https://doi.org/10.1016/S1473-3099(19)30124-0) |
| [MK007330](https://www.ncbi.nlm.nih.gov/nuccore/MK007330) | DRC | 18FHV090 | 2018-07-28 | Kivu/2018 | [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5) |

</div>
> **Table 1** A list of the genomes used in this post and their references. 

Building a maximum likelihood tree of these genomes shows the apparent slow down in the recent lineages (yellow dots). 
A root-to-tip regression (the line is fitted only to the green dots) shows how far below the expected line these are (this is similar to Figure 5 in [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5)).

<iframe src="https://rambaut.github.io/figtree.js/ebov.html" style="width: 1000px; height: 410px; border: 0px"></iframe>

> **Figure 1.** A tree and root-to-tip plot for the 15 Ebola virus genomes in Table 1.
This is an interactive figure: click the points to include/exclude them from the regression. 
The yellow tips are not included in the regression.
Click on a branch of the tree to re-root the tree at that position.
[The source code for this figure is available here](https://github.com/rambaut/figtree.js/).

To explore this effect we have used relaxed-clock models in BEAST to allow different rates of evolution for different parts of the tree. 
Firstly we used the Local Clock model which allows us to specify which parts of the tree have different rates. 
This allows us to assign a different rate of evolution to the clade for the 2014 and 2018 outbreaks (including the ‘stem’ branch leading to the clade).
             
{% include image.html width="320" prefix="" file="news/EBOV_Reference_Set_15_iqtree_highlighted.png" %}

> **Figure 2.** A maximum likelihood tree of the 15 EBOV genomes with the 'slow' clades highlighted. 

To simplify the analysis here, we have only included the pair of sequences from the 2014 DRC outbreak (Lomela-Lokolia16) and the Equator province outbreak from 2018 (**clade a** in Figure 5 of [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5)).
As a comparison we ran the analysis with a strict molecular clock (assumes a single rate over the whole tree) and a log-normal uncorrelated relaxed clock (allows each branch to have a different rate, independently drawn from a log-normal distribution). 
We also ran a strict molecular clock but excluding the recent DRC outbreak genomes.

For all of these analyses we constrained the tree topology so all of the viruses after the 1970s were monophyletic to maintain a consistent rooting. 
This was the rooting suggested by a much earlier an alysis(Dudas and Rambaut 2014). 

Analysis was done by partitioning the genomes into 1st, 2nd & 3rd codon positions for the concatenated protein coding regions and a 4th partition comprising the concatenated intergenic regions. 
Each partition was given an HKY model with gamma distributed site-specific rates and parameters for each were unlinked. [XML files for all the analyses are available here]().

Here are the resulting trees. 
Firstly the local clock tree. 
The branches are coloured by rate with blue meaning lower than average. 
You can see the two clades that have been allowed a different rate and both have a slower rate than the rest of the tree.

{% include image.html prefix="" file="news/EBOV_Reference_Set_13_LC1.MCC.tree.png" %}

> **Figure 3.**

Secondly, the relaxed clock tree. Here blue is again below-average rate and red denotes above-average rate. 
You can see that there is variation in rate across the tree (the clades of interest do, however, have the slowest rates). 
Note however that the age of the root of the tree is much further back in time and the HPD bar spans nearly 4 decades. 
Essentially the lognormal distribution is struggling to adequately describe the variation in rates given the extreme outlier seen in Figure 3. 


{% include image.html prefix="" file="news/EBOV_Reference_Set_13_UCLN.MCC.tree.png" %}

> **Figure 4.**

Finally, as a comparison, here is the strict molecular clock tree with the same rate over the whole tree. 
Once again, the root of the tree is much older than the local clock model and the relative branch lengths are very different. 
 
{% include image.html prefix="" file="news/EBOV_Reference_Set_13_SC.MCC.tree.png" %}

> **Figure 5.**

Looking at the relaxed clock tree in Figure 4, we notice that for the clade of interest, the tip branches seem to have a lower rate than the stem branches (the branches to the 2014 and 2018 outbreaks are much shorter too). 
This suggests another possibility - that it is not the whole clade that has a lower rate of evolution but just the branch leading to the common ancestor of the pair. 
This makes more sense if this is being produced by a process of latency (i.e., a switch between active replication and no replication). 
This would mean that, parsimoniously, there were just this one branch where the virus was latent for some period of time.

To examine this we can set up a new local clock model which just has the internal stem branch given the different rate of evolution with the tip branches in this clades having the same rate as the rest of the tree.

{% include image.html prefix="" file="news/EBOV_Reference_Set_13_LC2.MCC.tree.png" %}

> **Figure 6.**

In comparison with the clade specific local clock (Figure 3), the most recent common ancestor of the the Lokolia/Bikoro is much more recent. Other than that, the trees are very similar.

Looking at the average rate of evolution over the whole tree shows the slow-down in the in the Lokolia/Bikoro clade affects the strict clock to a much greater degree than the relaxed clocks.

{% include image.html prefix="" file="news/Set_13_mean_rates.png" %}

> **Figure 7.**

But if we look at the local clock models and compare the rate for the Lokolia/Bikoro clade and the stem branch we see the slow rates (the stem only model gives an even slower rate for this one branch - supporting the idea that this is the branch that experienced some ‘latency’).

{% include image.html prefix="" file="news/Set_13_LCx_rates.png" %}

> **Figure 8.**

### References

> Baize, Sylvain, Delphine Pannetier, Lisa Oestereich, Toni Rieger, Lamine Koivogui, N ’faly Magassouba, Barrè Soropogui, et al. 2014. “Emergence of Zaire Ebola Virus Disease in Guinea.” The New England Journal of Medicine 371 (15): 1418–25.
>
> Carroll, Serena A., Jonathan S. Towner, Tara K. Sealy, Laura K. McMullan, Marina L. Khristova, Felicity J. Burt, Robert Swanepoel, Pierre E. Rollin, and Stuart T. Nichol. 2013. “Molecular Evolution of Viruses of the Family Filoviridae Based on 97 Whole-Genome Sequences.” Journal of Virology 87 (5): 2608–16.
>
> Diallo, Boubacar, Daouda Sissoko, Nicholas J. Loman, Hadja Aïssatou Bah, Hawa Bah, Mary Claire Worrell, Lya Saidou Conde, et al. 2016. “Resurgence of Ebola Virus Disease in Guinea Linked to a Survivor With Virus Persistence in Seminal Fluid for More Than 500 Days.” Clinical Infectious Diseases: An Official Publication of the Infectious Diseases Society of America 63 (10): 1353–56.
>
> Lam, Tommy Tsan-Yuk, Huachen Zhu, Yee Ling Chong, Edward C. Holmes, and Yi Guan. 2015. “Puzzling Origins of the Ebola Outbreak in the Democratic Republic of the Congo, 2014.” Journal of Virology, July, JVI.01226–15.
>
> Maganga, Gaël D., Jimmy Kapetshi, Nicolas Berthet, Benoît Kebela Ilunga, Felix Kabange, Placide Mbala Kingebeni, Vital Mondonge, et al. 2014. “Ebola Virus Disease in the Democratic Republic of Congo.” The New England Journal of Medicine 371 (22): 2083–91.

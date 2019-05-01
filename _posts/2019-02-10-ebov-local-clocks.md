---
title: "Ebola Virus Local Clock Analysis"
author: Andrew Rambaut
categories: release
permalink: ebov_local_clocks.html
tags: [news]
---

{% capture root_url %}{{ site.tutorials_root_url }}/first_tutorial/{% endcapture %}

by Andrew Rambaut, JT McCrone & Guy Baele.

In 2014 there was an outbreak of Ebola virus disease in the Democratic Republic of Congo. 
When the first genome sequences were published (Maganga *et al.* 2014) it was noticed that the amount of divergence from the earliest EBOV genomes from the 1970s was considerably less than for the West African epidemic genomes which were from the same year. 
This suggested that the DRC lineage had exhibited a substantially lower rate of evolution (Lam *et al.* 2015). 
Lam *et al.* speculated that this may be due to it being in a different host species with different evolutionary forces at work. 

However, during the West African outbreak, a number of examples of long-term latency were observed where someone who had recovered from EVD months later transmitted the virus to another individual -- usually a sexual partner (Blackley *et al.* 2016). 
In the most extreme example, there was a 15 month interval between the acute infection and the onward transmission (Diallo *et al.* 2016). 
It was noticed that these cases were often associated with a short branch length suggesting a reduced rate of evolution or a form of latency with reduced replication for much of the period. 
This suggests that a similar process could be at work for EBOV in the non-human animal hosts over longer timescales.

Sequences from the last 3 DRC outbreaks (in 2017, summer 2018 and the currently ongoing one in the North East of the country) also exhibit this apparently reduced branch length. 
[See this post for a tree produced by the INRB and USAMRIID that shows this effect](http://virological.org/t/drc-2018-viral-genome-characterization/230) and also [Mbala-Kingebeni *et al.* 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5). 

To explore EBOV rate varation in non-human hosts, we assembled a data set of genomes that spans the known history of the virus. Most EBOV genomes have been sampled from human cases so we have included one genome per outbreak, preferring those with precise dates of sampling. 
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
| [MH733477](https://www.ncbi.nlm.nih.gov/nuccore/MH733477) | DRC | Tumba-BIK009 | 2018-05-10 | Bikoro-Mbandaka/2018 | [Mbala-Kingebeni et al. 2019a](https://doi.org/10.1016/S1473-3099(19)30124-0) |
| [MK007330](https://www.ncbi.nlm.nih.gov/nuccore/MK007330) | DRC | Ituri-18FHV090 | 2018-07-28 | Kivu/2018 | [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5) |

</div>

> **Table 1** A list of the genomes used in this post and their references. 

Building a maximum likelihood tree of these genomes shows the apparent slow down in the recent lineages (Figure 1; yellow dots). 
A root-to-tip regression (the line is fitted only to the green dots) shows how far below the expected line these are (this is similar to Figure 5 in [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5)). 

<iframe src="https://rambaut.github.io/figtree.js/ebov.html" style="width: 1100px; height: 450px; border: 0px"></iframe>

> **Figure 1.** A tree and root-to-tip plot for the 15 Ebola virus genomes in Table 1.
This is an interactive figure: click the points to include/exclude them from the regression. 
The yellow tips are not included in the regression.
Click on a branch of the tree to re-root the tree at that position.
[The source code for this figure is available here](https://github.com/rambaut/figtree.js/).

## Methods

To characterise this effect, we have used relaxed-clock models in BEAST to allow different rates of evolution for different parts of the tree. 
             
{% include image.html width="320" prefix="" file="news/EBOV_Reference_Set_15_iqtree_highlighted.png" %}

> **Figure 2.** A maximum likelihood tree of the 15 EBOV genomes with the 'slow' clades highlighted. 

Two lineages are identified as having lower than expected divergence by [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5) (see Figure 2):
* One comprising the outbreak in 2017 in Likati and the on-going 2018-2019 outbreak in North Kivu Province -- represented by the genomes *Muembe.1* and *Ituri-18FHV090*. 
* The other comprising the outbreak in 2014 in Lokolia and the 2018 outbreak in Équateur Province -- represented by the genomes *Lomela-Lokolia16* and *Tumba-BIK009*. 

The two lineages  are labelled *clade a* ("EBOV/Tum" & "EBOV/Lom") and *clade c* ("EBOV/Muy" & "EBOV/Itu"), respectively, in Figure 5 of [Mbala-Kingebeni et al. 2019b](https://doi.org/10.1016/S1473-3099(19)30118-5).

Firstly we used the Local Clock model which allows us to specify which parts of the tree have different rates (although this doesn't specify which bits are fast and which are slow).
This allows us to assign a different rate of evolution to the two lineages described above (including the ‘stem’ branch leading to each clade).

As a comparison we also ran the analysis with a strict molecular clock (assumes a single rate over the whole tree) and a log-normal uncorrelated relaxed clock (allows each branch to have a different rate, independently drawn from a log-normal distribution). 
We also ran a strict molecular clock but excluding the recent DRC outbreak genomes.

For all of these analyses we constrained the tree topology so all of the viruses after the 1970s were monophyletic to maintain a consistent rooting. 
This was the rooting suggested by a much earlier an analysis (Dudas and Rambaut 2014). 

Analysis was done by partitioning the genomes into 1st, 2nd & 3rd codon positions for the concatenated protein coding regions and a 4th partition comprising the concatenated intergenic regions. 
Each partition was given an HKY model with gamma distributed site-specific rates and parameters for each were unlinked. [XML files for all the analyses are available here]().

## Results
 
For the local clock model (Figure 3), you can see the two lineages that have been allowed a different rate and both have a slower rate than the rest of the tree (The branches are coloured by rate with blue meaning lower than average). This and all the subsequent trees are drawn on the same timescale to allow a comparison of the depth of the trees.

{% include image.html prefix="" file="news/EBOV_Reference_Set_15_LC1.MCC.tree.png" %}

> **Figure 3.** A local clock tree where two lineages, identified *a priori*, are allowed to evolve at a different rate. The branches are coloured by rate with blue meaning lower than average, red higher. Green bars represent 95% credible intervals for the date of the node.

Secondly, for the relaxed clock tree (Figure 4), you can see that there is variation in rate across the tree (the clades of interest do, however, have the slowest rates). 
Note however that the age of the root of the tree is further back in time and the HPD bar spans nearly 4 decades. 
Essentially the lognormal distribution is struggling to adequately describe the variation in rates given the extreme outliers seen in Figure 3. 

{% include image.html prefix="" file="news/EBOV_Reference_Set_15_UCLN.MCC.tree.png" %}

> **Figure 4.** The uncorrelated lognormal (UCLN) relaxed clock model. The rate for each branch is inferred independently with no *a priori* structure imposed. 

Finally, as a comparison, here is the strict molecular clock tree with the same rate over the whole tree (Figure 5). 
Once again, the root of the tree is much older than the local clock model and the relative branch lengths are very different. 
 
{% include image.html prefix="" file="news/EBOV_Reference_Set_15_SC.MCC.tree.png" %}

> **Figure 5.** The strict molecular clock model with a single rate describing the whole tree.

## Refining the model
 
Looking at the relaxed clock tree in Figure 4, we notice that for the two clades of interest, the tip branches seem to have a higher rate than the stem branches (they are less blue and they are shorter than in the local clock model). 
This suggests another possibility --- that it is not the whole clade that has a lower rate of evolution but just the branch leading to the common ancestor of the pair. 
This makes more sense if this is being produced by a process of latency (i.e., a switch between active replication and no replication). 
This would mean that, parsimoniously, there were just these two branch where the virus was latent for some period of time.
We would assume that an internal node in the tree represents active replication and epidemiological spread and thus the virus being in the non-latent state. 
This it is unlikely that a whole clade and stem exhibits latency (unless the propensity to latency increased on the stem lineage). 

{% include image.html width="320" prefix="" file="news/EBOV_Reference_Set_15_iqtree_highlighted_stem.png" %}

> **Figure 6.** The two stem branches given a different rate of evolution in the refined local clock model (the rest of the tree is assumed to have the same rate including the tip branches of the two clades identified in Figure 2. 

To examine this we can set up a new local clock model which just has the internal stem branch given the different rate of evolution with the tip branches in this clades having the same rate as the rest of the tree (Figure 6).

{% include image.html prefix="" file="news/EBOV_Reference_Set_15_LC2.MCC.tree.png" %}

> **Figure 7.** Stem branch only local clock model. Only the stem branches above the two clades of interest are allowed different rates of evolution.

In comparison with the clade specific local clock (Figure 3), the most recent common ancestor of the Muembe.1/18FHV090 pair Lokolia/Bikoro pair are much more recent. Other than that, the trees are very similar. The rates of evolution on the two stem lineages is even slower (more blue). We compare the actual values of these rates in Figure 9.

Looking at the average rate of evolution over the whole tree (Figure 8) shows the slow-down in the in the two lineages affects the strict clock to a much greater degree than the relaxed clocks. 

{% include image.html prefix="" width="450px" file="news/Mean_rate_LC1_LC2_SC_UCLN.png" %}

> **Figure 8.** Box-and-whisker plot of the mean rates of evolution across all four models.

But if we look at the local clock models and compare the rate for the Likati/North Kivu and Lokolia/Équateur clades and the respective stem branches (Figure 9) we see the slow rates (the stem-only model gives an even slower rate for this one branch - supporting the idea that this is the branch that experienced some ‘latency’). Interestingly the rates for the two stem branches are even lower than the clades and very similar (whereas the rates for the clades are different because they include a mixture of fast and slow branches for different amounts of time).

{% include image.html prefix="" width="450px" file="news/Local_rates_LC1_LC2.png" %}

> **Figure 9.** Box-and-whisker plot of the estimated rates for the two local clock model variants. The rate labelled 'Tree' is the rate for the rest of the tree (excluding the local clocks), then the rates for the Likati/North Kivu and Lokolia/Équateur lineages when the whole clade is included and then only the stem lineages. 

Finally we ran the strict clock model on a data set where we omitted the four most recent DRC genomes that are involved in the apperent slow down in rates (the last 4 sequences in Table 1). We compared this rate with the two local clock models for the rate of evolution estimated for the parts of the tree that are not included in the local clocks (the red branches in Figures 3 and 7). 

{% include image.html prefix="" width="450px" file="news/Primary_rate_LC1_LC2_SC_SC11.png" %}

> **Figure 10.** Box-and-whisker plot of the estimated rate for the tree (excluding the local clock rates for these models) in comparison to the strict clock rate and the rate for a strict clock on a data set that excludes the 4 recent DRC genomes (i.e., excluding the lineages that are exhibiting slow downs).

### Final points

Although we forced the rooting of the tree to be the same for each model, it is likely that the strict clock model and the relaxed clock model would give a different rooting (and possibly rates) if the constraint was removed. 

We currently running generalised stepping-stone sampling to obtain marginal likelihood estimates and test the fit of each model to the data.

Finally, we are developing an explicit model of latency which will act as a molecular clock model, infer the branches that have evidence of latency and estimate parameters of the process. More on this soon.

### References

> Baize, S. et al., 2014. Emergence of Zaire Ebola Virus Disease in Guinea. The New England journal of medicine, 371(15), pp.1418–1425.
>
> Carroll, S.A. et al., 2013. Molecular Evolution of Viruses of the Family Filoviridae Based on 97 Whole-Genome Sequences. Journal of virology, 87(5), pp.2608–2616.
>
> Diallo, B. et al., 2016. Resurgence of Ebola Virus Disease in Guinea Linked to a Survivor With Virus Persistence in Seminal Fluid for More Than 500 Days. Clinical infectious diseases: an official publication of the Infectious Diseases Society of America, 63(10), pp.1353–1356.
Grard, G. et al., 2011. Emergence of divergent Zaire ebola virus strains in Democratic Republic of the Congo in 2007 and 2008. The Journal of infectious diseases, 204 Suppl 3, pp.S776–84.
>
> Lam, T.T.-Y. et al., 2015. Puzzling origins of the Ebola outbreak in the Democratic Republic of the Congo, 2014. Journal of virology, pp.JVI.01226–15.
>
> Maganga, G.D. et al., 2014. Ebola Virus Disease in the Democratic Republic of Congo. The New England journal of medicine, 371(22), pp.2083–2091.
>
> Mbala-Kingebeni, P., Pratt, C.B., et al., 2019. 2018 Ebola virus disease outbreak in Équateur Province, Democratic Republic of the Congo: a retrospective genomic characterisation. The Lancet infectious diseases. Available at: http://dx.doi.org/10.1016/S1473-3099(19)30124-0.
>
> Mbala-Kingebeni, P., Aziza, A., et al., 2019. Medical countermeasures during the 2018 Ebola virus disease outbreak in the North Kivu and Ituri Provinces of the Democratic Republic of the Congo: a rapid genomic assessment. The Lancet infectious diseases. Available at: http://dx.doi.org/10.1016/S1473-3099(19)30118-5.
>
> Nsio, J. et al., 2019. 2017 Outbreak of Ebola Virus Disease in Northern Democratic Republic of Congo. The Journal of infectious diseases. Available at: https://academic.oup.com/jid/advance-article-pdf/doi/10.1093/infdis/jiz107/28269521/jiz107.pdf

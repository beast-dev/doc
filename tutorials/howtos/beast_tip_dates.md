---
title: How to specify dates for tips
keywords: software, molecular clocks, tipdates, beast, beauti
last_updated: August 2, 2017
tags: [how-to]
summary: ""
sidebar: beast_sidebar
permalink: tip_dates.html
folder: beast
---

{% include warning.html content="This page unfinished." %}

A key feature of BEAST is the ability to specify dates for individual sequences (i.e., tips in the tree --- so called tipdates). This is important when the organism being studies is evolving on the same scale as the time range of the tree. Common cases of this are fast evolving pathogens such as viruses and bacteria or DNA recovered from relatively ancient material such as sub-fossil bones.

By having sequences sampled through time, BEAST is able to estimate the timescale of the tree and the rate of evolution. See [Rambaut (2000)](#references) for a description of how this is done (albeit in a maximum likelihood rather than Bayesian context). See [Dummond et al 2003](#references) for a review of the idea of 'measurably-evolving populations'. 

Dates are generally specified as a calendar date such as 4 May 1971, an amount of time since some point in the past such as 200 days since diagnosis, or an 'age' such as 10,000 years before present. Which ever way they are specified, BEAST will convert these dates to a standard time axis that runs backwards from the most recent tip which becomes the zero point in the axis. If provided as calendar dates then the timescale will be in units of years. For other forms of dates the units of time will be that of the dates provided - days, years, thousands of years etc. Within BEAST, times on this timescale are referred to as 'heights' --- i.e., root height, node heights etc. --- which comes from [terminology in computer science](https://en.wikipedia.org/wiki/Tree_(data_structure)) where trees are drawn with tips at the bottom of the page and the root at the top so its time scale is how high up the page it is.

## Importing dates into BEAUti

When a data set has been loaded into BEAUti, the `Tips` panel will show a table with all the taxon labels and their assigned dates. By default all the taxa are assumed to have a date of zero. This will be correct if all the sequences were sampled at approximately the same point in time (at least on the time scale of their evolutionary history). Click the option `Use tip dates` to tell BEAUti that you wish to use them. At this point all the controls will become available and you can provide dates for the sequences. If you loaded [this file (an alignment of 35 RSV viruses)](/tutorials/howtos/files/RSVA.nex) the table would look like this:
 
{% include image.html file="tipdates1.png" prefix="tutorials/howtos/" %}

[BEAUti](beauti) provides a number of ways of loading dates for the sequences of an alignment and a great deal of flexibility in the format of those dates. In this case the dates are given as two digit years prefixed by an `@` symbol. This is not a standard but just how the creator of the data chose to label these sequences. The most straight forward (but laborious) way of setting the dates is simply to edit the value in the table:

{% include image.html file="tipdates2.png" prefix="tutorials/howtos/" %}

Here the two digit year was 93 referring to 1993 (presumably not 1893 or though this is not implausible) so we enter that value in the date column. In this column BEAST is expecting dates on a continuous time-line so it should be in decimal years (i.e., months are 1/12 or 0.08333 of a year and days are approximately 0.00274 of a year). Once one date has been specified, BEAST's timescale is set: 

{% include image.html file="tipdates3.png" prefix="tutorials/howtos/" %}

In the image above, the first sequence has been given the date 1993 and BEAST has given it the height of 0 (it is now the most recently sampled sequence). All the other sequences have a height of 1993 --- i.e., BEAST thinks they have been sampled 1993 years before the first one in the year 0 (technically, in the Gregorian calendar there is no year zero but we can ignore that poor decision).  So we need to set the dates for all the other sequences. For convenience when many sequences have the same date, you can select multiple rows in the table and then click the `Set Dates` button to set the same value to all of them. You can also `Clear Dates` for selected rows but that is the same as setting their date to zero.

{% include note.html content="If the dates are actually ages (i.e., time since the present) they can be specified as negative numbers. In this case, zero will be assumed to be the present day." %} 

## Extracting Dates from Taxon Labels

Setting the dates of the taxa
By default all the taxa are assumed to have a date of zero. This will be correct if all the sequences were sampled at approximately the same point in time (at least on the time scale of their evolutionary history). In this case, the Dengue-4 virus have been sampled at various dates going back to the 1950s. The actual year of sampling is given in the name of each taxon and we could simply edit the value in the Date column of the table to reflect these. However it is more convenient to use the Guess Dates button at the top of the window. Clicking this will make the following dialog box appear:

 beauti2.png

This operation attempts to guess what the dates are from information contained within the taxon names. Generally this works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field (such as the Dengue-4 sequences, above) then you can specify how to find the one that corresponds to the date of sampling. You can either specify the order that the date field comes (e.g., first, last or various positions in between) or specify a prefix (some characters that come immediately before the date field in each name). For the Dengue-4 sequences you select last from the drop-down menu for the order. If you left it at first then all taxa would be given a date of "4" taken from the second character of each name.

In this dialog box, you can also get BEAUti to add a fixed value to each guessed date. In this case the value "1900" has been added to turn the dates from 2 digit years to 4 digit. Any dates in the taxon names given as "00" would thus become "1900". If these dates were actually referring to the year 2000 then selecting the next option would convert them correctly, adding 2000 to any date less than 07.

When you press OK the dates will appear in the appropriate column of the main window. You can then check these and edit them manually as required. At the top of the window you can set the units that the dates are given in (years, months, days) and whether they are specified relative to a point in the past (as would be the case for years such as 1984) or backwards in time from the present.


## References

Rambaut (2000) Estimating the rate of molecular evolution: incorporating non-contemporaneous sequences into maximum likelihood phylogenies. [*Bioinformatics*, **16**: 395-399.](https://academic.oup.com/bioinformatics/article/16/4/395/187233/Estimating-the-rate-of-molecular-evolution)

Drummond, Pybus, Rambaut, Forsberg and Rodrigo (2003) Measurably evolving populations. [*Trends in Ecology and Evolution*, **18**: 481-488](https://doi.org/10.1016/S0169-5347(03)00216-7)

{% include links.html %}

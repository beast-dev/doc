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

## Extracting Dates from Taxon Labels

Setting the dates of the taxa
By default all the taxa are assumed to have a date of zero. This will be correct if all the sequences were sampled at approximately the same point in time (at least on the time scale of their evolutionary history). In this case, the Dengue-4 virus have been sampled at various dates going back to the 1950s. The actual year of sampling is given in the name of each taxon and we could simply edit the value in the Date column of the table to reflect these. However it is more convenient to use the Guess Dates button at the top of the window. Clicking this will make the following dialog box appear:

 beauti2.png

This operation attempts to guess what the dates are from information contained within the taxon names. Generally this works by trying to find a numerical field within each name. If the taxon names contain more than one numerical field (such as the Dengue-4 sequences, above) then you can specify how to find the one that corresponds to the date of sampling. You can either specify the order that the date field comes (e.g., first, last or various positions in between) or specify a prefix (some characters that come immediately before the date field in each name). For the Dengue-4 sequences you select last from the drop-down menu for the order. If you left it at first then all taxa would be given a date of "4" taken from the second character of each name.

In this dialog box, you can also get BEAUti to add a fixed value to each guessed date. In this case the value "1900" has been added to turn the dates from 2 digit years to 4 digit. Any dates in the taxon names given as "00" would thus become "1900". If these dates were actually referring to the year 2000 then selecting the next option would convert them correctly, adding 2000 to any date less than 07.

When you press OK the dates will appear in the appropriate column of the main window. You can then check these and edit them manually as required. At the top of the window you can set the units that the dates are given in (years, months, days) and whether they are specified relative to a point in the past (as would be the case for years such as 1984) or backwards in time from the present.

{% include links.html %}

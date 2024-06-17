---
title: NEXUS format metacomments
permalink: nexus_metacomments.html
sidebar: beast_sidebar
tags: [reference]
keywords: nexus, beast
author: Andrew Rambaut
last_updated: August 2, 2017
summary: "This is a brief description of the 'metacomment' format used by BEAST to annotate elements in the standard NEXUS format. This additional information is put in comments so that existing programs should read and ignore them. This format is used by BEAST to insert information into the sampled trees."
toc: false
folder: beast
---

## Metacomments in trees

The standard format for trees in NEXUS format is:

```
<node>:<branch_length>
```

Where `<node>` can be a tip label or a subtree:

`tip1:0.01` or `(<node>:<branch_length>, <node>:<branch_length>):0.01`

Attributes make use of the comment feature of the NEXUS format (a comment is enclosed in square brackets). More specifically, `[&<attribute>]` is used with the ampersand denoting "metadata".

Node attributes are put before the colon:

```
<node>[&height=100.0]:<branch_length>
```

Branch attribute are put after the colon:

```
<node>:[&bootstrap=75.0]<branch_length>
```

The general form of a metacomment is a list of key value pairs: `[&<name>=<value>,<name>=<value>,...]`

where `<name>` is a token and value is a number, a token (i.e., "true" or "red"), a quoted string or a list of values. Lists of values are given as:

```
<name>={<value>,<value>,..}
```

Some examples

```
[&colour={<colour1>,<time1>,<colour2>,<time2>,<colour3>}]
```

```
tip1:[&colour={0, 8.0, 1, 12.0, 0}] 20.0
```

This is a branch annotation with the colour starting at the time as 0, changing to 1 at time 8.0, reverting to 0 at time 12.0 and then remaining that colour up to time 20.0 (the total length of the branch).

Note that the metacomment doesn't suggest any structure to the data within them and it is up to the parsing software to make sense of them.

A regex to match most metacomments is `("[^"]*"+|[^,=\s]+)\s*(=\s*(\{[^=}]*\}|"[^"]*"+|[^,]+))?`

{% include links.html %}
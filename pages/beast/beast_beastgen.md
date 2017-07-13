---
title: BEASTGen
permalink: beastgen.html
sidebar: beast_sidebar
tags: [getting-started]
keywords: software, beastgen, beast
last_updated: July 13, 2017
summary: "BEASTGen"
toc: true
folder: beast
---

## BEASTGen

This package contains a simple program for transforming data from one format to another.

The program is run using the following command line:

```bash
beastgen <template_filename> <input_filename> <output_filename>
```

For example:

```bash
beastgen to_fasta.template dengue.nex dengue.fasta
```

This will change the NEXUS file into a FASTA file by using the to_fasta template (a FASTA to NEXUS template is also given in the templates folder).

### How a template file works

BEASTGen works by parsing and loading the data in the input file and then inserting it at the appropriate places in the template to construct the output file. 
The template contains tags which are replaced by values or data from the input file. 
For example, the tag ${taxon_count} will be replaced by the number of taxa in the input file's alignment. 
Here are the built-in variables that can be used:

<dl>
  <dt>taxon_count</dl>
  <dd>The number of taxa in the alignment</dd>
  
  <dt>site_count</dt>
  <dd>The number of sites in the alignment</dd>
  
  <dt>filename</dt>
  <dd>The name of the input file</dd>
  
  <dt>filename_stem</dt>
  <dd>The name of the input file without any suffix</dd>
  
  <dt>taxa</dt>
  <dd>A list of taxa that can be iterated over (see below)</dd>
  
  <dt>alignment.sequences</dt>
  <dd>A list of sequences that can be iterated over (see below)</dd>
</dl>

Additional variables can be set from the command line using the '-D' option. 
This is explained below in more detail.

The last two variables are treated differently - they are not simple values but lists of objects. 
To access these, the <#list>...</#list> tag is used. 
This works by inserting the text within the <#list>...</#list> pair repeatedly within the output file once for each object in the list. 
To demonstrate this, here is the contents of the 'to_fasta.template' file which converts sequence data into a FASTA format:

```bash
<#list alignment.sequences as sequence>
>${sequence.taxon.id}
${sequence.data}
</#list>
```

This iterates over the alignment, setting a variable (called 'sequence') to point to each sequence in turn. 
The text within is then expanded using this variable. 
The variable, sequence, is actually an object which contains two parts (taxon and data). 
The tag '${sequence.data}' gets replaced with the actual sequence data and '${sequence.taxon.id}' gets replaced with the name of the taxon. 
So the above template will produce something like:

```xml
>taxon_1
ATGACCTTA...
>taxon_2
ATGACCTTA...
.
.
.
```

### Example uses of BEASTGen

BEASTGen will detect and read alignments from BEAST XML format (as well as Nexus & FASTA) so when combined with the example templates 'to_nexus.template' and 'to_fasta.template' is useful for extracting data from BEAST files to load into other software.

BEASTGen can also be used to create BEAST XML files (as its name suggests). 
A template can be based on a BEAST XML file and be used to 'insert' data from another data file to create a file ready to run in BEAST. 
This can be useful for simulation studies or perhaps to create servers that run specific BEAST analyses for user uploaded data. 
An example of a template to generate a BEAST file is included in the examples folder ('beast_example.template'). 
This was generated using BEAUti and then modified to turn it into a template. 
The top of the file looks like this:

```xml
<beast>

    <!-- The list of taxa to be analysed (can also include dates/ages).          -->
    <!-- ntax=${taxon_count}                                                                 -->
    <taxa id="taxa">
        <#list taxa as taxon>
        <taxon id="${taxon.id}">
            <date value="${taxon.date}" direction="forwards" units="years"/>
        </taxon>
        </#list>
    </taxa>

    <!-- The sequence alignment (each sequence refers to a taxon above).         -->
    <!-- ntax=${taxon_count} nchar=${site_count}                                                      -->
    <alignment id="${alignment.id}" dataType="nucleotide">
        <#list alignment.sequences as sequence>
        <sequence>
            <taxon idref="${sequence.taxon.id}"/>
            ${sequence.data}
        </sequence>
        </#list>
    </alignment>
```

This creates a list of taxon elements one for each in the alignment. 
Dates are also set for each taxon and these are obtained from the taxon names in a similar way to the BEAUti feature 'guess dates'. 
The extraction of dates from taxon names is controlled by a number of command line options:

<dl>
  <dt>-date_order</dt>
  <dd>The order of the date field (negative numbers from last)</dd>
  
  <dt>-date_prefix</dt>
  <dd>A string that is the prefix to the date field</dd>
  
  <dt>-date_regex</dt>
  <dd>A string that gives the regular expression to match the date</dd>
  
  <dt>-date_format</dt>
  <dd>A string that gives the date format for parsing</dd>
  
  <dt>-date_precision</dt>
  <dd>Specifies the date is a variable precision yyyy-MM-dd format</dd>
</dl>

An additional command line option '-D' allows the user to specify additional variables and their values that are specific to a BEASTGen operation. 
For example, with a BEAST XML template, instead of fixing the chain length to a specific value, the template could use tag ${chain_length} and this will be replaced by a value for a variable called 'chain_length'. 
In this case the variable is set in the command line with the option '-D "chain_length=10000000"'. 
So wherever, ${chain_length} is found in the template, the output file will have '10000000'. 
Multiple variables can be set using this option:

```bash
beastgen -D "chain_length=10000000,log_every=1000" beast_example.template dengue.nex
```

The template 'beast_example.template' has the following line:

```xml
<mcmc id="mcmc" chainLength="${chain_length}" autoOptimize="true" operatorAnalysis="${filename_stem}.ops">
```

This will use the 'chain_length' variable from the command line and the automatically set 'filename_stem' variable to create the following line in the output file:

```xml
<mcmc id="mcmc" chainLength="10000000" autoOptimize="true" operatorAnalysis="dengue.ops">
```

The input file name was 'dengue.nex' so ${filename_stem} gets replaced with the name without the '.nex' suffix.

{% include links.html %}
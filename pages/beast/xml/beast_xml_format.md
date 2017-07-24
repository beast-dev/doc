---
title: XML Format
permalink: xml_format.html
sidebar: beast_sidebar
tags: [reference]
keywords: software, xml, format, beast
last_updated: July 24, 2017
toc: true
folder: beast
---

## Introduction to the XML language and the BEAST input format

XML (eXstensible Mark-up Language) is not a file format in itself but rather a set of rules for defining a file format that can be easily (and reliably) read by software and still read and edited by humans. BEAST uses a particular format that has been defined according to XML rules. What follows is a basic description of how an XML based document is written. The exact details of BEAST's format will come afterwards.

Generally, in XML spaces, tabs and new-lines or carriage-returns are treated as the same and are called whitespace. Whitespace characters are used to seperate words in the file but it doesn't matter how many or in what combination they are used. Thus parts of the file can be split onto two lines or indented in an arbitrary (and presumably aesthetically pleasing) manner.

Comments that are ignored by the software can be inserted by surrounding them by "". A comment can contain just about any text (except the string, '--'). Thus a comment may look like this:

```xml
<!-- This is a comment -->
```

### The elements of an XML document

An XML file consists of elements which define particular parts of the information. For example, a DNA sequence may be defined as follows:

```xml
<sequence>
	ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
</sequence>
```

Note the `<sequence>...</sequence>` pair, this forms a 'sequence element'. An element like this has _contents_ which is everything that lies between the pair, in this case some raw nucleotide data.

### The attributes of an element

An element can have attributes which specifies extra information for the element. For instance, we could tell the sequence element that the data it contains is nucleotide:

```xml
<sequence dataType="nucleotide">
	ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
</sequence>
```

The attribute value is always given in quotes (`"..."`) even if it is just a number.

### The contents of an element

An element can also contain other elements or a mixture of elements and raw data:

```xml
<alignment>
	<sequence dataType="nucleotide">
		<taxon id="Brazi82"/>
		ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
	</sequence>
	<sequence dataType="nucleotide">
		<taxon id="ElSal83"/>
		ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
	</sequence>
</alignment>
```

Here the alignment elements contains two sequence elements.	An element can also contain nothing, in which case it is written like this:

```xml
<taxon name="chimpanzee"/>
```

Note the '/' at the end. This is called an empty element.
With these concepts we can build an	XML document. We start with some header information that specifies that the document is a type of XML format:

```xml
<?xml version="1.0"?>
```

This is followed by a `beast` element which contains all the information that BEAST requires to run.

```xml
<?xml version="1.0"?>
<beast>
	<alignment>
		<sequence dataType="nucleotide">
			<taxon id="Brazi82"/>
			ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
		</sequence>
		<sequence dataType="nucleotide">
			<taxon id="ElSal83"/>
			ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
		</sequence>
	</alignment>
</beast>
```

### Referring to an element from earlier in the document

A special pair of attributes, 'id' and 'idref' are used to uniquely identify an element and then refer to it later in the document. For example, we may define a 'taxon' element and give it the id 'chimp':

```xml
<taxon id="chimp" name="chimpanzee"/>
```

The actual value of the id attribute can be anything but must be unique across the whole document (i.e., unique amongst all other id attributes whatever element they are in). Later in the document we need to make a reference to that element (basically make a connection from this point in the document to that element). For example, the sequence that actually contains chimpanzee nucleotide data needs to refer to the taxon elements that defines the chimp species:

```xml
<sequence dataType="nucleotide">
	<taxon idref="chimp"/>
	ATGATCGTAGTATCGTAGCTCGGTTTTTACGATCGGAC
</sequence>
```

The taxon element here uses the 'idref' attribute and is thus referring to the taxon element that was previously defined with the 'id' attribute. When an element uses the idref attribute it should contain no other attributes and have no contents (i.e., use the short, empty, form). The same taxon element can be referred to in other places as well such as at the leaf node (tip) of a phylogeny. In this way links between elements can be made.
Here is a more complete BEAST XML format file. It defines 5 taxa each with a date which are contained with a taxa element. An alignment come next with one sequence for each taxon containing a reference to the taxon plus the sequence data.

```xml
<?xml version="1.0"?>
<beast>
	<taxa id="taxa1">
		<taxon id="Brazi82"><date value="1982" units="years" direction="forwards" /></taxon>
		<taxon id="ElSal83"><date value="1983" units="years" direction="forwards" /></taxon>
		<taxon id="ElSal94"><date value="1994" units="years" direction="forwards" /></taxon>
		<taxon id="Indon76"><date value="1976" units="years" direction="forwards" /></taxon>
		<taxon id="Indon77"><date value="1977" units="years" direction="forwards" /></taxon>
	</taxa>

	<alignment id="alignment1">
		<!-- Dimensions ntax=17 nchar=1485 -->
		<sequence>
			<taxon idref="Brazi82"/>
	  		ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCAT
		</sequence>
		<sequence>
			<taxon idref="ElSal83"/>
			ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCAT
		</sequence>
		<sequence>
			<taxon idref="ElSal94"/>
			ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCAT
		</sequence>
		<sequence>
			<taxon idref="Indon76"/>
			ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCAT
		</sequence>
		<sequence>
			<taxon idref="Indon77"/>
			ATGCGATGCGTAGGAGTAGGAAACAGAGACTTTGTGGAAGGAGTCTCAGGTGGAGCAT
		</sequence>
	</alignment>
</beast>
```
{% include links.html %}
---
title: TreeLogAnalyser
permalink: treeloganalyser.html
sidebar: beast_sidebar
tags: [getting-started]
keywords: software, treeloganalyser, beast
last_updated: July 13, 2017
summary: "TreeLogAnalyser"
toc: true
folder: beast
---

## TreeLogAnalyser

This program assists in summarizing the clades information from a sample of trees produced by BEAST and named as ***.trees** file.

### Program Arguments

<dl>
  <dt>-burnin</dt>
  <dd>"the number of states to be considered as 'burn-in' [default = none]";</dd>
  
  <dt>-export file-name</dt>
  <dd>"name of file to export";</dd>
  
  <dt>-limit</dt>
  <dd>"don't export trees with support lower than limit [default = 0.0]";</dd>
  
  <dt>-probability</dt>
  <dd>"credible set probability limit [default = 0.95]";</dd>
  
  <dt>-max</dt>
  <dd>"export no more than max trees [default = all]";</dd>
  
  <dt>-short</dt>
  <dd>"use this option to produce a short report";</dd>
  
  <dt>-help</dt>
  <dd>"option to print this message".</dd>
</dl>

### Running TreeLogAnalyser

1) Simple command to run TreeLogAnalyser from beast.jar which is available in the /lib folder of released BEAST package

```bash
java -cp beast.jar dr.app.tools.TreeLogAnalyser inputTrees.trees
```

2) Or create a script file in the /bin folder of released BEAST package

### Windows

treeloganalyser.cmd

```bash
@echo off
setlocal
if ""=="%BEAST%" set BEAST=%~dp0%..
set BEAST_LIB=%BEAST%\lib
java -Xms64m -Xmx1024m -Djava.library.path="%BEAST_LIB%" -cp "%BEAST_LIB%/beast.jar" dr.app.tools.LogAnalyser %*
```

### Mac / Linux / Unix

treeloganalyser.sh

```bash
#!/bin/sh

if [ -z "$BEAST" ]; then
	## resolve links - $0 may be a link to application
	PRG="$0"

	# need this for relative symlinks
	while [ -h "$PRG" ] ; do
	    ls=`ls -ld "$PRG"`
	    link=`expr "$ls" : '.*-> \(.*\)$'`
	    if expr "$link" : '/.*' > /dev/null; then
		PRG="$link"
	    else
		PRG="`dirname "$PRG"`/$link"
	    fi
	done

	# make it fully qualified
	saveddir=`pwd`
	BEAST0=`dirname "$PRG"`/..
	BEAST=`cd "$BEAST0" && pwd`
	cd "$saveddir"
fi

BEAST_LIB="$BEAST/lib"
java -Xms64m -Xmx1024m -Djava.library.path="$BEAST_LIB" -cp "$BEAST_LIB/beast.jar" dr.app.tools.TreeLogAnalyser $*
```

{% include links.html %}
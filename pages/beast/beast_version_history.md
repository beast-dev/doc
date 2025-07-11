---
title: Version History
permalink: version_history.html
sidebar: beast_sidebar
tags: [reference]
keywords: beast
last_updated: April 26, 2024
summary: 
toc: false
folder: beast
---

### Version 10.5.0  released 1st July 2025

- New Major Version - BEAST X v10.5.0

  [Why is it called BEAST X?](faq.html#q3)

#### New Features:

BEAST X (v10.5.0) significantly advances the flexibility and scalability of evolutionary models supported. Novel clock and substitution models leverage: a large variety of evolutionary processes; discrete, continuous and mixed traits with missingness and measurement errors; and fast, gradient-informed integration techniques that rapidly traverse high-dimensional parameter spaces.

#### Bug Fixes:
> See [Issue List](https://github.com/beast-dev/beast-mcmc/issues?q=is%3Aissue%20state%3Aclosed) for full list.	

### Previous versions:
```
Version 1.10.4  released 11th November 2018

    New command line options for BEAGLE v3.1:
        -beagle_threading_off | Turn off CPU multithreading in BEAGLE.
        -beagle_thread_count  | Limit how many CPU threads BEAGLE uses.
        By default BEAGLE tries to occupy the entire CPU (i.e., all the
        available cores). Use this option to share the CPU with other users
        or processes.

	Bug Fixes:
		Issue 1038: logcombiner -burnin issue.
```

```
Version 1.10.4  released 11th November 2018

    New command line options for BEAGLE v3.1:
        -beagle_threading_off | Turn off CPU multithreading in BEAGLE.
        -beagle_thread_count  | Limit how many CPU threads BEAGLE uses.
        By default BEAGLE tries to occupy the entire CPU (i.e., all the
        available cores). Use this option to share the CPU with other users or processes.

	Bug Fixes:
		Issue 1038: Issue specifying burnin in the command-line LogCombiner.
```

```
Version 1.10.3 released 28th August 2018

Important bug fix where performance was degraded when using BEAGLE 3 on CPUs (compared with using BEAGLE 2 or using GPUs).
```

```
Version 1.10.2 released 9th August 2018

A minor bug fix release: Fixes issue with using the Generalized Stepping Stone sampling with the GTR model.
```

```
Version 1.10.1 released 9th August 2018

A minor bug fix release: Fixes issues with selecting the GTR model in BEAUti and running under Java 10 on Macs.
```

```
Version 1.10.0 released 11th June 2018
New Features:

    BEAST v1.10 is a major new version with many new features focusing on flexibility of model specification, integration of different data sources, and increasing the speed and efficiency of sampling.
```

```
Version 1.8.4 released 17th June 2016
New Features:

    New structured list of citations printed to screen before running.
    Option ('-citation_file') to write citation list to file.
    Option in BEAUti Priors panel to set parameters to 'Fixed Value'

Bug Fixes:

    Issue 808: Set autoOptimize to false in the randomWalkOperator on 
               Pagel's lambda
    Issue 806: SRD06 in BEAUTi selecting incorrect options.
    Issue 799: Relative rate parameters for partitions were not being 
               created. All partitions within a clock model have a 
               relative rate if their substitution models are unlinked.
    Issue 798: Calculating pairwise distances was slow for big data sets -
               removed this (but initial values no longer suggested based
               on data).
    Issue 797: Removed 'meanRate' from Priors tab in BEAUti.
    Issue 794: Running with empty command line causes error.
    Issue 792: Check to see that the same likelihood isn't included multiple
               times into the density.
```

```
Version 1.8.3 released 13th February 2016
New Features:
    Generalized Stepping Stone sampling for Marginal Likelihood Estimation.
    Continuous quantile version of uncorrelated relaxed clock as option in
    BEAUti [from Li & Drummond 2012, MBE].
    Option in BEAUti to log complete histories in Markov Jump Counting.
    Jukes-Cantor added as an option for BEAUti nucleotide substition model.
    New tree transition kernel (SubTreeLeap operator) implementd in BEAST.
    Defaulting to randomizing rate categories for DiscretizedBranchRates.
    BEAUti 'guess dates' options are now persistent from run to run (and
    shared with Path-O-Gen/Tempest).
    Transmission tree model of Hall et al (2016) implemented.
    Fast, general multidimensional scaling (MDS) implemented.
    Clock panel in BEAUti simplified.
    Parameter linking available in Priors panel in BEAUti.
    Command line is logged into log file headers for reference.

Bug Fixes:


    Issue 779:  Ancestral sequence reconstruction broken with
                <mergePatterns> elements.
    Issue 772:  BEAUTi should include BranchRatesModels in prior density.
    Issue 768:  BEAUti creates a subtree slide operator with size zero when
                data is invariable.
    Issue 758:  Full evaluation error.
    Issue 304:  Label individual transition rate dimensions for CTM models
                in log files.
```

Version 1.8.2 released 5th March 2015
    Bug Fixes:

Issue 747: Robust counting with multiple partitions generates unique reference IDs in BEAUti and unique total counts for Tracer.
Issue 756:    FEE with random local clock + codon position partitions + multiple threads.
Issue 754:    BEAST v1.8.1 is not terminating leaving 'zombie' processes
Issue 749:    Multiple partitions with unlinked substitution models can turn on ancestral state reconstruction.
Issue 747:    Duplicate references in robust counting with multiple partitions.
Issue 745:    Removing an HPM from some parameters doesn't remove the model in the XML

Version 1.8.1 released 20th September 2014
    New Features:

Local clock (fixed) model as option in 'Clocks' panel. Creates local rate for each taxon set with enforced monophyly.
Multilocus models with discrete traits can be generated by BEAUti.
Selection filters in Taxon Set panel allows quick selection by name.
Improved robust counting under null distribution for measuring selection.
Can link parameters in BEAUti to sample together.
TreeAnnotator can specify burnin as number of states or trees.
    Bug Fixes:

Issue 747: Robust counting with multiple partitions generates unique reference IDs in BEAUti and unique total counts for Tracer.
Issue 743: Partitions in BEAUti should have the same number of taxa as the tree they are using.
Issue 741: Fix negative branch length issues when sampling taxa ages from precision, or set different (default) operator.
Issue 740: Add jitter option to continuous diffusion options in the BEAUti sites panel.
Issue 734: BEAUti duplicates leafHeight parameters in multiple partition XMLs.
Issue 729: Setting initial values for infinite uniform improper priors in BEAUTi.
Issue 728: Having taxon sets defined without heights when using a user starting tree causes parsing issues.
Issue 725: BEAUti duplicates parameter id of Markov jumps for multiple traits.
Issue 722: Complex charsets in nexus files don't parse.
Issue 714: Sets block not recognized in 1.8.
Issue 709: MCMC tab in BEAUti v1.8.0 problem with multiple unlinked loci.

Version 1.8.0 released 16th October 2013
    New Features:

Skygrid, multi-locus GMRF tree prior now available in BEAUti.
Specify marginal likelihood estimating options (path-sampling or stepping-stone) from within BEAUti (in the MCMC tab).
User-specified starting trees and UPGMA trees can now be rescaled to fit the specified taxon set ages in BEAUti. 
Clone model settings for selected (or all) partitions from a source partition to help manage large numbers of partitions.
The ability to set precisions for tip dates and sample uniformally from these added to BEAUti.
Lognormal Relaxed Random Walk added as an option for continuous data.
DiffusionRateStatistic logged for continuous data.
Variance/Covariance matrix logged for multivariate continuous data.
    Bug Fixes:

Issue 706:    model selection and improper priors
Issue 704:    Guess dates function is affected by timezone of user
Issue 703:    Error combining Markov jumps with codon partitioned substitution model
Issue 702:    set the cmctScale prior as default for the trait.clock.rate in discrete trait analysis in BEAuti and include the estimation of root frequencies in the nonreversible model
Issue 701:    diffusionRateStatistic set-up in BEAUti    
Issue 699:    BEAUti becomes unresponsive with 100s of partitions
Issue 695:    Implementing the Mk substitution model with BEAST and BEAGLE
Issue 694:    BEAUti refresh error
Issue 693:    Close all log files at the end of MCMC chain
Issue 691:    Nexus importer doesn't allow spaces in nucleotide ranges
Issue 688:    TreeAnnotator report selected tree
Issue 685:    Creating multiple user starting trees for different partitions
Issue 684:    Aspects of BEAUti model selection persists between windows
Issue 683:    RandomWalkOperator is reflecting negative value to positive
Issue 682:    Saving/loading files in BEAUti doesn't completely restore the model
Issue 680:    Count state changes option in BEAUti doesn't generate a markovJumpsTreeLikelihood
Issue 677:    Using Microsatellite loci for inferring one phylogenetic tree that uses all the loci
Issue 663:    Add new command line option to specify the precision to which the full evaluation checks are made
Issue 630:    Add a progress indicator to Path Sampling
Issue 628:    Unlinked clock models on multiple partitions fail to run
Issue 626:    Trouble unsetting robust counting when partitioning scheme remove
Version 1.7.5 released 14th Sept 2013
New Features

Added ability to add a starting value for the age of clades specified in BEAUti using taxon sets. This allows the user to ensure they are within any hard bounds specified in the priors table. These starting dates are now used by BEAST when generating an initial tree.
Ancestral recombination graph inference improved for two partition problems.
BEAST runs on NSF Keeneland supercomputer in a massively parallel fashion.
BEAUti site model options now has a 'Yang96' button to set a codon position model described in that paper.
TreeAnnotator now reads MrBayes clock trees.
Bug Fixes

Conditional reference prior for mutation rates returns a proper density when tree height is a random quantity.
Issue 672:	BEAUti duplicates rates in phylograms
Issue 671:	Exporting taxon names in Nexus format - names with apostrophes are enclosed in single quotes.
Issue 667:	Dollo ambiguity code is incorrect when using BEAUti's no data option.
Issue 666 (the issue of the BEAST):	BEAUti should read charsets from sets blocks in NEXUS files
Issue 665:	The coalescent based simulator doesn't respect hard bounds placed on MRCAs of taxon sets.
Issue 662:	Problem with reconstructing synonymous/non-synonymous change counts (BEAGLE must be used).
Issue 659:  BEAUti generates various Dollo ambiguity codes        

Version 1.7.4 released 12th Sept 2012
Critical Bug Fix

Issue 664:	Some priors are not being evaluated. 
Bug Fixes

Issue 661:	Fails to generate XML after particular sequence of options.
Issue 660:	For trait specification errors, error messages should include name of taxon.
Version 1.7.3 released 20th Aug 2012
New Features

Added 'precision' attribute in Date element to allow easy sampling of tip date when the date of sampling is known to a limited precision 
(see testTipDatePrecision.xml in examples/testXML folder).
Bug Fixes

       Issue 631:	Code generated by BEAUti for substitutions trees doesn't load into BEAST
       Issue 635:	*BEAST 'species' attributes are being created outside the <taxon> elements
       Issue 633:	Multivariate continuous trait analyses doesn't respect ancestral state reconstruction choices
       Issue 636:	Unlinked codons and state reconstruction in BEAUTi
       Issue 637:	birth-death sampling model seems to not work smoothly
       Issue 640:	GUI error when canceling species-tree analysis
       Issue 642:	Inappropriate default values provided for microsatellite model parameters in BEAUti
       Issue 643:	Unable to specify a MRCA node to reconstruct ancestral states
       Issue 645:	Discrete traits were generating ancestral reconstructions irrespective of the Ancestral States settings
       Issue 647:	Selecting robust counting was not creating the correct XML
       Issue 651:	Default Poisson prior for asymmetric BSSVS model of discrete traits is not standard
       Issue 652:	Some conditioning priors need to be evaluated before the data likelihood
       Issue 654:	Dollo model does not parse when BEAGLE is switched on.
       Issue 655:	Operator log sometimes attempts to write to locked folder causing exception
       Issue 656:	fix p=0 in Birth Death Serial Sampling Model
Other changes

       Restored non-BEAGLE AncestralTreeLikelihood availability - should be considered deprecated.
       Some changes to the default BEAGLE options to help discrete trait models run (SSE is switched off for non-nucleotide partitions and 
the default scaling scheme is now 'delayed').

Version 1.7.2 released 22nd May 2012
New Features

       Implement Pearson Correlation Statistic
Bug Fixes

       Issue 609:	BEAUti duplicate prefix issue for multi-partition
       Issue 611:	BEAUti misnames the rates log file for BSSVS
       Issue 612:	BEAUTi robust counting XML was not overriding the default
	                stripping of ambiguous sites.
       Issue 614:	Writing Newick user tree in BEAUti doesn't quote taxa with
	                space in the name
       Issue 615:	Multivariate traits generation by BEAUti was broken in
                        the 1.7.1 update
       Issue 618:	BEAUti errors in States panel
       Issue 619:	BEAUti bug: cannot select a defined taxon set in
                        "Apply to taxon set" at the Tip date sampling
       Issue 620:	BEAUti only allows taxon sets >1 taxa
       Issue 621:	r3896 and r4062 broke Skyride in BEAUti
       Issue 622:	BEAUti: the "big" updown operator is missing for
                        *BEAST when calibration
       Issue 623:	Logging multiple branch rate models in same tree log is broken
       Issue 624:	Check boxes in BEAUti States panel do not line up
       Issue 625:	BEAUti XML invalid for 1 codon-partitioned partition and any
                        2nd partition
       Issue 627:	Error renaming clock-group
       Issue 629:	BEAST doesn't appear to be using multithreading

Version 1.7.1 released 16th March 2012
New Features

       TN93 added to BEAGLE BEAST interface
       Added BEAGLE rescaling options to options dialog
       Added BEAGLE rescaling frequency commandline option
Bug Fixes

       Issue 571:	TN93 substitution model
       Issue 594:	BEAUti 1.7 has a redundant and non-functional Sequence Error
                        Model popup menu in SiteModelPanel
       Issue 595:	BEAUti: Markov jump state reconstruction not pushed to XML
       Issue 596:	BEAGLE performance has been degraded by choice of default
                        scaling option
       Issue 597:       Use of -beagle_instances is broken in BEAST 1.7
       Issue 598:	BEAUti prior plot crashes given offset
       Issue 599:	Robust counting of dN/dS was producing incorrect XML
       Issue 600:	Truncation of prior distribution not interoperating with
                        offset prior distribution
       Issue 601:	Markov Jumps counting of state changes wasn't generating
                        correct XML
       Issue 602:	BEAUti prior dialog crashes if choose Laplace
       Issue 603:	BEAUti prior dialog not validate truncation and uniform
                        bound and offset
       Issue 604:	RealNumberField FocusListener in prior dialog makes
                        many popups
       Issue 605:	BEAUti complains about missing values in traits files

Version 1.7.0 released 27th February 2012
New Features

        New Birth-Death speciation and epidemiological tree models. See citation
	panel in BEAUti for references.

	Multivatiate continuous trait evolution models including Brownian motion
	and Relaxed Random Walk models.

	Revamped Traits panel with more options for creating and editing traits.

	New 'Create Partition from Trait' button to create a new data partition
	from an imported discrete or continuous trait.

	New 'States' panel in BEAUti for ancestral reconstruction and sequence
	error model options for any data partition.

	Robust counting models to reconstruct number of substitutions (including
	synonymous/non-synonymous for coding sequences).

	Handling microsatellite data in BEAUti.

       	Clock group table in BEAUti to specify shared molecular clocks, and to
       	distinguish with clocks applied to microsatellite data.

       	Construct Phylogenetic Hierarchical models in Priors panel of BEAUti.

       	More 'Guess Dates' options for parsing dates from tip labels. Includes
       	parsing calendar dates.

        More prior probability options for parameters and updated prior dialog
        box.

        Species tree calibration for *BEAST in BEAUti.

        Added Metropolis-coupled "BEAST MC3" into BEAST release.
Bug Fixes

	Issue 43:	treeTraceAnalysis fails due to comment in newick importer
	Issue 51: 	log-normal prior in beauti not that usefull presentation
        Issue 85: 	Add search filter above Included and Excluded taxa in Taxon
                    	Sets panel of BEAUti
        Issue 86:	Missing validation in BayesianSkylineLikelihoodParser
        Issue 88:	LogCombiner should not allow thinning that is not compatible
                     	with the original sampling rate
        Issue 189:	Gamma quantile fails on values close to 0 or 1
        Issue 228:	LogCombiner mishandles trees with attributes
        Issue 312:	BEAST continues to run (inappropriately) when sequence contains
                     	invalid character
        Issue 397: 	*BEAST in BEAUti is broken
        Issue 398: 	BEAUti text message overlaps with button
        Issue 399: 	Binary for TreeStat packaged with BEAST v1.6 has wrong version
                     	 	number and icon
        Issue 403: 	Starting tree generated with constraints by BEAUti is not correct
                     	 	XML for BEAST
        Issue 404: 	Make "Median heights" as the default of nodeHeightsCombo
        Issue 405: 	RandomWalkOperator with reflecting boundary can grind to a halt
        Issue 407: 	*BEAST needs to log species tree in { }, otherwise TreeAnnotator
                     	 	keeps coming up with null exception on species tree
        Issue 408: 	TreeAnnotator crashes with Null Pointer Exception on malformed
                     	 	metacomment
        Issue 409: 	BEAUti should explicitly generate uniform priors
        Issue 410: 	"Improper priors" on posterior statistics
	Issue 411: 	Incorrect validation and error message for random local clock
	                in BEAUti
	Issue 412: 	BEAUti generates randomWalkOperator instead of
	                randomWalkIntegerOperator for branchRates.categories
	Issue 413: 	BEAUti: duplicate class PartitionModelOptions causes model
	                link conflict
	Issue 414: 	BEAUti: incorrect xml for multi-alignment when given complex
	                combination of clock model and tree model
        Issue 416: 	Laplace prior parser should use scale same as BEAUti
        Issue 417: 	BEAUti growthRate related XML causes -INF likelihood
        Issue 418: 	Set maximun fraction digits for numbers displayed in BEAUti
                     	prior panel
        Issue 419: 	BEAUti RealNumberField should not throw Exception all the time
        Issue 420: 	Add error message : Partitions cannot have the same name
        Issue 422: 	BEAUti: add validation to check whether modified prior
                     	initial value is between the boundary
        Issue 423: 	delta exchange operator discription is wrong
        Issue 425: 	BEAUti can't re-link subst models anymore
        Issue 426: 	BEAUti does not preserve model settings when re-linking
        Issue 427: 	BEAUti generates a mergePatterns even when it is enclosing
                     	a single patterns element
        Issue 429:	Specifying more than 2 -temperatures on the command line
                     	fails in parsing arguments
        Issue 432: 	More detail for error message: *BEAST special part
                     	generation has failed.
        Issue 433: 	Typo in BEAUTi and example files
        Issue 434: 	BEAUti: Initial value missing from prior dialog
        Issue 435: 	UniformIntegerOperator did not include upper in the value
        Issue 438: 	BEAST should tell you what frequencies belong to which
                     	partition
        Issue 442: 	BEAUti: taxon set table does not refresh after changing
                     	tree model
        Issue 443: 	BEAUti: change alpha default prior into Exponential
                     	mean=0.5 offset=0.0
        Issue 444: 	BEAUti: model table select row not update
        Issue 445: 	BEAUti: clock rate configuration is not consistent
                     	between clock model panel and prior panel
        Issue 446:	no indication that Checkboxes and rate text boxes are not
                     	editable in Clock Group table
        Issue 447: 	The Birth-Death models in the Trees Panel show a
                     	citation - other models do not
        Issue 448:	Cannot load 2 nexus files with the same name
        Issue 451:	BEAST suggests using a non-integer for randomWalkIntegerOperator
        Issue 457:	BEAST should raise an error if binary dataType set but data is
                     	not binary
        Issue 466:	Cannot run beauti / beast from git-svn clone
        Issue 467:	Native support for likelihoods is broken in linux
        Issue 469:	BEAUTi Covarion generation fails to add hfrequencies to operators.
        Issue 477:	Unable to calibrate species tree in BEAUti under *BEAST
        Issue 481:	Improve reporting of XML errors
        Issue 493:	Beauti does not show ploidy type for EBSP
        Issue 499:	Strip out should be false in the patterns when using binary
                     	Covarion Model
        Issue 500:	remove RandomWalkIntegerOperator operator from relaxed clocks xml
        Issue 501:	Random Local Clock model has a bug when using multi-tree-likelihood
        Issue 502:	BEAUti prior panel: the lognormal prior chart cannot accept
                     	negative numbers for M=log(mean), but it should
        Issue 503:	BEAUti operator analysis should be chosen as default
        Issue 505:	BEAUti Taxon Sets panel should have species rather than taxa
                     	for *BEAST
        Issue 506:	The gamma prior is not reverted to what it was previously if
                     	*BEAST in unselected.
        Issue 513:	*BEAST constraint of the 'species' trait
        Issue 522:	BEAUti Taxon Sets panel should not allow to add taxon if no data
        Issue 523:	BEAUti Traits panel buttons enable/disable should adapt to data
                     	and traits
        Issue 527:	change bound of Uniform prior into Double MAX or MIN
        Issue 528:	the BEAST parser for UniformPrior should throw a parser exception
                     	if you attempt to give a bound at infinity.
        Issue 529:	proper priors to determine calibration in BEAUti
        Issue 532:	compileNativeLinux.sh uses non-optimal / fixed compile settings
        Issue 533:	Taxon set validation fires twice
        Issue 535:	SpeciesTreesPanel are not necessary
        Issue 537:	Robust counting code generation not producing good XML
        Issue 538:	move tree prior panel to the right of table
        Issue 540:	MCMC chain limited to 2^31-1 (Integer.MAX_VALUE)
        Issue 541:	BEAUti generates wrong xml when enforcing a uniform prior on
                     	node ages
        Issue 545:	BEAUti taxon set compatibility should be focused on each tree
        Issue 548:	Beauti does not generate functional xml for msat data analysis
        Issue 549:	BeautiOptions.updateAll() stop user to customize clock rates
        Issue 557:	Removing a partition doesn't remove its unique taxa
        Issue 560:	wrong dependency to dr.evomodel.newtreelikelihood.
                     	TreeLikelihood
        Issue 562:	BEAUTi : Birth Death Epidemiology Model update
        Issue 565:	hasIdenticalTaxa(List<AbstractPartitionData> partitionDataList)
                     	gives wrong boolean
        Issue 568:	same pattern id given to two different partitions
        Issue 569:	BirthDeathEpidemiologyModel bug
        Issue 570:	bug of unique attribute in pattern lists
        Issue 572:	BEAUti tmrca gives wrong prefix
        Issue 573:	BEAUti taxon set panel taxon set table incorrectly auto
                     	selection
        Issue 575:	BEUAti should check for '--' in generated XML comments.
        Issue 576:	BEAUti calibrated Yule validation is missing one logic
        Issue 577:	BEAUti generator for *BEAST + calibrated Yule is broken
        Issue 578:	Add BEAST MC3 dialog and make it available in BEAST release
                     	package
        Issue 579:	BEAUti : empty species set is created in *BEAST
        Issue 580:	BEAUti *BEAST did not check the empty species value
        Issue 581:	BEAUti prior dialog cannot accept 0 for typing 0.???
        Issue 582:	BEAUti Species Set cannot revert back to Taxon Set if
                     	uncheck *BEAST
        Issue 584:	BEAUti prior dialog validation bugs
        Issue 585:	BEAUti keep getting "No leaf nodes selected" error message
        Issue 586:	BEAUti prior dialog Cancel not working
        Issue 587:	BEAUti prior dialog ignores validation in the text field if
                     	pressing Enter key
        Issue 588:	Validation not working properly for PriorDialog
        Issue 589:	BEAUti lost Uniform bound validation
        Issue 590:	BEAUti prior dialog GUI logic bug
        Issue 591:	BEAUti prior dialog Truncated fields do not have correct
                     	validation regarding parameter bounds
        Issue 592:	BEAUti tmrca name is not updated in prior panel if changing
                     	its name in taxon set panel
        Issue 593:	TruncatedDistribution throw UnsupportedOperationException
                     	for mean and variance

Version 1.6.2 released 23rd August 2011
New Features

        adds a "Beta Diversity" statistic to TreeStat program. This statistic
        takes a tree of two sets of species and computes the percentage of
        the tree length shared by the two taxa sets.

        allows BEAUti 'Guess Dates' dialog to parse out calendar dates from
        the taxon names.

        Updates all native nucleotide likelihood core files into 64 bit.
        For 32 bit machines, the user needs to rename the 32 bit files
        (e.g. for Windows, rename NucleotideLikelihoodCore32.dll into
        NucleotideLikelihoodCore.dll) to replace the current 64 bit files.
Bug Fixes

        Issue 423:	delta exchange operator description is wrong
        Issue 424:	TraitGuesser not extracting match within brackets (braces)
        Issue 434:	BEAUti: Initial value missing from prior dialog
      * Issue 435:	UniformIntegerOperator did not include upper in the value
        Issue 454:	BEAUti: all the taxon sets are deleted when link/unlink tree
        Issue 460:	LogCombiner uses localized decimal point when writing trees
      * Issue 464:	Localized decimal indicator still being used in log files
        Issue 472:	Don't report operator suggestions when autooptimize is on
      * Issue 473:	BEAGLE default options should be CPU/Double
        Issue 474:	Partition table shows 0 taxa for trait partitions
        Issue 478:	TipDates table cell editor large the text font size when
	                 changing the value
      * Issue 479:	Multi-block charset parsing and handling in BEAUTi
        Issue 484:	beagle_scaling command line flag turns on BEAGLE in the
                         absence of any other flags
        Issue 486:	BEAST cannot find NucleotideLikelihoodCore.dll in Windows
        Issue 487:	BEAUti: Wrong error message with poorly constructed priors
        Issue 488:	BEAUti: Poor parsing of Poisson rate and offset in Priors
        Issue 489:	Default Laplace prior mean is 0.01
      * Issue 491:	BEAUti parameter should keep uniform upper and lower
        Issue 492:	Should BEAUti use 'NNN' rather than 'N' for empty alignment,
                         to allow for codon-partitioned models
        Issue 494:	BEAUti *BEAST does not need link tree prior option
        Issue 495:	Tree annotator needs to validate the duplicate taxon name

Version 1.6.1 released 15th October 2010
Bug Fixes

        Issue 398: BEAUti text message overlaps with button
        Issue 399: Binary for TreeStat packaged with BEAST v1.6 has wrong version
                   number and icon
        Issue 403: Starting tree generated with constraints by BEAUti is not correct
                   XML for BEAST
        Issue 404: Make "Median heights" as the default of nodeHeightsCombo
        Issue 405: RandomWalkOperator with reflecting boundary can grind to a halt
      * Issue 407: *BEAST needs to log species tree in { }, otherwise TreeAnnotator
                   keeps coming up with null exception on species tree
        Issue 408: TreeAnnotator crashes with Null Pointer Exception on malformed
                   metacomment
      * Issue 410: "Improper priors" on posterior statistics
        Issue 411: Incorrect validation and error message for random local clock
                   in BEAUti
      * Issue 412: BEAUti generates randomWalkOperator instead of randomWalkIntegerOperator
                   for branchRates.categories
        Issue 413: BEAUti: duplicate class PartitionModelOptions causes model link conflict
        Issue 414: BEAUti: incorrect xml for multi-alignment when given complex
                   combination of clock model and tree model
        Issue 416: Laplace prior parser should use scale same as BEAUti
        Issue 417: BEAUti growthRate related XML causes -INF likelihood
        Issue 418: Set maximun fraction digits for numbers displayed in BEAUti prior panel
        Issue 419: BEAUti RealNumberField should not throw Exception all the time
        Issue 422: BEAUti: add validation to check whether modified prior initial value
                   is between the boundary

Version 1.6.0 released 17th September 2010
New Features

	Random local clock model, see:
	Drummond AJ and Suchard MA (2010) Bayesian random local clocks or one
	rate to rule them all. BMC Biology.

	Discrete trait models, see:
        Lemey P, Rambaut A, Drummond AJ & Suchard MA (2009) Bayesian
        Phylogeography Finds Its Roots.PLoS Comput Biol 5, e1000520.
	http://beast.bio.ed.ac.uk/Tutorials#Phylogeography_tutorials

	Continuous trait models, see:
        Lemey P, Rambaut A, Welch JJ & Suchard MA Phylogeography takes a
        relaxed random walk in continuous space and time. (2010)
        Mol Biol Evol 27, 1877-1886.
        These models are not currently specifiable from BEAUti, but see here:
        http://beast.bio.ed.ac.uk/Tutorials#Phylogeography_tutorials

        Improved user interface for Discrete Trait models in BEAUti.

	Added an 'Include Stem?' option in the Taxon Set table  in BEAUti.
	    This allows the calibration to be specified for the stem of a clade.

	Added the application TreeStat to the BEAST package.

	Can 'drag and drop' files to the data table in BEAUti to import them.

	New 'tool tip' help messages for most user-interface elements in BEAUti

	The name of the XML file is now shown in the title bar of the BEAST window.

	By default, BEAST will no longer overwrite existing log/trees files. This
	    behaviour can be overridden by using the '-overwrite' command line option
	    or the check box in the options dialog box.

	There is a BEAST new command line option '-prefix XXX' which will add the
	    specified text to start of the file names of all log files and trees files
	    for that run. This is useful for batch running of BEAST.

	More warnings are given now about potentially problematic prior choices,
	    in particular the use of improper priors. These are shown in yellow.
	    For some models, the user now has to make an explicit prior choice.
Bug Fixes

This version addresses the following issues:
	Issue 40:  TreeAnnotator produced misleading medians and HPDs when calculated
	           from only 1 tree.
	Issue 170: coalescentLikelihood would sometimes result in a zero initial likelihodo
               when using an UPGMA starting tree
	Issue 235: BEAUti: Unlinked DiscretizedBranchRates for multiple loci have the
	           wrong number of dimensions
    Issue 291: BEAUti: fixed a problem generating a user specified starting tree 
               in XML.
	Issue 298: BEAUti: checks that a user specified tree is rooted and fully
	           bifurcating.
	Issue 300: BEAUti: Simplified the XML for discrete models by using a single
	           'generalSubstitutionModel' parser for all variants.
	Issue 302: BEAUti: Now possible to importing multiple files at once when they
	           have different taxon sets
	Issue 307: BEAUti: missing .txt in tree log using EBSP
	Issue 311: BEAUti: Prior choices for codon partition parameters are now
	           properly generated.
	Issue 328: BEAUti: No longer generates very long default value and bound
	           arrays for parameters.
	Issue 332: BEAUti: Add traits now allows any trait name to be given.
	Issue 333: BEAUti: Unlink buttons are enabled even when only one partition is
	           loaded
	Issue 337: BEAUti: Creating a 'CONTINUOUS' or 'INTEGER' trait gives Discrete
	           model of substitution in SiteModelPanel
	Issue 345: BEAUti: traits can be edited in the Traits table.
	Issue 346: BEAUti: Show user a guide for an example of *BEAST or trait mapping
	           file format.
	Issue 347: BEAUti: Change for BEAUti default prior of ucld.stdv and kappa
	Issue 348: BEAST: For GUI versions, <close> then <cancel>, should allow BEAST
	           to continue running.
	Issue 349: BEAUti: Window is too large for low resolution projector
	           or screen.
	Issue 352: BEAUti: NullPointerException if leave any trait value
	           empty after activate BSSVS
	Issue 353: BEAUti: *BEAST is now explicitly activated by a check box
	           above the data partition table.
	Issue 356: BEAUti: Added instructions to show user how to load specified
			   starting tree from BEAUti
	Issue 357: BEAST: Linux/UNIX version was unable to locate the native libraries.
	Issue 361: BEAUti: RegEx for guess dates and guess traits now works better.
	Issue 369: Beauti: Tip Dates panel: Tip date sampling "apply to" resets to
			   "All taxa" after navigating to different tab
	Issue 374: BEAUti: only one taxon set for 3 unlinked partitions
	Issue 380: BEAUti: Discrete trait model should have its tree linked to that
			   for a tree for a sequence partition
	Issue 381: BEAUti: Discrete trait model can select an inappropriate substitution
			   model in the data partition table
	Issue 383: BEAUti: "species" trait should not appear in Data Panel
	Issue 384: BEAST: Unhandled attribute (typo?) name in sumStatistic:rateChanges
	Issue 387: BEAUti: Generates wrong xml when a uniform prior is selected
			   for species.popMean
	Issue 391: BEAUti: add includeStem for taxon set


Version 1.5.4 released 29th March 2010
Bug Fixes

This version addresses the following issues:
        Issue 52:  Commas put into years displayed in BEAUti
	Issue 59:  examples/testCoalescent.xml
	Issue 74:  mcmc.operators
	Issue 161: BEAUTi: review all initial rates and root heights
	           calculations
	Issue 162: Fix unstable JUnit test
	Issue 198: Improper JUnit test code causes incorrect failure in
	           Hudson
	Issue 241: BEAUTi: operator subtreeSlide size should not be INF
	Issue 270: BEASTParserDoc is unable to generate Wiki format
	Issue 267: BEAUTi: The user should *always* be allowed to fix
	           the rates if they want
	Issue 268: BEAUti: prior distribution error message "find
	           incorrect number format"
	Issue 277: Typo in BEAUTi - Unable to overwrite exsting file
	Issue 282: BEAUti: AlignmentGenerator cannot print sequence with
	           long sites properly
	Issue 285: BEAST: ComplexSubstitutionModelParser can only refer to
	           SVS not ComplexSubstitutionModel
	Issue 286: BEAUti: remove exponential in VariableDemographicModel
	           from BEAUti
	Issue 287: BEAUti: EBSP VariableDemographicModel popSize value =
	           populationMean value and indicators value = 0
	Issue 288: BEAUti: avoid comma generated in the numbers in the log

        All issues can be viewed at http://code.google.com/p/beast-mcmc/issues/list

Version 1.5.3 released 9th December 2009
New Features

GUI versions of BEAST show a dialog box to set various options that are otherwise only available by command-line.
Bug Fixes

This version addresses the following issues:
        Issue 55:  MCMC Screen log doesn't currently work.
        Issue 70:  beauty and partition into codon positions
        Issue 72:  Beauti should hard limit GTR model parameters
        Issue 122: Ctrl-A in Beauti -> Exception
        Issue 127: BEAUTi prior panel, prior upper and lower does not show
                   INFINITY
        Issue 128: BEAUTi: tree prior Logistic Growth is not available for
                   calibration
        Issue 146: BEAUTi: binary COVARION model
        Issue 169: Editing the file name stem in BEAUti causes the insertion
                   point to jump to the end
        Issue 173: BEAUTi: partially link exception
        Issue 181: BEAUTi: need enhancement to default behaviour when adding
                   additional alignment after unlinking all
        Issue 193: Improved convergence diagnostic: compute effective size of
                   combined runs by concatenating the samples
        Issue 194: BEAUTi: prior setting exception when changing value
        Issue 199: Tracer shows only first log file entry when multiples
                   entries have the same name
        Issue 201: Editing file name stem in MCMC panel causes insertion point
                   to jump to end
        Issue 202: Build scripts producing JDK 1.6 classes so distribution fails
                   on machines with JDK 1.5
        Issue 203: Launch4j bug affecting the link of NucleotideLikelihoodCore.dll
        Issue 204: BEAUTi: tree prior Constant Size is not working for node calibration
        Issue 205: Tittle information disappeared in the console using windows
                   paramter to run BEAST
        Issue 209: pathogen dose not compile
        Issue 211: BEAUTi: Amino Acid site model xml is wrong
        Issue 212: BEAST Linux version: need chmod 755 *
        Issue 215: Default memory allocations for Mac packaging are too small
        Issue 216: Default memory allocations for Linux packaging are too small
        Issue 217: Problems with the Mac OS X packaging
        Issue 218: BeastMain options dialog giving error "Illegal entry value
                   must be between 1 and 21474863647"
        Issue 220: The shell scripts to launch BEAST in command line can't cope
                   with spaces in the path.
        Issue 221: Reweight the substitution model operators in BEAUti
        Issue 222: Naming of 'treeLikelihood' when only 1 partition
        Issue 223: Set the 'operator analysis' file name as an attribute in
                   MCMC element
        Issue 225: TreePartitionCoalescent is not existing
        Issue 226: The parsers in release_parsers.properties need to be updated
        Issue 227: Fix BeastDoc to generate tag doc for BEAST users
        Issue 229: Another failure of testing framework
        Issue 231: Delay the start of the performance measurement until after
                   full evaluation
        Issue 232: Mac (Windows?) version of BEAST closes console on error
        Issue 234: Make the dreaded "The initial posterior is zero" error a bit
                   more friendly to debug
        Issue 236: dr.evomodel.operators.TraitGibbsOperator is duplicated with
                   parsers in either release_parser.properties or BeastParser.java
        Issue 237: BEAUTi: taxon set not handling multi-tree partition
        Issue 238: Naming of 'patterns' when only 1 partition
        Issue 240: BEAUTi: useAmbiguities of treeLikelihood should be default
                   as true for binay Covarion
        Issue 242: BEAUTi: create a check box to choose useAmbiguities in
                   treeLikelihood for binary data
        Issue 244: URGENT: Default prior review
        Issue 247: BEAUTi: wrong XML in frequecies choosing EMPIRICAL binary
                   COVARION model
        Issue 248: BEAUTi exception (*BEAST) when linking some same taxa for a
                   tree model by given different taxa in total
        Issue 250: BEAUTi: wrong alignment blocks for multi-gene when choosing
                   "create empty alignment"
        Issue 253: BEAUTi add a pop-up box to check the default priors when
                   click Generate BEAST file
        Issue 254: BEAUTi generate XML button should be disable after all data
                   partition removed
        Issue 255: Turn off parser WARNINGs by default for released version
        Issue 256: BEAUTi: Add comment in XML "skyride.logPopSize is log unit
                   unlike other popSize"
        Issue 257: BEAUTi: Binary data and multiple partitions does not generate
                   the siteModel correctly
        Issue 259: BEAUTi: Mac OS MCMC panel problem
        Issue 260: BEAUTi: correct English
        Issue 261: Error parsing <traceAnalysis> element with id null
        Issue 262: wrong XML of testCataclysmCoalescent.xml
        Issue 264: ImportException: Number format error for <treeTraceAnalysis ...

        All issues can be viewed at http://code.google.com/p/beast-mcmc/issues/list

Version 1.5.2 released 9th October 2009
New Features

GUI versions of BEAST show a dialog box to set various options that are otherwise only available by command-line.
Bug Fixes

Many bugs fixed that were introduced in 1.5.1 including:
        Issue 44: Recent change (svn commit 773) breaks Beauti
        Issue 75: "Unlink substitution model across codon positions has no effect
        Issue 77: BEAUti v1.5 produces decimal operator weights that don't work with
                  old BEAST
        Issue 94: Improve the prefix of PartitionClockModelTreeModelLink
        Issue 123: BEAUti uses a poor choice of name for re-linking partitions  
        Issue 131: BEAUTi: rewrite Parameter and Operator class by Builder pattern,
                   and all referring methods
        Issue 134: TN93 parser problem
        Issue 135: Laplace prior has not been implemented in PriorParsers, but
                   appearing in BEAUTi.
        Issue 136: BEAUTi log screen should show actual name instead of Rate 1, 2, ....
        Issue 139: ImportnaceNarrowExchange should be ImportanceNarrowExchange
        Issue 140: more options for *beast
        Issue 144: BEAUTi: "In use" in Operators panel cannot be changed for those
                   operators belonging to PartitionClockModelTreeModelLink  
        Issue 145: BEAUTi: implement frequencies for binary model in the same way as
                   for DNA data
        Issue 147: BEAUTi: if no leaf nodes selected in Taxon Set panel, the
                   corresponding tmrca should not appear in Prior panel
        Issue 148: BEAUTi: illegal entry error for Clock Model panel
        Issue 151: BEAUti: MCMC tab numerical fields reset after GUI events
        Issue 154: No Nucleotide Likelihood Core in java.library.path
        Issue 155: Warning message " ... does not match stored object with same id
                   and tag name ..." confused user
        Issue 156: LogNormal in prior panel in Beauti
        Issue 157: LogNormal in Beauti: Exception occurred during event dispatching
        Issue 158: We should have the Inverse Gamma distribution in Beauti
        Issue 160: Ant build for Mac version release
        Issue 163: BEAUTi: unlink trees if allow different taxa
        Issue 164: TreeAnnotator v1.5.1 incorrectly labels tree [bug report AND fix
                   solution!]
        Issue 165: BEAUTi: some priors parameters keep changing
        Issue 168: GMRF 'Skyride' complains about 'Share same tree prior' even if only
                   one tree
        Issue 172: BEAUti: shareSameTreePrior should be disabled when there is only 1
                   tree model
        Issue 176: BEAUti: LogNormal mean should be > 0 when mean in real space
        Issue 179: species.popSize is a horrible choice of name
        Issue 180: BEAUTi: allMus is not dealing with multi-partition + codon, and
                   allClockRate
        Issue 183: BEAUTi: clock model should use different mu with codon model
        Issue 184: BEAUTi: make "mu" only appeared using codon model
        Issue 185: Guess Trait dialog doesn't offer user defined traits
        Issue 188: Suggestion to remove 'pre-burnin'
        Issue 190: Mac app ant build needs several corrections
        Issue 192: BEAUti: GUI exception when attempting to add a new trait 
        Issue 195: BEAUTi ignores and resets change of prior
        Issue 196: Beast failure with file generated by BEAUTi (ucld)
        Issue 197: meanRate, coefficientOfVariation and covariance should have gene name
                   in name="" attribute
        Issue 200: BEAUTi: *BEAST using Import Trait cannot add species in Trait table

        All issues can be viewed at http://code.google.com/p/beast-mcmc/issues/list

Version 1.5.1 released 3rd September 2009
New Features

*BEAST: a version of BEAST that can estimate species trees from multi-locus multi-individual data sets using the multispecies coalescent (Heled & Drummond, 2009, submitted)
BEAUti overhaul: BEAUti has been completely re-written to allow flexible handling of multi-partition analyses, including partitioning by substitution models, clock models and trees. BEAUti also supports the new *BEAST method.
Relaxed clock refinements: The uncorrelated relaxed clock models have been refined by the addition of two new operators to address (valid) criticisms levelled in "Bayesian estimation of species divergence times from multiple loci using multiple calibrations", Rannala and Yang (2007). The change allows more than one branch to have the same relaxed clock rate category. In practice this will only have any appreciable impact on trees that have a small number of branches (< 15 taxa).
Added phylogeography models of Lemey et al (2009), PLoS Comput Biol.
Added post mortem damage models of Rambaut et al (2009) Mol Biol Evol.
Bug Fixes

Many bugs fixed that were introduced in 1.5.0 including:
		
		Issue 38: If partitions are unlinked then the base frequencies should be 
	              calculated from each partition separately;
		Issue 80: ant build generates a broken beast;
		Issue 81: ant build release fails after recent changes to beauti;
		Issue 82: dr.app.util.Utils is broken (use of java 1.6 features?);
		Issue 97: Remove "Link All/Unlink All" buttons from Data Tab;
		Issue 98: Request to be able to view data partition alignments;
		Issue 99: Suggestion: Clock Models tab;
		Issue 100: Request to revise UI of "Choose Fix Rate Option";
		Issue 103: Comments and suggestions for "MCMC Tab";
		Issue 106: Single locus but multiple codon partitions: Doesn't allow 
		           'Fixed mean rate';
		Issue 109: BEAUti: Generating XML - no file overwriting warning?;
		Issue 110: BEAUTi: excludedTaxonSetsComboBox and includedTaxonSetsComboBox 
		           in Taxon Sets panel not updating
		Issue 114: Beauti Priors panel for starbeast;
		Issue 115: Beauti starbeast: missing updown operator for first gene;
		Issue 116: Make TN93 available in BEAUTi;
		Issue 118: Beauti defaults - clock.rate in starbeast;
		Issue 119: Beauti fails;
		Issue 120: Beauti silliness - warn about not saving when nothing was done;
		Issue 121: Beauti generates spurios multiple upDown operators;
		Issue 124: Create method to check calibration situation;
		Issue 125: Tree prior panel affecting isShareSameTreePrior check box wrongly.
		        
		All issues can be viewed at http://code.google.com/p/beast-mcmc/issues/list

Version 1.5.0 released 4th August 2009
This was a major new version with numerous new features and many bugs - see release 1.5.1 for details.

Bug Fixes

Many new bugs were introduced. 

Older Versions
Version 1.4.8 released 27nd July 2008

New Features

A birth-death model of speciation. This is the model of Tanja Gernhard (The conditioned reconstructed process, J Theor Biol, 2008).
There is now an option to dynamically rescale the likelihoods of trees to avoid loss of precision. This can avoid problems with large trees but may affect performance. See on-line documentation for details.
Bug Fixes

Improvements to how uncorrelated relaxed clocks are sampled. This will be an improvement more for small trees than large.
Fixed a problem setting the number of groups for the Bayesian Skyline Plot in BEAUti.
A warning message is given if a speciation process is selected for serially-sampled sequences.
LogCombiner ignores lines starting with a '#' as a comment line.
Trees are written with a standard (alphabetical) ordering of taxa to allow them to be read by AWTY.
For writing NEXUS tree files, taxon names with illegal characters (such as spaces or semicolons) are now quoted.
LogCombiner now uses the '.' as the decimal separator irrespective of country or language. This is to standardize with other programs.
Version 1.4.7 released 1st February 2008

New Features

BEAUti can now set nucleotide frequencies to be sampled or equal as well as the empirically estimated (the previous default).
Individual operators can now be turned on and off in BEAUti (for example to sample on a fixed tree topology).
Bug Fixes

BEAST now generates starting trees with certain taxon constraints that caused problems before.
Some numerical problems with the Expansion and Logistic models have been fixed or at least improved for certain situations.
Fixed a problem in which BEAUti's Prior Distribution dialog was freezing when a very large lognormal mean was set.
A seed of zero crashed BEAST - seeds must be > 0 now.
The command-line version of TreeAnnotator wasn't accepting a target tree file name.
Fixed a problem in LogCombiner where if the Run button was pressed before the user had finished editing a burnin the value was ignored.
Fixed an issue with BEAUti running under Mac OS X 10.5 (Leopard) where the text box for the substitution rate was tiny.
Version 1.4.6 released 26th September 2007

Bug Fixes

Fixed a problem in which the lognormal distribution wasn't giving the required distribution as prior.
Fixed a problem with TreeAnnotator not completing when finding the Maximum Clade Credibility tree.
Version 1.4.5 released 15th August 2007

New Features

BEAUti has ability to generate BEAST files that sample only from the prior distribution by replacing sequences with 'N's. This option can be found in the MCMC panel.
Bug Fixes

Defining taxa sets that weren't compatible could cause BEAST to fail to run.
The priors table didn't update when the tree prior was changed.
The parametric plots in the Prior Dialog now show correctly.
Introduced a default Jeffery's prior on certain parameters (not technically a bug fix but may make the defaults more robust).
Version 1.4.4 released 12th July 2007

New Features

Improved speed of relaxed clock by more judicious updating of the likelihood when rates change on a few branches.
Slight improvement in speed calculating the coalescent prior.
The taxa and translate lists in NEXUS trees files can now be sorted alphabetically (and this is the default in BEAUti). This will help comparisons of trees files using certain software that assume taxon orders are the same (namely AWTY).
Bug Fixes

Log normal prior element required meanInRealSpace attribute which prevented older XML file from running without modification. This attribute is now optional.
Version 1.4.3 released 18th June 2007

Bug Fixes

The Yule tree prior was wrongly implemented.
BEAUti did not allow some types of compatable monophyly constraints.
BEAST did not always simulate starting trees with enforced monophyly correctly.
BEAST ignored specified offsets for exponential priors on parameters.
BEAUti ignored user specified offsets for gamma distribution priors on parameters.
Version 1.4.2 released 25th April 2007

New Features

Taxon sets can now have monophyly enforced using BEAUti.
Starting tree is now compatible with monophyly constraints and uniform priors on tMRCAs.
Relaxed clock statistics (meanRate, etc.) are now in the priors table.
Bug Fixes

Fixed problem with rate estimation under the 2 partition codon specific rates models (including SRD06).
Fixed problem setting Bayesian Skyline group count in BEAUti.
Version 1.4.1 released 25th January 2007

Bug Fixes

BEAUti did not accept the number of skyline groups properly.
BEAUti was not able to 'guess dates' using a specified prefix.
Fixed a problem using exponential distribution as priors.
LogCombiner could mix up taxon labels when combining multiple tree files. This problem would not affect the reconstruction of skyline plots.
Version 1.4 released 31th October 2006

New Features

Faster likelihood calculations after rejecting a state. Whilst the improvement in speed will vary, the indications are that this is a significant overall speed improvement.
Rates for relaxed clock models can be written embedded in the tree for later analysis.
2 new accessory programs: LogCombiner for combining multiple runs into single log files and TreeAnnotator which annotates a given target tree with posterior estimates from a BEAST sample of trees.
BEAUti can now create TaxonSets and apply prior probability distributions to the tMRCA of these.
BEAUti can now save and load "Template Files" containing model settings but not data.
BEAUti can be run non-interactively as a command-line using the template files.
The order of parameters logged in BEAST files created by BEAUti has been changed to make it easier to compare files with different models in Tracer.
Bug Fixes

BEAUti did not use the specified fixed substitution rate.
Fixed a problem using UPGMA as an initial tree - would sometimes give ? in log files instead of posteriors.
Fixed a problem with BEAUti not loading data when using a non-english operating system.
Fixed a problem using gamma distribution as priors.
Version 1.3 released 30th August 2005

New Features

"Relaxed Clock" models.
New prior selection for parameters using BEAUti.
Bug Fixes

Problem with distributionLikelihood including all data twice resulting in the distributions being too tight.
Improved error reporting.
Version 1.2 released 24th February 2005

New Features

"Bayesian Skyline" demographic model.
Logistic demographic model.
Version 1.1.2 released 27th August 2004

Bug Fixes

Amino Acid models were not being set correctly
resulting in the use of an equal-rates model.
Version 1.1.1 released 24th August 2004

New Features

Can now switch autoOptimize on or off for individual operators. This overrides the setting for the <mcmc> element.
Default weights for certain operators have been changed in BEAUti to improve performance.
Bug Fixes

Fixed a bug in BEAUti in which unlinked codon analyses produced non-working XML files.
Fixed a bug where BEAST wouldn't run certain old XML files throwing a null-pointer exception when writing a log file.
Doesn't stop with RuntimeException when a state is proposed that has a really bad (underflowing) likelihood.
Version 1.1 released 5th August 2004

New Features

An auto-optimize function that removes the need to perform manual tuning of operators.
Improvement in speed of likelihood calculations for nucleotides. 
Now includes BEAUTi as part of the BEAST package. In future these will be distributed together with matching version numbers.
Bug Fixes

Various minor problems with parsing XML have been fixed
Version 1.0.3 released 12 July 2003

New Features

Improved tree log analyser. Now gives mean node heights (branch lengths) on trees with a frequency > 100.
Bug Fixes

Various minor problems with parsing XML have been fixed
Version 1.0.2 released 27 June 2003

New Features

Improved tree log analyser. Now gives mean node heights (branch lengths) on trees with a frequency > 100.
Bug Fixes

Fixed the wrong coalescent likelihood function introduced in the last version.
Various minor problems with parsing XML have been fixed (including GTR model, NormalDistribution and others).
Version 1.0.1 released 23 June 2003

This version introduced a 'fix' for the coalescent likelihood function which turned out to be erroneous. 

This version should not be used.

Version 1.0 released 10 June 2003

First released version.
{% include links.html %}

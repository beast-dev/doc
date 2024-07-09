---
title: Frequently Asked Questions
permalink: faq.html
sidebar: beast_sidebar
tags: [help, trouble-shooting]
keywords: frequently asked questions, FAQ, question and answer, help
last_updated: April 26, 2024
summary: "Frequently asked questions about BEAST."
toc: true
folder: beast
---

## Introduction
<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q1">What is BEAST?</a>
			</div>
		</div>
		<div id="q1" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
				BEAST is a cross-platform program for Bayesian analysis of molecular sequences using MCMC. 
				It is entirely orientated towards rooted, time-measured phylogenies inferred using strict or relaxed molecular clock models. 
				It can be used as a method of reconstructing phylogenies but is also a framework for testing evolutionary hypotheses without conditioning on a single tree topology. 
				BEAST uses MCMC to average over tree space, so that each tree is weighted proportional to its posterior probability. 
				We include a simple to use user-interface program, called BEAUti, for setting up standard analyses and a suit of programs for analysing the results. 
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q2">What can BEAST do?</a>
			</div>
		</div>
		<div id="q2" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
			    <div>BEAST is a software package to perform Bayesian analysis of molecular sequences using MCMC and focuses on estimating phylogenies using a wide range of models.
			    </div>
                <div><a href="about">Here is list some of BEAST's features and models.</a></div>
                <div><a href="tutorials">Introductory, advanced and workshop tutorials can be found on this website.</a></div>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q3a">Why is it called BEAST X?</a>
			</div>
		</div>
		<div id="q3a" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
				We have renamed the release that would have been called <code>BEAST v1.10.5</code> as <code>BEAST X v10.5.0</code>. This is to distinguish it from the independent project called <a href="https://www.beast2.org">BEAST 2 – see: https://www.beast2.org</a>. These projects have been running in parallel for many years which has restricted this BEAST project to using the v1 major release version and only incrementing the minor release version. We have renamed this project <code>BEAST X</code> to denote its orthogonal axis in project-space and thus call this <code>v10.#.#</code> as the new major version. The next major version of BEAST X will be <code>v11.0.0</code>, and so on. 
			</div>
		</div>
	</div>
</div>
<!-- /.panel-group -->

## Installing and running BEAST	
<div class="panel-group" id="accordion">
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q3">
				How do I install and run BEAST?</a>
			</div>
		</div>
		<div id="q3" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
			<a href="installing">Look at this page for instructions about installing BEAST on different operating systems</a>
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q4">
				What is BEAGLE and should I use it?</a>
			</div>
		</div>
		<div id="q4" class="panel-collapse collapse">
			<div class="panel-body">
            <p>
            BEAGLE is a high-performance computational library that can perform the core calculations at the heart of most Bayesian and Maximum Likelihood phylogenetics packages. 
            It can make use of highly-parallel processors such as those in 3D graphics boards (referred to as Graphics Processing Units or GPUs) found in many PCs. 
            In general using it (even if not using a GPU) will improve the performance of BEAST. 
            However, it is not necessarily going to benefit all data sets. 
            In particular, for the use of a GPU to be efficient, long partitions are required (perhaps >500 unique site patterns). 
            Only high-end GPUs such as the GTX590 or Tesla boards will provide sufficient benefits. 
            </p>
            <p><a href="beagle">See this page for more information about BEAGLE.</a></p>
            </div>
		</div>
	</div>
    <!-- /.panel -->
        	<div class="panel panel-default">
        		<div class="panel-heading">
        			<div class="panel-title">
        				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q18">
        				How do I achieve optimal performance when using BEAGLE with BEAST? </a>
        			</div>
        		</div>
        		<div id="q18" class="panel-collapse collapse">
        			<div class="panel-body">
                    <a href="performance">See this page on how to optimize performance when using BEAGLE with BEAST.</a>.
        			</div>
        		</div>
        	</div>
	<!-- /.panel -->
</div>
<!-- /.panel-group -->

## Interpreting the results	
<div class="panel-group" id="accordion">
    <!-- /.panel -->
    	<div class="panel panel-default">
    		<div class="panel-heading">
    			<div class="panel-title">
    				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qmc">
How do I do model comparison?
    				</a>
    			</div>
    		</div>
    		<div id="qmc" class="panel-collapse collapse noCrossRef">
    			<div class="panel-body">
<p>Accurate model comparison in Bayesian phylogenetics is typically performed using <a href="model_selection_1">path sampling</a>, <a href="model_selection_1">stepping-stone sampling</a> or <a href="model_selection_2">generalized stepping-stone sampling</a>.</p>
    			</div>
    		</div>
    	</div>
    <!-- /.panel -->
        	<div class="panel panel-default">
        		<div class="panel-heading">
        			<div class="panel-title">
        				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qpdt">
How do I summarize the posterior distribution of trees?
        				</a>
        			</div>
        		</div>
        		<div id="qpdt" class="panel-collapse collapse noCrossRef">
        			<div class="panel-body">
<p><a href="beagle">See this page for an explanation of various approaches to summarizing trees.</a></p>
        			</div>
        		</div>
        	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q5">
What is the maximum clade credibility (MCC) tree produced by TreeAnnotator?
				</a>
			</div>
		</div>
		<div id="q5" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
<p>The tree produced by TreeAnnotator (denoted the maximum clade credibility or MCC tree) is not a consensus tree such as that produced by the 'sumt' command in MrBayes. Instead, TreeAnnotator picks one of the trees actually present in the sample produced by BEAST - thus it is a tree that was actually visited by the MCMC sampler. The tree it picks is the one that has the highest product of all the clade credibilities (posterior probabilities) for all the clades in the tree. The motivation with this is to find a single 'point estimate' tree that is in some way central to the distribution of trees. This tree is then given (annotated with) summary information for the full set of trees from the sample. For example, it is given average node heights, credible intervals for the node heights, rates, etc. 
</p>
<p><a href="summarizing_trees">See this page for an explanation of various approaches to summarizing trees.</a></p>
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q6">
Why does my tree produced by TreeAnnotator have negative branch lengths?
				</a>
			</div>
		</div>
		<div id="q6" class="panel-collapse collapse">
			<div class="panel-body">
MCC trees produced by TreeAnnotator can have a descendent node that is older than its direct ancestor (a negative branch length). This may seem like an error but is actually the correct behaviour. The MCC tree is, by default, generated with average node heights across all trees in the sample which contain that clade. The negative branch lengths result when a clade is at low frequency and tends not to occur in those trees that have the MCC tree's ancestral clade (or vice versa). This means the average heights are for the adjacent nodes are derived from different sets of trees and may not have any direct ancestor-descendent relationship.
			</div>
		</div>
	</div>
	<!-- /.panel -->
</div>
<!-- /.panel-group -->

## Effective Sample Size (ESS) of parameters	
<div class="panel-group" id="accordion">
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q7">
What is an ESS?
				</a>
			</div>
		</div>
		<div id="q7" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
The Effective Sample Size (ESS) of a parameter sampled from an MCMC (such as BEAST) is the number of effectively independent draws from the posterior distribution that the Markov chain is equivalent to.
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q8">
How do I calculate an ESS?
				</a>
			</div>
		</div>
		<div id="q8" class="panel-collapse collapse">
			<div class="panel-body">
The simplest way is to load your BEAST log files into Tracer.
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q9">
Why do I need to increase it?
				</a>
			</div>
		</div>
		<div id="q9" class="panel-collapse collapse">
			<div class="panel-body">
If the ESS of a parameter is small then the estimate of the posterior distribution of that parameter will be poor. In Tracer you can calculate the standard deviation of the estimated mean of a parameter. If the ESS is small then the standard deviation will be large. This is exactly the same as the sample size of an experiment consisting of measurements.
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q11">
What size ESS is adequate?
				</a>
			</div>
		</div>
		<div id="q11" class="panel-collapse collapse">
			<div class="panel-body">
The larger the better. Tracer flags up ESSs < 100 but this may be liberal and > 200 would be better. On the other hand chasing ESSs > 10000 may be a waste of computational resources.
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q12">
Do I need adequate ESSs for all my parameters?
				</a>
			</div>
		</div>
		<div id="q12" class="panel-collapse collapse">
			<div class="panel-body">
Possibly not. Really low ESSs may be indicative of poor mixing but if a couple of parameters that you are not interested in are a little low it probably doesn't matter. The likelihoods (both of the tree and coalescent model) should have decent ESSs.
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q13">
Is the ESS important if I am interested in the sample of trees?
				</a>
			</div>
		</div>
		<div id="q13" class="panel-collapse collapse">
			<div class="panel-body">
Definitely. At the moment we don't have anyway of directly examining the ESS of the tree or the clade frequencies. Therefore, it is important that the continuous parameters and likelihoods have adequate ESS to demonstrate good mixing of the MCMC.
			</div>
		</div>
	</div>
	<!-- /.panel -->
    	<div class="panel panel-default">
    		<div class="panel-heading">
    			<div class="panel-title">
    				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q14">
    Do I need to worry about optimizing operators if my ESSs are okay?
    				</a>
    			</div>
    		</div>
    		<div id="q14" class="panel-collapse collapse">
    			<div class="panel-body">
        No. Tuning the operators will only increase the efficiency of the sampling - resulting in better ESSs for the same chain length. If you are already getting suitable ESSs then that is fine. 
        <a href="ess_tutorial.html">See this tutorial for more details about this subject.</a></div>
    		</div>
    	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q15">
How do I increase the ESS of a parameter?
				</a>
			</div>
		</div>
		<div id="q15" class="panel-collapse collapse">
			<div class="panel-body">
<a href="ess_tutorial">Take a look at this brief tutorial for ways of increasing the ESS.</a>
			</div>
		</div>
	</div>
	<!-- /.panel -->
    	<div class="panel panel-default">
    		<div class="panel-heading">
    			<div class="panel-title">
    				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q16">
    Why does the operator analysis continue to suggest that I decrease my &lt;subtreeSlide&gt;'s size attribute in order to improve my acceptance probability?
    				</a>
    			</div>
    		</div>
    		<div id="q16" class="panel-collapse collapse">
    			<div class="panel-body">
    The size value in the &lt;subtreeSlide&gt; operator should be proportional to the height of your tree (say about 10% initially). 
    If the tree is uncalibrated then the height of the tree is given in substitutions per site which can be very small.
    			</div>
    		</div>
    	</div>
	<!-- /.panel -->
</div>
<!-- /.panel-group -->

## Setting up models

<div class="panel-group" id="accordion">
    <!-- /.panel -->
    	<div class="panel panel-default">
    		<div class="panel-heading">
    			<div class="panel-title">
    				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qpr">
How do I run BEAST without data to sample the Prior?
    				</a>
    			</div>
    		</div>
    		<div id="qpr" class="panel-collapse collapse noCrossRef">
    			<div class="panel-body">
In BEAUti, on the MCMC tab, click the checkbox 'Sample from prior only - create empty alignment', save the XML and run with BEAST.
Alternatively, in the XML file, remove (or comments out) the entries in the &lt;likelihood&gt; block.
    			</div>
    		</div>
    	</div>
    <!-- /.panel -->
        	<div class="panel panel-default">
        		<div class="panel-heading">
        			<div class="panel-title">
        				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qout">
How do I tell BEAST to use an outgroup?
        				</a>
        			</div>
        		</div>
        		<div id="qout" class="panel-collapse collapse noCrossRef">
        			<div class="panel-body">
The simple answer is that you may not want to - BEAST will sample the root position along with the rest of the nodes in the tree. 
If you then calculate the proportion of trees that have a particular root, you obtain a posterior probability for this root position. 
However if you have a strong prior for an outgroup then you can constrain the ingroup to be monophyletic. 
        			</div>
        		</div>
        	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qdm">
Which non-parametric demographic model should I use to analyse a single gene?
				</a>
			</div>
		</div>
		<div id="qdm" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
<p>A description of the coalescent tree priors (or demographic priors) can be found <a href="tree_priors.html">here</a>.
There are essentially three different non-parametric demographic priors available: the Bayesian Skyline, the (GMRF) Bayesian Skyride and the Bayesian Skygrid.
Basically, we suggest using Skyride over Skyline as it is a straightforward development of the Skyline with fewer user specified options.</p>
<p>The question of Skygrid vs Skyride is more complex. 
Skyride, like the original Skyline, scales its demographic curve to the height/age of the tree, with the changes in population sizes being concordant with the nodes in the tree. 
That is, as the tree grows and shrinks over the course of the MCMC, the Skyride timescale does too. 
Skygrid on the other hand requires you to define a fixed time line and grid points where the population size changes. 
The tree scales within this grid (i.e., the grid doesn't change even though the tree does). 
This is useful when you know what the timeline of the process is. 
Skygrid allow allows multi-locus analysis but this is probably not useful for viruses (unless they are independent epidemics being controlled by the same process). 
Finally, Skygrid allows covariates of the population dynamics to be incorporated and tested.</p>
			</div>
		</div>
	</div>
	<!-- /.panel -->
	<div class="panel panel-default">
        		<div class="panel-heading">
        			<div class="panel-title">
        				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qorder">
Does it matter what order the Priors & Likelihoods come in the XML?
        				</a>
        			</div>
        		</div>
        		<div id="qorder" class="panel-collapse collapse noCrossRef">
        			<div class="panel-body">
Yes. 
BEAST will evaluate each component in order starting with the priors. 
If any of these are zero, then the rest of the posterior is not calculated. 
Thus it is particularly important that constraints, like &lt;booleanLikelihood&gt; and &lt;uniformPrior&gt; which may give zero probabilities, are put at the beginning of the &lt;prior&gt; section: 
<pre>
&lt;mcmc id="mcmc" chainLength="1000000" autoOptimize="true"&gt;
    &lt;posterior id="posterior"&gt;
        &lt;prior id="prior"&gt;
            &lt;uniformPrior id="constraint" lower="90.0" upper="100.0"&gt;
                &lt;parameter idref="rootHeight"/&gt;
            &lt;/uniformPrior&gt;
            &lt;coalescentLikelihood idref="coalescent"/&gt;
        &lt;/prior&gt;
        &lt;likelihood id="likelihood"&gt;
            &lt;treeLikelihood idref="treeLikelihood"/&gt;
        &lt;/likelihood&gt;
    &lt;/posterior&gt;
</pre>
        			</div>
        		</div>
        	</div>
</div>
<!-- /.panel-group -->

## Starting tree and fixing trees

<div class="panel-group" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qudtree">Can you specify a user-defined starting tree?</a>
			</div>
		</div>
		<div id="qudtree" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
				Yes, you can insert a starting tree in Newick format into the BEAST XML using a text editor: 
<pre>
&lt;newick id="startingTree"&gt;
    insert you starting tree here in Newick format
&lt;/newick&gt;
</pre>
				The &lt;treeModel&gt; XML element then needs to contain a reference to this starting tree XML element:
<pre>
&lt;newick idref="startingTree"/&gt;
</pre>
				Alternatively, you can provide a starting tree using BEAUti, in the Trees panel.
				You can load a file containg one or more trees (in Newick format) into BEAUti using the "Import Data" menu option.
			</div>
		</div>
	</div>
	<!-- /.panel -->
    <div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qcontop">How can you keep this topology constant while estimating other parameters, e.g. node height?</a>
			</div>
		</div>
		<div id="qcontop" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
			In short, you need to remove all the operators that act on the treeModel. 
			In BEAUti, you can do this by deselecting the following operators: narrow exchange, wide exchange, Wilson Balding and subtree slide. 
			Alternatively, you can remove these operators from the XML using a text editor (but don't remove the operators acting upon treeModel.rootHeight or treeModel.internalNodeHeights). 
			Without these operators, the actual topology of the tree will not be altered.
			</div>
		</div>
	</div>
	<!-- /.panel -->
<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#qprinttree">How can I see the initial tree of my analysis?</a>
			</div>
		</div>
		<div id="qprinttree" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
			If you want to print the initial tree for your analysis printed to screen, you can add the following to the BEAST XML file using a text editor:
<pre>
&lt;report&gt;
    &lt;treeModel idref="treeModel"/&gt;
&lt;/report&gt;
</pre>
			</div>
		</div>
	</div>
	<!-- /.panel -->
</div>
<!-- /.panel-group -->

{% include links.html %}

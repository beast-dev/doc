---
title: Frequently Asked Questions
permalink: faq.html
sidebar: beast_sidebar
tags: [help, trouble-shooting]
keywords: frequently asked questions, FAQ, question and answer, help
last_updated: July 5, 2017
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
				A description of some of the analyses that can be performed using BEAST can be found here.

				See also the list of tutorials.
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
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q5">
What is the maximum clade credibility (MCC) tree produced by TreeAnnotator?
				</a>
			</div>
		</div>
		<div id="q5" class="panel-collapse collapse noCrossRef">
			<div class="panel-body">
The tree produced by TreeAnnotator (denoted the maximum clade credibility or MCC tree) is not a consensus tree such as that produced by the 'sumt' command in MrBayes. Instead, TreeAnnotator picks one of the trees actually present in the sample produced by BEAST - thus it is a tree that was actually visited by the MCMC sampler. The tree it picks is the one that has the highest product of all the clade credibilities (posterior probabilities) for all the clades in the tree. The motivation with this is to find a single 'point estimate' tree that is in some way central to the distribution of trees. This tree is then given (annotated with) summary information for the full set of trees from the sample. For example, it is given average node heights, credible intervals for the node heights, rates, etc. 

See this page for various other approaches to summarizing trees.
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
				<a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#q10">
Why do I need to increase it?
				</a>
			</div>
		</div>
		<div id="q10" class="panel-collapse collapse">
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
How do I increase the ESS of a parameter?
				</a>
			</div>
		</div>
		<div id="q14" class="panel-collapse collapse">
			<div class="panel-body">
<a href="ess_tutorial.html">Take a look at this brief tutorial for ways of increasing the ESS.</a>
			</div>
		</div>
	</div>
	<!-- /.panel -->
</div>
<!-- /.panel-group -->

{% include links.html %}

---
title: Model Averaging for Clocks Tutorial
keywords: model averaging, relaxed clocks, tutorial
last_updated: November 4, 2017
tags: [tutorial]
summary: "Bayesian model averaging (BMA) for relaxed clocks in BEAST."
sidebar: beast_sidebar
permalink: model_averaging_clocks.html
folder: beast

---

{% capture root_url %}{{ site.tutorials_root_url }}/model_averaging_clocks/{% endcapture %}

## Bayesian model averaging (BMA) for uncorrelated relaxed clocks

{% include callout.html content='This tutorial provides an alternative to the model selection tutorials that are also available and requires to first have a look at the different types of clock models in BEAST: <a href="clocks">\'Molecular clock models\' tutorial</a>.' %}

In previous tutorials, we have described different model selection approaches to select the optimal model (out of a selection of available models) for a data set using marginal likelihood estimation.
We have discussed different techniques to estimate the marginal likelihood, by either using [path sampling and stepping-stone sampling](model_selection_1) or [using generalized stepping-stone sampling](model_selection_2).
Although quantifying the marginal likelihood of alternative models is invaluable when it relates to hypothesis testing, model selection and its search for a single best-fit model typically ignores uncertainty about the "correct" model specification and can lead to overconfident inferences (Hoeting et al. 1999). 
Bayesian model averaging (BMA) approaches have been proposed to explicitly address model uncertainty by forming a posterior distribution over a set of candidate models (Madigan and Raftery 1994). 
In general, BMA does not provide a method for identifying the most likely model within the candidate set of models, as the aim of BMA is often orthogonal to model selection efforts.


{% include image.html file="defaultClock.png" prefix=root_url %}




## References

J. A. Hoeting, D. Madigan, A. E. Raftery and C. T. Volinsky (1999) Bayesian model averaging: a tutorial. Stat Sci. 14:382-417.

D. Madigan and A. E. Raftery (1994) Model selection and accounting for model uncertainty in graphical models using Occam's window. J. Am. Stat. Assoc. 89:1535-1546.

W. L. S. Li and A. J. Drummond (2012) Model averaging and Bayes factor calculation of relaxed molecular clocks in Bayesian phylogenetics. Mol. Biol. Evol. 29(2):751-761.

T. Lepage, D. Bryant, H. Philippe and N. Lartillot (2007) A general comparison of relaxed molecular clock models. Mol. Biol. Evol. 24(12):2669-2680.

{% include links.html %}
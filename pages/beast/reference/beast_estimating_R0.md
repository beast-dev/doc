---
title: Estimating R0 from coalescent growth rates
keywords: beast, tutorial
last_updated: July 8, 2017
tags: [reference]
summary: 
sidebar: beast_sidebar
permalink: estimating_R0.html
toc: false
folder: beast
---

Based on an original page posted by Nick Grassly on the [H1N1 pandemic website](https://tree.bio.ed.ac.uk/wiki/pages/t769F5D1/Relationship_between_R0_and_the_epidemic_growth_rate.html).

The basic reproduction number of the swine influenza epidemic, \\( R_{0} \\) can be estimated from its initial rate of spread. If we assume roughly exponential growth then the basic reproductive number is related to the growth rate by the so-called Lotka-Euler estimating equation:

\\[ R_{0}=\int_{0}^{\infty} \frac{1}{w(\tau)e^{-rt}} d\tau \\]

where \\( r \\) is the rate of exponential growth and \\( w(\tau) \\) the generation time distribution [1]. The generation time distribution can be thought of as the probability density function describing the distribution of times between successive infections in a chain of transmission.

The estimate of the basic reproductive number is therefore dependent not just on an estimate of \\( r \\)  , but also a good estimate of the generation time distribution [2]. In the case of swine influenza the generation time distribution is unclear, but data appear consistent with seasonal influenza that has a mean generation time of approximately 3 days.

Analytical solutions for \\( R_{0} \\) can be derived for different assumed generation time distributions using the Lotka-Euler estimating equation (which is essentially a moment generating function). If we assume a generation time distribution that follows the gamma distribution, then

\\[ R_{0}=\left(1+\frac{r}{b}\right)^{a} \\]

where a and b are the parameters of the gamma distribution (\\( a = m^{2}/s^{2} \\) and \\( b = m/s^{2} \\) where \\( m \\) and \\( s \\) are the mean and standard deviation of the distribution respectively).

Estimates of \\( R_{0} \\) based on the estimates of \\( r \\)  reported by Andrew Rambaut are given in **Table 1**. Obviously \\( r \\) can also be estimated from epidemiological case data and this may give different results.

{% include table.html content=" 
| \\( r \\) (per day with 95% HPD) | generation time distribution (and parameters in days) | \\( R_{0} \\)                 |
|--------------------------:|-------------------------------------------------------|--------------------|
| 0.053 (0.0014, 0.12)     | gamma (\\( m=3 \\), \\( s=2 \\))                                      | 1.17 (1.00 - 1.40) |
| 0.053 (0.0014, 0.12)     | exponential (\\( m=3 \\)) (i.e. SIR model)                    | 1.16 (1.00 - 1.36) |
" caption="**Table 1** \| Estimates of \\( R\_\{0\} \\) from the coalescent growth rate, \\( r \\) for the early period of Pandemic H1N1." %}

### Citations
1. Wallinga J, Lipsitch M. (2007) How generation intervals shape the relationship between growth rates and reproductive numbers. *Proc Roy Soc Lond B* **274**: 599-604
2. Grassly NC, Fraser C. (2008) Mathematical models of infectious disease transmission. *Nat Rev Microbiol.* **6**: 477-487

{% include links.html %}

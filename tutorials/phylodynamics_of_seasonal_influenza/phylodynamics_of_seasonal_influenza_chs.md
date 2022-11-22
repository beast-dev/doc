---
title: 揭示流感的波动进化动力学
keywords: phylodynamics, influenza, tutorial
last_updated: August 8, 2017
tags: [tutorial]
summary: "本教程提供了如何对跨越纽约几个流行季节的H3N2病毒序列样本序列集进行进化动力学分析的逐步讲解。该数据集是跨越纽约州几个流行季节的综合性数据集的一个子集，并且已经被用来揭示该病毒的基因组及流行病学动力学(Rambaut et al., 2008)。我们将研究H3N2多样性如何随时间波动。"

sidebar: beast_sidebar
language: cn
permalink: phylodynamics_of_seasonal_influenza.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/phylodynamics_of_seasonal_influenza/{% endcapture %}

本教程中，我们将会对流行于北半球3个流行季节的人流感病毒H3N2亚型构建[Bayesian skygrid](tree_priors#skygrid)。数据集包含165HA序列，由于在BEAST运行时间比在实践部分更长。因此本教程将会讨论如何设置该分析，以及如何分析总结BEAST运行的结果。

{% include note.html content='本教程建立在先前教程的基础上，应首先完成这些教程，特别是 <a href="rates_and_dates">"估测具有时间标记序列的速率和日期"</a>, 以及 <a href="phylodynamics_of_epidemic_influenza">"流感流行的进化动力学"</a> 
本教程将跳过上述教程所包含的细节步骤。' %}
                
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 数据文件为 '<samp>NewYork.HA.2000-2003.nex</samp>' 和 <a href="{{ root_url }}files/NewYork.HA.2000-2003.nex">可以在此处下载</a>.</div>
                
## 运行 BEAUti

运行BEAUti，加载nexus文件(<samp>NewYork.HA.2000-2003.nex</samp>)并且设置`Tips`面板的`Parse Dates`为之前所说的序列名称中的最后一个数字字段。 设置和上节练习相同的进化模型(包括伽马分布的变化速率)和分子钟模型。`Trees`选项选择`Coalescent: Bayesian SkyGrid`作为`Tree Prior`。本教程中，我们将会对在最近采样日期之前(<samp>2003.98</samp>因此追溯到1999年)的5年间隔(`Time at last point:` <samp>5</samp>)分为<samp>50</samp>网格，因此每年估计10个种群大小。应看到如下所示:

{% include image.html file="image19.png" prefix=root_url %}

此时，我们通常会生成BEAST XML文件，将其加载到BEAST并运行它。然而，这个数据集比以前稍微大一些，并且模型的计算密集程度要高一些，所以不要等待它完成，可以直接分析一些已经运行过的结果文件。
 
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 运行更长代次的log文件 <a href="{{ root_url }}files/Long_Run_H3N2_SkyGrid.zip">可以在此处下载</a>.</div>

## 分析BEAST的输出结果

使用Tracer，我们可以根据提供的输出文件分析运行结果(加载文件<samp>NewYork.HA.2000-2003.log</samp>)。该运行链长为50,000,000，每5000步采样一次，总共10,000个样本:

{% include image.html file="image20.png" prefix=root_url %}

要重建贝叶斯天际网图，请在`Analysis`下选择`SkyGrid reconstruction...`。将会出现以下窗口:

{% include image.html file="image21.png" prefix=root_url  max-width="50%" align="center"%}

设置"bin"范围为从<samp>1999</samp>到<samp>2004</samp>，并且指定底部的<samp>2003.98</samp>作为`Age of the youngest tip`。点击`OK`，一段时间好，会出现以下贝叶斯天际网图的重建(选择实心间隔):

{% include image.html file="image22.png" prefix=root_url %}

默认情况下y轴采样对数刻度。点击`Axes`按钮，关掉`Log axis`的`Y axis`。由于HPD上限非常大，因此也需要设置`Manual range`。设置<samp>0</samp> 到<samp>100</samp> ，将会得到如下所示:

{% include image.html file="image23.png" prefix=root_url %}

在这里，您可以看到季节性峰值非常强(但可信区间表示的不确定性也非常大)。 

## 参考文献

- Gill MS, Lemey P, Faria NR, Rambaut A, Shapiro B, and Suchard MA (2013) Improving Bayesian population dynamics inference: a coalescent-based model for multiple loci. Mol Biol Evol 30, 713-724.
- Minin VN, Bloomquist EW and Suchard MA (2008) Smooth Skyride through a Rough Skyline: Bayesian Coalescent-Based Inference of Population Dynamics. Molecular Biology and Evolution 25:1459-1471; doi:10.1093/molbev/msn090.
- Rambaut A, Pybus OG, Nelson MI, Viboud C, Taubenberger JK, Holmes EC (2008) The genomic and epidemiological dynamics of human influenza A virus. Nature, 453: 615-9.

## 帮助文档

BEAST网站: [http://beast.community](http://beast.community)

教程: [http://beast.community/tutorials](http://beast.community/tutorials)

常见问题: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

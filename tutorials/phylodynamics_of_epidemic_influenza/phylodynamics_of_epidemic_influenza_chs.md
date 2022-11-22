---
title: 流感流行的进化动力学
keywords: phylodynamics, influenza, tutorial
last_updated: August 25, 2017
tags: [tutorial]
summary: "本教程提供了如何通过BEAST对不同时间点(‘异质’数据)采集的样本序列集进行进化动力学分析的逐步讲解。 我们将关注A型流感病毒的进化，尤其是2009年出现的猪源H1N1 A型流感病毒(H1N1pdm)的动力学。 H1N1pdm数据集是研究此次大流行的起源与进化基因组学的所分析的基因组的子集(Smith et al., 2009)。本教程的目的是获得对该流行病起源日期的估计，以及对H1N1pdm流行病增长和基本生殖数量的估计。"
sidebar: beast_sidebar
language: cn
permalink: phylodynamics_of_epidemic_influenza.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/phylodynamics_of_epidemic_influenza/{% endcapture %}


## 前言

第一步是将带有DATA或CHARACTERS的模块的NEXUS文件转化为BEAST XML输出文件。该步骤通过BEAUti(代表贝叶斯进化分析程序)完成。这是一个友好用户程序，用来设置进化模型和MCMC分析的选项。第二步是对含有数据，模型以及设置的输出文件运行BEAST。最后一步是分析BEAST输出的结果，来诊断问题以及总结结果。

{% include note.html content='This tutorial builds on the <a href="workshop_rates_and_dates">Estimating rates and dates from time-stamped sequences</a> which should be completed before starting this one.' %}

执行本教程前，您需要下载与您的计算机系统兼容的3个软件包(均适用于Mac OS X，Windows以及Linux/UNIX操作系统):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>本教程所需的所有文件'<samp>H1N1pdm_2009.nex</samp>' and <a href="{{ root_url }}files/H1N1pdm_2009.nex">可以在此处下载</a>.</div>

## 运行 BEAUti

{% include icon-callout.html file='icons/beauti-icon.png' content='Run <a href="beauti">BEAUti</a> 通过双击其图标运行BEAUti。BEAUti 是一个交互式图形应用程序，用于设计分析和生成控制文件(BEAST XML文件)，BEAST将会运行该文件。' %}

加载NEXUS格式比对的文件，仅需要从`File`菜单选择`Import NEXUS...`即可。

选择`H1N1pdm_2009.nex`。该文件为50个基因组(拼接好的8个基因节段)，13109个核苷酸长度。一旦导入，数据将会在Partitions下列出，如图所示:

{% include image.html file="image1.png" prefix=root_url %}  <br /><br />

### 设置叶节点日期

要分析进化动力学我们需要指定每个所选病毒的采样日期。本教程中，序列为2009年3月到5月H1N1 2009大流行期间采集的。切换到主窗口的`Tips` 面板，设置日期。

选中标签`Use tip dates`。以年为单位的实际采样时间编码于每个分类单元名称中，我们可以用面板顶端的`Parse Dates`按钮来提取。对于H1N1pdm_2009序列，可以保持默认值`Defined just by its order`，从其下拉按钮选择`last`，并点击`OK`。日期将会出现在窗口相应列。如果需要也可以检查并手动调整。

{% include image.html file="image5.png" prefix=root_url %}

{% include tip.html content='此处对于解读和解析不同格式的叶节点日期有许多不同的方法。 <a href="tip_dates.html">对于这些选项的详细介绍详见此页。</a>' %}

### 设置替代模型

接下来要做的是点击主窗口顶部的`Sites`标签，来设置BEAST的进化模型:

{% include image.html file="image6.png" prefix=root_url %}

对于本教程，在继续`Clocks`标签之前，保持默认`HKY`模型，默认`Estimated`碱基频率，选择`Gamma`作为`Site Heterogeneity Model`(具有4个离散分类)。 

### 设置分子钟模型

`Clock`面板的选项允许我们选择在严格分子钟和宽松分子钟(不相关的对数正太分布或指数分布)之间选择。由于本数据的多样性比较低，宽松的分子钟可能会过度参数化。因此我们设置为严格分子钟。 

{% include image.html file="image7.png" prefix=root_url %}  <br /><br />

然后切换到`Trees`面板。

### 设置树的先验值

该面板包含对树的设置。首先，起始树指定为‘随机生成’。另一个主要的设置是指定‘Tree prior’，该设置是描述聚合模型中种群大小是如何随时间变化的。默认的先验树为恒定大小的聚合先验树。[不同的树先验(聚合和其它模型)详见此页](tree_priors)。

为了估计流行的增长率，我们将人口统计模型改为指数增长聚合先验模型，该模型可以直观地解释病毒的爆发。将`Tree Prior` 切换为`Coalescent: Exponential Growth`:

{% include image.html file="image8.png" prefix=root_url %}

### 设置先验值

现在切换到`Priors` 选项。该面板有一个列表展示的是当前所选模型的每个参数，以及每个参数的先验分布。好的先验允许用户通过选择具有较小方差的特定分布来‘通知’分析。或者，我们也可以选择一个弱(离散)的先验分布来最小化对分析的影响。注意必须指定每一个参数的先验分布，尽管BEAUti提供了默认选项，但是并不一定适合要分析的问题和数据。

{% include image.html file="image9.png" prefix=root_url %}

本教程中，由于其默认的规模(<samp>1.0</samp>)，指数增长率的默认先验分布优先选择相对较小的增长率(拉普拉斯分布)。然而，在流行病规模上，增长率参数应该考虑相对较大的值。因此，我们将通过设置规模为<samp>100</samp> 来增加先验分布的方差。一个有用的练习是检查增长率估计对这个先前分布的不同比例值的敏感性(如scale = 1，10，100)。

其他先验值可以保持默认选项。

### 设置采样模块

模型中的每个参数都有一个或多个“采样模块”(被其他MCMC软件包如MrBayes和LAMARC称为移动，建议或转换内核)。采样模块指定的是参数是如何随着MCMC的运行而改变的。 BEAUti中的`Operators`选项列出了参数，其相关采样模块以及采样模块的调整设置:

{% include image.html file="image10.png" prefix=root_url %}

请注意聚合增长率参数(`exponential.growthrate`)有一个`randomWalk`采样模块。该模块适合于既可以是正值又可以是负值的参数(严格为正值的参数可以使用规模采样模块)。在此表中无需任何改变。
 
### 设置MCMC选项

BEAUti中的`MCMC` 选项提供了控制MCMC链和生成log文件的设置。

{% include image.html file="image11.png" prefix=root_url %}

对于本教程数据集，我们起初设置链长为<samp>100,000</samp> ，采样频率为<samp>100</samp>。`File name stem:` 已经设置为 <samp>H1N1pdm_2009</samp>，但是您也可以调整这些(或许添加更多关于分析的指示)。

现在我们可以准备生成BEAST XML文件。从`File`菜单选择`Generate XML...`(或者主窗口底部按钮)。BEAUti 将会要求您在保存文件之前再次查看先验设置(并指示是否有任何不正确的设置)。接着为文件选择命名---它将在MCMC面板中提供您给出的名称，我们通常以'.xml' 结束文件名(尽管在Windows系统您可能希望为文件提供扩展名'.xml.txt')。

{% include tip.html content="为方便起见，请使BEAUti 窗口处于打开状态，以便您可以根据本教程后面的要求更改值并重新生成BEAST文件。"%}

## 运行BEAST

创建BEAST XML文件后，可以使用BEAST执行分析。

{% include icon-callout.html file='icons/beast-icon.png' content='Run <a href="beast">BEAST</a>通过双击其图标运行BEAST.' %}

BEAST启动后，将出现一个对话框，您可以在其中选择XML文件:

{% include image.html file="image12.png" prefix=root_url max-width="50%" align="center" %}

点击`Choose File...` 按钮，选择刚才创建的XML文件，然后点击`Run`。然后将执行分析，其中包含有关正在写入屏幕的运行进度等详细信息。运行结束后log文件和trees文件将会创建在与XML文件相同的位置。

[有关BEAST对话框中其他选项的更多信息，请参阅此页面](beast).

## 分析BEAST的输出
    
{% include icon-callout.html file='icons/tracer-icon.png' content='为了分析运行BEAST的结果，我们将使用程序 <a href="tracer">Tracer</a>. 通过双击其图标运行Tracer。' %}

从`File`菜单选择`Import Trace File...`选项。选择之前创建的log文件 <samp>H1N1pdm_2009.log</samp>。该文件将加载，您将看到一个类似于下面的窗口。 

{% include image.html file="image13.png" prefix=root_url %}

类似于[之前的教程](rates_and_dates) 所有追踪迹线的有效取样大小(ESSs)都比较小(ESSs小于100的在Tracer中红色高亮)。在窗口的右下方是样本的频率图，对于上图`posterior`的追踪迹线有多个峰值。

如果我们选择右侧标记为`Trace`的选项卡，我们可以查看原始的追踪迹线---MCMC链中步数的采样值:

{% include image.html file="fig14.png" prefix=root_url %}

在这里很明显，链长10％的默认老化是不充分的(超出第一部分链长之后的后验概率值仍在增加)。双击左上角的`Burn-In` 列并进行编辑(上边情况下，最小值为<samp>20,000</samp>)。然而，很明显链长<samp>100,000</samp> 已经足够了。ESS值(通常为较低的两位数字)表明链长为<samp>10,000,000</samp> 会很合适。在现代计算机上，这可能只需要大约20分钟，但我们提供了运行此链长的输出结果，您可以在本节的其余部分使用。

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 运行更长代次的log文件 <a href="{{ root_url }}files/Long_Run_H1N1pdm_Exponential.zip">可以在此处下载</a>.</div>
</div>

将新的log文件 (<samp>H1N1pdm_2009.log</samp>) 加载到Tracer(可以和之前加载的进行比较)。点击`Trace`选项查看新的原始追踪图。

我们再次选择对于聚合模型参数生成1000个样本并且>300的选项，样本之间几乎没有自相关性。该图中没有明显的趋势表明MCMC尚未收敛，并且迹线中没有大规模波动，这表明混合不是很好。

由于我们对MCMC的结果感到满意，我们现在可以转到感兴趣的参数之一:我们在对指定树先验值时聚合模型的指数增长率。选择左侧表格的 `exponential.growthRate`。现在通过选择选项`Marginal Prob Distribution`可以选择密度图。该图展示的是该参数的后验概率密度图。您应该看到类似于此的图:

{% include image.html file="image15.png" prefix=root_url %}

如您所见，后验概率密度大致为钟形。默认的是核密度的估计(KDE)，该数据符合平滑概率密度。切换到顶部的`Display:`选项到`Histogram`查看未平滑的频率图。这里仍然有很多噪音，但它是对分布的一个很好的估计。 

{% include callout.html type="warning" content="The <code>age(root)</code> 统计提供的是对整个树的最近共同祖先的估计。在病毒从宿主猪跨种传播到人时，对流行的开始可能是最好的估计。MRCA日期的平均估计值和95％HPD是多少?<br /><br /><br />" %} 

您可以在`Analysis`菜单选择`Demographic Reconstruction...` 查看种群的增长估计值。选择此选项并设置如下所示的对话框:

{% include image.html file="image16.png" prefix=root_url %}

选择`Demographic Model: Exponential Growth (Growth Rate)` --- 注意，必须选择在BEAUti中所选的先验树，此处不能修改。Tracer 将会自动识别模型的参数(`exponential.popSize` and `exponential.growthRate`)。`Maximum time is the root height's:`选项选择`Upper 95% HPD`.。这意味着它将重建延伸回根节点年龄的可信区间。设置`Age of youngest tip:`为<samp>2009.403</samp> (样品的最近采样日期)。也可以设置`Use manual range for bins:`使时间尺度更清晰---选择<samp>2009.0</samp>至<samp>2009.42</samp>。点击`OK`，窗口将如下所示:

{% include image.html file="image17.png" prefix=root_url %}

图的实心区域显示的是指数增长的中位值和95% HPD的置信区间。由于为对数尺度，因此是一条直线。可以用`Setup...`按钮来设置时间轴。垂直的虚线表示的是树根节点日期的95% HPD。

{% include callout.html type="primary" content="The exponential.growthRate (\\( r \\)) 是对H1N1pdm 2009大流行增长率的估计。鉴于\\( N t = N_0 e^{-r t} \\) (with \\( N_0 \\) 是目前的种群大小)，\\( r = 21 \\) 的双倍时间大约是0.03年或者12天。有意义的是，基本增殖率(\\( R_0 \\))与生长率有关---[详见此页](/estimating_R0.html)。然而，基本增长数不仅取决于(\\( r \\))的估计，而且取决于生成时间分布的估计，该参数反应的是在传播过程中有效感染的时间。如果我们假设生成时间分布遵循伽马分布，那么会有\\( R_0 = (1 +  r / b) ^a \\)，其中\\( a \\)和\\( b \\) 伽马分布的参数(\\( a = \mu^2 / \sigma^2 \\), \\( b = \mu / \sigma^2 \\))。" %} 

{% include callout.html type="warning" content="假设\\( \mu = 3 \\) 天，以及\\( \sigma = 2 \\)天，H1N1pdm 2009的\\( R_0 \\) 的平均估计是多少\\( R_0 \\)?<br /><br /><br />" %}

## 总结树

我们已经看到我们如何使用Tracer来诊断MCMC的运行以及生成对我们模型参数边际后验概率分布的估计。接下来我们可以用BEAST包的[TreeAnnotator](treeannotator) 来总结生成的树中所包含的信息。

{% include icon-callout.html file='icons/utility-icon.png' content='双击其图标，运行TreeAnnotator。' %}

TreeAnnotator采样单个'target'树，以及使用来自整个树样本的汇总信息对其进行注释。总结的信息包含平均节点时间(带有HPD间隔)，后验概率以及每个分支的平均进化速率(对于宽松分子钟，其可以变化)。程序为在指定的'target'树的每个节点或分支的计算相关值。

设置`Burnin (as states):`为<samp>1,000,000</samp>。这是链长的10%，Tracer可以证明这已经足够了。其他的选项为默认值---`Posterior probability limit: 0`，`Target tree type: Maximum clade credibility tree`，以及 `Node heights: Median`。

使用`Choose File...`按钮来选择输入树的文件,<samp>H1N1pdm_2009.trees</samp>。

{% include tip.html content='在多数BEAST包中，如果有一个按钮来选择文件，您也可以将文件拖到此区域。' %}

选择输出树文件的名称(如 <samp>H1N1pdm_2009.MCC.tre</samp>)。

一旦选择以上所有选项，点击`Run`按钮。TreeAnnotator将会分析输入树的文件并且将总结的树写入所指定的文件。该树是一个标准的NEXUS树文件格式，因此可以载入任何一个支持该文件的绘图包中。然而，它还包含只能使用[FigTree](figtree)程序显示的其他信息。

## 查看注释的树

{% include icon-callout.html file='icons/figtree-icon.png' content='<a href="figtree">FigTree</a> 是一个友好的图形程序，用来查看树以及BEAST所提供的相关信息。双击FigTree图标运行它。' %}

现在运行FigTree，从`File`菜单选择`Open...`命令。选择前一节用TreeAnnotator所创建的树文件。树将会呈现在igTree窗口。在窗口的左侧是控制树如何展示的选项与设置。此次我们想展示的是树中每个分支的后验概率，以及每个节点年龄的估计。为此，您需要更改一些设置。

首先在`Tree`菜单下选择`Increasing Node Order`来对节点重新排序。切换到左侧控制面板的`Branch Labels`，通过点击左侧的箭头打开该部分。现在在 `Display:`选项下选择`posterior`。降低`Sig. Digits`到<samp>2</samp>。

我们现在想要在树上显示条形来表示每个节点的日期估计的不确定性。TreeAnnotator将此信息以95％最高后验概率密度(HPD)可信区间的形式放置在树文件中。切换到控制面板的`Node Bars`打开此部分；选择`height_95%_HPD` 来展示节点高度的95% HPDs。

我们还可以绘制这个进化历史的时间轴。切换到`Scale Axis`(关掉`Scale bar`)，在`Scale Axis`选项下选择`Reverse Axis`选项(您也可以稍微增加字体大小)。要进行适当的缩放，请打开面板的`Time Scale`，设置`Offset:`到<samp>2009.403</samp> (最近采样的病毒的日期)。

最后，打开`Appearance`面板，改变`Line Weight`以使用较粗的线条绘制树。生成的树将如下所示:

{% include image.html file="image18.png" prefix=root_url %}

这些选项实际上都不会改变树的拓扑或分支长度，因此可以随意浏览选项和设置。您也可以保存树，这将保存您的大多数设置，以便当您再次将其加载到FigTree时，它将显示几乎与您选择的完全相同。树也可以导出到图形文件(pdf，eps，等)。

## 参考文献
- Smith GJD, Vijaykrishna D, Bahl J, Lycett SJ, Worobey M, Pybus OG, Ma SK, Cheung CL, Raghwani J, Bhatt S, Peiris JSM, Guan Y & Rambaut A (2009) Origins and evolutionary genomics of the 2009 swine-origin H1N1 influenza A epidemic. Nature 459, 1122-1125.

## 帮助文档

BEAST网站: [http://beast.community](http://beast.community)

教程: [http://beast.community/tutorials](http://beast.community/tutorials)

常见问题: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

---
title: 估计具有时间标记序列的速率和日期
keywords: beast, tutorial, rate, date, workshop
last_updated: August 2, 2017
tags: [tutorial, workshop]
summary: "本章提供了对于不同时间点(异质数据)分离毒株组成的数据集的分步教程。在美洲，黄热病毒通常被引用的起源假说为源于非洲的埃及伊蚊，通过奴隶贸易期间的帆船舱底引入。尽管Bryant et al.(2007)在论文中已经提出奴隶贸易引入的假说，但是还没有通过用基因序列数据和现代系统发育技术相结合来估计其分歧时间的严格检验。本练习的目的是获得对分子进化速率的估计，最近共同祖先的估计以及通过恰当的统计支持方法来推断系统发育关系。"
sidebar: beast_sidebar
permalink: workshop_rates_and_dates.cns.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/workshop_rates_and_dates/{% endcapture %}

## 前言

第一步是将带有DATA或CHARACTERS模块的NEXUS文件转化为BEAST XML输出文件。该步骤通过BEAUti(代表贝叶斯进化分析程序)完成。这是一个友好用户程序，用来设置进化模型和MCMC分析的选项。第二步是对含有数据，模型以及设置的输出文件运行BEAST。最后一步是分析BEAST输出的结果，来诊断问题以及总结结果。

执行本教程前，您需要下载与您的计算机系统兼容的3个软件包(均适用于Mac OS X，Windows以及Linux/UNIX操作系统):

{% include beast_callout.md %}

{% include tracer_callout.md %}

{% include figtree_callout.md %}

数据集为来自非洲和美洲黄热病毒(YFV)的71条prM/E基因,其分离时间范围为1940-2009年。
序列为Bryant等人分析的数据集的子集([Bryant JE, Holmes EC, Barrett ADT, 2007 Out of Africa: A Molecular Perspective on the Introduction of Yellow Fever Virus into the Americas. PLoS Pathog 3(5): e75](http://doi.org/10.1371/journal.ppat.0030075)).

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 所有本教程需要的文件
<a href="{{ root_url }}files/YFVtutorialFiles.zip"> 从此处下载</a>。
如果已经下载了压缩文件夹，没有必要再下载本教程链接的其它文件或文件夹。
</div>

## 将数据导入BEAUti

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 数据文件为<samp>YFV.nex</samp>可以从此处下载:<br />
 <div style="margin: 16px"><code>Tutorials\Tutorial 1 - Rates and Dates\Data\YFV.nex</code></div>
 <a href="{{ root_url }}files/YFV.nex">也可以从此处下载</a>.</div>
-->
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> 数据文件为'<samp>YFV.nex</samp>'和<a href="{{ root_url }}files/YFV.nex">可以从此处下载</a>.</div>

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>数据集 '<samp>YFV.nex</samp>'可以在BEAST包的'<samp>examples/Data/</samp>'文件夹下载或者<a href="{{ root_url }}files/YFV.nex">从此处下载</a>.</div>
-->

{% include icon-callout.html file='icons/beauti-icon.png' content='<a href="beauti">BEAUti</a> 通过双击其图标运行。BEAUti是一个交互式图形应用程序，用来分析和生成BEAST可以运行的控制文件(一个BEAST XML文件)。' %}

导入NEXUS格式的文件，仅仅需要从`File`菜单选择`Import Data...`选项，然后选择文件`YFV.nex`。
该文件为71条YFV prM/E 基因序列，序列长度为654个核苷酸。
一旦导入，序列数据将会在"Data Partitions"列出:

{% include image.html prefix=root_url file="image1.png" %}

双击表格中的文件名(而不是Partition名字)来展示实际的比对文件:

{% include image.html prefix=root_url file="image1b.png" %}

### 指定分类集

在`Taxa`面板，我们可以定义想获得某些特定统计的分类集群，强制执行单类群限制或者输入校准信息。
让我们通过点击面板左下侧的"+"来定义"美洲"分类群:

{% include image.html prefix=root_url file="image2.png" width="50%" %}<br />

该步骤将创建一个新的分类群。
通过双击出现的条目(起初称作`untitled1`)来重新命名。
称其为`Americas`。
由于我们要评估对该类群的支持，因此不强制执行`monophyletic?`。
由于我们想估计来自美洲的病毒的TRMCA，而不是导致这个分支的父节点，因此我们也不选择`includeStem?`。

在下一张表格您将看到可用的分类群。
通过点击绿色箭头按钮分类将会被选择并被移动到`Included taxa`。
注意可以分别按住Mac或PC上的"命令"或"控制"按钮同时选择多个分类。
由于多数分类来自美洲，最简便的方法是选中所有分类将其移动到`Included taxa`，然后将非洲分类移回非洲分类(取样国家包含在分类群名称末尾)。检查左侧仅有非洲国家(应该有21条),右侧应该仅有美洲国家(应该有50条)。

对于更多创建分类群的信息，[详见此页](taxon_sets)。

完成以上操作后，屏幕应如下所示:

{% include image.html prefix=root_url file="image3.png" %}

#### 设置叶节点日期

为了让BEAUti/BEAST识别序列的采样日期，请转到`Tips`面板，选择选项`Use tip dates`。默认情况下，所有分类的日期假设为0(即假设所有序列在同一时间采集；BEAST将当前或最近的采样时间视为时间0)。在本教程中，YFV序列的采样可以追溯到1940s不同日期。实际的采样年份在每个分类单元的名称中给出，我们可以在在"Date column"简单地编辑表格中的日期以反映这些值。然而，如果分类单元名称包含校准信息，则在BEAUti中指定序列日期的便捷方法是使用在`Tips`面板顶部的`Parse Dates`按钮。单击此按钮将显示一个对话框:

{% include image.html prefix=root_url file="image4.png" %}

此操作尝试从分类单名称包含的信息中猜测日期。它的工作原理是尝试在每个名称中找到一个数字字段。如果分类单元名称包含多个数字字段(例如上面的一些YFV序列)，那么您可以指定如何找到与采样日期对应的数字字段[有关此面板中对于设置日期的不同选项的详细内容，请参阅此页面](tip_dates)。对于YFV序列分析，可以保持默认的`Defined just by its order`和`Order: first`(请注意确保选中`Parse as a number`选项)。

在解析数字时，可以要求BEAUti为每个日期添加固定值，此应用有益于[将2位数的年份转换为4位数字的年份](tip_dates)。由于在本教程中所有的日期被指定为4位数字的格式，没有必要再添加额外的设置。因此，我们可以点击`OK`。

{% include image.html prefix=root_url file="image5.png" %}

`Height` 一列列出了相对于时间0的时间提示(本教程是2009)。

{% include tip.html content='此处有许多解读不同格式叶节点日期的选项。<a href="tip_dates.html">关于这些选项的详细描述详见此页。</a>' %}

对于本教程的这些序列仅提供了采样年份，并没有确切的日期。考虑到该例子相对较大的进化时间尺度，其不确定性可以忽略，然而，[可以调整取样的不确定性---详见此处](sampling_tipdates).

### 设置进化模型

接下来要做的是点击主窗口顶端的`Sites`选项。该选项将会揭示对于BEAST的进化模型的设置。哪些选项会出现取决于数据是核苷酸还是氨基酸(或者性状)。本教程假设您熟悉可用的进化模型；然而BEAUti中选择模型还有几点需要注意:

{% include modules/substitution_models.md %}

 对于本教程，选择`3 partitions: positions 1, 2, 3`选项，使每个密码子位置有其独立的HKY进化模型，进化速率，碱基频率，以及位点的伽马分布率变量:

{% include image.html prefix=root_url file="image6.png" %}

### 设置分子钟模型

点击主窗口顶端的`Clocks`面板。我们将使用(默认)严格分子钟模型执行初始运行:
 
{% include image.html prefix=root_url file="image7.png" %}

### 设置起始树和树先验分布

点击主窗口顶端的`Trees`面板。我们保留默认的随机起始树和(简单)恒定大小的聚合先验分布。树的先验分布(聚合和其他模型)[详见此页](tree_priors)。

{% include image.html prefix=root_url file="image8.png" %}

### 设置先验分布

查看`Priors`面板下的设置:

<!-- this image is out of date - shows allMus rather than allNus -->
{% include image.html prefix=root_url file="image9.png" %}

<!-- perhaps this should be left for model selection section? -->
一些默认的边际先验值可能是不合适的---意味着概率分布没有整合到有限值。在当前的默认设置中，对于`constant.popSize`的先验分布值 `1/x`就是一个不合适的例子。

为所有被估计的参数提供适当的先验是非常重要的，由于不正确的先验分布会导致不适当的后验估计和不正确的边际似然值(当进行贝叶斯模型选择时，请参阅另一个不同的教程)。比如，为了改变对`constant.popSize`的先验分布，点击相关的先验分布，先验分布选择的主窗口将会出现。设置先验值为正态分布，`mu = 1`，`sigma = 10`。该先验分布的图形表明大多数先验值处于相对较小的值上，但是密度在较大值上仍然扩散。<请注意，单击"OK"确认此设置后，先前的设置变为黑色。>

{% include image.html prefix=root_url file="image10.png" %}

注意进化速率的默认先验分布(clock.rate)接近于条件参考先验(Approx. Reference Prior) (Ferreira and Suchard, 2008)。如果序列不是来自于不同的采样日期(异质性)，或者当采样时间范围对于分类群的进化规模来说是微不足道的，替代速率可以固定为一个来源于其他参考的值，或者更好的是，可以为先验分布指定一个不确定的‘外部’速率。固定速率为1.0将会使树的节点日期以每个位点的替换为单位来估计(比如在一些常见的包如MrBayes以支长为单位)。注意当选择固定速率为某一值时，该参数的转换参数(`Operators`面板，详见此页)将会自动取消。 

### 设置采样模块

{% include modules/operator_table.md %}

对于此分析，无需改变列表设置。

### 设置MCMC选项

BEAUti中的MCMC选项卡提供控制MCMC链的设置。首先是链的长度，这是MCMC在完成之前在链中所做的步数。这取决于数据集的大小，模型的复杂性和所需回答问题的精确度。默认值10,000,000完全是随机的，应根据数据集的大小进行调整。稍后我们将看到如何使用Tracer分析生成的log文件，来检查特定链长是否足够。

{% include image.html prefix=root_url file="image12.png" %}

接下来两个选项指定当前参数值应在屏幕上显示并记录在log文件中的频率。屏幕输出仅用于监测程序的进度，因此可以设置为任意值(尽管设置得太小，屏幕上显示的信息量将减慢程序的运行速度)。对于log文件，应该相对于链的总长度设置该值。过于频繁的采样将导致非常大的文件，在估计的精确度方面几乎没有额外的好处。样本太少，log文件中包含有关参数分布的信息较少。您可能希望存储不超过10,000个样本，因此应将其设置为大于等于链长的万分之一。

对于本数据集，我们最初将链长设置为100,000，因为这将在多数现代计算机上运行的相当快。尽管根据以上建议表明较低的采样频率，本数据将采样频率设置为100。

{% include tip.html content="也可以设置屏幕显示取样频率不同于log文件。本教程分析运行十分快，因此每运行100步将会导致大量信息滚动于屏幕。试图设置`Echo state to screen`选项为`10000`，将会在运行时在屏幕上进行100次更新。" %}

下一个选项允许用户设置文件主干名称；如果不默认设置为‘YFV’，则可在此处输入(或者添加相关分析的更多详细信息)。接下来的两个选项给出了log文件的参数和树的文件名。根据文件主干名，将其设置为默认值。

{% include note.html content="Windows 系统会隐藏您的文件扩展名。有时候很容易为log文件和tree 文件添加`.txt` 后缀----- Windows 将会隐藏`.txt`，但仍然显示 `.log` 和`.trees` 拓展名，以便于区分文件。" %}

其它选项可以不选。仅仅从先验分布中取样有利于评估当从数据中提取信息时后验概率的差异性。当然，也可以边际似然估计来评估模型的拟合；我们将在后面的教程中讲述到这一点。

### 保存和加载BEAUti文件

如果从`File`菜单选择`Save` 选项，将会保存文件为BEAUti自己的格式。请注意这不是BEAST能够识别的文件---该文件仅能够被BEAUti打开。BEAUti该设置和数据仅是能够为了保存和后续再次载入。我们建议保存BEAUti文件时加其拓展名'.beauti'。

{% include note.html content="正如BEAUti文件不能被BEAST解读，BEAST XML文件也不能再次被载入BEAUti。然而，它们可以像NEXUS或FASTA文件一样'导入'。将导入其中包含的序列数据，以及所有叶节点日期和某些其他信息。" %}

### 生成BEAST XML文件

我们现在准备创建BEAST XML文件。从`File`菜单(或者主窗口底部按钮)选择`Generate XML...`。BEAUti将要求您在保存文件之前再次查看先前的设置(并指示是否有任何不正确的设置)。继续并选择文件的名称---它将在MCMC面板中提供您给出的名称，我们通常以'.xml'结束文件名 (尽管参阅以上关于在Windows上的拓展名--您可能希望给文件扩展名'.xml.txt')。

{% include tip.html content="为方便起见，请保持BEAUti窗口处于打开状态，以便您可以根据本教程后面的要求更改值并重新生成BEAST文件。" %}

## 运行BEAST

我们现在准备通过BEAST运行该文件。

{% include icon-callout.html file='icons/beast-icon.png' content='通过双击BEAST图标运行BEAST。' %}

将出现以下对话框:

{% include image.html prefix=root_url file="image13.png" %}

您只需单击`Choose File...`按钮，选择在BEAUti中生成的XML文件，然后点击`Run`。[有关其它选项的信息，请参阅BEAST程序页面 ](beast)。

当点击`Run` BEAST将加载XML文件，设置分析，然后运行它而不进行进一步的交互。在输出窗口中，您将看到许多信息出现。首先显示的是标题和著作信息:

```
       BEAST v1.10.0 Prerelease #VEME2017, 2002-2017
       Bayesian Evolutionary Analysis Sampling Trees
                 Designed and developed by
   Alexei J. Drummond, Andrew Rambaut and Marc A. Suchard

               Department of Computer Science
                   University of Auckland
                  alexei@cs.auckland.ac.nz

             Institute of Evolutionary Biology
                  University of Edinburgh
                     a.rambaut@ed.ac.uk

              David Geffen School of Medicine
           University of California, Los Angeles
                     msuchard@ucla.edu

                Downloads, Help & Resources:
                  	http://beast.community

Source code distributed under the GNU Lesser General Public License:
          	http://github.com/beast-dev/beast-mcmc
```                              

然后给出了它加载的数据和指定的模型的一些细节(为简洁起见，下面省略了一些行)。您应该看到它重复了您在BEAUti中所做的所有选择。

```
Random number seed: 1503410333443

Parsing XML file: YFV.xml

Read alignment: alignment
  Sequences = 71
      Sites = 654
   Datatype = nucleotide
Site patterns 'CP1.patterns' created from positions 1-654 of alignment 'alignment'
  only using every 3 site
  unique pattern count = 59
Site patterns 'CP2.patterns' created from positions 2-654 of alignment 'alignment'
  only using every 3 site
  unique pattern count = 33
Site patterns 'CP3.patterns' created from positions 3-654 of alignment 'alignment'
  only using every 3 site
  unique pattern count = 201

Creating the tree model, 'treeModel'
  initial tree topology = (...)
  tree height = 69.38328510064179

Using strict molecular clock model.

Creating state frequencies model 'frequencies': Initial frequencies = {0.25, 0.25, 0.25, 0.25}

Creating HKY substitution model. Initial kappa = 2.0

Creating state frequencies model 'frequencies': Initial frequencies = {0.25, 0.25, 0.25, 0.25}

Creating HKY substitution model. Initial kappa = 2.0

Creating state frequencies model 'frequencies': Initial frequencies = {0.25, 0.25, 0.25, 0.25}

Creating HKY substitution model. Initial kappa = 2.0

Creating site rate model:
  with initial relative rate = 1.0
  4 category discrete gamma with initial shape = 0.5

Creating site rate model:
  with initial relative rate = 1.0
  4 category discrete gamma with initial shape = 0.5

Creating site rate model:
  with initial relative rate = 1.0
  4 category discrete gamma with initial shape = 0.5
.
.
.
Creating the MCMC chain:
  chainLength=100000
  autoOptimize=true
  autoOptimize delayed for 1000 steps
```

接下来，它打印出BEAST的引用模块以及所选的各个模型和组分。这是为了帮助您编写分析，指定和引用所使用的模型:

```
Citations for this analysis:

FRAMEWORK
BEAST primary citation:
	Drummond AJ, Suchard MA, Xie Dong, Rambaut A (2012) Bayesian phylogenetics with BEAUti and the BEAST 1.7. Mol Biol Evol. 29, 1969-1973. DOI:10.1093/molbev/mss075

SUBSTITUTION MODELS
HKY nucleotide substitution model:
	Hasegawa M, Kishino H, Yano T (1985) Dating the human-ape splitting by a molecular clock of mitochondrial DNA. J. Mol. Evol.. 22, 160-174
Discrete gamma-distributed rate heterogeneity model:
	Yang Z (1994) Maximum likelihood phylogenetic estimation from DNA sequences with variable rates over sites: approximate methods. J. Mol. Evol.. 39, 306-314

PRIOR MODELS
CTMC Scale Reference Prior model:
	Ferreira MAR, Suchard MA (2008) Bayesian analysis of elapsed times in continuous-time Markov chains. Canadian Journal of Statistics. 36, 355-368
```

最后BEAST开始运行。它打印出各种信息，可用于跟踪发生的情况。第一列是'状态'数---在这种情况下，它递增1000，因此在每个行之间它已经进行了1000次操作。屏幕log仅显示一些指标和参数，但它也将log文件记录到磁盘，其中包含所有结果(以及包含这些状态的采样树的'.trees'文件)。

在几千个状态之后，将会开始报告每百万个状态所消耗的小时数(或者会运行的非常快，每十亿个状态)。这有助于您预测将会运行多长时间，以及您是否有时间去加勒比海地区享用一杯咖啡，午餐或两周假期。

```
# BEAST v1.10.0 Prerelease #VEME2017
# Generated Tue Aug 22 14:59:04 BST 2017 [seed=1503410333443]
# -beagle
state	Posterior     Prior       Likelihood    rootAge   clock.rate  
0       -17832.0434   -209.3400   -17622.7035   1939.62   1.00000     -
100     -16759.9962   -201.5887   -16558.4075   1939.63   0.79663     -
200     -15788.1880   -195.6302   -15592.5578   1939.63   0.74501     -
300     -15339.8944   -201.7870   -15138.1074   1939.65   0.74501     -
400     -14704.4588   -192.4580   -14512.0008   1939.65   0.61861     -
.
.
```

在等待预期的时间后，BEAST将完成。

```
.
.
99500	-5947.7998   -606.3356   -5341.4642   535.003   2.06631E-4   43.95 hours/billion states
99600	-5944.2435   -605.9852   -5338.2583   464.495   2.06631E-4   43.95 hours/billion states
99700	-5943.2009   -606.0432   -5337.1577   471.835   1.88318E-4   43.94 hours/billion states
99800	-5952.6018   -610.7744   -5341.8274   549.930   2.10672E-4   43.95 hours/billion states
99900	-5944.0227   -603.4808   -5340.5419   730.490   2.08943E-4   43.95 hours/billion states
100000	-5944.2243   -600.5219   -5343.7025   598.543   2.08943E-4   43.95 hours/billion states

Operator analysis
Operator                                          Tuning   Count      Time     Time/Op  Pr(accept)
scale(CP1.kappa)                                  0.357   1153       187      0.16     0.2402      
scale(CP2.kappa)                                  0.219   1049       149      0.14     0.2479      
scale(CP3.kappa)                                  0.55    1116       410      0.37     0.2348      
frequencies                                       0.07    1105       438      0.4      0.2471      
scale(CP1.alpha)                                  0.385   1109       224      0.2      0.2435      
scale(CP2.alpha)                                  0.245   1161       189      0.16     0.2343      
scale(CP3.alpha)                                  0.46    1158       397      0.34     0.2383      
scale(clock.rate)                                 0.747   3406       1345     0.39     0.2372      
up:clock.rate down:nodeHeights(treeModel)         0.905   3471       979      0.28     0.2264      
allMus                                            0.129   3430       957      0.28     0.2423      
subtreeSlide(treeModel)                           55.702  16910      1668     0.1      0.2367      
Narrow Exchange(treeModel)                                17007      1449     0.09     0.1364      
Wide Exchange(treeModel)                                  3373       184      0.05     0.0044      
wilsonBalding(treeModel)                                  3342       466      0.14     0.0093      
scale(treeModel.rootHeight)                       0.304   3441       324      0.09     0.2479      
uniform(nodeHeights(treeModel))                           34356      4387     0.13     0.4551      
scale(constant.popSize)                           0.514   3413       132      0.04     0.2429      

17.445 seconds
```

最后的表列出了每个操作模块，以及每个操作模块的次数，它们花费的时间以及其他一些细节。此信息可用于优化运行的性能，但通常可以忽略。

## 分析BEAST的输出

{% include icon-callout.html file='icons/tracer-icon.png' content='为了分析BEAST运行的结果，我们将使用程序 <a href="tracer">Tracer</a>。 通过双击Tracer图标运行Tracer icon。' %}

从`File`菜单选择`Import Trace File...`选项。如果可用，请选择您在上一节中创建的log文件。该文件将加载，您将看到一个类似于下面的窗口。请记住，MCMC是一种随机算法，因此实际数字不会完全相同。

{% include image.html prefix=root_url file="image14.png" %}

{% include modules/tracer_statistics.md %}

注意所有"traces"的有效样本大小(ESSs)都比较小(在Tracer中ESSs<100红色高亮，而>100，<200黄色高亮)。这个结果并不好。低ESS值意味着"traces"包含许多相关样本，因此，并不能很好地代表后验概率的分布。在主窗口的右下侧是取样频率图，该图认为低ESSs值的取样是非常粗糙的。

如果我们选择了右侧`Trace`标签，我们可以看到原始的追踪，也就是，MCMC链中步骤的采样值:

{% include image.html prefix=root_url file="image15.png" %}

这里，您可以看到样本是如何自相关的---在追踪中有1000个样本(我们运行MCMC 100,000步，每100步取样一次)，但是很明显，相邻样本通常具有相似的值。根节点年龄的ESS值(`treeModel.rootAge`)仅为6，因此每167次实际采样获得一个独立的样本)。

看起来链长10％的默认老化是不充分的(在大多数链中后验概率仍在上升)。不排除足够的链条起点作为老化，将使结果偏差并使ESS的估计不可靠。设置`burn-in`为20,000(双击跟踪文件表中的数字进行编辑)。将看到如下图所示:  

 {% include image.html prefix=root_url file="image16.png" %}

您可能会看到ESS有所改善，但它们仍然很低。在上图中，根节点的年龄看起来有向下的趋势，这意味着它没有被老化或者它可能是更长周期的自相关值的一部分。

对这种情况的简单回应是我们需要更长时间地运行链长。返回到BEAUti(希望处于打开状态)，返回到`MCMC`选项部分，将创建一个具有更长链长的新的BEAST XML文件(比如：10,000,000)。  

<!--
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
要继续学习本教程而不必等待很长时间才能完成，您可以使用本教程提供的BEAST输出文件(链长为20,000,000，每10,000个样本记录一次)。 数据文件，<samp>YFV.log</samp> 和 <samp>YFV.trees</samp>，可以在分享的文件夹中找到:
<div style="margin: 16px"><code>Tutorials\Tutorial 1 - Rates and Dates\Long_Run_YFV\</code></div>
文件，<a href="{{ root_url }}files/YFVLongRuns.zip"><samp>YFVLongRun.zip</samp>，可以从此处下载 </a>.</div>
-->
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
继续学习本教程而不必等待很长时间才能完成，您可以使用本教程提供的BEAST输出文件(链长为20,000,000，每10,000个样本记录一次)。数据文件，<samp>YFV.log</samp> 和 <samp>YFV.trees</samp>, <a href="{{ root_url }}files/YFVLongRuns.zip"><samp>YFVLongRuns.zip</samp>, 可以从此处下载</a>.</div>

导入严格分子钟并运行的新的较长log文件，选择`treeModel.rootAge`统计信息并点击`Trace`标签查看原始的追踪图。

{% include image.html prefix=root_url file="image17.png" %}

提供的log文件包含2000个样本，clock.rate的ESS为262，样本之间仍存在一定程度的自相关，但是262个有效独立的样本现在将提供后验分布的合理估计。该图中没有明显的趋势表明MCMC尚未收敛，并且追踪中没有大规模波动，这表明没有达到良好的混合状态。

由于我们对后验概率感到满意，我们现在可以转向感兴趣的参数之一:替代率。在左侧列表选择 `clock.rate`。这是对齐文件中所有位点的平均替换率。现在通过选择`Marginal Prob Distribution`来选择密度图。该图显示的是该参数的后验概率密度的核密度估计(KDE)。您应该看到类似于此的图:

{% include image.html prefix=root_url file="image18.png" %}

正如您所看到的，后验概率密度很好地呈钟形。当查看`Estimates`当查看在估计面板中等价的直方图时时，存在一些采样噪声被KDE平滑化;如果我们将链长运行更长，这将会减少，但我们已经对平均值和HPD间隔进行了合理估计。您可以重合多条轨迹线的密度图以进行比较(由用户决定它们是否在同一轴上具有可比性)。选择左边表格中所有三个密码子位置的相对替代率(标记为`CP1.mu`，`CP2.mu` 和`CP3.mu`，并且在 `Legend`下选择`Top-Right`。将显示覆盖所有三个密码子位置的相​​对替换率的后验概率密度:

{% include image.html prefix=root_url file="image19.png" %}

{% include question.html content="请注意，这三个比率明显不同，这告诉我们这个基因的选择压力是什么？<br /><br /><br />" %}

现在让我们来看下树的时间尺度。选择`age(root)`和`age(Americas)`的统计信息。这些是树的根节点和我们为所有美国序列定义的分支的日期。因为我们已经记录了树的叶节点日期，所以这些统计数据作为日历年给出，并且以当前日期在右侧的方式呈现(最近的采样序列是从2009年开始)。

{% include image.html prefix=root_url file="image20.png" %}

{% include note.html content="负数表示年份为公元前(BCE)，但从技术上讲，日历从从公元前1年到公元1年---没有0年。因此，如果要报告BCE年份，则应采用绝对值并添加1" %}

这表明美洲的TMRCA明显比整棵树的更近，并且对最近将黄热病病毒引入美洲的说法产生异议。然而，应该注意这些估计存在相当大的不确定性。切换到`Estimates`显示进入美洲的TMRCA平均日期是1590年，但95％HPD可信区间跨越1377到175年间。Bryant et al. (2007)表明，YFV进入美洲很可能是16至19世纪发生的大西洋奴隶贸易的结果。

## 总结树

我们已经看到我们如何使用Tracer诊断我们运行的MCMC以及对我们模型参数的边际后验分布的估计。然而，BEAST还会与模型的其他参数同时对树(系统发育或谱系)进行采样。这些被写入称为`YFV.trees`独立文件。该文件是标准的NEXUS格式文件。因此，它可以很容易地加载到其他软件中，以检查它包含的树。一种可能性是将树加载到诸如PAUP*之类的程序中，并以类似的方式构建一致树以概括一组自展值树。在本例子中，在一致树中已解析节点所报道的支持值是这些分支的后验概率。

然而在本教程中，我们将用BEAST包中的一个工具来总结存在于我们取样树中的信息。

{% include modules/treeannotator.md %}

选择`Burnin (as states)`为<samp>2,000,000</samp>，`Posterior probability limit` 为<samp>0.0</samp>，`Target tree type:` <samp>Maximum clade credibility tree</samp>，以及`Node heights:` <samp>Median heights</samp>。然后选择<samp>YFV.trees</samp>作为`Input Tree File`。

一旦选择以上所有选项，点击`Run`。TreeAnnotator将会分析输出文件并将总结树写入到您指定的文件。此树是标准的NEXUS树文件格式，因此可以加载到支持此树的任何树绘图包中。但是，它还包含只能使用FigTree来显示的额外信息。

### 查看带注释的树

{% include icon-callout.html file='icons/figtree-icon.png' content='<a href="figtree">FigTree</a> 是一个友好图形界面，用来查看树和BEAST提供的相关信息。双击FigTree运行。' %}

从`File`菜单选择`Open...`运行FigTree。选择在上一节中使用TreeAnnotator创建的树文件。树将会展示在FigTree窗口。在窗口的左侧是控制树显示方式的选项和设置。在本教程，我们希望显示树中存在于每个进化枝的后验概率以及每个节点的年龄估计。为此，您需要更改一些设置。

首先，通过`Tree`菜单下`Increasing Node Order`重新排序节点顺序。单击左侧控制面板中的`Branch Labels`，然后单击左侧的箭头打开相关部分。现在在`Display:`选项下选择`posterior`。

我们还可以为此进化史绘制时间轴：选择`Scale Axis`并取消`Scale bar`。默认情况下，时间刻度是从树的根部开始的。要进行适当的缩放，打开`Scale Axis`面板设置`Reverse Axis`选项，并且打开控制面板的`Time Scale`，设置`Offset`<samp>2009.0</samp>。

最后，打开`Appearance` 面板。改变`Line Weight`以使用较粗的线条绘制树。您还可以通过选择分支来选择分组，选择`Clade`来选择模式并选择颜色。选项不会实际改变树的拓扑结构或分支长度，因此可以随意探索选项和设置(比如美洲分支的`Highlight` 或`Collapse`)。

{% include image.html prefix=root_url file="image22.png" %}

您也可以保存树，这将保存您的大多数设置，以便当您再次将其加载到FigTree时，它将显示几乎与您选择的完全相同。

最后，还可以使用`File`菜单中的选项将树导出到图形文件(pdf，svg 等)。

{% include question.html content="来自美洲分支的病毒是否与来自非洲的病毒相关以及我们可以从推断的时间尺度得出什么结论?" %}

## 宽松分子钟分析

通过在`Clocks`选项中选择宽松的分子钟，为此数据集设置对数正态分布的宽松分子钟:

{% include image.html prefix=root_url file="image23.png" %}

此外，对于此分析，我们提供了运行更长时间的输出文件:

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i>
您可以使用本教程提供的BEAST输出文件(链长为50,000,000，每50,000个样本记录一次)。文件 <samp>YFV.log</samp> 和 <samp>YFV.trees</samp>，<a href="{{ root_url }}files/YFVLongRuns.zip"><samp>YFVLongRuns.zip</samp>，可以在此处下载</a>.</div>

{% include question.html content="次样本默认的10%老化是否足够?" %}

{% include question.html content="宽松分子钟对数正态分布的标准差估计是否表明谱系之间存在显着的速率变化？我们通常怎样测试?" %}

{% include question.html content="美国在奴隶贸易期间引入YFV的假设是否也适用于这种模式?" %}


## 参考文献

Bryant JE, Holmes EC and Barrett ADT (2007) Out of Africa: A Molecular Perspective on the Introduction of Yellow Fever Virus into the Americas. *PLoS Pathogens*, **3**: e75. [doi: 10.1371/journal.ppat.0030075](https://doi.org/10.1371/journal.ppat.0030075)

## 帮助文档

BEAST 网站: [http://beast.community](http://beast.community)

教程: [http://beast.community/tutorials](http://beast.community/tutorials)

常见问题: [http://beast.community/faq](http://beast.community/faq)

{% include links.html %}

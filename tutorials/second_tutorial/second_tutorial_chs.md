---
title: Second Tutorial
keywords: beast, tutorial
last_updated: May 24, 2018
tags: [tutorial]
summary: "本教程是BEAST入门教程的第二讲。将继续分析第一讲的输出，问题的诊断，以及结果的总结。同时会介绍BEAST包里的logcombiner和treeannotator,以及其以外的应用程序Tracer和FigTree。"
sidebar: beast_sidebar
permalink: second_tutorial_chs.html
language: cn
folder: beast
redirect_from: "/tutorial-2"
---

在 [入门教程第一讲](first_tutorial)， 我们讲述了如何将数据导入[BEAUti](beauti), 建立模型和分析，以及在[BEAST](beast)中运行。
在第二讲中，我们将通过在Tracer中检查其输出文件，在Figtree中构建一致树并对其进行可视化来分析输出的结果。
但是首先我们将解释如何合并多个独立输出的文件（即使用不同的起始种子运行相同的BEAST XML）。
当每个参数为实现好的[有效样本大小](ess_tutorial)在计算上费事时，这样的设置可能是有用的，并且多个硬件资源可并行地独立运行多个重复。


## 合并多个独立重复结果
[LogCombiner](logcombiner) 作为BEAST包的一部分，可以将多个独立重复的输出文件合并为一个文件，这使得后续分析变得容易。
值得注意的是在合并输出结果时需要运行[LogCombiner](logcombiner) 两次，一次是合并.log文件，一次是合并.tree文件。
更多地关于如何使用[LogCombiner](logcombiner) 会在其[专门讲述页面](logcombiner)找到。
在本教程的后续部分，我们假定存在.log 文件和.tree文件。


## 检查生成的转换参数
我们经常忽略的一个步骤是快速检查各种转换参数（或在BEAST中中称作运算符）的的性能。
在分析结束时，通常会创建一个.ops的文件，该文件包含重要的参数参数和估计树的进程。
对于我们在[第一讲](first_tutorial)中的分析, 创建了一个.ops的文件，其包含的成分如下所示：

```
Operator analysis
Operator                                          Tuning   Count      Time     Time/Op  Pr(accept)
scale(kappa)                                      0.289   9642       130      0.01     0.2385      
frequencies                                       0.062   9717       155      0.02     0.2409      
subtreeSlide(treeModel)                           0.02    289099     2280     0.01     0.2313      
Narrow Exchange(treeModel)                                288345     2668     0.01     0.0549      
Wide Exchange(treeModel)                                  28842      150      0.01     0.0109      
wilsonBalding(treeModel)                                  28874      172      0.01     0.0057      
scale(treeModel.rootHeight)                       0.131   28831      242      0.01     0.241       
uniform(nodeHeights(treeModel))                           287901     2710     0.01     0.3851      
scale(yule.birthRate)                             0.2     28749      103      0.0      0.2399  
```

通常，转换参数的接受值大概在0.234,或者更高，这取决于运算符的类型。
应该注意并不适用于某些树的转换参数，尤其是本次分析的分类数量较少的情况。
更重要的是保证任何一个标准的转换参数的接受值为0。


## 总结估计的参数
将含有本分析所有参数的参数样本（除了树及其对应的支长）的.log文件导入Tracer，生成如下屏幕:

{% include image.html file="tracer.png" prefix="/tutorials/second_tutorial/" %}<br />

从Tracer窗口，可以清晰地看到所有连续参数的[有效样本大小](ess_tutorial) 已经足够结束分析。
注意不应该对分类或离散的参数以及后验概率，似然值和先验采样密度进行[有效样本大小的估计](ess_tutorial)。
然而对于后验概率，似然值和先验采样密度的估计，低的[有效样本大小](ess_tutorial)可能会反应出某些参数评估存在的潜在问题，因此对于这些密度的估计确实有用。
对于离散参数来说，检查其轨迹便于评估后验分布适当的收敛是很有意义的。

注意常量参数的显示是为了完整性，而不是用来检验收敛度或者ESS值，如不能被估计的参数（clock.rate和 meanRate）或者归一化的常数（branchRates）。

对于Tracer更详细的介绍见[分析BEAST的输出文件](analysing_beast_output)和[评估收敛度](tracer_convergence).


## 构建MCC树
在BEAST分析过程中检查每棵树是不可能的，因此我们将通过总结树的后验概率分布来构建一个一致树。
在BEAST包中通过程序[TreeAnnotator](treeannotator)来构建MCC树。

一旦运行[TreeAnnotator](treeannotator)，将会呈现出以下窗口:

{% include image.html file="mcc_settings.png" prefix="/tutorials/second_tutorial/" width='80%' %}<br />

通常，在分析过程中迭代总数的10%将会被老化，前提是能足够使其通过真实的老化阶段(在Tracer中可以查看).
在`Input Tree File`中，在BEAST运行过程中生成的apes.trees文件需要被选择。
在`Output File`，类似文件不需要被选中，但是其文件名字需要在以下窗口手动输入（在`Save As 处):

{% include image.html file="mcc_output.png" prefix="/tutorials/second_tutorial/" width='80%' %}<br />

在输入所有需要的设置后，通过点击‘Run’开始构建 MCC 树。
在以下窗口可以监测到进程，结束时将会要求退出程序，MCC树已经被写入所选择的输出文件：

{% include image.html file="mcc_window.png" prefix="/tutorials/second_tutorial/" %}<br />


## 在FigTree中可视化MCC树
最后一步是将MCC树导入[FigTree](figtree)，可以看到树的结构以及[TreeAnnotator](treeannotator)生成的附属信息。
启动[FigTree](figtree)后，点击`File`，`Open...` apes.mcc.tree文件。
通常，树的节点应该以递增的顺序呈现(在`Tree` 处选择 `Increasing Node Order`).
鉴于在分析中我们没有加入时间信息，如先验值的校准信息，树下方的时间比例将以每个时间单位替换数表示(时间轴不会被添加)。
通过在左侧`Tip Labels`处设置`Font Size`，如：14，来增加叶节点标签的字体大小:

{% include image.html file="figtree.png" prefix="/tutorials/second_tutorial/" %}<br />


{% include links.html %}

---
title: Analysing Continuous Traits
keywords: beast, tutorial, continuous, traits
last_updated: July 22, 2017
tags: [tutorial]
summary: "如何联合评估分子系统发育树和形态特征的共同进化模式"
sidebar: beast_sidebar
language: cn
permalink: continuous_traits.html
folder: beast
redirect_from: "/continuous-traits"
---

## 加载序列数据

加载NEXUS格式比对的文件，仅需要从`File`菜单选择`Import NEXUS...`即可。
对于教程，请从BEAST包裹中选择examples/continuousTraits/DarwinsFinches.nex文件。
载入文件后，数据面板将如下所示:

{% include image.html prefix="tutorials/continuous_traits/" file="image1.png" %}

## 加载特征数据

接下来请加载特征数据examples/continuousTraits/DarwinsFinchesTraits.txt.
这是一个制表符分隔的文本文件，第一列具有分类单元名称（以匹配序列数据中的分类单元名称），随后的每一列都具有特征值。
第一行包含特征的名称（第一行的第一列被忽略，可以为空）。

数据如下所示:

{% include table.html content="
|  | wingL | tarsusL | culmenL | beakD | gonysW|
|--:|:--|
| Geospiza magnirostris | 4.4042 | 3.03895 | 2.724667 | 2.823767 | 2.675983 |
| Geospiza conirostris | 4.349867 | 2.9842 | 2.6544 | 2.5138 | 2.360167 |
| Geospiza difficilis | 4.224067 | 2.898917 | 2.277183 | 2.0111 | 1.929983 |
| Geospiza scandens | 4.261222 | 2.929033 | 2.621789 | 2.1447 | 2.036944 |
| Geospiza fortis | 4.244008 | 2.894717 | 2.407025 | 2.362658 | 2.221867 |
| Geospiza fuliginosa | 4.132957 | 2.806514 | 2.094971 | 1.941157 | 1.845379 |
| Cactospiza pallida | 4.265425 | 3.08945 | 2.43025 | 2.01635 | 1.949125 |
| Certhidea olivacea | 3.975393 | 2.936536 | 2.051843 | 1.191264 | 1.401186 |
| Camarhynchus parvulus | 4.1316 | 2.97306 | 1.97442 | 1.87354 | 1.81334 |
| Camarhynchus pauper | 4.2325 | 3.0359 | 2.187 | 2.0734 | 1.9621 |
| Pinaroloxias inornata | 4.1886 | 2.9802 | 2.3111 | 1.5475 | 1.6301 |
| Platyspiza crassirostris | 4.419686 | 3.270543 | 2.331471 | 2.347471 | 2.282443 |
| Camarhynchus psittacula | 4.23502 | 3.04912 | 2.25964 | 2.23004 | 2.07394 |
" caption="DarwinsFinchesTraits.txt" %}

实际的文件看起来像这样：物种名称在第一列并且特征名称在第一行。
每个项目由制表符分隔:

```
	wingL	tarsusL	culmenL	beakD	gonysW
Geospiza magnirostris	4.4042	3.03895	2.724667	2.823767	2.675983
Geospiza conirostris	4.349867	2.9842	2.6544	2.5138	2.360167
Geospiza difficilis	4.224067	2.898917	2.277183	2.0111	1.929983
Geospiza scandens	4.261222	2.929033	2.621789	2.1447	2.036944
Geospiza fortis	4.244008	2.894717	2.407025	2.362658	2.221867
Geospiza fuliginosa	4.132957	2.806514	2.094971	1.941157	1.845379
Cactospiza pallida	4.265425	3.08945	2.43025	2.01635	1.949125
Certhidea olivacea	3.975393	2.936536	2.051843	1.191264	1.401186
Camarhynchus parvulus	4.1316	2.97306	1.97442	1.87354	1.81334
Camarhynchus pauper	4.2325	3.0359	2.187	2.0734	1.9621
Pinaroloxias inornata	4.1886	2.9802	2.3111	1.5475	1.6301
Platyspiza crassirostris	4.419686	3.270543	2.331471	2.347471	2.282443
Camarhynchus psittacula	4.23502	3.04912	2.25964	2.23004	2.07394
```

从`File`菜单选择`Import Trace File...`选项。
一旦加载，特征面板将如下所示：

{% include image.html prefix="tutorials/continuous_traits/" file="image2.png" %}

接下来，我们需要将单个特征组合成多变量数据分区。
选择左侧表格中的所有五个特征，然后按下 `Create partition from trait...`按钮.
您将被要求为此新分区命名。
您可将其命名为'traits' (或者其他合适的名字):

{% include image.html prefix="tutorials/continuous_traits/" file="image3.png" %}

## 设置模型

切换到站点面板，您需为每个数据分区选择进化模型。
您应看到两个数据分区，其中'DarwinsFinches'是我们首先加载的核苷酸数据，其次'traits'是我们刚刚从五个特征中创建的多变量特征分区。（您还应在数据面板的数据表中看到这两个分区）。

请选择序列数据的首选核苷酸替代模型：

{% include image.html prefix="tutorials/continuous_traits/" file="image4.png" %}

现在请选择'traits'分区并选择连续性状进化模型（在本例中为同质布朗运动模型）：

{% include image.html prefix="tutorials/continuous_traits/" file="image5.png" %}

请选择模型的其他方面，例如树先验模型（如Yule模型）：

{% include image.html prefix="tutorials/continuous_traits/" file="image6.png" %}

请选择输出文件的名称词干和适当的链长度：

{% include image.html prefix="tutorials/continuous_traits/" file="image7.png" %}

## 分析数据

请生成XML文件，将其加载到BEAST并运行它：

{% include image.html prefix="tutorials/continuous_traits/" file="image8.png" %}

Tracer和TreeAnnotator/FigTree是分析结果的常用组合。

首先将日志文件加载到Tracer中：

{% include image.html prefix="tutorials/continuous_traits/" file="image9.png" %}

在上述中，标记为colXY的痕迹是特征X和Y的精度或共精度（按照它们在BEAUti中出现的顺序排列）。
因此，对于finch数据，col11是第一个特征‘wingL’的精度。
选择所有精度（例如col11, col22等等）
我们可以看到特征的变化程度（精度是方差的倒数，数字越大，方差越小）。
纵观所有的共精度，很明显，特征4和特征5（beakD和gonysW）有很大的负值。
这对应于强正相关（方差/协方差矩阵是精度矩阵的倒数）。

您还可以用TreeAnnotator工具来组建一个汇总MCC树，然后用FigTree来进行单个特征维度的可视化（例如通过给分支着色）。我们目前没有任何用于这些分析的多变量可视化工具，但我们希望在未来提供一些。

{% include links.html %}

---
title: 在线贝叶斯谱系动力学推断教程
keywords: online, checkpoint, resume, tutorial
last_updated: March 6, 2019
tags: [tutorial]
summary: "使用贝叶斯谱系动力学推断教程向BEAST进行中的分析增加序列."
sidebar: beast_sidebar
permalink: online_inference.html
language: cn
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/online_inference/{% endcapture %}

## 在线贝叶斯谱系动力学推断教程

通常，当一个系统发育分析已经完成或者甚至还在运行时，新的序列数据已经变得可用并需要将其纳入已经运行过或仍在运行的分析中。
许多广泛使用的系统发育推断软件包都假定在开始实际推断程序之前，所有数据都已被完全观察到。
这意味着，当新的序列数据可用时，整个系统动力学分析将用完整的数据（包含新序列数据）从头开始重新运行。
重复的从头开始重新运行动力系统学分析可能非常耗时，并且会导致延迟几天或者几周后才生成结果。

从版本[v1.10](installing)开始，BEAST配备了在线贝叶斯谱系动力学推断程序。
简而言之，这意味着BEAST将在每次在进行中的分析期间生成一个状态文件，然后可以使用该文件插入新的序列数据，并在不必完全重新启动分析的情况下继续运行进行中的数据分析。
您可以通过定期生成新版本来保障分析期间状态文件的不断更新。


## 在BEAST中生成状态（或检查点）文件

如需将给定迭代次数的状态文件写入磁盘，请添加以下程序参数: **'-save_at iteration#'** (不包括引号).
此举将创建一个包含所以必要信息且带时间戳的，以 'beast_state_xxxx.xx.xx' 为命名格式的文件。
例如，要在迭代2.000.000时为名为epiWeekX1.XML的XML格式文件生成状态文件，可以使用以下命令：

```bash
beast -save_at 2000000 epiWeekX1.xml
```

例如，此命令将会生成以下文件: 

```bash
beast_state_2018.11.11.17.14.47
```

{% include note.html content="不要使用此选项为状态文件提供输出文件名，因为BEAST将不会启动分析。我们主要将此功能视为存储BEAST分析的最终状态的一种方法。"  %}

如需每隔x次迭代将状态文件写入磁盘，请添加以下程序参数: **'-save_every x'** (不包括引号).
如果未提供文件名，且距离上次尝试写入文件的时间差至少为1秒，则每次需要将信息写入磁盘时，都会创建一个新的时间戳文件。

例如，要为XML文件epiWeekX1.XML每20.000次迭代生成一系列状态文件，可以使用以下命令：

```bash
beast -save_every 20000 epiWeekX1.xml
```

为了分析100.000次迭代，此命令将生成5个状态文件，文件名中带有时间戳：

```bash
beast_state_2018.11.12.10.30.23
beast_state_2018.11.12.10.30.54
beast_state_2018.11.12.10.31.27
beast_state_2018.11.12.10.32.00
beast_state_2018.11.12.10.32.32
```

如您所见，大约每30秒一个新的（和唯一的）状态文件将被创建（但同时这取决于分析运行的速度）。
或者，您可以使用以下程序参数提供stem文件名：**'-save_stem filestem'**（不包括引号）。
此举将生成一系列状态文件，文件名由提供的stem文件名和迭代号组成。
例如，您可以使用以下命令来执行此操作：

```bash
beast -save_every 20000 -save_stem custom epiWeekX1.xml
```

为了分析100.000次迭代，此命令将生成以下状态文件：

```bash
custom_20000
custom_40000
custom_60000
custom_80000
custom_100000
```

如果您只需要一个具有BEAST分析最新状态信息的单个状态文件（例如，在您当前执行的分析的最后一次迭代时），您还必须使用 **'-save_state filename'** 参数（不包括引号）提供文件名。
为此，您可以使用以下命令和用checkpoint.state作为所需的检查点文件名：

```bash
beast -save_every 20000 -save_state checkpoint.state epiWeekX1.xml
```

以这种方式，仅生成一个状态文件（包括提供的文件名），且文件的内容将在每第x次迭代中被覆盖。


## 在BEAST中加载先前生成的状态（或检查点）文件

要从磁盘加载BEAST状态文件并恢复以前的分析，请将以下程序参数：**-'load_state filename'**（不包括引号）添加到```beast```命令中。
例如，以下命令将加载本教程上一节生成的checkpoint.state文件：

```bash
beast -load_state checkpoint.state epiWeekX1.xml
```

{% include note.html content="您仍需首先提供用于生成状态文件的XML文件。在重新启动检查点分析之前，可以对此XML文件进行某些调整，例如增加迭代次数。"  %}

请注意，您可以组合 **-'load_state filename'** 和 **'-save_state newfilename'** 参数（但最好为两个参数使用不同的文件名）。
这将从先前的分析中恢复状态并继续运行相同的分析，为恢复的运行创建新的状态（或检查点）文件：

```bash
beast -load_state checkpoint.state -save_every 20000 -save_state resumed.state epiWeekX1.xml
```

如果由于重新计算的后验值的微小差异而恢复检查点状态失败, 您可以通过设置 **-'force_resume'** (不包括引号) 参数:

```bash
beast -load_state checkpoint.state -save_every 20000 -save_state resumed.state -force_resume epiWeekX1.xml
```


## 如何将序列添加到获得的系统发育中

将序列添加到现有的贝叶斯系统发育或系统发育动态重建的典型用例包括在持续爆发期间收集DNA序列。
假设您已经使用名为epiWeekX1.XML的XML文件中包含的特定模型集合，且使用直到某个epi周的所有可用数据运行了BEAST分析。
当新的序列数据可用时，您将构建一个更新的XML文件，其中包含与模型集合完全相同的模型，但更新了比对：epiWeekX2.XML。

我们的方法包括使用新创建的XML文件来更新具有此新获得的序列信息的检查点文件。
BEAST [v1.10](installing)包含一个名为 CheckpointUpdateApp 的新应用程序，其使用现有的检查点文件和更新的XML文件来实现这一目标。
假设我们使用上一节（checkpoint.state）中的检查点文件以及更新的XML文件（epiWeekX2.XML）来生成修改后的检查点文件（uplated.checkpoint.state）

```bash
java -cp beast.jar dr.app.realtime.CheckPointUpdaterApp -BEAST_XML epiWeekX2.xml -load_state checkpoint.state -output_file updated.checkpoint.state -update_choice JC69Distance
```

{% include note.html content="您无需为此步骤不提供原始的XML文件，因为其所有信息都将包含在检查点状态文件中。"  %}


## 如何使用添加的序列恢复先前的分析

现在已经生成了更新的检查点（或状态）文件，剩下的就是将这个新的状态文件以及更新的XML文件加载到BEAST中：

```bash
beast -load_state updated.checkpoint.state -save_every 20000 -save_state updated.state epiWeekX2.xml
```

In anticipation of (even) more data becoming available, we suggest to keep using the **'-save_every x'** (without the quotation marks) and **'-save_state newfilename'** (without the quotation marks) arguments.
为了预期（甚至）更多数据可用，我们建议您继续使用 **'-save_every x'** （不包括引号）和 **'-save_state newfilename'**（不包括引号）参数。

## BEAST XML文件

我们在此在线贝叶斯系统发育动态推理框架上随附提交的手稿以及XML文件，[10 BEAST XML files]({{ root_url }}files/XMLs.zip)





## 参考文献

M. S. Gill, P. Lemey, M. A. Suchard, A. Rambaut, G. Baele (2019) Online Bayesian phylodynamic inference in BEAST with application to epidemic reconstruction. Submitted.

M. A. Suchard, P. Lemey, G. Baele, D. L. Ayres, A. J. Drummond, A. Rambaut (2018) Bayesian phylogenetic and phylodynamic data integration using BEAST 1.10. Virus Evolution 4(1): vey016.

{% include links.html %}
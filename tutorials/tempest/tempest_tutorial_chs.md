---
title: 用TempEst进行数据探索
keywords: tempest, tutorial
last_updated: Aug 23, 2018
tags: [tempest, tutorial]
summary: "本教程用TempEst来检查数据集的时间信号以及查看有问题或错误的序列。"
sidebar: beast_sidebar
permalink: tempest_tutorial_chs.html
folder: beast
---

{% capture root_url %}{{ site.tutorials_root_url }}/tempest/{% endcapture %}

本教程中，我们将探索使用交互式界面程序[TempEst](tempest)(之前称为Path-O-Gen)来查看具有采样时间信息的病毒序列数据，从而检查有问题的序列以及具有时间信号的程度和模式。这在花费大量时间运行[BEAST](beast)之前，检查数据潜在的问题很有帮助。

## 构建非分子钟树

为了检验遗传分化与时间(时间信号)之间的关系，我们需要构建一个没有分子钟的进化树。有很多合适的软件包(如 PhyML,RAxML, GARLI) 但是本教程将使用[IQ-Tree](http://www.iqtree.org)，该软件使用快速而有效的算法来推断最大似然树。

<div class="alert alert-success" role="alert"><div>本教程的数据是根据该文章编写的: Worobey (2009) Phylogenetic Evidence against Evolutionary Stasis and Natural Abiotic Reservoirs of Influenza A Virus. <i>Journal of Virology</i>, <b>82</b>, 3769–3774. <a href="http://doi.org/10.1128/JVI.02207-07">DOI: 10.1128/JVI.02207-07</a>. 这是对早期文章的回应：(Zhang et al (2006) <i>J Virol</i> <b>80</b>, 12229–12235 <a href="http://doi.org/10.1128/JVI.00986-06">DOI: 10.1128/JVI.00986-06</a> ) 该文章声称从冰川分离到了流感病毒。</div>

<br/><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses.fasta"><i class="fa fa-download fa-lg"></i> You can download the file, <code class="highlighter-rouge">ice_viruses.fasta</code>, here</a>.</div>
</div>

使用[网站上的说明](http://www.iqtree.org) 安装 **IQ-Tree**，打开命令行提示符，导航到包含数据`ice_viruses.fasta`的文件夹。

在构建最大似然进化树时使用GTR+gamma模型:

```bash
iqtree -s ice_viruses.fasta -m GTR+G
```

将会在目录中创建一组包含各种输出和结果的文件:

```
ice_viruses.fasta.bionj
ice_viruses.fasta.ckp.gz
ice_viruses.fasta.iqtree
ice_viruses.fasta.log
ice_viruses.fasta.mldist
ice_viruses.fasta.treefile
ice_viruses.fasta.uniqueseq.phy
```

我们的目的是仅需要最大似然树文件`ice_viruses.fasta.treefile`。如果您愿意，可以删掉其他文件。

## 运行TempEst并加载树

{% include icon-callout.html file='icons/tempest-icon.png' content='Run <a href="tempest">TempEst</a> 双击图标运行TempEst。TempEst是一个交互式图形应用程序，通过将每个叶节点与根的分歧和采样时间之间的关系绘图(a root-to-tip plot)，用来检测带有时间信息树的时间信号。' %}


一旦运行，TempEs将会看起来类似，无论其在哪个电脑系统上运行。对于本教程，显示的是Mac OS X 版本，但是在Linux & Windows 版本上会有完全一样的输出和功能。

启动时，TempEst将立即显示一个文件选择对话框，您可以在其中选择您在上一节中创建的树。

{% include image.html prefix="/tutorials/tempest/" width="90%" file="fig1_open_dialog.png" %}

选择`ice_viruses.fasta.treefile`并点击`Open`。

## 解析采样日期

一旦导入树，主窗口将会出现，如下所示:

{% include image.html prefix="/tutorials/tempest/" file="fig2_taxon_table.png" %}

暂时忽略左侧面板。首先需要做的是为每条序列提供采样日期。

采样的实际年份在每个分类单元的名称末尾给出。为了在BEAUti中指定序列的采样日期，我们使用面板顶端的`Parse Dates`按钮。通过点击将出现以下对话框:

{% include image.html prefix="/tutorials/tempest/" width="90%" file="fig3_parse_dates_dialog.png" %}

该操作试图从分类单元中提取日期。它的工作原理是尝试在每个名称中找到一个数字字段。此对话框与[BEAUti](beauti)的对话框一样，有多种选项执行该操作-[有关早该面板中设置日期的各种选项设置，请详细参阅此页](tip_dates)。对于本教程的序列，您可以设置选项如上图所示：`Defined just by its order`，`Order: last`和`Parse as a number` 选项。

解析日期时，您可以要求BEAUti为每个日期添加固定值，这对于[将2位数字的年份转换为4位数字的年份](tip_dates)非常有用。由于本数据所有日期被指定为4位数字格式，没有必要再进行其它设置。因此我们可以点击`OK`。

在列表中的`Dates`列将会显示出每个病毒的采样年份。点击`Dates` 列标题为日期分类并且检查它们是否正确。

{% include image.html prefix="/tutorials/tempest/" file="fig4_dated_taxon_table.png" %}

## 时间信号和置根

现在我们可以通过主窗口的标签来分析数据- `Tree`，`Root-to-tip` & `Residuals`。如果点击`Tree`标签，将会看到从树文件中载入的树。由于我们通过使用非分子钟模型构建该树，因此它被任意置了根。如果检查树中每个病毒的日期，将会看到水平位置间没有相关性：

{% include image.html prefix="/tutorials/tempest/" file="fig5_unrooted_tree.png" %}

接下来切换到`Root-to-tip`面板。这显示了树的根与采样时间的分歧图(所谓的'Root to tip plot')：

{% include image.html prefix="/tutorials/tempest/" file="fig6_unrooted_root_to_tip.png" %}

我们可以从图中看到相关性很低(该线为最佳拟合回归)。左侧列表可以看到`Correlation Coefficient` 为`0.35`。由于系统发育重建软件是任意设置根根的，与预期缺乏相关性，因此与根的分歧是没有意义的。 **TempEst** 可以尝试找到优化时间信号的树的根。它通过尝试所有可能的根并选择产生一系列统计数据的最佳值的根来实现这一点。它使用的功能在左上角的菜单中选择。
选项是最小化残差的平方的平均值(`residual-mean-squared`)，或者最大化相关系数(`correlation`)或R的平方(`R squared`)。这些都是临时程序，没有哪项是特别指定最好的，但是`residual-mean-squared`可能是与本研究最相符的。

点击`Best-fitting root`，在最小化参差平方的均值处置根树。

{% include image.html prefix="/tutorials/tempest/" file="fig7_rooted_root_to_tip.png" %}

现在叶节点日期与根的分歧之间有较好的相关性(相关性系数几乎翻了一倍)。返回树看根所置位置:

{% include image.html prefix="/tutorials/tempest/" file="fig8_rooted_tree.png" %}

为了使树更容易查看，将面板底部`Order` 选项切换到`increasing`。这将会旋转每个节点以至于具有许多叶节点的分支出现在顶部。在该流感进化树中会看到主要有3个谱系-顶部来从1918年BrevigMission病毒开始的人类谱系，中部的猪谱系，以及底部的禽类谱系。

分支被着色来显示残差，蓝色叶节点为正残差(回归线上部)，红色为负残差。

在窗口的左侧有一个统计表:

{% include image.html prefix="/tutorials/tempest/" width="70%" file="fig8a_stats_table.png" %}
<br/>

除了统计参数外(`Correlation Coefficient`, `R squared` and `Residual Mean Squared`)，还有以下内容:

`Date range`
: 病毒的采样日期范围。

`Slope (rate)`
:回归线的斜率。这是进化率以每个位点每年的替代率估计的。

`X-Intercept (TMRCA)`
: 回归线所经x轴的点。这是对树根日期的估计。

## 发现和分析有问题的序列

切换到`Root-to-tip`面板。寻找离左上象限最远的点。如果单击并将指针拖过该点，它将以蓝色突出显示:

{% include image.html prefix="/tutorials/tempest/" file="fig9_positive_outlier_hilighted.png" %}

切换到`Residual`面板，将会看到所有残差的图(回归线的切线)。我们选择的病毒仍会突出显示，您可以看到它是一个异常值。在该图中选择异常值通常是最容易的。

{% include image.html prefix="/tutorials/tempest/" file="fig10_positive_residual_hilighted.png" %}

如果返回到`Tree`将会看到所选病毒的标签是高亮的。可以用面板底部的`Zoom`放大树的区域，`Font Size`选择以增加标签大小:

{% include image.html prefix="/tutorials/tempest/" file="fig11_tree_1917_hilighted.png" %}

如果看树的这一部分，将会看到为什么`A.BrantGoose.1.1917`是异常值。尽管它是取样于1917年的，但是实际上它与来自1999年俄亥俄州的4种其它鸟类病毒相同。这表明该病毒是同一实验室另一种病毒污染造成的(另一种可能是取样时间标错了)。

{% include note.html content="流感病毒序列`A.BrantGoose.1.1917`是发表在文章题为['1917 Avian Influenza Virus Sequences Suggest that the 1918 Pandemic Virus Did Not Acquire Its Hemagglutinin Directly from Birds'](https://jvi.asm.org/content/76/15/7860.long)上的。文章认为该序列早于1918人类大流感，进化关系上看与'现代'鸟类病毒聚为一组，表明1918大流感不是从鸟类直接跨种过来的。明显这种解释是不合理的，因为很可能是实验室污染造成的。" %}

还有其它的工具可以用来查找有问题的序列。打开在面板底部的`Show ancestor traces`选项:

{% include image.html prefix="/tutorials/tempest/" file="fig12_positive_outlier_ancestor_line.png" %}

该选项绘制了一条从所选病毒到代表直接祖先位置回归线的绿色的线条(即从根节点的分歧)。如此处示例所示，如果线条水平向左延伸，表明序列实际日期比给定日期更新。这可能表明可能最新病毒的污染超过了假定日期或者错误标记造成的(另一种解问题可能是日期格式被错误解析了)。

祖先线条垂直向上表明与其祖先相比该序列有许多独特的差异性。这可能表明测序错误，样品降解，宿主限制因子的编辑，序列比对问题或者重组。

祖先线条水平向右表明该病毒的假设采样日期比分歧回归线所示的更新。这可能是旧毒污染造成的(或者错误标记)。

祖先线条不会垂直向下，由于这表示负分歧。祖先线较短或者接近于回归梯度表明序列没有问题。

返回`Residuals`面板选择最左侧的(负) 残差点:

{% include image.html prefix="/tutorials/tempest/" file="fig13_negative_residual_hilighted.png" %}

然后返回到树查看所选病毒:

{% include image.html prefix="/tutorials/tempest/" file="fig14_tree_1990_hilighted.png" %}

在此处可以看到所选的病毒`A.swine.StHyacinthe.148.1990`，尽管假设其来自1990年，但是却与来自1930年渥太华的病毒更相似。`A/swine/Iowa/15/1930` 通常被用作实验室毒株，因此很有可能再一次是污染问题。

{% include note.html content="如果`A.swine.StHyacinthe.148.1990`的日期是正确的，意味着该并毒直接来自于1930s，并没有进行进化。这种情况要求病毒，一直处于冻结状态，直到60年之后重新出现。尽管这也并不完全不可信，但是在该例子中是完全不可能的。"  %}

在该数据集中存在此类问题的还有4个其他的例子。看下您是否能识别出。

## 清理数据集

一旦有问题的数据被识别后，可以将他们排除，重新构建树来查看他们在分析上是否有效果。下载文件 `ice_viruses_cleaned.fasta`，该文件排除了7个有问题的序列。

<div class="alert alert-success" role="alert"><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses_cleaned.fasta"><i class="fa fa-download fa-lg"></i> Download the file, <code class="highlighter-rouge">ice_viruses_cleaned.fasta</code>, here</a>.</div>
</div>

根据以上说明，对于文件`ice_viruses_cleaned.fasta`，重新用 **IQ-Tree** 构建树，将产生的树加载到 **TempEst** 并解析每个病毒的日期。切换到`Root-to-tip`面板，打开`Best-fitting root` 并将该图与之前的图进行比较。您将看到类似如下所示:

{% include image.html prefix="/tutorials/tempest/" file="fig15_cleaned_root_to_tip.png" %}

可以看到从根的分歧与采样时间之间的相关性较好(左侧列表的`Correlation Coefficent`现在是0.733)。

发现这种关系仍然不是很清晰。原因是此处有3种不同的谱系(人，猪和禽)，将他们组合成一棵树(之后固定)会模糊掉他们各自独立的模式。

本分析的最后一个文件`ice_viruses_human.fasta`仅包含人类病毒的文件。

<div class="alert alert-success" role="alert"><div style="text-align: center"><a href="{{ root_url }}files/ice_viruses_human.fasta"><i class="fa fa-download fa-lg"></i> Download the file, <code class="highlighter-rouge">ice_viruses_human.fasta</code>, here</a>.</div>
</div>

重复以上步骤构建进化树并将其载入 **TempEst** ，会看到他们之间的关系:

{% include image.html prefix="/tutorials/tempest/" file="fig16_human_root_to_tip.png" %}

该图中1975年的序列高亮为蓝色。这里实际上有2条线，一条为从1918到1957年的，一条为从1977到2000年的。从时间上看(水平轴) 大约有20年的间隙，但是在从根节点的分歧上却没有间隙。

{% include note.html content="对于H1N1人类谱系的时间空隙已经得到了充分的描述。在1957-1958流感大流行，H2N2亚型流感病毒的出现取代了自1918年以来一直作为季节性流感传播的H1N1谱系。直到1968年，H3N2亚型流感病毒取代了H2N2谱系。然后在1977年发生了另一次大流行，与先前流行的相同的H1N1谱系再次出现作为第二季流感类型(随后持续传播，直到2009年被'猪流感'H1N1所取代)。1977年出现的H1N1病毒(我们在树上所看到的)的显著特点是它们与20世纪40年代和50年代的病毒非常相似。如此相似，似乎20年来该病毒都没有进化。由于1977年后测定了1000多株毒株，因此并不是污染造成。几乎可以确定1977年出现的毒株已经被冻结，并且是实验室逃逸的结果。" %}

{% include links.html %}

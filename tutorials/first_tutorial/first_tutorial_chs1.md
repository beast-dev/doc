第一次课程
概述：BEAST的入门教程。本课程描述了如何使用BEAUti 和BEAST分析一些灵长类的序列来估计系统发育树。旨在引导您完成如何完成导入比对的序列，选择模型，生成BEAST XML文件的过程。然后运行BEAST。

目录：
首次运行BEAST
    -运行BEAUti
    -导入NEXUS文件
　　-设置日期和分类
　　-设置进化模型
    -设置分子钟
　　-设置树的先验模型
　　-先验
　　-MCMC操作
　　-设置MCMC选项
　　-保存和加载BEAST XML文件
　　-生成BEAST XML文件
运行BEAST

首次运行BEAST
    本教程将引导你如何通过运行BEAST和其附属程序来完成简单的进化分析。如果还没有准备好，请按照这些说明下载并安装BEAST。
   
　　 注意：本教程假设您对分子进化和模型以及该领域的专业术语有了一定的掌握。如果您知道什么是HKY模型，速率异质性的伽马模型，那么您应该没问题。您至少应该熟悉贝叶斯推断和马尔科夫蒙特卡罗采样的基本知识。

运行BEAUti
    双击其图标运行BEAUti。BEAUti是一个交互式图形应用程序，该程序用来生成用于BEAST分析的控制文件（XML文件）。
　　BEAUti的运行在哪个计算机系统上都是类似的。本教程显示的是在Mac OS X版本上的运行，但是和Linux和Windows版本具有完全相同的布局和功能。
载入NEXUS文件
　　运行时，您将看到如下窗口：
　　首先需要做的是载入一些数据，本教程用的是少量比对过的核苷酸序列。
　　从File下拉按钮选择”Import Data“,即可载入NEXUS格式的文件。也可以点击窗口左下角“＋”或者拖拽文件到主窗口。
NEXUS文件
    (示例文件在下载的BEAST文件夹里ape.nex文件)
　　文件为比对过的来自６个灵长类物种(５个猿, 1个猴子外类群)的线粒体tRNA序列。
文件看起来是这样的（序列被截断了):
# NEXUS

BEGIN DATA;
	DIMENSIONS NTAX=6 NCHAR=768;
	FORMAT MISSING=? GAP=- DATATYPE=DNA;
	MATRIX
	human      AGAAATATGTCTGATAAAAGAGTTACTTTGATAGAGTAAATAATAGGAGC...
	chimp      AGAAATATGTCTGATAAAAGAATTACTTTGATAGAGTAAATAATAGGAGT...
	bonobo     AGAAATATGTCTGATAAAAGAATTACTTTGATAGAGTAAATAATAGGAGT...
	gorilla    AGAAATATGTCTGATAAAAGAGTTACTTTGATAGAGTAAATAATAGAGGT...
	orangutan  AGAAATATGTCTGACAAAAGAGTTACTTTGATAGAGTAAAAAATAGAGGT...
	siamang    AGAAATACGTCTGACGAAAGAGTTACTTTGATAGAGTAAATAACAGGGGT...
	;
END;
   　BEAST也可导入FASTA文件（只要序列比对过）或者BEAST XML文件（该情况下数据可以被导入，但是模型和设置不能导入）。
　　一旦导入，序列就会像主窗口中表格展示的那样：
　　如果想查看实际的比对序列，双击表格上的行。
　　主窗口上是一系列的”标签“：
　　其中每个都有设置和选项，一般来说，应该从左到右进行（尽管并非所有选项都与所有分析相关）。在“Partitions”导入数据之后，暂时跳过“Taxa”，然后直接转到“Tips”。　　设置日期和分类
　　在Tips选项中将看到包含比对序列中所有分类单元的表格。此面板允许您提供分类日期。分类日期（或“提示日期”）仅在某些情况下很重要，例如，当它们采样为快速进化的病毒或古化石的DNA样本。本教程分析的猿类的进化树代表数百万年的进化，因此提示的日期可以假设为零。这是默认值 - 分类单元的日期均为零，“Use tip dates”选项并不选中。
　　跳过“Traits”到“Sites”标签。
　　设置进化模型
　  在"Sites"选项中，可以为已导入的序列数据设置分子进化模型。哪些选项出现取决于数据是核苷酸还是氨基酸（或其他形式的数据）。加载apes.nex数据集后将显示的设置如下：　　
    本教程假设对进化模型比较熟悉，但有几点需要注意：
　  默认是简单的HKY（Hasegawa，Kishino＆Yano（1985）J Mol Evol 22：160-174）核苷酸进化模型。我们将使用这个模型。
　  选择分区为密码子选项假定数据作为密码子。在这种情况下，本教程数据为线粒体tRNA，因此这个选项是不合适的。
    设置分子钟模型
　  在下“Clock”　中设置了我们将使用的分子钟模型。与许多其他系统发育软件不同，BEAST专门使用分子钟模型，因此构建的树具有时间尺度（即具有推断的根和时间方向）。最简单的模型是默认的“严格时钟”，该假设树上的所有分支具有相同的进化速率。其他分子钟模型以各种方式放宽了该假设，后面的教程将讨论这些假设。
    对于此分析，保留“Clock Typeas”　为“ Strict clock”并继续执行“Trees”选项。
　  设置树先验模型
　  该面板可设置在树先验模型以及有关MCMC运行中的起始树的一些选择。
  　该Tree Prior选项有许多选择，通常分为“聚结”模型，通常适用于种群和'物种'模型，顾名思义，这些模型用于物种水平数据。由于我们有来自少数物种的序列数据，我们将选择Speciation: Yule process模型。Yule过程Yule（1925）Phil Trans Royal Soc B 213：402-420是最简单的物种形成模型，其中假设每个谱系都以固定的速率进行了规范。该模型有一个参数，即新物种的“出生率”。

    此面板的下半部分允许您选择BEAST如何选择起始树。在大多数情况下，最好将其保留为Random starting tree。这将生成一个随机树以启动BEAST运行。

    选择Yule模型并移至“Priors”。
　　Priors
    该模块允许指定模型中参数的先验值：
　　设定先验值是贝叶斯分析中最具有挑战性的一件事。在BEAST中，多数参数值我们试图选择合理且合适的默认值。本教程中，选择的都是默认值。
　　MCMC运行模块
　　该模块讲述的是MCMC的运行,可以在主窗口的“Operators”看到。本教程的ape.nex数据集模型的设置如截屏所示：
　　模型中的每个参数都有一个或多个“operators”。该模块指定了参数是如何随着MCMC的运行而改变的。该表列出了参数，运行模块以及其调整设置。第一列是参数名称。类似于kappa（HKYＭ模型的kappa参数，即转化-巅换值）之类的。接下来一列是影响每一个参数所对应的运行模块。比如，“scale”按比例向上或向下缩放参数，“random walk”增加或减少参数的量，“uniform”允许在一定范围内统一设定一个新值。一些参数与树或树的节点的高度有关，并且这些参数具有特殊的运行模块。
　　下一列的“Tuning”为运行模块提供调整设置。某些参数没有任何调整设置的，在此列下标有n/a。更改调整设置将改变运行模块的移动大小，这将影响MCMC接受的更改频率，从而影响分析的效率。在窗口的顶部是选项“Auto Optimize”，当选择该选项时，将在MCMC运行时自动调整设置以尝试实现最高效率。
　　称作"Weight"的一列指定运行模块间的相关性。某些参数与其他模型的相互作用很少，因此会非常有效地估计－ 例如kappa参数，这些参数可以使其运行模块降低权重，以便它们不会经常更改。
　　再一次使用默认值，移动到下一个标签。
　　设置MCMC选项
　　MCMC提供控制BEAST运行的设置。
　　首先是链长的设置，即在MCMC完成之前在链中所运行的步数。运行多长时间取决于数据集的大小，模型的复杂性和所需解决问题。默认值10,000,000完全是随机的，该设置应根据数据集的大小进行调整。为了检查特定链长是否足够，可以使用Tracer分析生成的日志文件。设定链长的目的是获得合理的有效样本量（ESS）。在另一个教程中讲述了如何操作。
　　下一个选项指定当前参数值应在屏幕上显示并记录在日志文件中的频率。屏幕输出仅用于监视程序进度，因此可以设置为任意值（但是设置得太小，屏幕上显示的大量信息实际上可能会减慢程序速度）。对于日志文件，应该与链的总长度相关。过于频繁的采样将导致非常大的文件，会影响分析精度。样本太频繁，日志文件中不包含有关参数分布的大量信息。如果希望存储１0,000个样本，因此应将其设置为链长的/10,000。
　　对于本教程数据集（非常小），我们最初将链长设置为1,000,000，因为这在大多数现代计算机上运行得非常快。相应地将采样频率设置为100。
　　注意：可以将屏幕采样频率设置为与主日志文件不同。在这里，分析将以非常快的速度运行，因此每100步会记录在屏幕，将导致大量信息显示在屏幕。尝试将Echo state to screen选项设置10000为在分析运行时仅对屏幕进行100次更新。
  　最后两个选项给出参数和树的日志文件的文件名。这些将根据导入的NEXUS文件的名称设置为默认值，但您可以随意更改这些。出于本教程的目的，可以忽略其余选项。
    注意：在Windows操作系统上，会隐藏您的文件扩展名。可以为日志和树文件添加额外的扩展名.txt-Windows虽然隐藏.txt但仍然显示.log和.trees扩展名，以便区分文件。　　保存和加载BEAUti 文件
    从“File”按钮选择“Save”将会以BEASTti的格式保存文档。但是它并不是BEAST识别的格式－仅仅能被BEAUti再次打开。其在BEAUti的设置和数据可以保存和后续导入。建议保存BEAUti文件时以其延伸名'.beauti'保存。
　　注意：正如BEAST无法读取和理解BEAUti文件一样，BEAST XML文件也无法重新导入回BEAUti。然而，它们可以像NEXUS或FASTA文件一样导入。将导入其中包含的序列数据，以及所有提示和某些其他信息。
　　生成BEAST XML文件
　　现在准备生成BEAST XML文件。从”File“菜单中选择”Generate XML...“（或窗口底部的按钮）并使用适当的名称保存文件-它将在MCMC面板中显示给出的名称，我们通常以“.xml”结束文件名（尽管请参阅上面的注释，关于Windows操作系统上的扩展 - 也可以为该文件提供扩展名“.xml.txt”）。
　　运行BEAST
    双击下载包中的BEAST图标运行BEAST。
    将出现以下对话框：
　　只需单击"Choose File..."按钮，选择您在上面的BEAUti中创建的XML文件，然后"Run"。有关其他选项的信息，请参阅"BEAST program"的页面。
    点击”Run“BEAST时将导入XML文件，设置相关分析，然后运行它。在输出窗口中，您将看到许多信息出现。首先打印标题和信息：
　　　BEAST v1.X, 2002-2102
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
          	http://github.com/beast-dev/beast-mcmc                            然后给出导入数据和指定模型的详细信息。您将会看到所有在BEAUti中所做出的选择。
           Random number seed: 1500828054875

Parsing XML file: apes.xml
  File encoding: UTF8
Looking for plugins in /Users/rambaut/Projects/BEAST/plugins

Read alignment: alignment
  Sequences = 6
      Sites = 768
   Datatype = nucleotide
Site patterns 'patterns' created from positions 1-768 of alignment 'alignment'
  unique pattern count = 69

Using Yule prior on tree

Creating the tree model, 'treeModel'
  initial tree topology = ((((bonobo,human),orangutan),gorilla),(chimp,siamang))
  tree height = 102.55912280908296

Using strict molecular clock model.

Creating state frequencies model 'frequencies': Initial frequencies = {0.25, 0.25, 0.25, 0.25}

Creating HKY substitution model. Initial kappa = 2.0

Creating site rate model: 
  with initial relative rate = 1.0

Using Multi-Partition Data Likelihood Delegate with BEAGLE 3 extensions
  Using BEAGLE resource 0: CPU
    with instance flags:  PRECISION_DOUBLE COMPUTATION_SYNCH EIGEN_REAL SCALING_MANUAL SCALERS_RAW VECTOR_SSE THREADING_NONE PROCESSOR_CPU FRAMEWORK_CPU
  Ignoring ambiguities in tree likelihood.
  With 1 partitions comprising 69 unique site patterns
  Using rescaling scheme : dynamic (rescaling every 100 evaluations, delay rescaling until first overflow)

Using TreeDataLikelihood
Optimization Schedule: default

Likelihood computation is using an auto sizing thread pool.

Creating the MCMC chain:
  chainLength=1000000
  autoOptimize=true
  autoOptimize delayed for 10000 steps 

    接下来，显示引用出BEAST以及所选的各个模型和组分的模块。旨在帮助您指定和引用所使用的模型的编写分析：
　　Citations for this analysis: 

FRAMEWORK
BEAST primary citation:
	Drummond AJ, Suchard MA, Xie Dong, Rambaut A (2012) Bayesian phylogenetics with BEAUti and the BEAST 1.7. Mol Biol Evol. 29, 1969-1973. DOI:10.1093/molbev/mss075

TREE DENSITY MODELS
Gernhard 2008 Birth Death Tree Model:
	Gernhard T (2008) The conditioned reconstructed process. Journal of Theoretical Biology. 253, 769-778. DOI:10.1016/j.jtbi.2008.04.005

SUBSTITUTION MODELS
HKY nucleotide substitution model:
	Hasegawa M, Kishino H, Yano T (1985) Dating the human-ape splitting by a molecular clock of mitochondrial DNA. J. Mol. Evol.. 22, 160-174

    最后开始运行BEAST。它打印出各种可用于追踪发生的情况的信息。第一列是'状态'号-在这种情况下,它逐步递增1000，因此在每个行之间它已经进行了1000次操作。屏幕日志仅显示一些指标和参数，但它也将日志文件和包含的结果记录到磁盘（以及包含这些状态的采样树的'.trees'文件）。
　　几千个"state"之后，将会开始报告每百万个"state"所需要的时间（或者会运行的很快，每几百亿个“state”所需时间)。有助于推测运行需要大概多长时间，是否有时间去干别的事。
　# BEAST v1.X
# Generated Sun Jul 23 17:42:37 BST 2017 [seed=1500828054875]
state	Posterior   	Prior       	Likelihood  	rootAge     
0	-6812.7534  	-481.7973   	-6330.9561  	102.559     	-
10000	-2910.2955  	-246.4611   	-2663.8344  	13.7383     	-
20000	-2082.7664  	-234.0125   	-1848.7539  	0.12112     	-
30000	-2049.3031  	-230.0213   	-1819.2818  	5.84813E-2  	-
40000	-2043.1005  	-226.3604   	-1816.7401  	6.21508E-2  	-
50000	-2042.1593  	-226.1915   	-1815.9678  	5.79924E-2  	-
.
.
.
　在等待预期时间后，BEAST将结束运行。
950000	-2044.0265  	-227.1010   	-1816.9255  	5.98269E-2  	11.27 hours/billion states
960000	-2041.6364  	-225.0546   	-1816.5818  	5.58888E-2  	11.27 hours/billion states
970000	-2046.3378  	-227.5622   	-1818.7756  	5.96169E-2  	11.27 hours/billion states
980000	-2039.9261  	-226.1422   	-1813.7839  	5.96151E-2  	11.27 hours/billion states
990000	-2047.3466  	-227.6691   	-1819.6775  	6.41662E-2  	11.27 hours/billion states
1000000	-2040.3296  	-225.5095   	-1814.8201  	5.74639E-2  	11.27 hours/billion states

Operator analysis
Operator                                          Tuning   Count      Time     Time/Op  Pr(accept) 
scale(kappa)                                      0.239   13605      621      0.05     0.2453      
frequencies                                       0.105   13530      722      0.05     0.2398      
subtreeSlide(treeModel)                           0.025   202546     5651     0.03     0.2313      
Narrow Exchange(treeModel)                                203114     7020     0.03     0.0547      
Wide Exchange(treeModel)                                  40112      623      0.02     0.0099      
wilsonBalding(treeModel)                                  40753      848      0.02     0.0053      
scale(treeModel.rootHeight)                       0.148   40635      1192     0.03     0.2406      
uniform(nodeHeights(treeModel))                           404956     13096    0.03     0.385       
scale(yule.birthRate)                             0.126   40749      305      0.01     0.2392      

41.987 seconds
   最后的列出了每个运行模块的次数，它们花了多少时间以及其他一些细节。此信息可用于优化运行的性能，但通常可以忽略它。
　　本教程示例在低性能的MacBooK上运行仅需要４０s。很明显我们也可以加长代次运行，然而该小数据集并不需要。我们在查看BEAST输出文件时会发现。

　＃教程二将会看到对输出文件的总结，问题的诊断以及如何构建树。
　　



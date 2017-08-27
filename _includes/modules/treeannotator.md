{% include icon-callout.html file='icons/utility-icon.png' content='To summarize the trees from BEAST into a single representitive tree that we can view we are going to use the BEAST utility called <a href="treeannotator">TreeAnnotator</a>. Run TreeAnnotator by double clicking on the icon.' %}

Once running, you will be presented with a window like the one below:

{% include image.html file="modules/treeannotator.png" %}

TreeAnnotator takes a single `target` tree and annotates it with the summarized information from the entire sample of trees. The summarized information includes the average node ages (along with the HPD intervals), the posterior support and the average rate of evolution on each branch (for models where this can vary). The program calculates these values for each node or clade observed in the specified 'target' tree.

Burnin
: This is either the number of states or the number of trees in the input file that should be excluded from the summarization. This value is given as the number of trees rather than the number of steps in the MCMC chain. For the example, with a chain of 20,000,000 steps, a burn-in of 10% as the number of states can be specified as 2,000,000 states. Alternatively, if sampling every 10000 steps, there are 2000 trees in the file. To obtain a 10% burnin, set the burnin as the number of trees value to 200.

Posterior probability limit
: This is the minimum posterior probability for a node in order for TreeAnnotator to store the annotated information. I.e., a value of <samp>0.5</samp> will mean that only nodes in the MCC tree that are present in at least 50% of the posterior distribution of trees will have posterior probabilities, height HPDs etc.  

Target tree type
: This has two options "Maximum clade credibility" or "User target tree". For the latter option, a NEXUS tree file can be specified as the Target Tree File, below. For the former option, TreeAnnotator will examine every tree in the Input Tree File and select the tree that has the highest product of the posterior probabilities of all its nodes. 

Node heights
: This option specifies what node heights (times) should be used for the output tree. If the ’Keep target heights’ is selected, then the node heights will be the same as the target tree. Node heights can also be summarised as  a Mean or a Median over the sample of trees. Sometimes a mean or median height for a node may actually be higher than the mean or median height of its parental node (because particular ancestral-descendent relationships in the MCC tree may still be different compared to a large number of other tree sampled). This will result in artifactual negative branch  lengths, but can be avoided by the ‘Common Ancestor heights’ option. 

Target Tree File
: If the "User target tree" option is selected then you can use "Choose File..." to select a NEXUS file containing the target tree.

Input Tree File
: Use the "Choose File..." button to select an input trees file. This will be the trees file produced by BEAST. 
Output File - Select a name for the output tree file.


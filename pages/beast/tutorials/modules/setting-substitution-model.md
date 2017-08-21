#### Setting the substitution model (Module)

The next thing to do is to click on the ‘Sites’ tab at the top of the main window. This will reveal the evolutionary model settings for BEAST. Exactly which options appear depend on whether the data are nucleotides or amino acids.

This tutorial assumes that you are familiar with the evolutionary models available, however there are a couple of points to note about selecting a model in BEAUti:

Partition into codon positions:
: Selecting the `Partition into codon positions` option assumes that the data are aligned as codons. This option will then estimate a separate rate of substitution for each codon position, or for 1+2 versus 3, depending on the setting.

Unlink substitution model across codon positions:
: Selecting the `Unlink substitution model across codon positions` will specify that BEAST should estimate a separate transition-transversion ratio or general time reversible rate matrix for each codon position. 

Unlink rate heterogeneity model across codon positions:
: Selecting the `Unlink rate heterogeneity model across codon positions` will specify that BEAST should estimate set of rate heterogeneity parameters (gamma shape parameter and/or proportion of invariant sites) for each codon position.

Unlink base frequencies across codon positions:
: Selecting the `Unlink base frequencies across codon positions` will specify that BEAST should estimate a separate set of base frequencies for each codon position.

{% include image.html file="image6.png" prefix="/_modules/images" %}

For this tutorial, keep the default ‘HKY’ model, the default ‘Estimated’ base frequencies and select ‘Gamma’ as ‘Site Heterogeneity Model’ (with 4 discrete categories) before proceeding to the ‘Clocks’ tab. 

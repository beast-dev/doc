Substitution Model:
: For nucleotide data, this is a choice of `JC`, `HKY`, `GTR` or `TN93`. Other substitution models are possible by constraining one of these model. [See this page for more details](custom_substitution_models).

Base frequencies:
: The nucleotide base frequencies can be `Estimated` (estimated as a parameter in the model), `Empirical` (estimated emprically from the data and then fixed) or `All equal` (fixed to be 0.25 each). 

Site Heterogeneity Model:
: A choice of the discrete gamma distribution model, the invariant site model or both.

Partition into codon positions:
: Selecting the `Partition into codon positions` option assumes that the data are aligned as codons. This option will then estimate a separate rate of substitution for each codon position, or for 1+2 versus 3, depending on the setting.

Unlink substitution model across codon positions:
: Selecting the `Unlink substitution model across codon positions` will specify that BEAST should estimate a separate transition-transversion ratio or general time reversible rate matrix for each codon position. 

Unlink rate heterogeneity model across codon positions:
: Selecting the `Unlink rate heterogeneity model across codon positions` will specify that BEAST should estimate set of rate heterogeneity parameters (gamma shape parameter and/or proportion of invariant sites) for each codon position.

Unlink base frequencies across codon positions:
: Selecting the `Unlink base frequencies across codon positions` will specify that BEAST should estimate a separate set of base frequencies for each codon position.

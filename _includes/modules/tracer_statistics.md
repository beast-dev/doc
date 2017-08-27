On the left hand side at the top is the name of the log file loaded (in this case `YFB.log`), the number of states in the log and the burn-in (10% by default). Below this is a table containing all the columns in the log file, including various statistics and continuous parameters. Selecting a trace on the left brings up analyses for this trace on the right hand side depending on the tab that is selected at the top. When first opened, the `posterior` trace (a quantity proportional to posterior --- the product of the data likelihood and the prior probabilities, on the log-scale) is selected and various statistics of this trace are shown under the `Estimates` tab.

In the top right of the window is a table of calculated statistics for the selected trace. The statistics and their meaning are described in the table below.

mean
: The mean value of the samples.

stderr of mean
: The standard error of the mean. This takes into account the effective sample size so a small ESS will give a large standard error.

stdev
: The standard deviation of the samples.

variance
: The variance of the samples.

median
: The median value of the samples.

value range
: The full range of values sampled.

geometric mean
: The central tendency or typical value of the set of samples.

95% HPD Interval
: The lower bound and upper bound of the highest posterior density (HPD) interval. The HPD is the shortest interval that contains 95% of the sampled values.

auto-correlation time (ACT)
: The average number of states in the MCMC chain that two samples have to be separated by for them to be uncorrelated (i.e. independent samples from the posterior). The ACT is estimated from the samples in the trace (excluding the burn-in).

effective sample size (ESS)
: The effective sample size (ESS) is the number of independent samples that the trace is equivalent to. This is calculated as the chain length (excluding the burn-in) divided by the ACT.

number of samples
: The number of samples (values) used to compute the above statistics. This will be the total number of samples minus the burn-in.

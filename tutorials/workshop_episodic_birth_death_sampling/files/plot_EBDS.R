# ---------------------------------------------------------------------------
#  Plotting episodic birth-death-sampling (EBDS) results from a BEAST log file
#
#  Produces four stacked panels on a common time axis:
#     birth rate, death rate, sampling rate, effective reproductive number
#  Each epoch is drawn as its posterior mean with a shaded 95% HPD interval.
#
#  Only base R is used, so nothing needs to be installed.
#  Edit the SETTINGS block below and source the file (Ctrl+Shift+S in RStudio).
# ---------------------------------------------------------------------------

## ======================= SETTINGS ==========================================

log_file  <- "EBDS_tutorial/B.1.1.7/B.1.1.7_EBDS.log"  # path to the BEAST log
cut_off   <- 0.35          # the <cutOff> value from the XML
mrsd      <- "2020-12-31"  # most recent sampling date; NULL to plot in height
burnin    <- 0.10          # proportion of samples discarded as burn-in
log_scale <- TRUE          # log axis for the rates and R (recommended)

## Exercise 2 (influenza) would instead use:
##   log_file <- "EBDS_tutorial/Influenza/all_h3n2_hmc_1.log"
##   cut_off  <- 6
##   mrsd     <- 2003.98        # a decimal year is also accepted

## ===========================================================================


## --- helpers ---------------------------------------------------------------

# Highest posterior density interval
hpd_interval <- function(x, prob = 0.95) {
  x <- sort(x[is.finite(x)])
  n <- length(x)
  if (n < 2) return(c(NA_real_, NA_real_))
  gap <- max(1L, min(n - 1L, round(n * prob)))
  lo  <- seq_len(n - gap)
  i   <- which.min(x[lo + gap] - x[lo])
  c(x[i], x[i + gap])
}

# Calendar date -> decimal year (leap years handled)
to_decimal_year <- function(d) {
  if (is.numeric(d)) return(d)
  d <- as.Date(d)
  y <- as.numeric(format(d, "%Y"))
  y + as.numeric(d - as.Date(paste0(y, "-01-01"))) /
      as.numeric(as.Date(paste0(y + 1, "-01-01")) - as.Date(paste0(y, "-01-01")))
}

# Columns named <prefix>1 .. <prefix>N, returned in numerical order
epoch_columns <- function(dat, prefix) {
  hits <- grep(paste0("^", prefix, "[0-9]+$"), names(dat), value = TRUE)
  if (!length(hits)) return(character(0))
  hits[order(as.numeric(sub(paste0("^", prefix), "", hits)))]
}

# Posterior mean and 95% HPD for each epoch of one quantity
summarise_epochs <- function(dat, prefix) {
  cols <- epoch_columns(dat, prefix)
  if (!length(cols)) return(NULL)
  out <- t(sapply(cols, function(cl) {
    x <- dat[[cl]]
    c(mean = mean(x), hpd_interval(x))
  }))
  data.frame(epoch = seq_along(cols), mean = out[, 1],
             lower = out[, 2], upper = out[, 3])
}

# One panel: a step line through the epoch means over shaded HPD blocks
draw_panel <- function(est, left, right, ylab, xlim, log_scale,
                       hline = NA, show_axis = FALSE, xlab = "") {
  ylim <- range(c(est$lower, est$upper), finite = TRUE)
  if (log_scale) {
    pos <- c(est$lower, est$upper, est$mean)
    pos <- pos[is.finite(pos) & pos > 0]
    ylim <- range(pos)
  }
  if (!is.na(hline)) ylim <- range(c(ylim, hline))
  plot(NA, xlim = xlim, ylim = ylim, log = if (log_scale) "y" else "",
       xlab = "", ylab = ylab, xaxt = "n", las = 1, bty = "l")

  rect(left, est$lower, right, est$upper,
       col = rgb(1, 0.65, 0, 0.30), border = NA)
  if (!is.na(hline)) abline(h = hline, lty = 2)

  segments(left, est$mean, right, est$mean, col = "darkorange", lwd = 2)
  if (nrow(est) > 1) {                       # vertical risers between epochs
    n <- nrow(est)                             # epoch k and k+1 share left[k]
    segments(left[-n], est$mean[-n], left[-n], est$mean[-1],
             col = "darkorange", lwd = 2)
  }
  if (show_axis) {
    axis(1); title(xlab = xlab)
  }
}


## --- main ------------------------------------------------------------------

plot_ebds <- function(log_file, cut_off, mrsd = NULL,
                      burnin = 0.10, log_scale = TRUE) {

  dat <- read.table(log_file, header = TRUE, sep = "\t",
                    comment.char = "#", check.names = FALSE)

  if (burnin > 0) {
    keep <- seq(floor(nrow(dat) * burnin) + 1, nrow(dat))
    dat  <- dat[keep, , drop = FALSE]
  }
  message(nrow(dat), " samples retained after ", 100 * burnin, "% burn-in")

  quantities <- list(
    list(prefix = "ebds.birthRate",              lab = "Birth rate",    hline = NA),
    list(prefix = "ebds.deathRate",              lab = "Death rate",    hline = NA),
    list(prefix = "ebds.samplingRate",           lab = "Sampling rate", hline = NA),
    list(prefix = "effectiveReproductiveNumber", lab = "Effective R",   hline = 1)
  )

  ests <- lapply(quantities, function(q) summarise_epochs(dat, q$prefix))
  missing <- vapply(ests, is.null, logical(1))
  if (any(missing)) {
    stop("no columns found for: ",
         paste(vapply(quantities[missing], `[[`, "", "prefix"), collapse = ", "))
  }

  n_epochs <- nrow(ests[[1]])
  if (length(unique(vapply(ests, nrow, 0L))) != 1L) {
    stop("the four quantities do not all have the same number of epochs")
  }
  message(n_epochs, " epochs found")

  # Epoch k covers [(k-1)*w, k*w) in height; the oldest epoch is unbounded and
  # is drawn back to the posterior mean origin when that was logged.
  w      <- cut_off / n_epochs
  starts <- (0:(n_epochs - 1)) * w
  ends   <- (1:n_epochs) * w
  oldest <- if ("ebds.origin" %in% names(dat)) mean(dat[["ebds.origin"]]) else n_epochs * w
  ends[n_epochs] <- max(oldest, ends[n_epochs])

  # heights -> plotting coordinates (time runs left to right)
  if (is.null(mrsd)) {
    left  <- -ends;   right <- -starts
    xlim  <- c(-ends[n_epochs], 0)
    xlab  <- "Time before most recent sample"
    at    <- pretty(xlim); labs <- abs(at)
  } else {
    m     <- to_decimal_year(mrsd)
    left  <- m - ends; right <- m - starts
    xlim  <- c(m - ends[n_epochs], m)
    xlab  <- "Year"
    at    <- pretty(xlim); labs <- at
  }

  op <- par(no.readonly = TRUE); on.exit(par(op))
  par(mfrow = c(4, 1), mar = c(0.4, 5, 0.4, 1), oma = c(4.5, 0, 1, 0),
      mgp = c(3.2, 0.7, 0))

  for (i in seq_along(quantities)) {
    draw_panel(ests[[i]], left, right, quantities[[i]]$lab, xlim, log_scale,
               hline = quantities[[i]]$hline, show_axis = FALSE)
  }
  axis(1, at = at, labels = labs)          # single shared axis under panel 4
  title(xlab = xlab, outer = TRUE, line = 3)

  invisible(setNames(ests, vapply(quantities, `[[`, "", "lab")))
}


## --- run -------------------------------------------------------------------

results <- plot_ebds(log_file, cut_off, mrsd, burnin, log_scale)

# `results` holds the plotted numbers, e.g.:
#   results[["Effective R"]]

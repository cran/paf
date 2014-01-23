\name{plot.paf}
\alias{plot.paf}
\title{
Plot method for \code{paf} objects
}
\description{
Plot the attributable fraction function obtained by the \code{paf} function.
}
\usage{
\method{plot}{paf}(x, conf.int = TRUE, lty = 1, col = 1, ylim =
NULL, xlab = "Time",
ylab = "Attributable Fraction Function", \dots)
}
\arguments{
  \item{x}{
    an object of class \code{paf} which is retured by the \code{paf} function.
  }
  \item{conf.int}{
    determines whether confidence intervals will be plotted.  The default
    is TRUE.  
  }
  \item{lty}{
    an integer specifying line type. 
  }
  \item{col}{
    an integer specifying color type.    
  }
  \item{ylim}{
    a vector specifying the lower and upper boundaries for y values.
  }
  \item{xlab}{
    label given to the x-axis with "Time" as default.
  }
  \item{ylab}{
    label given to the y-axis with "Attributable Fraction Function" as default.
  }
  \item{\dots}{
    other arguments allowed for the general \code{plot} function.
  }
}

\references{
  Chen L, Lin DY, Zeng D. (2010).
  Attributable fraction functions for censored event times.
  \emph{Biometrika}
  \bold{97}, 713-726.
}
\author{
Li Chen
}

\seealso{
  \code{\link{par}},
  \code{\link{paf}}.
}
\examples{
# simulated data set from a Cox model
n = 1000
x1 = as.numeric(runif(n)>0.5)
x2 = x1 + rnorm(n)
t = exp(-x1 - 0.5 * x2) * rexp(n, rate = 0.1)
c = runif(n, 0, 3.4)
y = pmin(t, c)
delta = as.numeric(t<=c)
test = data.frame(time=y, status=delta, x1=x1, x2=x2)

# calculate the atrributable fraction function of x1 adjusting for x2
result=paf(Surv(time, status) ~ x1 + x2, data=test, cov=c('x1'))
# plot the attributable fraction function
plot(result)

}
\keyword{survival}


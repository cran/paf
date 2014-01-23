\name{paf}
\alias{paf}
\title{
Calculate attributable fraction function for censored survival data

}
\description{
Fit a Cox model and calculate the unadjusted/adjusted attributable fraction
function of a set of covariates based on the Cox model using the method
proposed by Chen, Lin and Zeng (2010). 
}
\usage{
paf(formula, data, cov)
}
\arguments{
  \item{formula}{
    a formula object for the Cox model considered , which has the same format as that in the \code{coxph}
    function of the \code{survival} package. 
}
  \item{data}{
    a data.frame in which to interpret the variables named in 
    the \code{formula}.
}
  \item{cov}{
    the set of covariates whose attributable fraction function is of
    interest.    
}
}
\details{
  This function calculates the unadjusted/adjusted attributable fraction function
  for the set of covariates specified in \code{cov} which must also be
  included as covariates of the Cox model. The function calculates the unadjusted attributable fraction function
  if the Cox model does not include other covariates; otherwise the function calculates the adjusted attributable
  fraction function adjusting for other covariates in the Cox model. 
}
\value{
  \item{time}{unique uncensored event times at which the attributable
    fraction function jumps.}
  \item{est}{the estimates of unadjusted/adjusted attributable fractions
    at unique uncensored event times.}
  \item{se}{the standard errors of the estimated attributable fractions.}
  \item{low}{the lower confidence limits of the atrtributable fractions.}
  \item{upp}{the upper confidence limits of the atrtributable
    fractions.}
  \item{fit.cox}{coxph object from the fitted Cox model.}
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
\note{
The Breslow method is used to handle ties. The function will do
missing-data filter automatically. 
}

\seealso{
\code{\link{plot.paf}}.
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
result$fit.cox
cbind(result$time, result$est, result$se, result$low, result$upp)[1:10, ]
# Calculate the unadjusted attributable fraciton function of x1
result=paf(Surv(time, status) ~ x1, data=test, cov=c('x1'))
}
\keyword{survival}


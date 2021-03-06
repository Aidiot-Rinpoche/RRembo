% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/selectA.R
\name{selectA}
\alias{selectA}
\title{Select a random embedding matrix}
\usage{
selectA(d, D, type = "isotropic", control = list(n = 30, maxit = 100,
  maxit2 = 10))
}
\arguments{
\item{d}{small dimension}

\item{D}{high dimension}

\item{type}{method of random sampling of coefficients or selection procedure, one of
\itemize{
\item 'Gaussian' for standard Gaussian i.i.d. coefficients and orthonormalization
\item 'isotropic' for a random matrix with equal row norms and orthonormal columns.
It is obtained starting with a random Gaussian i.i.d. matrix,
then alternating normalization of rows and orthonormalization of columns.
\item 'optimized' for known optimal solutions (e.g., d = 2) or using a potential. 
Considering each row as a point on the d-hypersphere, try to maximize the minimum distance between any two points.
\item 'standard' for the original REMBO iid random matrix.
}}

\item{control}{list to be passed to \code{\link[stats]{optim}} in the \code{optimized} case (d > 2)}
}
\value{
randomly selected matrix with orthogonal columns and normalized rows (except for standard)
}
\description{
Select a random embedding matrix
}
\examples{
## Example of orthogonal projections
d <- 2; D <- 6
A1 <- selectA(d, D, type = 'Gaussian')
A2 <- selectA(d, D, type = 'isotropic')
A3 <- selectA(d, D, type = 'optimized')

n <- 10000
size <- 10
Y <- size * (2 * matrix(runif(n * d), n) - 1)

Z1 <- ortProj(randEmb(Y, A1), t(A1))
Z2 <- ortProj(randEmb(Y, A2), t(A2))
Z3 <- ortProj(randEmb(Y, A3), t(A3))

par(mfrow = c(1, 3))
plot(Z1, asp = 1)
plot(Z2, asp = 1)
plot(Z3, asp = 1)

par(mfrow = c(1, 1))

}
\references{
M. Binois (2015), Uncertainty quantification on Pareto fronts and high-dimensional strategies in Bayesian optimization, with applications in multi-objective automotive design, PhD thesis, Mines Saint-Etienne.
}
\author{
Mickael Binois
}

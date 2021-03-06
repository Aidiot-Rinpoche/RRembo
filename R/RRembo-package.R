##' Implementation of the Random EMbedding Bayesian Optimization method with several improvements. 
##' Those include domain selection as well as warped kernels.
##' @title Package RRembo
##' @author Mickael Binois
##' @docType package
##' @name RRembo-package
##' @references
##' Z. Wang, F. Hutter, M. Zoghi, D. Matheson, N. de Freitas (2016), Bayesian Optimization in a Billion Dimensions via Random Embeddings, JAIR. \cr \cr
##' M. Binois, D. Ginsbourger, O. Roustant (2015), A Warped Kernel Improving Robustness in Bayesian Optimization Via Random Embeddings, Learning and Intelligent Optimization, Springer \cr \cr
##' M. Binois, D. Ginsbourger, O. Roustant (2018), On the choice of the low-dimensional domain for global optimization via random embeddings, arXiv:1704.05318 \cr \cr
##' M. Binois (2015), Uncertainty quantification on Pareto fronts and high-dimensional strategies in Bayesian optimization, with applications in multi-objective automotive design, PhD thesis, Mines Saint-Etienne.
##' @details 
##' Important functions:\cr
##' 
##' @examples 
##' \dontrun{
##' set.seed(42)
##' library(DiceKriging)
##'
##' lowd <- 2
##' highD <- 25
##'
##' maxEval <- 100
##' 
##' ii <- sample(1:highD, 2)
##' sol <- easyREMBO(par = rep(NA, lowd), branin_mod, ii = ii, lower = rep(0, highD),
##'                    upper = rep(1, highD), budget = maxEval)
##' cat(sol$value, "\n")
##' }
NULL
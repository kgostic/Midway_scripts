library(doParallel)
library(optparse)

# use the environment variable SLURM_NTASKS_PER_NODE to set the number of cores
registerDoParallel(cores=(Sys.getenv("SLURM_NTASKS_PER_NODE")))

# parse options
option_list = list(
  # Option "var" defines a numeric value
  make_option(c("--var"), type="numeric", default=NULL, 
              help="input variable value", metavar="numeric"), 
  
  make_option(c("--char"), type="character", default=NULL)
); 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser); # Now you have a list called "opt" with elements opt$var and opt$out

print(var)
print(char)

# Bootstrapping iteration example
x <- iris[which(iris[,5] != "setosa"), c(1,5)]
iterations <- 10000 # Number of iterations to run

# Parallel version of code 
# Note the '%dopar%' instruction
parallel_time <- system.time({
  r <- foreach(icount(iterations), .combine=cbind) %dopar% {
    ind <- sample(100, 100, replace=TRUE)
    result1 <- glm(x[ind,2]~x[ind,1], family=binomial(logit))
    coefficients(result1)
  }
})

# Shows the number of Parallel Workers to be used
getDoParWorkers()

# Prints the total compute time.
parallel_time["elapsed"]
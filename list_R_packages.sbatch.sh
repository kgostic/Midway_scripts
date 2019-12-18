#!/bin/bash

#SBATCH --partition=broadwl
#SBATCH --tasks=1

# Load the default version of hello.
module load R/3.1+intel-15.0

# Use R CMD BATCH to run Rhello.R.
R CMD BATCH --no-save --no-restore R_listPackages.R
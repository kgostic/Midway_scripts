#!/bin/bash
#SBATCH --job-name=example_doParallel
#SBATCH --output=example_doParallel.out
#SBATCH --error=example_doParallel.err
#SBATCH --time=00:05:00
#SBATCH --partition=broadwl
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --mem-per-cpu=2000
#SBATCH --mail-type=END,FAIL,TIME_LIMIT
#SBATCH --mail-user=kgostic


# From https://rcc.uchicago.edu/docs/software/environments/R/index.html

module load R

Rscript doParallel.R --var 5 --char "testString"
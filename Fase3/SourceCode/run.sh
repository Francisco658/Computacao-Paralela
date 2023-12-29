#!/bin/bash
#SBATCH --time=1:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20

nvprof ./bin/cuda < inputdata.txt

# --unified-memory-profiling off
# --profile-from-start off
# --openacc-profiling off

# # Load necessary modules
# module load cuda/11.3.1

# # Define your executable
# EXECUTABLE="./bin/cuda"

# # Run the executable with cuda-memcheck
# cuda-memcheck $EXECUTABLE < inputdata.txt
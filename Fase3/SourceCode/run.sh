#!/bin/bash
#SBATCH --time=5:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20

time nvprof ./bin/cuda < inputdata.txt

# --metrics achieved_occupancy,sm_efficiency
# --metrics dram_read_throughput,dram_write_throughput,l2_read_throughput,l2_write_throughput
# --metrics flop_count_dp,flop_count_sp,inst_executed
# --metrics warp_execution_efficiency
# --metrics achieved_occupancy
# --metrics kernel_elapsed_time,api_elapsed_time
# --nst_executed
# --cpu-profiling on
#!/bin/bash

# Edit this if you want more or fewer jobs
jobs_in_parallel=8

if [ ! -f "$1" ]
then
    echo "Error: file passed does not exist"
    exit 1
fi

# Start job using job list: set right number of jobs based on line numbers and a job name
sbatch --array=1-$(wc -l < "$1")%${jobs_in_parallel} --job-name $(basename "$1" .txt) $(dirname "$0")/generic.sh "$1"
#!/bin/bash
#SBATCH --time=1:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20

nvprof ./bin/MDpar_CUDA < inputdata.txt

threads=(1 2 4 8 16 32 40)


for nthreads in "${threads[@]}"
do
        export OMP_NUM_THREADS=${nthreads}
        echo How many threads? ${OMP_NUM_THREADS}
        time `./MDpar.exe <inputdata.txt >lixo`
        echo -e "\n"
done
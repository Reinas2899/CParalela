#!/bin/bash
#SBATCH --time=1:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20


# ESTE SCRIPT TESTA QUAL O TEMPO DE EXECUÇÃO E CPI PARA
# DIFERENTES NUMEROS DE THREADS PER BLOCK


num_threads=(220 224 288 320 330 340)


for num in "${num_threads[@]}"
do
        module load gcc/7.2.0
        module load cuda/11.3.1
        echo How many threads per block? ${num}
        export GLOBAL_THREAD_VALUE=${num}
        srun --partition=cpar perf stat -e instructions,cycles nvprof ./bin/MDpar_CUDA < inputdata.txt
        echo -e "\n"
done

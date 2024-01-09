#!/bin/bash
#SBATCH --time=1:00
#SBATCH --partition=cpar
#SBATCH --constraint=k20


# ESTE SCRIPT TESTA QUAL O TEMPO DE EXECUÇÃO E CPI PARA
# DIFERENTES VALORES DE N (NUMERO DE PARTICULAS)

num_particulas=(5500 5600 6000 7000 8000)


for num in "${num_particulas[@]}"
do
        module load gcc/7.2.0
        module load cuda/11.3.1
        echo How many particules? ${num}
        export GLOBAL_N_VALUE=${num}
        srun --partition=cpar perf stat -e instructions,cycles nvprof ./bin/MDpar_CUDA < inputdata.txt
        echo -e "\n"
done

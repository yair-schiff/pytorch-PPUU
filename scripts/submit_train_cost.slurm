#!/bin/bash
#
#SBATCH --job-name=train_cost
#SBATCH --output=logs/train_cost.out
#SBATCH --error=logs/train_cost.err
#SBATCH --time=48:00:00
#SBATCH --gres gpu:1
##SBATCH --exclude="weaver1, weaver2, weaver3, weaver4, weaver5, vine5, vine11, lion6, lion7"
##SBATCH --constraint="gpu_12gb&pascal"
#SBATCH --nodes=1
#SBATCH --mem=50000
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL 
#SBATCH --mail-user=yzs208@nyu.edu

source activate PPUU
cd ../
srun python train_cost.py -mfile $1 -lrt $2 -nfeature $3 -ncond $4 -npred $5 -layers $6 -batch_size $7 -seed $8 -dataset $9 -data_dir ${10} -model_dir ${11} 


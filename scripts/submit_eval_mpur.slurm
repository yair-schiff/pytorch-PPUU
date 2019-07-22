#!/bin/bash
#
#SBATCH --job-name=eval_MPUR
##SBATCH --output=logs/eval_MPUR_%j.out
##SBATCH --error=logs/eval_MPUR_%j.err
#SBATCH --time=48:00:00
#SBATCH --gres gpu:1
#SBATCH --constraint="gpu_12gb&pascal"
#SBATCH --exclude="weaver1, weaver2, weaver3, weaver4, weaver5, vine5, vine11"
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --mem=48000
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=yzs208@nyu.edu

<<<<<<< HEAD
cd ../
source activate PPUU
srun python3 eval_policy.py \
=======
eval "$(conda shell.bash hook)"
conda activate PPUU

cd ../
srun python eval_policy.py \
>>>>>>> 6483e89d12dbbe5138a9106f3a82b39f9e0ec0ff
    -method policy-MPUR \
    -map $map \
    -mfile $mfile \
    -model_dir $model_dir \
    -policy_model $policy

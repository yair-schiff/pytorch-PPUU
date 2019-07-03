#!/bin/bash
#
##SBATCH --nodes=1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --time=48:00:00
#SBATCH --mem=40GB
#SBATCH --exclude="rose5,rose6,vine5,vine11,vine3"
#SBATCH --qos=batch
#SBATCH --job-name=extract-${1}
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
##SBATCH --mail-user=yzs208@nyu.edu
#SBATCH --output=extract_${1}.out
#SBATCH --error=extract_${1}.err

source activate PPUU
cd ../
srun python extract_car_size.py -map $1

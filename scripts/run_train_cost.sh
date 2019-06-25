#!/bin/bash

# Pick the map you'd like to generate data for (comment the others)
#MAP="ai"
#MAP="i80"
MAP="us101"
#MAP="lanker"
#MAP="peach"

#rm *.err
#rm *.out

for mfile in model=fwd-cnn-vae-fp-layers=3-bsize=8-ncond=20-npred=20-lrt=0.0001-nfeature=256-dropout=0.1-nz=32-beta=1e-06-zdropout=0.5-gclip=5.0-warmstart=0-seed=1.step400000.model; do
    for lrt in 0.0001; do 
        for nfeature in 256; do 
            for ncond in 20; do 
                for npred in 20; do 
                    for layers in 3; do 
                        for bsize in 8; do
                            for seed in 1; do 
			        sbatch \
				    --output ../logs/train_cost_${MAP}.out \
				    --error ../logs/train_cost_${MAP}.err \
				    submit_train_cost.slurm $mfile $lrt $nfeature $ncond $npred $layers $bsize $seed ${MAP} traffic-data/state-action-cost/data_${MAP}_v0/ models_us101_v2/
			    done
			done
		    done
	        done
	    done
	done
    done
done

#!/bin/bash

# Allows named arguments
set -k

# Pick the map you'd like to generate data for (comment the others)
#MAP="ai"
#MAP="i80"
MAP="us101"
#MAP="lanker"
#MAP="peach"

if $(echo "i80 us101" | grep -q $MAP); then T=2; fi
if $(echo "lanker peach" | grep -q $MAP); then T=1; fi

echo "Map: $MAP, time slots: $(eval echo {0..$T})"

for t in $(eval echo {0..$T}); do  # time slot
    sbatch \
<<<<<<< HEAD
        --output ../logs/${MAP}_ts${t}.out \
        --error ../logs/${MAP}_ts${t}.err \
        submit_generate_data_${MAP}.slurm $t
=======
        --output ${MAP}_ts${t}.out \
        --error ${MAP}_ts${t}.err \
        submit_generate_data_${MAP}.slurm time_slot=$t
>>>>>>> 6483e89d12dbbe5138a9106f3a82b39f9e0ec0ff
done

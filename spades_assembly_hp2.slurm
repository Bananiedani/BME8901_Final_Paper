#!/bin/bash 
#
#SBATCH --job-name=spades_hp2
#SBATCH --array=1-388%20
#SBATCH --output=spades_hp2.out
#SBATCH --error=spades_hp2.err
#SBATCH --time=00-24:00:00
#SBATCH --account=bme3890
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
#SBATCH --mem=16G
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=jaime.j.wang@vanderbilt.edu

module load spades

FILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" hp2_file_names.txt)
SAMPLE=$(basename $FILE .fastq) 

spades.py --12 /home/wangjj3/Final_Project/Topic1_dataset/chr21_fastq_files/$FILE -o /home/wangjj3/Final_Project/spades_output_hp2/${SAMPLE}

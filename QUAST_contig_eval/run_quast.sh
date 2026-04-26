#!/bin/bash

#SBATCH --job-name=run_quast
#SBATCH --output=run_quast.out
#SBATCH --error=run_quast.err
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --mem=8G
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=danielle.d.liu@vanderbilt.edu
#SBATCH --account=woodard_lab
#SBATCH --partition=batch

cd /data/woodard_lab/ComputationalGenomics8901
./quast-5.3.0/quast.py \
    spades_contigs_hp1.fasta spades_contigs_hp2.fasta \
    -r refdata_hg19_chr21/fasta/genome.fa \
    -o quast_output \
    --threads 4

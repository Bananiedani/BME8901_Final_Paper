#!/bin/bash

#SBATCH --job-name=run_minimap2_hp2
#SBATCH --output=run_minimap2_hp2.out
#SBATCH --error=run_minimap2_hp2.err
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=8
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --mem=8G
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=danielle.d.liu@vanderbilt.edu
#SBATCH --account=woodard_lab
#SBATCH --partition=batch

cd /data/woodard_lab/ComputationalGenomics8901

module restore my_env
source activate my_env

minimap2 -cx asm5 -t 8 --cs refdata_hg19_chr21/fasta/genome.fa spades_contigs_hp2.fasta > asm2.paf
sort -k6,6 -k8,8n asm2.paf > asm2.srt.paf
k8 ~/.conda/envs/my_env/bin/paftools.js call asm2.srt.paf > asm2.var.txt

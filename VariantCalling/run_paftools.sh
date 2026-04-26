#!/bin/bash

#SBATCH --job-name=run_paftools
#SBATCH --output=run_paftools.out
#SBATCH --error=run_paftools.err
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

REF=refdata_hg19_chr21/fasta/genome.fa

# haplotype 1
minimap2 -cx asm5 -t 8 --cs $REF spades_contigs_hp1.fasta > asm1.paf
sort -k6,6 -k8,8n asm1.paf > asm1.srt.paf
k8 ~/.conda/envs/my_env/bin/paftools.js call -f $REF asm1.srt.paf > asm1.vcf

# haplotype 2
minimap2 -cx asm5 -t 8 --cs $REF spades_contigs_hp2.fasta > asm2.paf
sort -k6,6 -k8,8n asm2.paf > asm2.srt.paf
k8 ~/.conda/envs/my_env/bin/paftools.js call -f $REF asm2.srt.paf > asm2.vcf

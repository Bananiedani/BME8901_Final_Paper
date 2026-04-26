#!/bin/bash
#SBATCH --job-name=minimap2_contigs
#SBATCH --output=minimap2_contigs.out
#SBATCH --error=minimap2_contigs.err
#SBATCH --time=04:00:00
#SBATCH --mem=16G
#SBATCH --cpus-per-task=4

module load samtools/1.22.1

# Align hp1 contigs to the reference genome
./minimap2/minimap2 -t 4 -ax asm5 refdata_hg19_chr21/fasta/genome.fa spades_contigs_hp1.fasta | \
samtools view -bS - | \
samtools sort -o hp1_vs_ref.bam

samtools index hp1_vs_ref.bam

# Align hp2 contigs to the reference genome
./minimap2/minimap2 -t 4 -ax asm5 refdata_hg19_chr21/fasta/genome.fa spades_contigs_hp2.fasta | \
samtools view -bS - | \
samtools sort -o hp2_vs_ref.bam

samtools index hp2_vs_ref.bam

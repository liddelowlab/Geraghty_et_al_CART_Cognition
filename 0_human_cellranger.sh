#!/bin/bash
#SBATCH --partition=cpu_medium # partition on which to run
#SBATCH --job-name=cellranger # name 
#SBATCH --mail-type=ALL #Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email_address #Where to send mail
#SBATCH --ntasks=1 #Run on # of CPUs
#SBATCH --cpus-per-task=17
#SBATCH --mem=128gb #Job memory request ##max 128GB
#SBATCH --time=2-00:00:00 #Time limit hrs:min:sec
#SBATCH --output=/relative_path/cellranger_%a.log #Standard output and error log
#SBATCH --no-kill
#SBATCH --array=0-6

samples=( CAR_T_3 CAR_T_8 CAR_T_9 CAR_T_10 DIPG_73 DIPG_79_Cortex DIPG_95_Cortex  )

# id             name for output directory corresponding to sample
# fastqs         Path of folder created by 10x demultiplexing or bcl2fastq
# transcriptome  Path of folder containing 10X-compatible transcriptome

/relative_path/CellRanger/cellranger-7.0.1/cellranger count \
--id "${samples[$SLURM_ARRAY_TASK_ID]}" \
--localmem 128 \
--localcores 17 \
--transcriptome /relative_path/CellRanger/references/refdata-gex-GRCh38-2024-A \
--fastqs /relative_path/fastqs \
--include-introns=true \
--sample ${samples[$SLURM_ARRAY_TASK_ID]}

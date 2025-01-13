#!/bin/bash
#SBATCH --partition=gpu8_medium # partition on which to run
#SBATCH --job-name=cellbender # name 
#SBATCH --mail-type=ALL #Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email_address #Where to send mail
#SBATCH --ntasks=1 #Run on # of CPUs
#SBATCH --mem=64G #Job memory request ##max 128GB
#SBATCH --gres=gpu:1
#SBATCH --time=3-00:00:00 #Time limit hrs:min:sec
#SBATCH --output=/relative_path/cellbender_%a.log #Standard output and error log
#SBATCH --no-kill
#SBATCH --array=0-6

source /relative_path/anaconda3/bin/activate cellbenderv3

samples=( CAR_T_3 CAR_T_8 CAR_T_9 CAR_T_10 DIPG_73 DIPG_79_Cortex DIPG_95_Cortex )

mkdir -p "/relative_path/cellbender_outputs/""${samples[$SLURM_ARRAY_TASK_ID]}"
cd "/relative_path/cellbender_outputs/""${samples[$SLURM_ARRAY_TASK_ID]}"

cellbender remove-background \
	--input "/relative_path/""${samples[$SLURM_ARRAY_TASK_ID]}""/outs/raw_feature_bc_matrix.h5" \
	--output "./""${samples[$SLURM_ARRAY_TASK_ID]}""_output_adjusted.h5" \
	--cuda

# Geraghty_et_al_CART_Cognition

This repository contains the code for the human single-nucleus RNA-seq analyses in Geraghty et al (in revision).

Scripts 0 & 1 are bash scripts executed on a Linux HPC cluster using the SLURM resource manager. Scripts 2-10 are formatted as Jupyter notebooks containing Python (v3.9.19) and R (v4.3.3) code and were executed on a Mac `osx_64` system. 

Script 1 requires the `cellbenderv3` conda environment (see `environments/cellbenderv3.yml`). Scripts 2-4, 6-7, & 9-10 require the `environment1` conda environment (see `environments/environment1.yml`). Scripts 5 & 8 require the `environments2` conda environment (see `environments/environment2.yml`). If your system differs from the above operating systems/architectures, you may need to relax the package builds/versions specified in the respective .yml files. 

FASTQ files and a preprocessed h5ad file are available at NCBI GEO accession TBD. The preprocessed h5ad file is the final output file from the Step 2 `2_human_QC.ipynb` notebook and can be used as input to the Step 3 script. This file contains the post-QC filtered, CellBender-corrected count matrices and associated cell-level metadata for all nuclei aggregated across all samples.

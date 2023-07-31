#!/bin/bash
# ---------------------------------------------------------------------
# SLURM script for a multi-step job on our clusters. 
# ---------------------------------------------------------------------
#SBATCH --cpus-per-task=4
#SBATCH --account=def-flavielc
#SBATCH --mem=40G
#SBATCH --gres=gpu:2
#SBATCH --time=12:00:00
#SBATCH --mail-user=ltfon@ulaval.ca
#SBATCH --mail-type=ALL

echo "Current working directory: `pwd`"
echo "Starting run at: `date`"
# ---------------------------------------------------------------------
echo ""
echo "Job Array ID / Job ID: $SLURM_ARRAY_JOB_ID / $SLURM_JOB_ID"
echo "Running task from array $SLURM_ARRAY_TASK_ID"
echo ""
# ---------------------------------------------------------------------
source ~/envs/protoP/bin/activate
python setup.py build install 

# ---------------------------------------------------------------------
echo "Job finished with exit code $? at: `date`"
# ---------------------------------------------------------------------
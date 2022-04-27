#!/bin/bash
#SBATCH -o Logs/SLURM_job.%j.%N.out
#SBATCH -e Logs/SLURM_job.%j.%N.err
#SBATCH -D .
#SBATCH -J Forward
#SBATCH --get-user-env
#SBATCH --account=bm1164
#SBATCH --mail-user=clara.henry@mpimet.mpg.de
#SBATCH --ntasks=80
#SBATCH --time=08:00:00
#SBATCH --partition=compute,compute2
#=================================================================================================================
set -e
echo Here comes the Nodelist:
echo $SLURM_JOB_NODELIST

echo Here comes the partition the job runs in:
echo $SLURM_JOB_PARTITION
cd $SLURM_SUBMIT_DIR

source ModulesPlusPathsMistralGCC71.sh

cp $ELMER_HOME/share/elmersolver/lib/FreeSurfaceSolver.so src/MyFreeSurfaceSolver.so
echo $ELMER_HOME
echo $ELMER_SOLVER_HOME
cp ../../../Init/Mesh/*result* Mesh/
YearCounter=$1
        YearCounterFormatted=$(printf %06d $YearCounter)
        YearCounter=$(($YearCounter+1))
        YearCounterFormattedNew=$(printf %06d $YearCounter)
        cp Forward.sif.bak Forward.sif
        sed -i "s/START/${YearCounterFormatted}/g" Forward.sif
        sed -i "s/END/${YearCounterFormattedNew}/g" Forward.sif
        echo $YearCounter
        make compile
        make ini 
        make grid
srun -l --export=ALL --cpu_bind=cores --distribution=block:cyclic -n 80 ElmerSolver_mpi
        sbatch Submit.sh 0






#make compile
#make ini
#make grid
#srun -l --export=ALL --cpu_bind=cores --distribution=block:cyclic -n 80 ElmerSolver_mpi Forward.sif

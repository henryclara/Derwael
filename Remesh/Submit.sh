#!/bin/bash
#SBATCH -o /work/bm1164/m300832/Derwael/Remesh/Logs/SLURM_job.%j.%N.out
#SBATCH -e /work/bm1164/m300832/Derwael/Remesh/Logs/SLURM_job.%j.%N.err
#SBATCH -D /work/bm1164/m300832/Derwael/Remesh/
#SBATCH -J Remesh
#SBATCH --get-user-env
#SBATCH --account=bm1164
#SBATCH --ntasks=80
#SBATCH --time=00:10:00
#SBATCH --partition=compute,compute2
#=================================================================================================================
set -e
#echo Here comes the Nodelist:
#echo $SLURM_JOB_NODELIST

#echo Here comes the partition the job runs in:
#echo $SLURM_JOB_PARTITION
#cd $SLURM_SUBMIT_DIR

source ModulesPlusPathsMistralGCC71.sh

cp $ELMER_HOME/share/elmersolver/lib/FreeSurfaceSolver.so src/MyFreeSurfaceSolver.so
echo $ELMER_HOME
echo $ELMER_SOLVER_HOME

#YearCounter=$1
#YearCounterFormatted=$(printf %06d $YearCounter)
#sed -i "s/FORMAT/${YearCounterFormatted}/g" Forward.sif
#echo YearCounter is: 
make compile
make ini
make grid
srun -l --export=ALL --cpu_bind=cores --distribution=block:cyclic -n 1 ElmerSolver_mpi Remesh.sif
#if [ "${YearCounter}" -lt "1000" ]; then
#	if [ "1" -eq 1 ]; then
#					cp Mesh/*result* /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward/Mesh/
#					cp Mesh/mesh* /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward/Mesh/
#					cd /work/bm1164/m300832/CodeThatWorks/SyntheticExperiments//Tolerance6/Forward
#					sbatch Submit.sh $YearCounter
#	fi
#fi

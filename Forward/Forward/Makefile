# Makefile for Elmer
# ----------------------------------------
# Use external Geometry to create mesh
# Calculate Depth and Height for Paraview

EXECUTABLES = src/DistanceSolverRD 


NumProcs=220
NumProcx=22
NumProcy=10
NumProcz=1

InputSif=Age.sif



.SUFFIXES: .f90

all: clean ini grid submit

grid:
	ElmerGrid 2 2 Mesh -partition 22 10 1 -autoclean
	#ElmerGrid 2 2 Mesh -metis 220 4  -autoclean

submit: ini

	mpirun -n 220 ElmerSolver_mpi

compile:  
	elmerf90 src/AgeSolverRD.f90 -o src/AgeSolverRD
	elmerf90 src/Interp3DVelVar.F90 -o src/Interp3DVelVar
	elmerf90 src/Interp3DVelVarNew.F90 -o src/Interp3DVelVarNew

clean:
	rm -fr results/*

ini:
	echo Forward.sif > ELMERSOLVER_STARTINFO

.f90:
	elmerf90  -o Age.sif 22 10 1 220 $<
.c:
	gcc  -o Age.sif 22 10 1 220 $< -lm

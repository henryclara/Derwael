# Makefile for Elmer
# ----------------------------------------
# Use external Geometry to create mesh
# Calculate Depth and Height for Paraview

EXECUTABLES = src/DistanceSolverRD 


NumProcs=100
NumProcx=1
NumProcy=1
NumProcz=1

InputSif=WriteOutGeo.sif



.SUFFIXES: .f90

all: clean ini grid submit

grid:
	#ElmerGrid 2 2 Mesh -partition 1 1 1 -autoclean
	#ElmerGrid 2 2 Mesh -metis 80 4  -autoclean

submit: ini

	mpirun -n 100 ElmerSolver_mpi

compile:
	elmerf90 src/WriteOutput2File.f90 -o src/WriteOutput2File

clean:
	rm -fr results/*

ini:
	echo WriteOutGeo.sif > ELMERSOLVER_STARTINFO

.f90:
	elmerf90  -o WriteOutGeo.sif 1 1 1 100 $<
.c:
	gcc  -o WriteOutGeo.sif 1 1 1 100 $< -lm

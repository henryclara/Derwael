#!/bin/bash

# Run this script to create a new simulation

# Exit if no argument
if [ $# -eq 0 ]; then
 echo "Choose a simulation name"
 exit 1
fi

# Indicate a name for the new simulation
Name=$1

# Create a directory to store model output
mkdir -p Simulations/${Name}/{Mesh,Logs,BoundaryConditions}
cp -r ../Init/Mesh/{mesh*,partitioning.100,Forward000000.result.*} Simulations/${Name}/Mesh
cp -r BoundaryConditions/Derwael* Simulations/${Name}/BoundaryConditions
cp -r {Forward.sif.bak,Submit.sh,Submit0.sh,ModulesPlusPaths2LoadIntelMPI.sh,Makefile,src} Simulations/${Name}

cd Simulations/${Name}

sbatch Submit0.sh 0


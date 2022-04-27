#!/bin/bash

# Run this script to create a new simulation

# Indicate a name for the new simulation
Name=$1

# Create a directory to store model output
mkdir -p Simulations/${Name}/{Mesh,Logs}
cp -r Mesh/{mesh*,partitioning.80,Forward000000.result.*} Simulations/${Name}/Mesh
cp -r {Forward.sif,Forward.sif.bak,Submit.sh,Submit0.sh,Derwael2.nc,SMB_Derval2.nc,ModulesPlusPathsMistralGCC71.sh,Makefile,src} Simulations/${Name}

cd Simulations/${Name}
cp Mesh/*result* Output$(printf "%06d" ${Counter}) 

sbatch Submit0.sh


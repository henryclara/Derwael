#!/bin/bash

# Run this script to create a new simulation

# Indicate a name for the new simulation
Name=SimName
Counter=$1

# Create a directory to store model output
mkdir -p Simulations/${Name}/{Mesh,Logs,Output$(printf "%06d" ${Counter})}
cp -r Mesh/{mesh*,partitioning.80,*result*} Simulations/${Name}/Mesh
cp -r {Forward2.sif,Submit2.sh,Derwael2.nc,SMB_Derval2.nc,ModulesPlusPathsMistralGCC71.sh,Makefile,src} Simulations/${Name}

cd Simulations/${Name}
cp Mesh/*result* Output$(printf "%06d" ${Counter}) 

sbatch Submit2.sh

#while [[ ${Counter} -lt 2 ]]; do

#	mkdir -p Output$(printf "%06d" ${Counter})
#	sbatch Submit2.sh
#	cp -r Mesh/*result* Output$(printf "%06d" ${Counter})
#	mv Mesh/*vtu Output$(printf "%06d" ${Counter})
#	Counter=$((Counter + 1))
	
#done


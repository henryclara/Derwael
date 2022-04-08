#!/bin/bash

# Run this script to create a new simulation

# Indicate a name for the new simulation
Name=SimName
Counter=$1

# Create a directory to store model output
mkdir -p Simulations/${Name}/{Mesh,Logs,Output$(printf "%06d" ${Counter})
cp Mesh/{mesh*,partitioning.80,*result*} Simulations/${Name}/Mesh
cp -r {Forward2.sif,Submit2.sh,Derwael2.nc,SMB_Derval2.nc,ModulesPlusPathsMistralGCC71.sh,Makefile,src} Simulations/${Name}

cd Simulations/${Name} 
sbatch Submit2.sh






# Set up a counter for keeping track of the number of outputs
#Counter=$1

#while [ "${Counter}" -lt "1" ]; do

# This line creates a directory for the first set of output simulations
#mkdir -p Output$(printf "%06d" ${Counter} )	
#cd Output$(printf "%06d" ${Counter} )
#cp ../../../Submit.sh .
#cp ../../../Forward.sif .

#sbatch Submit.sh ${Counter}

#Counter=$((Counter + 1))

#done



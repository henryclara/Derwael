#!/bin/bash

# Run this script to create a new simulation

# Indicate a name for the new simulation
Name=SimName

# Create a directory to store model output
mkdir -p Simulations/${Name}/Mesh
cp Forward.sif Simulations/${Name}
cp Submit.sh Simulations/${Name}
cp Derwael2.nc Simulations/${Name}
cp SMB_Derval2.nc Simulations/${Name}
cp ModulesPlusPathsMistralGCC71.sh Simulations/${Name}
cp -r src Simulations/${Name}




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



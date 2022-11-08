#!/bin/bash

# Run this script to create a new simulation

# Exit if no argument
if [ $# -eq 0 ]; then
 echo "Choose a simulation name"
 exit 1
fi

# Indicate a name for the new simulation
Name=$1
cp -r Forward Simulations/${Name}/
cp -r Simulations/${Name}/Refinement/Mesh/{mesh.*,partitioning.220,Forward*result*} Simulations/${Name}/Forward/Mesh/
cp -r Simulations/${Name}/Refinement/DEM Simulations/${Name}/Forward/ 
cd Simulations/${Name}/Forward
sbatch Submit.sh 200


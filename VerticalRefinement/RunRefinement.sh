#!/bin/bash

# Run this script to create a new simulation

# Exit if no argument
if [ $# -eq 0 ]; then
 echo "Choose a simulation name"
 exit 1
fi

# Indicate a name for the new simulation
Name=$1
cp -r Refinement Simulations/${Name}/
cp -r Simulations/${Name}/WriteOutGeo/Mesh/{mesh.*,WriteOutGeo*} Simulations/${Name}/Refinement/Mesh/
cp -r Simulations/${Name}/WriteOutGeo/GeoOut/* Simulations/${Name}/Refinement/DEM/
cd Simulations/${Name}/Refinement
sbatch Submit.sh

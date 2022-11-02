#!/bin/bash

# Run this script to create a new simulation

# Exit if no argument
if [ $# -eq 0 ]; then
 echo "Choose a simulation name"
 exit 1
fi

# Indicate a name for the new simulation
Name=$1
echo "Current directory: ${PWD}"
cp -r Simulations/${Name}/WriteOutGeo/Mesh/{mesh.*,partitioning*,WriteOutGeo*} Simulations/${Name}/Forward/Mesh/
cp -r Simulations/${Name}/WriteOutGeo/GeoOut/* Simulations/${Name}/Forward/DEM/
cd Simulations/${Name}/Forward
sbatch Submit.sh

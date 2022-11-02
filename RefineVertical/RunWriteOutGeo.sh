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
mkdir -p Simulations/${Name}/Logs
cp -r WriteOutGeo Simulations/${Name}/
cp -r Forward Simulations/${Name}/
cd Simulations/${Name}/WriteOutGeo/
echo "Currently in this directory (should be in WriteOutGeo): ${PWD}"
sbatch Submit.sh



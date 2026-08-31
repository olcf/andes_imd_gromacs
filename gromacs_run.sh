#!/bin/bash

module load gromacs

PDB_FILE="1AKI.pdb"

set -ueo pipefail

# Generate the topology files (choose 8)

gmx pdb2gmx -f $PDB_FILE -o processed.gro -water spc

# Define simulaton box

gmx editconf -f processed.gro -o vacuum_box.gro -c -d 1.0 -bt cubic

# Solvate the system

gmx solvate -cp vacuum_box.gro -cs spc216.gro -o solvated_box.gro -p topol.top

# Add ions

gmx grompp -f inputs/ions.mdp -c solvated_box.gro -p topol.top -o ions.tpr

# Neutralize (choose 13 SOL)

gmx genion -s ions.tpr -o solvated_box.gro -p topol.top -pname NA -nname CL -neutral

# Minimize

gmx grompp -f inputs/minim.mdp -c solvated_box.gro -p topol.top -o em.tpr
gmx mdrun -v -deffnm em

# Equilibrate
gmx grompp -f inputs/nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr

gmx mdrun -deffnm nvt -imdwait -imdpull -imdterm -imdport 0

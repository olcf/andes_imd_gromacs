#!/bin/bash

find . -maxdepth 1 -type f ! -name "*.sh" ! -name "*.pdb" ! -name "*.swp" ! -name "*.cif" ! -name "*.mdp" -exec rm {} +

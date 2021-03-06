#!/bin/bash --

# Defining colours
BLUE='\033[1;34m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'
PURPLE='\033[1;35m'

# Exit immediately if a command exits with a non-zero status.
set -e

# Running benchmark
echo
echo -e "${GREEN}=== Running Example $PWD...${RESET}"
echo

dart ./bin/example.dart

echo

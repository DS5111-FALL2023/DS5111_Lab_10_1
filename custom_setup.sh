#!/bin/bash

# Step 1) Run setup_remote.sh

## First run the setup_remote.sh script 

# Step 2) Clone a REPO

# Check if repository name is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <repository_name>"
    exit 1
fi

REPO_URL=$1
REPO_NAME=$(basename -s .git "$REPO_URL")

# Clone the repository
git clone "$REPO_URL"
cd "$REPO_NAME"

# Step 3) Install dependencies

# Update apt-get
apt-get update

# Check if make is installed, and if not, install it
if ! command -v make &> /dev/null; then
    echo "Make is not installed. Installing..."
    sudo apt-get install make
fi

# Check if python3-pip is installed, and if not, install it
if ! dpkg -l | grep python3-pip &> /dev/null; then
    echo "python3-pip is not installed. Installing..."
    sudo apt-get install -y python3-pip
fi

# Check if python3-venv is installed, and if not, install it
if ! dpkg -l | grep python3-venv &> /dev/null; then
    echo "python3-venv is not installed. Installing..."
    sudo apt-get install -y python3-venv
fi

# Set up the Python virtual environment
make env

# Additional setup steps or data loading can be added here

echo "Setup complete!"


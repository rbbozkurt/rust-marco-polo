#!/bin/bash

# Stop execution if any command fails
set -e

# Install a specific Rust version (e.g., 1.74.0)
echo "Installing Rust 1.74.0..."
rustup install 1.74.0

# Set the installed version as the default
rustup default 1.74.0

echo "Installing clippy..."
rustup component add clippy

# Ensure rustfmt is installed
echo "Installing rustfmt..."
rustup component add rustfmt

# Check if Python is installed, install pre-commit, and set up hooks
echo "Checking for Python..."
if command -v python3 &>/dev/null; then
    echo "Python detected, installing pre-commit..."
    python3 -m pip install --user pre-commit

    # Install pre-commit hooks if .pre-commit-config.yaml exists
    if [ -f .pre-commit-config.yaml ]; then
        echo "Setting up pre-commit hooks..."
        pre-commit install
    else
        echo "No .pre-commit-config.yaml found, skipping pre-commit hook setup."
    fi
else
    echo "Python is not installed; pre-commit not set up."
fi


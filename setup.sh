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

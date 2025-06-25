#!/bin/bash

# RAAKH Network Installer Script (Path-Aware)
# Installs all dependencies and launches the OP Stack via Kurtosis.

set -e

echo "🔧 Installing prerequisites..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git docker.io docker-compose

# Install Kurtosis CLI
echo "📦 Installing Kurtosis CLI..."
curl -fsSL https://kurtosis.com/install | bash
echo 'export PATH="$HOME/.kurtosis/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
kurtosis version

# Check OP Stack folder
if [ ! -d "../optimism-package" ]; then
  echo "❗ Error: optimism-package folder not found in expected location."
  exit 1
fi

# Copy kurtosis configuration files
echo "📂 Preparing kurtosis files..."
cp ../optimism-package/kurtosis.yml ../optimism-package/network_params.yaml .

# Run Kurtosis
echo "🚀 Launching OP Stack using Kurtosis..."
cd ../optimism-package
kurtosis run . --enclave raakhnet

echo "✅ RAAKH network is live via Kurtosis containers."

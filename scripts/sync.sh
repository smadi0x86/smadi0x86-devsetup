#!/bin/bash
set -e

echo "[+] Syncing your setup..."

# Pull the latest changes from the main repository
git pull origin main

# Update submodules
git submodule update --remote --merge

# Stow the dotfiles
./scripts/stow.sh

echo "[+] Sync complete!"

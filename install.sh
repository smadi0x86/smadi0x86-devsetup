#!/bin/bash
set -e

# Regarding .bashrc, you can generate one using cp /etc/skel/.bashrc ~/ and source ~/.bashrc then continue if you don't have one setup
echo "🔄 Updating system and installing base packages..."
sudo apt update -y
sudo apt install -y stow git curl

echo ""
echo "📦 Beginning installation of environment setup scripts..."

# Loop through each script and prompt before executing
for script in scripts/*.sh; do
  script_name=$(basename "$script")
  echo ""
  read -p "➡️  Do you want to run '$script_name'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🚀 Running $script_name..."
    bash "$script"
  else
    echo "⏭️  Skipped $script_name."
  fi
done

echo ""
echo "✅ Environment setup complete."

#!/bin/bash
set -e

echo "🔄 Updating system and installing base packages..."
sudo apt update -y
sudo apt install -y stow git curl

echo ""
echo "📜 Running environment setup scripts..."
# (scripts/ folder except stow.sh and sync.sh)
for script in scripts/*.sh; do
  script_name=$(basename "$script")
  
  # SKIP stow.sh and sync.sh for now
  if [[ "$script_name" == "stow.sh" || "$script_name" == "sync.sh" ]]; then
    continue
  fi

  echo ""
  read -e -p "➡️  Do you want to run '$script_name'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🚀 Running $script_name..."
    bash "$script"
  else
    echo "⏭️  Skipped $script_name."
  fi
done

echo ""
echo "📦 Running package install scripts..."
# (packages/ folder)
for package in packages/*.sh; do
  package_name=$(basename "$package")
  echo ""
  read -e -p "➡️  Do you want to install '$package_name'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "📦 Installing $package_name..."
    bash "$package"
  else
    echo "⏭️  Skipped $package_name."
  fi
done

echo ""
echo "📂 Running dotfile stow setup..."
# (scripts/stow.sh)
if [ -f scripts/stow.sh ]; then
  read -e -p "➡️  Do you want to run 'stow.sh' now to link dotfiles? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔗 Stowing dotfiles..."
    bash scripts/stow.sh
  else
    echo "⏭️  Skipped stow.sh."
  fi
fi

echo ""
echo "🔄 Running sync script if needed..."
# (scripts/sync.sh)
if [ -f scripts/sync.sh ]; then
  read -e -p "➡️  Do you want to run 'sync.sh' now? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔄 Running sync..."
    bash scripts/sync.sh
  else
    echo "⏭️  Skipped sync.sh."
  fi
fi

echo ""
echo "✅ Environment setup complete."

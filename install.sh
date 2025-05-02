#!/bin/bash
set -e

echo "Updating system and installing base packages..."
sudo apt update -y
sudo apt install -y stow git curl

echo ""
echo "Running environment setup scripts..."
# Run all scripts in scripts/, except stow.sh and sync.sh
for script in scripts/*.sh; do
  script_name=$(basename "$script")

  if [[ "$script_name" == "stow.sh" || "$script_name" == "sync.sh" ]]; then
    continue
  fi

  echo ""
  read -e -p "Run '$script_name'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Running $script_name..."
    bash "$script"
  else
    echo "Skipped $script_name."
  fi
done

echo ""
echo "Running package install scripts..."
# Run all scripts in packages/
for package in packages/*.sh; do
  package_name=$(basename "$package")

  echo ""
  read -e -p "Install '$package_name'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Installing $package_name..."
    bash "$package"
  else
    echo "Skipped $package_name."
  fi
done

echo ""
echo "Stowing Emacs dotfiles (if available)..."
if [ -d emacs ]; then
  echo "Emacs dotfiles to be symlinked into \$HOME:"
  ls -A emacs | sed 's/^/  - /'

  read -e -p "Stow Emacs dotfiles into home directory? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    timestamp=$(date +%s)
    for item in .emacs .emacs.custom.el .emacs.local .emacs.rc .emacs.snippets; do
      target="$HOME/$item"
      if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $item to $item.backup.$timestamp"
        mv "$target" "$target.backup.$timestamp"
      fi
    done

    echo "Running: stow emacs"
    stow emacs
    echo "Emacs dotfiles have been stowed."
  else
    echo "Skipped Emacs dotfiles setup."
  fi
else
  echo "'emacs/' folder not found. Skipping."
fi

echo ""
echo "Stowing other dotfiles..."
if [ -f scripts/stow.sh ]; then
  read -e -p "Run 'stow.sh' to link dotfiles? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Running stow.sh..."
    bash scripts/stow.sh
  else
    echo "Skipped stow.sh."
  fi
fi

echo ""
echo "Running sync script..."
if [ -f scripts/sync.sh ]; then
  read -e -p "Run 'sync.sh'? (y/N): " response
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Running sync.sh..."
    bash scripts/sync.sh
  else
    echo "Skipped sync.sh."
  fi
fi

echo ""
echo "Environment setup complete."

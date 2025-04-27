#!/bin/bash
set -e

sudo apt update
sudo apt install -y make gcc ripgrep unzip git xclip curl

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/

git clone https://github.com/smadi0x86/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

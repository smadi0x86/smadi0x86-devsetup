#!/bin/bash
set -e

sudo apt update -y

echo "[+] Installing common development tools..."
sudo apt install -y \
    git \
    curl \
    wget \
    htop \
    build-essential \
    unzip \
    ripgrep \
    xclip \
    jq \
    tree \
    tmux \
    software-properties-common \
    vim \
    fzf \
    zip \
    neofetch \
    dnsutils \
    net-tools \
    wireless-tools

echo "[+] Common tools installation completed!"

# smadi0x86 Development Setup

<div align="center">
<img src="https://github.com/user-attachments/assets/8c060ff3-9867-4a89-96f7-eb0260af6b9f" alt="Debian Logo" />
</div>

This repository automates the installation and configuration of my personal development environment on Debian-based systems (Ubuntu, WSL, Debian 12). It includes essential tools, configurations, and dotfiles managed using GNU Stow and Git submodules.

If you're wondering why I have 2 text editors configs (`emacs` and `nvim`), I use `nvim` for fast file editing and `emacs` for bigger projects.

## Features

- **Tmux**: Configured with my custom `.tmux.conf.local` from `.tmux` project.
- **Neovim**: Configured with my [Kickstart.nvim](https://github.com/smadi0x86/kickstart.nvim).
- **Emacs**: Emacs configuration using custom file loading, lisp modules and using the built-in `rc/require` lisp function. 
- **Packages**: Includes installation scripts for common dependencies and tools such as `tmux`, `neovim`, `golang`, `python3`, `docker` and more.
- **Stow**: Uses [GNU Stow](https://www.gnu.org/software/stow/) for managing dotfiles with symlinks.

## Installation

1. **Clone this repository**:

```bash
git clone --recurse-submodules https://github.com/smadi0x86/smadi0x86-devsetup.git
cd smadi0x86-devsetup
```

2. **Run the installer**: This will install all the necessary packages and setup the dotfiles using stow.

```bash
./install.sh
```

## Syncing

If you've made changes to your dotfiles on one machine and want to sync them across others, use the sync.sh script.

```bash
./scripts/sync.sh
```

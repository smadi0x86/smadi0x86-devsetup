#!/bin/bash
set -e

echo "[+] Installing core development packages for C/C++ and system-level programming..."

sudo apt update -y

# Essential compilers and libraries
sudo apt install -y \
    build-essential \
    clang \
    gcc \
    g++ \
    gcc-multilib \
    g++-multilib \
    libc6-dev \
    libstdc++-12-dev \
    libclang-dev

# Ninja build system
sudo apt install -y ninja-build

# Common utilities
sudo apt install -y \
    cmake \
    make \
    gdb \
    lldb \
    valgrind \
    ccache \
    pkg-config \
    lcov \
    binutils \
    libtool \
    automake \
    autoconf

# Kernel/module dev
sudo apt install -y linux-headers-$(uname -r)

echo "[+] ✅ C/C++ and system programming tools installed!"

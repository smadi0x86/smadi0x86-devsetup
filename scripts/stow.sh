#!/bin/bash
set -e

cd dotfiles

for dir in */; do
  stow -v -t "$HOME" "${dir%/}"
done

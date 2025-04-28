#!/bin/bash
set -e

cd "$HOME"
if [ ! -d "$HOME/.tmux" ]; then
  git clone --single-branch https://github.com/smadi0x86/.tmux.git
fi

ln -sf .tmux/.tmux.conf
cp -n .tmux/.tmux.conf.local .

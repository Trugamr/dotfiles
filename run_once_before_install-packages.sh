#!/usr/bin/env bash
set -euo pipefail

packages=(
  curl
  git
  tmux
  vim
  zsh
  rsync
  xz-utils # Required by proto
)

sudo apt-get update
sudo apt-get install -y "${packages[@]}"

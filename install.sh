#!/usr/bin/env bash

set -euo pipefail

os=$(uname -s)
if [[ "$os" != "Linux" ]]; then
  echo "Only Linux is supported (detected: $os)" >&2
  exit 1
fi

# Minimum prereqs for the chezmoi installer to fetch & run
sudo apt-get update
sudo apt-get install -y curl git

# Install chezmoi into ~/.local/bin and immediately run init --apply
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply Trugamr/dotfiles

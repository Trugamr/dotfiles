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

# Install (or refresh) chezmoi to latest
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"

# Make sure the freshly-installed binary is reachable in this shell
export PATH="$HOME/.local/bin:$PATH"

# First run clones + applies; subsequent runs pull + apply
if [[ -d "$HOME/.local/share/chezmoi/.git" ]]; then
  chezmoi update
else
  chezmoi init --apply Trugamr/dotfiles
fi

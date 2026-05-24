#!/usr/bin/env bash
set -euo pipefail

if [[ "$SHELL" != *zsh ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

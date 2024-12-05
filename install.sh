#!/usr/bin/env bash

set -e

os=$(uname -s)

packages=(
  curl
  git
  tmux
  vim
  zsh
  rsync
  xz-utils # Required by proto
)

# Install packages on supported platforms
if [[ "$os" == "Linux" ]]; then
  sudo apt-get update
  sudo apt-get install -y "${packages[@]}"
fi

# Create directories for configs and binaries
mkdir -p "$HOME/.proto"
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# Clone dotfiles repo
clone_directory="$HOME/dotfiles"
# Useful when developing locally
if [ "$DEBUG" = "true" ]; then
  rsync -ahP "$PWD/" "$clone_directory"
else
  git clone https://github.com/Trugamr/dotfiles.git "$clone_directory"clear

fi

# TODO: Move everything to symlink in separate directory and itreate over it to create symlinks?

# Create symlinks to config files
ln -fs "$clone_directory/.proto/.prototools" "$HOME/.proto/.prototools"
ln -fs "$clone_directory/.config/starship.toml" "$HOME/.config/starship.toml"
ln -fs "$clone_directory/.gitconfig" "$HOME/.gitconfig"
ln -fs "$clone_directory/.hushlogin" "$HOME/.hushlogin"
ln -fs "$clone_directory/.tmux.conf" "$HOME/.tmux.conf"
ln -fs "$clone_directory/.vimrc" "$HOME/.vimrc"
# Create symlinks to shell files
ln -fs "$clone_directory/.zsh" "$HOME/.zsh"
ln -fs "$clone_directory/.zshrc" "$HOME/.zshrc"

# Install proto to manage tooling versions
if ! command -v proto &> /dev/null; then
  curl -fsSL https://moonrepo.dev/install/proto.sh | bash -s -- --no-modify-profile --no-modify-path --yes --version 0.43.0
fi

# Install starship prompt (https://starship.rs/)
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sudo sh -s -- --yes --version 1.21.1
fi

# Change default shell to zsh
if [[ "$os" == "Linux" ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi
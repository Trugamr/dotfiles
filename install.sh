#!/usr/bin/env bash

set -e

os=$(uname -s)

packages=(
  curl
  git
  tmux
  vim
  zsh
)

# Install packages on supported platforms
if [[ "$os" == "Linux" ]]; then
  sudo apt-get update
  sudo apt-get install -y "${packages[@]}"
fi

# Install proto to manage tooling versions
if [[ ! -d "$HOME/.proto" ]]; then
  curl -fsSL https://moonrepo.dev/install/proto.sh | bash
fi

# Install latest LTS version of node using proto
if ! command -v node &> /dev/null; then
  NODE_VERSION=$(curl https://resolve-node.vercel.app/lts)
  "$HOME/.proto/bin/proto" install node "$NODE_VERSION"
fi

# Install starship prompt (https://starship.rs/)
if ! command -v starship &> /dev/null; then
  curl -sS https://starship.rs/install.sh | sudo sh -s -- -y
fi

# Change default shell to zsh
if [[ "$os" == "Linux" ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

# Create directories for configs and binaries
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

clone_directory="$HOME/dotfiles"

# Create symlinks to config files
ln -fs "$clone_directory/.config/starship.toml" "$HOME/.config/starship.toml"
ln -fs "$clone_directory/.gitconfig" "$HOME/.gitconfig"
ln -fs "$clone_directory/.hushlogin" "$HOME/.hushlogin"
ln -fs "$clone_directory/.tmux.conf" "$HOME/.tmux.conf"
ln -fs "$clone_directory/.vimrc" "$HOME/.vimrc"
ln -fs "$clone_directory/.zshrc" "$HOME/.zshrc"

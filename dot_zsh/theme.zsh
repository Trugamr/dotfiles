# 💋 muah theme wiring (files fetched via chezmoi externals)

# fzf reads its color theme from this opts file
export FZF_DEFAULT_OPTS_FILE="$HOME/.config/fzf/muah.opts"

# fast-syntax-highlighting palette — must be sourced AFTER fsh loads (plugins.zsh)
[ -r "$HOME/.config/zsh/muah.zsh" ] && source "$HOME/.config/zsh/muah.zsh"

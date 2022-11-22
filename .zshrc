# 🔧 zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# 🧩 plugins
zinit load agkozak/zsh-z
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load lukechilds/zsh-nvm

# 🌸 prompt
eval "$(starship init zsh)"

# 🎭 aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# 🔨 fixes
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# 🔧 Install and source zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone --depth 1 https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 🧩 Load plugins
zinit light agkozak/zsh-z
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/history-search-multi-word

# 📜 Set history file path and size
if [[ -z "$HISTFILE" ]]; then
    HISTFILE="$HOME/.zsh_history"
fi
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# 🌸 Initialize prompt
eval "$(starship init zsh)"

# 📦 Add binaries to path
PROTO_HOME="$HOME/.proto"
PROTO_NODE_GLOBALS="$PROTO_HOME/tools/node/globals"
export PATH="$PROTO_NODE_GLOBALS/bin:$PROTO_HOME/bin:$PATH:$PROTO_HOME/shims"

# 🎹 Key bindings
bindkey -M emacs '^[[3;5~' kill-word        # ctrl+delete
bindkey -M emacs '^[[1;5C' forward-word     # ctrl+right
bindkey -M emacs '^[[1;5D' backward-word    # ctrl+left

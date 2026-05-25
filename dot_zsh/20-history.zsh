# 📜 Set history file path and size
if [[ -z "$HISTFILE" ]]; then
    HISTFILE="$HOME/.zsh_history"
fi
HISTSIZE=100000
SAVEHIST=$HISTSIZE
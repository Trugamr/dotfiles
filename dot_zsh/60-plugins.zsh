# 🧩 Load plugins

# Required by fzf-tab; fast-syntax-highlighting must load after.
autoload -Uz compinit && compinit

zinit light agkozak/zsh-z
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting

# Let fzf-tab fully own the completion menu (recommended in fzf-tab README)
zstyle ':completion:*' menu no

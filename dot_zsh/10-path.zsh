# 📦 Add binaries to path

# User-local binaries (chezmoi, etc.)
export PATH="$HOME/.local/bin:$PATH"

# OpenCode
export PATH="$HOME/.opencode/bin:$PATH"

# Proto
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

# Node globals (managed by proto)
export PATH="$PATH:$PROTO_HOME/tools/node/globals/bin"

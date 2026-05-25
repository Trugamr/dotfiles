# 📦 Add binaries to path

# User-local binaries (chezmoi, etc.)
export PATH="$HOME/.local/bin:$PATH"

# Proto
PROTO_HOME="$HOME/.proto"
export PATH="$PATH:$PROTO_HOME/shims:$PROTO_HOME/bin"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

# Node globals (managed by proto)
export PATH="$PATH:$HOME/.proto/tools/node/globals/bin"

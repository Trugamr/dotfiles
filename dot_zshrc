# Source common .zsh files
for file in "$HOME/.zsh/"*.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Optionally source local .zsh files
for file in "$HOME/.zsh/local/"*.zsh(N); do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
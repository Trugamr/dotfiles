# Source common .zsh files
for file in "$HOME/.zsh/"*.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# Source machine specific .zsh files
for file in "$HOME/.zsh/local/"*.zsh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
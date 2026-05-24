# dotfiles
Make binaries tough and shiny 💎

### Install
```shell
curl -sS https://raw.githubusercontent.com/Trugamr/dotfiles/main/install.sh | bash
```
Bootstraps `zsh`/`curl`/`git`, installs [chezmoi](https://www.chezmoi.io/), then runs `chezmoi init --apply Trugamr/dotfiles`.

Linux only — the installer fails fast on anything else.

### Local overrides
Drop machine-specific `*.zsh` files into `~/.zsh/local/`. The directory is sourced by `.zshrc` but is **not** managed by chezmoi, so files placed there are never overwritten or removed by `chezmoi apply`.

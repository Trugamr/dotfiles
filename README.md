# dotfiles
🌸🌊 configs that make things look pretty.


### Using these config files
Clone as bare repository, update config to hide untracked files from `git status` & checkout.
```bash
git clone --bare git@github.com:Trugamr/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

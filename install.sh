#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

# Installing ZSH configuration
ln -sf "$DOTFILES_HOME/zsh/"* "$HOME/.oh-my-zsh/custom/"

# Installing PWSH configuration
pwsh install.ps1
mkdir -p "$HOME"/.config/powershell
cp "$DOTFILES_HOME"/.dotfiles/pwsh/profile.ps1 "$HOME"/.config/powershell/profile.ps1

# Configure Git
git config --global core.editor "code"
git config --global pull.ff only

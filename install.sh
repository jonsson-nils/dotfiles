#!/usr/bin/env zsh

set -x
set -e

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

# Installing ZSH configuration
ln -sf "$DOTFILES_HOME/zsh/"* "$HOME/.oh-my-zsh/custom/"

# Installing PWSH configuration
mkdir -p ~/.omp/themes
ln -sf "$DOTFILES_HOME"/pwsh/themes ~/.omp/
pwsh "$DOTFILES_HOME"/pwsh/install.ps1
mkdir -p "$HOME"/.config/powershell
ln -sf "$DOTFILES_HOME"/pwsh/profile.ps1 "$HOME"/.config/powershell/profile.ps1

# Configure Git
git config --global user.name "Nils Jonsson"
git config --global user.email "nils.jonsson@jonsson-analytics.com"
git config --global core.editor "code"
git config --global pull.ff only

#!/usr/bin/env zsh

set -ex

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

# Installing ZSH configuration
ln -sf "$DOTFILES_HOME/zsh/"* "$HOME/.oh-my-zsh/custom/"

# Configure Git
git config --global user.name "Nils Jonsson"
git config --global user.email "nils.jonsson@jonsson-analytics.com"
git config --global core.editor "vim"
git config --global pull.ff only

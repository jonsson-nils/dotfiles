#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

install_zsh_config() {
  echo "Installing ZSH configuration."

  ln -sf "$DOTFILES_HOME/src/zsh/"* "$HOME/.oh-my-zsh/custom/"
}

install_zsh_config

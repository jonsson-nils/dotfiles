#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

# Installing ZSH configuration
ln -sf "$DOTFILES_HOME/zsh/"* "$HOME/.oh-my-zsh/custom/"

  ln -sf "$DOTFILES_HOME/src/zsh/"* "$HOME/.oh-my-zsh/custom/"
}

install_zsh_config

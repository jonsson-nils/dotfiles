#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

install_zsh_config() {
  echo "Installing ZSH configuration."

  ln -sf "$DOTFILES_HOME/src/zsh/"* "$HOME/.oh-my-zsh/custom/"
}

install_tabnine_config() {
  if [ ! -s "$HOME/.config/TabNine" ]; then
    echo "Installing TabNine configuration."

    rm -rf "$HOME/.config/TabNine" && \
    mkdir -p "$HOME/.config" && \
    ln -sf "$DOTFILES_HOME/src/TabNine" "$HOME/.config/TabNine"
  fi
}

install_docker_config() {
  if [ ! -d "$HOME/.docker/" ]; then
    echo "Installing Docker configuration."

    mkdir -p "$HOME/.docker" && \
    cp -R "$DOTFILES_HOME/src/docker/config.json" "$HOME/.docker/config.json"
  fi
}

install_tabnine_config
# install_docker_config
install_zsh_config

#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

echo "$DOTFILES_HOME"

install_zsh_config() {
  echo "Installing ZSH configuration."

  mkdir -p "$HOME/.zsh-configuration/configuration"

  if [ ! -f "$HOME/.zsh-configuration/apply.zsh" ]; then
    ln -sf "$DOTFILES_HOME/src/zshrc" "$HOME/.zsh-configuration/apply.zsh"
    echo "source ~/.zsh-configuration/apply.zsh" >> "$HOME/.zshrc"
  fi

  echo "export DOTFILES_HOME=\"$DOTFILES_HOME\"" >>"$HOME/.zsh-configuration/configuration/000_dotfiles_home.zsh"
  ln -sf "$DOTFILES_HOME/src/zsh/"* "$HOME/.zsh-configuration/configuration/"
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

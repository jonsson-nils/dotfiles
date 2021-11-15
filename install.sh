#!/usr/bin/env zsh

DOTFILES_HOME="$(dirname $0 | xargs realpath)"

install_zsh_config() {
  echo "Installing ZSH configuration."

  if [ ! -d "$HOME/.zsh-configuration/configuration" ]; then
    mkdir -p "$HOME/.zsh-configuration/configuration"
  fi
  if [ ! -f "$HOME/.zsh-configuration/apply.zsh" ]; then
    ln -sf "$DOTFILES_HOME/src/zshrc" "$HOME/.zsh-configuration/apply.zsh"
    echo "source ~/.zsh-configuration/apply.zsh" >> "$HOME/.zshrc"
  fi

  echo "export DOTFILES_HOME=\"$DOTFILES_HOME\"" >>"$HOME/.zsh-configuration/configuration/000_dotfiles_home.zsh"
  ln -sf "$DOTFILES_HOME/src/zsh/"* "$HOME/.zsh-configuration/configuration/"
}

install_docker_config() {
  echo "Installing Docker configuration."

  if [ ! -d "$HOME/.docker/" ]; then
    mkdir -p "$HOME/.docker"
  fi

  cp -R "$DOTFILES_HOME/src/docker/config.json" "$HOME/.docker/config.json"
}

install_zsh_config
install_docker_config

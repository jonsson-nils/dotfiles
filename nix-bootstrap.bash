#!/usr/bin/env bash

set -ex

sudo apt-get update
sudo apt-get install -y curl xz-utils

sh <(curl -L https://nixos.org/nix/install) --no-daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

echo > ~/.config/home-manager/home.nix <<-EOF
{ config, pkgs, ... }:
{
  home.username = "jonsson-nils";
  home.homeDirectory = "/home/jonsson-nils";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    gh
    git
  ];
}
EOF

home-manager switch

gh auth login
mkdir ~/projects
gh repo clone jonsson-nils/dotfiles ~/projects/dotfiles
rm -rf ~/.config/home-manager ~/.gitconfig
ln -sf ~/projects/dotfiles/config/home-manager ~/.config/home-manager

home-manager switch

sudo apt-get remove curl xz-utils


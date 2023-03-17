{ config, pkgs, ... }:

{
  home = {
    username = "jonsson-nils";
    homeDirectory = "/home/jonsson-nils";
    stateVersion = "22.11";
  };

  programs = {
    home-manager.enable = true;
    gpg.enable = true;
  };

  home.sessionVariables = {
    DISPLAY = ":0";
    EDITOR = "hx";
    VISUAL = "hx";
  };

  home.file = {
    ".gitconfig".source = ~/projects/dotfiles/.gitconfig;
  };

  home.packages = with pkgs; [
    gh
    git
    helix
  ];
}


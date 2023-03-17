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
    ".gitconfig".source                = ~/projects/dotfiles/.gitconfig;
    ".config/helix/config.toml".source = ~/projects/dotfiles/config/helix/config.toml;
    ".config/zellij/config.kdl".source = ~/projects/dotfiles/config/zellij/config.kdl;
    ".config/nushell/config.nu".source = ~/projects/dotfiles/config/nushell/config.nu;
    ".config/nushell/env.nu".source    = ~/projects/dotfiles/config/nushell/env.nu;
  };

  home.packages = with pkgs; [
    # vcs
    gh
    git

    # editors
    helix

    # shell
    nushell
    starship
    zellij
  ];
}


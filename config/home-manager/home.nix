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

  home.file = {
    ".bin/broot-nvim.sh".source = ~/projects/dotfiles/bin/broot-nvim.sh;

    ".ssh/config".source = ~/projects/dotfiles/ssh/config;

    ".config/git/config".source = ~/projects/dotfiles/config/git/config;

    ".config/nixpkgs/config.nix".source = ~/projects/dotfiles/config/nixpkgs/config.nix;

    ".cargo/config.toml".source = ~/projects/dotfiles/cargo/config.toml;

    ".config/helix/config.toml".source = ~/projects/dotfiles/config/helix/config.toml;

    ".config/nushell/config.nu".source = ~/projects/dotfiles/config/nushell/config.nu;
    ".config/nushell/env.nu".source = ~/projects/dotfiles/config/nushell/env.nu;
    ".config/nushell/bash-compat.nu".source = ~/projects/dotfiles/config/nushell/bash-compat.nu;
    ".config/nushell/zoxide.nu".source = ~/projects/dotfiles/config/nushell/zoxide.nu;
    ".config/nushell/starship.nu".source = ~/projects/dotfiles/config/nushell/starship.nu;
    ".config/nushell/carapace.nu".source = ~/projects/dotfiles/config/nushell/carapace.nu;
    ".config/nushell/themes/dark.nu".source = ~/projects/dotfiles/config/nushell/themes/dark.nu;
    ".config/nushell/themes/light.nu".source = ~/projects/dotfiles/config/nushell/themes/light.nu;
    ".config/starship.toml".source = ~/projects/dotfiles/config/starship.toml;

    ".config/nvim/init.lua".source = ~/projects/dotfiles/config/nvim/init.lua;
    ".config/nvim/lua/config/autocmds.lua".source = ~/projects/dotfiles/config/nvim/lua/config/autocmds.lua;
    ".config/nvim/lua/config/keymaps.lua".source = ~/projects/dotfiles/config/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/config/lazy.lua".source = ~/projects/dotfiles/config/nvim/lua/config/lazy.lua;
    ".config/nvim/lua/config/options.lua".source = ~/projects/dotfiles/config/nvim/lua/config/options.lua;
    ".config/nvim/lua/plugins/example.lua".source = ~/projects/dotfiles/config/nvim/lua/plugins/example.lua;

    ".config/tmux/tmux.conf".source = ~/projects/dotfiles/config/tmux/tmux.conf;
    ".other/t-smart-tmux-session-manager".source = builtins.fetchGit {
      url = "https://github.com/joshmedeski/t-smart-tmux-session-manager";
      ref = "main";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    # todo: find a better way to integrate the overlay
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
      #url = "https://api.github.com/repos/nix-community/neovim-nightly-overlay/tarball/2dc429bba6bde69698b5e5fe865b13accc58b88a";
    }))
  ];

  home.packages = with pkgs; [
    cachix

    # shell
    nushell
    starship
    tmux
    carapace

    # cli essentials
    coreutils-full
    openssh
    zoxide
    fzf
    broot
    eza
    bat
    ripgrep
    fd
    sd
    zip
    unzip

    # monitoring
    bottom
    du-dust
    bandwhich
    speedtest-cli
    procs
    netcat-gnu

    # editors
    neovim
    helix

    vscode-langservers-extracted

    kakoune
    kak-lsp
    file

    # vcs
    gh
    git
    gitui
    lazygit
    delta

    # dev environment
    tokei
    sccache
    hyperfine
    mold
    jq
    yq
    oha
    openjdk17-bootstrap
    python3

    # node
    nodejs
    deno
    nodePackages.pnpm

    # Rust compiler
    rustup

    # C compiler
    # todo: find a better workaround for tree-sitter
    #gcc
    clang
    pkg-config
    cmake
    gnumake

    # go compiler
    go
    libcap

    # lua
    luajitPackages.luarocks-nix

    # databases
    postgresql_15
    mysql80
    mongosh

    # latex
    texlive.combined.scheme-full

    # other
    #google-cloud-sdk
    android-tools

    irssi
  ];
}


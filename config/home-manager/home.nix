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
    ".ssh/config".source = ~/projects/dotfiles/ssh/config;

    ".gitconfig".source = ~/projects/dotfiles/.gitconfig;

    ".config/nixpkgs/config.nix".source = ~/projects/dotfiles/config/nixpkgs/config.nix;

    ".cargo/config.toml".source = ~/projects/dotfiles/cargo/config.toml;

    ".config/helix/config.toml".source = ~/projects/dotfiles/config/helix/config.toml;

    ".config/zellij/config.kdl".source = ~/projects/dotfiles/config/zellij/config.kdl;

    ".config/nushell/config.nu".source = ~/projects/dotfiles/config/nushell/config.nu;
    ".config/nushell/env.nu".source = ~/projects/dotfiles/config/nushell/env.nu;
    ".config/starship.toml".source = ~/projects/dotfiles/config/starship.toml;
    ".cache/starship/init.nu".source = ~/projects/dotfiles/cache/starship/init.nu;

    ".config/nvim/init.lua".source = ~/projects/dotfiles/config/nvim/init.lua;
    ".config/nvim/lua/user/init.lua".source = ~/projects/dotfiles/config/nvim/lua/user/init.lua;
    ".config/nvim/lua/user/options.lua".source = ~/projects/dotfiles/config/nvim/lua/user/options.lua;
    ".config/nvim/lua/user/keymaps.lua".source = ~/projects/dotfiles/config/nvim/lua/user/keymaps.lua;
    ".config/nvim/lua/user/packer.lua".source = ~/projects/dotfiles/config/nvim/lua/user/packer.lua;
    ".config/nvim/after/plugin/bufferline.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/bufferline.lua;
    ".config/nvim/after/plugin/indent_blankline.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/indent_blankline.lua;
    ".config/nvim/after/plugin/leap.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/leap.lua;
    ".config/nvim/after/plugin/which-key.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/which-key.lua;
    ".config/nvim/after/plugin/octo.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/octo.lua;
    ".config/nvim/after/plugin/neotree.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/neotree.lua;
    ".config/nvim/after/plugin/fugitive.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/fugitive.lua;
    ".config/nvim/after/plugin/gitsigns.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/gitsigns.lua;
    ".config/nvim/after/plugin/diffview.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/diffview.lua;
    ".config/nvim/after/plugin/harpoon.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/harpoon.lua;
    ".config/nvim/after/plugin/lsp.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/lsp.lua;
    ".config/nvim/after/plugin/lualine.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/lualine.lua;
    ".config/nvim/after/plugin/tokyonight.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/tokyonight.lua;
    ".config/nvim/after/plugin/telescope.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/telescope.lua;
    ".config/nvim/after/plugin/treesitter.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/treesitter.lua;
    ".config/nvim/after/plugin/undotree.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/undotree.lua;
    ".config/nvim/after/plugin/zen-mode.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/zen-mode.lua;
    ".config/nvim/after/plugin/twilight.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/twilight.lua;
    ".config/nvim/after/plugin/markdown-preview.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/markdown-preview.lua;
    ".config/nvim/after/plugin/trouble.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/trouble.lua;
    ".config/nvim/after/plugin/todo-comments.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/todo-comments.lua;
    ".config/nvim/after/plugin/symbols-outline.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/symbols-outline.lua;
    ".config/nvim/after/plugin/persistence.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/persistence.lua;

    ".local/bin/update-rust-analyzer".source = ~/projects/dotfiles/local/bin/update-rust-analyzer;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      #url = "https://github.com/nix-community/neovim-nightly-overlay/archive/a9719c5050b1abbb0adada7dd9f98e0cdbd3ed53.tar.gz";
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  home.packages = with pkgs; [
    # vcs
    gh
    git
    gitui
    delta

    # editors
    helix
    neovim

    # dev environment
    sccache
    tokei
    hyperfine
    mold
    jq
    yq
    oha
    openssl
    openssl.dev
    openjdk17-bootstrap

    # node
    nodejs
    deno

    # Rust compiler
    rustup

    # C compiler
    #gcc
    clang
    pkg-config
    cmake

    # go compiler
    go
    libcap

    luajitPackages.luarocks-nix

    # databases
    postgresql_15
    mysql80
    mongosh

    # shell
    openssh
    nushell
    starship
    zellij
    mprocs
    broot
    netcat-gnu

    # latex
    texlive.combined.scheme-full

    # cli essentials
    zip
    unzip
    coreutils-full
    eza
    bat
    ripgrep
    fd
    sd

    # monitoring
    bottom
    du-dust
    bandwhich
    speedtest-cli
    procs

    google-cloud-sdk
    android-tools
 ];
}


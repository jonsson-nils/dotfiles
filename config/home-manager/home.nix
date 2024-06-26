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
    ".config/nvim/lua/user/init.lua".source = ~/projects/dotfiles/config/nvim/lua/user/init.lua;
    ".config/nvim/lua/user/options.lua".source = ~/projects/dotfiles/config/nvim/lua/user/options.lua;
    ".config/nvim/lua/user/keymaps.lua".source = ~/projects/dotfiles/config/nvim/lua/user/keymaps.lua;
    ".config/nvim/lua/user/packer.lua".source = ~/projects/dotfiles/config/nvim/lua/user/packer.lua;
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

    ".config/tmux/tmux.conf".source = ~/projects/dotfiles/config/tmux/tmux.conf;
    ".config/tmux/plugins/tpm".source = builtins.fetchGit {
      url = "https://github.com/tmux-plugins/tpm";
      ref = "master";
    };
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


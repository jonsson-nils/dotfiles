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
    ".gitconfig".source = ~/projects/dotfiles/.gitconfig;

    ".config/nixpkgs/config.nix".source = ~/projects/dotfiles/config/nixpkgs/config.nix;

    ".cargo/config.toml".source = ~/projects/dotfiles/cargo/config.toml;

    ".config/helix/config.toml".source = ~/projects/dotfiles/config/helix/config.toml;

    ".config/zellij/config.kdl".source = ~/projects/dotfiles/config/zellij/config.kdl;

    ".config/nushell/config.nu".source = ~/projects/dotfiles/config/nushell/config.nu;
    ".config/nushell/env.nu".source = ~/projects/dotfiles/config/nushell/env.nu;

    ".config/nvim/init.lua".source = ~/projects/dotfiles/config/nvim/init.lua;
    ".config/nvim/lua/options/init.lua".source = ~/projects/dotfiles/config/nvim/lua/options/init.lua;
    ".config/nvim/lua/keymaps/init.lua".source = ~/projects/dotfiles/config/nvim/lua/keymaps/init.lua;
    ".config/nvim/lua/plugins/init.lua".source = ~/projects/dotfiles/config/nvim/lua/options/init.lua;
    ".config/nvim/after/plugin/bufferline.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/bufferline.lua;
    ".config/nvim/after/plugin/indent_blankline.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/indent_blankline.lua;
    ".config/nvim/after/plugin/hop.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/hop.lua;
    ".config/nvim/after/plugin/which-key.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/which-key.lua;
    ".config/nvim/after/plugin/octo.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/octo.lua;
    ".config/nvim/after/plugin/orgmode.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/orgmode.lua;
    ".config/nvim/after/plugin/copilot.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/copilot.lua;
    ".config/nvim/after/plugin/neotree.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/neotree.lua;
    ".config/nvim/after/plugin/neogit.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/neogit.lua;
    ".config/nvim/after/plugin/fugitive.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/fugitive.lua;
    ".config/nvim/after/plugin/fidget.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/fidget.lua;
    ".config/nvim/after/plugin/git-gutter.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/git-gutter.lua;
    ".config/nvim/after/plugin/harpoon.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/harpoon.lua;
    ".config/nvim/after/plugin/lsp.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/lsp.lua;
    ".config/nvim/after/plugin/lualine.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/lualine.lua;
    ".config/nvim/after/plugin/tokyonight.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/tokyonight.lua;
    ".config/nvim/after/plugin/telescope.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/telescope.lua;
    ".config/nvim/after/plugin/treesitter.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/treesitter.lua;
    ".config/nvim/after/plugin/undotree.lua".source = ~/projects/dotfiles/config/nvim/after/plugin/undotree.lua;

    ".local/bin/update-rust-analyzer".source = ~/projects/dotfiles/local/bin/update-rust-analyzer;
  };

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
    oha
    openssl
    openssl.dev

    # node
    nodejs

    # Rust compiler
    rustup

    # C compiler
    gcc
    pkgconfig
    cmake

    # go compiler
    go
    libcap

    # shell
    openssh
    nushell
    starship
    zellij
    mprocs
    broot

    # latex
    texlive.combined.scheme-full

    # cli essentials
    zip
    unzip
    coreutils-full
    exa
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
 ];
}


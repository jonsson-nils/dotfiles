#!/usr/bin/env bash

if [ -e './.nvim.pipe' ]; then
  nvim --server ./.nvim.pipe --remote "$2"
  nvim --server ./.nvim.pipe --remote-send "<C-\\><C-N>$1gg<CR>"
else
  nvim "$1" "$2"
fi


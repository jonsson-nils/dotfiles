#!/usr/bin/env bash

echo "$PWD"

if [ ! -e './.nvim.pipe' ]; then
  echo "No .nvim.pipe file found."
  tmux split-window "nvim --listen ./.nvim.pipe"
  sleep 1
fi

nvim --server ./.nvim.pipe --remote "$2"
nvim --server ./.nvim.pipe --remote-send "<C-\\><C-N>$1gg<CR>"


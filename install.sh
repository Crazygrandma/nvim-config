#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/Crazygrandma/nvim-config.git"
NVIM_DIR="$HOME/.config/nvim"

# Backup existing config if it exists
if [ -d "$NVIM_DIR" ]; then
  echo "Backing up existing nvim config..."
  mv "$NVIM_DIR" "$NVIM_DIR.backup.$(date +%s)"
fi

echo "Cloning nvim config..."
git clone "$REPO_URL" "$NVIM_DIR"

echo "Done."

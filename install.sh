#!/usr/bin/env bash

# NOTE: This script is AI generated, and not tested. Use at your own risk!

# strict mode
set -euo pipefail

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# formatting
info() { printf "\033[34m[INFO]\033[0m %s\n" "$1"; }
success() { printf "\033[32m[OK]\033[0m %s\n" "$1"; }
warn() { printf "\033[33m[WARN]\033[0m %s\n" "$1"; }

# Create directories if they don't exist
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/karabiner"
mkdir -p "$HOME/Developer/gitlab"

# Associative array for mappings: "repo_path:target_path"
# Add more files here as needed
declare -a FILES_TO_SYMLINK=(
    ".zshrc:$HOME/.zshrc"
    ".gitconfig:$HOME/.gitconfig"
    ".spaceshiprc.zsh:$HOME/.spaceshiprc.zsh"
    "tmux/.tmux.conf:$HOME/.tmux.conf"
    "tmux/startup.sh:$HOME/.config/tmux/startup.sh"
    "terminal/ghostty/config:$HOME/.config/ghostty/config"
    "karabiner/karabiner.json:$HOME/.config/karabiner/karabiner.json"
    "gitlab-config/.gitconfig:$HOME/Developer/gitlab/.gitconfig"
)

for mapping in "${FILES_TO_SYMLINK[@]}"; do
    source_file="${mapping%%:*}"
    target_file="${mapping##*:}"
    full_source_path="$DOTFILES_DIR/$source_file"

    # Check if source exists
    if [ ! -e "$full_source_path" ]; then
        warn "Source file not found: $source_file. Skipping..."
        continue
    fi

    # Check if symlink already exists and is correct
    if [ -L "$target_file" ] && [ "$(readlink "$target_file")" == "$full_source_path" ]; then
        success "$target_file is already linked."
        continue
    fi

    # Backup existing file if it's not a symlink
    if [ -e "$target_file" ] && [ ! -L "$target_file" ]; then
        mv "$target_file" "$target_file.backup"
        warn "Moved existing $target_file to $target_file.backup"
    fi

    # Create the symlink
    # -f forces the link creation (overwriting the existing link if it points somewhere else)
    ln -sf "$full_source_path" "$target_file"
    success "Linked $source_file -> $target_file"
done

info "Installation complete! Restart your shell."

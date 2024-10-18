#!/bin/bash

declare -A DOTFILES
DOTFILES=(
	["zsh/.zshrc"]="$HOME/.zshrc"
	["nvim/init.vim"]="$HOME/.config/nvim/init.vim"
	["hyprland/hyprland.conf"]="$HOME/.config/hyprland/hyprland.conf"
)

create_symlinks() {
    for source in "${!DOTFILES[@]}"; do
        target=${DOTFILES[$source]}
        
        # Check if the target file exists
        if [ -e "$target" ]; then
            echo "Backing up existing $target to $target.bak"
            mv "$target" "$target.bak"
        fi

        # Create the necessary directories if they don't exist
        mkdir -p "$(dirname "$target")"

        # Create the symlink
        ln -s "$HOME/dotfiles/$source" "$target"
        echo "Created symlink: $HOME/dotfiles/$source -> $target"
    done
}

create_symlinks

echo "dotfiles setup complete"



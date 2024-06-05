#! /bin/bash

# Create the configuration directory if it doesn't exist
mkdir -p ~/.config

# Create symbolic links to the dotfiles if they don't already exist
[ ! -L ~/.config/nvim ] && ln -s ~/deriv_dotfiles/nvim ~/.config/nvim
[ ! -L ~/.gitconfig ] && ln -s ~/deriv_dotfiles/.gitconfig ~/.gitconfig
[ ! -L ~/.tmux.conf ] && ln -s ~/deriv_dotfiles/.tmux.conf ~/.tmux.conf

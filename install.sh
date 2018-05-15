#!/bin/sh

# Symlink
unlink ~/.config/nvim
ln -sv ~/.dotfiles/nvim/ ~/.config/

# Install Plug - Vim plugin manager
curl -fLo ~/.dotfiles/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Plugins
nvim -c PlugInstall

# Tmux config
ln -sv ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Ctags
ln -sv ~/.dotfiles/.ctags ~/.ctags

#!/bin/zsh

rm ~/.zshrc 
cp .zshrc ~/.zshrc

rm ~/.gitconfig 
cp .gitconfig ~/.gitconfig

sudo cp -r ./.config/ ~/.config/

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


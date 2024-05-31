#!/bin/bash

install_dependencies() {
    echo "Install dependencies..."
    sudo apt update
    sudo apt upgrade
    sudo apt install -y git wget curl neovim
    sudo snap install bash-language-server --classic
}

remove_old_nvim ()
{
    echo "Remove old Neovim..."
	mv $HOME/.config/nvim $HOME/.config/nvim.bak
	mv $HOME/.cache/nvim $HOME/.cache/nvim.bak
	mv $HOME/.local/share/nvim $HOME/.local/share/nvim.bak
	mv $HOME/.local/state/nvim $HOME/.local/state/nvim.bak
}

make_new_folder()
{
    echo "Create new directory..."
    mkdir -p $HOME/.config/nvim
}

install()
{
    echo "Install ..."
    ln -s $PWD/lua $HOME/.config/nvim/lua
    ln -s $PWD/init.lua $HOME/.config/nvim/init.lua
}

main()
{
    remove_old_nvim
    install_dependencies
    make_new_folder
    install
    echo "Done!"
}

main

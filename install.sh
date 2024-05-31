#!/bin/bash

install_dependencies() {
    echo "Install dependencies..."
    sudo apt update
    sudo apt upgrade
    sudo apt install -y git wget curl
    sudo snap install bash-language-server --classic
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    mv nvim.appimage /opt/nvim/nvim
}

remove_old_nvim ()
{
    echo "Remove old Neovim..."
    sudo rm -rf /opt/nvim
	mv $HOME/.config/nvim $HOME/.config/nvim.bak
	mv $HOME/.cache/nvim $HOME/.cache/nvim.bak
	mv $HOME/.local/share/nvim $HOME/.local/share/nvim.bak
	mv $HOME/.local/state/nvim $HOME/.local/state/nvim.bak
}

make_new_folder()
{
    echo "Create new directory..."
    mkdir -p $HOME/.config/nvim
    sudo mkdir -p /opt/nvim
}

install()
{
    echo "Install ..."
    ln -s $PWD/lua $HOME/.config/nvim/lua
    ln -s $PWD/init.lua $HOME/.config/nvim/init.lua
    echo "export PATH="$PATH:/opt/nvim/"" >> $HOME/.bashrc 
    echo "export PATH="$PATH:/opt/nvim/"" >> $HOME/.zshrc
}

main()
{
    remove_old_nvim
    make_new_folder
    install_dependencies
    install
    echo "Done!"
}

main

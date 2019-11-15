#!/bin/sh

# Shell script to setup dotfiles and everything else required

# git configuration
git_email="venuvardhanreddytekula8@gmal.com"
git_name="Venu Vardhan Reddy Tekula"

# Directory and repo for oh-my-zsh
oh_my_zsh_dir=$HOME/.oh-my-zsh
oh_my_zsh_repo=https://github.com/robbyrussell/oh-my-zsh.git
oh_my_zsh_theme="bureau"

# Packages to install
packages="wget build-essential curl python-dev python-pip python3-pip git xclip zsh"

# Pip packages to install
pip2_packages="ipython pip virtualenvwrapper"
pip3_packages="ipython pip"

if [ -z $git_name ] || [ -z $git_email ]
then
    echo "Please set both git_name and git_email variables in install script and re-run it"
    exit
fi

echo "Updating package lists"
sudo apt-get update
if [ $? -ne 0 ]; then
    echo "Package lists update failed. Aborting."
    exit 1
fi

echo "Installing packages $packages. Won't work on systems without apt-get."
sudo apt-get install --yes $packages

echo "Installing pip packages. Might fail on non-Ubuntu machines."
sudo pip2 install --upgrade $pip2_packages
sudo pip3 install --upgrade $pip3_packages

# Git configuration setup
echo "Setting up git configuration"
git config --global user.name $git_name
git config --glob

echo "Cloning oh-my-zsh to $oh_my_zsh_dir"
git clone $oh_my_zsh_repo $oh_my_zsh_dir

cp bashrc ~/.bashrc 
cp zshrc ~/.zshrc 
source ~/.zshrc

echo "Changing login shell to zsh"
chsh -s /bin/zsh

echo "Install complete. You might want to tweak the profile used by your terminal emulator"
#!/bin/sh

# Shell script to setup dotfiles and everything else required

# initial setup
apt-get update
apt-get upgrade

# logging setup
apt-get install fortune cowsay
git clone http://github.com/possatti/pokemonsay
cd pokemonsay && ./install.sh && cd ..
rm -rf pokemonsay
mv ~/bin/* /bin && rm -rf ~/bin/

# git installation and configurations
echo "INSTALLING GIT" | pokemonsay
apt install git-all

git config --global user.name "Venu Vardhan Reddy Tekula"
git config --global user.email "venuvardhanreddytekula8@gmail.com"

echo "GIT IS CONFIGURED" | pokemonthink
git --version
git config user.name
git config user.email

echo "ADDING GIT ALIASES" | pokemonsay
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

# zsh installation and configurations
echo "INSTALLING ZSH" | pokemonsay
apt install zsh
zsh --version
chsh -s $(which zsh)

echo $SHELL
echo "need to logout, then you can see /bin/zsh as output"
echo "ZSH IS CONFIGURED, LOGOUT ONCE TO SEE THE CHANGES" | pokemonthink

echo "SETTING UP OHMYZSH" | pokemonsay
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/vchrombie/dotfiles/master/vchrombie-bureau.zsh-theme -O ~/.oh-my-zsh/themes/vchrombie-bureau.zsh-theme
wget https://raw.githubusercontent.com/vchrombie/dotfiles/master/zshrc -O ~/.zshrc

echo "RELAUNCH TERMINAL TO SEE THE CHANGES" | pokemonsay

echo "INSTALLING NECCESSARY PACKAGES" | pokemonsay
apt-get install python3-dev python3-tk libffi-dev libssl-dev
apt-get remove python3-pip; apt-get install python3-pip

echo "INSTALLING APPS" | pokemonsay
# other required apps setup


echo "TELEGRAM" | pokemonsay
apt install telegram-desktop

echo "SLACK" | pokemonsay
snap install slack --classic

echo "PYCHARM COMMUNITY" | pokemonsay
snap install pycharm-community --classic

echo "FINAL CHECK FOR UPDATES AND MISSING PACKAGES"
apt-get update && apt-get update --fix-missing
apt-get upgrade && apt-get upgrade --fix-missing

echo "SYSTEM SETUP IS DONE" | pokemonsay

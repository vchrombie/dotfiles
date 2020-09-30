#!/bin/sh

# Shell script to setup dotfiles and everything else required

# initial setup
sudo apt-get update
sudo apt-get upgrade

# logging setup
sudo apt-get install fortune cowsay
git clone http://github.com/possatti/pokemonsay
cd pokemonsay && ./install.sh
rm -rf pokemonsay

# git installation and configurations
echo "INSTALLING GIT" | ~/bin/pokemonsay
sudo apt install git-all
git config --global user.name "Venu Vardhan Reddy Tekula"
git config --global user.email "venuvardhanreddytekula8@gmail.com"
echo "GIT IS CONFIGURED" | ~/bin/pokemonthink
git --version
git config user.name
git config user.email
echo "ADDING GIT ALIASES" | ~/bin/pokemonsay
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

# zsh installation and configurations
echo "INSTALLING ZSH" | ~/bin/pokemonsay
sudo apt install zsh
zsh --version
chsh -s $(which zsh)
echo "ZSH IS CONFIGURED, LOGOUT ONCE TO SEE THE CHANGES" | ~/bin/pokemonthink
echo $SHELL # need to logout, then you can see `/bin/zsh` as output
echo "SETTING UP OHMYZSH" | ~/bin/pokemonsay
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/vchrombie/dotfiles/master/vchrombie-bureau.zsh-theme -O ~/.oh-my-zsh/themes/vchrombie-bureau.zsh-theme
wget https://raw.githubusercontent.com/vchrombie/dotfiles/master/zshrc -O ~/.zshrc
echo "RELAUNCH TERMINAL TO SEE THE CHANGES" | ~/bin/pokemonsay



# other required apps setup
echo "INSTALLING APPS" | ~/bin/pokemonsay
echo "TELEGRAM" | ~/bin/pokemonsay
sudo apt install telegram-desktop
echo "PYCHARM COMMUNITY" | ~/bin/pokemonsay
sudo snap install pycharm-community --classic

echo "SYSTEM SETUP IS DONE" | ~/bin/pokemonsay

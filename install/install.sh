#!/bin/bash

# install Homebrew (if not already installed)
if ! command -v brew >/dev/null; then
    /bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)'
fi

# install command-line tools and applications using Homebrew
brew bundle --file ~/.dotfiles/brew/Brewfile

# create symbolic links for dotfiles
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/install/.macos ~/.macos
ln -sf ~/.dotfiles/alacritty/.alacritty.yml ~/.alacritty.yml
ln -sf ~/.dotfiles/fish/.config/ ~/.config/
ln -sf ~/.dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf

# add fish to '/etc/shells' and set to default
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

# install Oh My Fish
curl -L https://get.oh-my.fish | fish

# set the default theme to pure
omf install pure
omf theme pure

# install Python packages using pip
pip3 install numpy scipy sympy pandas matplotlib pygame flask notebook torch
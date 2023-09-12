#!/bin/zsh

# install Homebrew (if not already installed)
if ! command -v brew >/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/fraser/.profile
    eval "$(/usr/local/bin/brew shellenv)"
fi

# install command-line tools and applications using Homebrew
brew bundle --file ~/.dotfiles/brew/Brewfile

# create symbolic links for dotfiles
ln -sf ~/.dotfiles/ssh/ ~/.ssh
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

# install fonts needed in theme
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# install python
pyenv install 3.10

echo 'Installation Complete.'

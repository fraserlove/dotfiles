#!/bin/bash

set -e

echo 'Starting dotfiles setup...'

echo 'Installing xcode command line tools...'
xcode-select --install 2>/dev/null || echo 'Xcode Command Line Tools already installed.'

echo 'Installing Homebrew...'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing packages from brewfile...'
brew bundle --file=./Brewfile

echo 'Copying config files to ~/.config...'
mkdir -p "$HOME/.config"
for dir in .config/*; do
    dest="$HOME/.config/$(basename "$dir")"
    [ -e "$dest" ] && rm -rf "$dest"
    cp -r "$dir" "$dest"
done

touch "$HOME/.hushlogin"

echo 'Installing pure-fish/pure prompt...'
fish -c "fisher install pure-fish/pure"

echo 'Setting up pyenv...'
fish -c "set -Ux PYENV_ROOT $HOME/.pyenv"
fish -c "fish_add_path $PYENV_ROOT/bin"

echo 'Installing python...'
pyenv install -s 3
pyenv global 3

echo 'Setting fish as default shell...'
if ! grep -q "/opt/homebrew/bin/fish" /etc/shells; then
    echo '/opt/homebrew/bin/fish' | sudo tee -a /etc/shells
fi
chsh -s /opt/homebrew/bin/fish

echo 'Done. Perform a restart to apply changes.'

rm -rf "$(dirname "$0")"

#!/bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Oh-My-Fish with Pure theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install)" > install
sh -c "fish install --path=~/.local/share/omf --config=~/.config/omf curl git.io/pure-fish --output 
/tmp/pure_installer.fish --location --silent"
sh -c "source /tmp/pure_installer.fish; and install_pure"


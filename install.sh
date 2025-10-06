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
for dir in config/*; do
    dest="$HOME/.config/$(basename "$dir")"
    [ -e "$dest" ] && rm -rf "$dest"
    cp -r "$dir" "$dest"
done

touch "$HOME/.hushlogin"

echo 'Installing cursor extensions...'
ln -s "/Applications/Cursor.app/Contents/Resources/app/bin/cursor" /usr/local/bin/cursor
EXTENSIONS=(
  ms-python.python
  wicked-labs.sequoia
  james-yu.latex-workshop
  artlaman.chalice-icon-theme
)
for ext in "${EXTENSIONS[@]}"; do
  cursor --install-extension "$ext"
done

echo 'Changing cursor settings...'
CURSOR_USER_SETTINGS="$HOME/Library/Application Support/Cursor/User/settings.json"
CURSOR_CONFIG_SOURCE="$HOME/.config/cursor/settings.json"
mkdir -p "$(dirname "$CURSOR_USER_SETTINGS")"
# Remove existing settings.json if it exists and is not the correct symlink
if [ -e "$CURSOR_USER_SETTINGS" ] && [ ! -L "$CURSOR_USER_SETTINGS" ]; then
    rm "$CURSOR_USER_SETTINGS"
fi
# Symlink the config
ln -sf "$HOME/.config/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"

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

echo "Replacing Alacritty icon with terminal icon..."
ALACRITTY_APP="/Applications/Alacritty.app"
TERMINAL_ICON="/System/Applications/Utilities/Terminal.app/Contents/Resources/Terminal.icns"
ALACRITTY_ICON="$ALACRITTY_APP/Contents/Resources/alacritty.icns"
if [ -d "$ALACRITTY_APP" ]; then
    echo "Copying Terminal icon to Alacritty..."
    sudo cp "$TERMINAL_ICON" "$ALACRITTY_ICON"
    sudo touch "$ALACRITTY_APP"
    killall Dock &>/dev/null || true
    echo "Alacritty icon replaced successfully."
else
    echo "Alacritty.app not found in /Applications. Skipping icon replacement."
fi

echo 'Done. Perform a restart to apply changes.'

rm -rf "$(dirname "$0")"

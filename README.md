# Dotfiles
A disposable dotfiles repo to configure a new macOS environment.

## Installation
To use these dotfiles on your own system, follow these steps:
```sh
git clone https://github.com/fraserlove/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```
Once complete, perform a restart. This repository will self-delete after installation is complete.

> **Note:** You'll need to authenticate with a **personal access token (PAT)** when performing an initial push to a GitHub repository. This token will be securely stored in the macOS **Keychain** via the `osxkeychain` credential helper.

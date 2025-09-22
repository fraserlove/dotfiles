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

> Cursor settings
> The following settings.json file configures Cursor with your preferred UI and terminal color theme. It includes smooth cursor animation, an icon theme, and a fully customized terminal palette.
```json
{
    "window.commandCenter": true,
    "workbench.iconTheme": "chalice-icon-theme",
    "editor.minimap.enabled": true,
    "editor.cursorSmoothCaretAnimation": "on",
    "workbench.colorCustomizations": {
      "terminal.ansiBlack": "#000000",
      "terminal.ansiRed": "#D66E86",
      "terminal.ansiGreen": "#A1BDFF",
      "terminal.ansiYellow": "#997CD5",
      "terminal.ansiBlue": "#A1BDFF",
      "terminal.ansiMagenta": "#D66E86",
      "terminal.ansiCyan": "#A1BDFF",
      "terminal.ansiWhite": "#DFDFDF",
      "terminal.ansiBrightBlack": "#666666",
      "terminal.ansiBrightRed": "#D66E86",
      "terminal.ansiBrightGreen": "#A1BDFF",
      "terminal.ansiBrightYellow": "#997CD5",
      "terminal.ansiBrightBlue": "#A1BDFF",
      "terminal.ansiBrightMagenta": "#D66E86",
      "terminal.ansiBrightCyan": "#A1BDFF",
      "terminal.ansiBrightWhite": "#DFDFDF"
    }
  }
```

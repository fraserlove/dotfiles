Apply MacOS settings:
```
./.macos
```

Move dot files into home folder:
```
mv -t $HOME .alacritty.yml .config .gitconfig wallpaper.png
```

Install  Xcode Command Line Tools (i.e. clang, gcc, git, 
python3, pip, ...):

```
xcode-select --install
```

Install Homebrew and Oh-My-Fish:
```
./brew_install.sh
```

Install selected packages with Homebrew:
```
brew bundle
```

Install selected Python packages with pip:
```
python3 -m pip install numpy matplotlib flask notebook
```

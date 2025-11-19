# Steps to bootstrap a new Mac

- Create symlinks in the Home directory to the real files in the repo.

  ```zsh
  # There are better and less manual ways to do this;
  # investigate install scripts and bootstrapping tools.

  ln -s ~/Developer/dotfiles/.zshrc ~/.zshrc
  ln -s ~/Developer/dotfiles/.zprofile ~/.zprofile
  ln -s ~/Developer/dotfiles/.bashrc ~/.bashrc
  ln -s ~/Developer/dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/Developer/dotfiles/.tmux.conf ~/.tmux.conf
  ln -s ~/Developer/dotfiles/.spaceshiprc.zsh ~/.spaceshiprc.zsh
  ln -s ~/Developer/dotfiles/config/tmux/startup.sh ~/.config/tmux/startup.sh
  ```

- Install Homebrew, followed by the software listed in the Brewfile.

- Review `docs/software.md` for the full inventory (brew bundle targets, manual apps, fonts, and verification checklist).

### Other Software to install

- Google Chrome browser
  - wordtune
  - Adblock for youtube
  - editthiscookie
  - google translate
  - grepper
  - json viewer
  - page ruler
  - react dev tools
  - ublock origin
- Alfred
  - Settings:
- Docker
- Kap (capture screen videos)
- Lightshot (screenshots) https://app.prntscr.com/en/privacy.html
- Maccy (clipboard) https://maccy.app/
- Notion
- postman
- spectacle (rectangle) (moving windows) https://github.com/eczarny/spectacle
  - setting: set as rectangle
- Slack
- Sublime text (from brew)
- VScode (from brew)
- zoom
- inkscape
- github desktop
- excalidraw

### Mac setup

- [Cursor Speed](https://www.maketecheasier.com/adjust-cursor-speed-in-mac/)
- [show app switcher across all displays](https://gist.github.com/jthodge/c4ba15a78fb29671dfa072fe279355f0)

```sh
defaults write com.apple.dock appswitcher-all-displays -bool true
killall Dock
```

- [macOS System Preferences](https://amiryonatan.medium.com/increase-development-productivity-in-macos-c936fce43c17)
- [macOS System Preferences (Video)](https://www.youtube.com/watch?v=2_ZbslLnshw)

### Terminal

Software :

- Iterm2
- Warp
- macOS Terminal

OhMyZsh
[Spaceship prompt](https://github.com/spaceship-prompt/spaceship-prompt) (consider replacing spaceship with starship)

MesloLGS NF font

### Reference

- https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds

- https://www.youtube.com/watch?v=r_MpUP6aKiQ

- https://www.youtube.com/watch?v=tMNOpaQrfAE&t=4746s

- https://github.com/wesbos/dotfiles

## Add scripts to path

1. Move script file to local `mv <script file path> .local/bin/<file name>` (no need .sh suffix in the file name)
2. Give it executable permission `chmod u+x <file name>`

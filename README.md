# Steps to bootstrap a new Mac

- Create symlinks in the Home directory to the real files in the repo.

  ```zsh
  # There are better and less manual ways to do this;
  # investigate install scripts and bootstrapping tools.

  ln -s ~/.dotfiles/.zshrc ~/.zshrc
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
  ```

- Install Homebrew, followed by the software listed in the Brewfile.

## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command) to record and restore System Preferences and other macOS configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like [Dotbot](https://github.com/anishathalye/dotbot).
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a [bootable USB installer for macOS](https://support.apple.com/en-us/HT201372).
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
- Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io/).

### Reference

- https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds

- https://www.youtube.com/watch?v=r_MpUP6aKiQ

- https://www.youtube.com/watch?v=tMNOpaQrfAE&t=4746s

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
- Docker
- Kap (capture screen videos)
- Lightshot (screenshots) https://app.prntscr.com/en/privacy.html
- Maccy (clipboard)
- Notion
- postman
- spectacle (rectangle) (moving windows) https://github.com/eczarny/spectacle
- Slack
- Sublime text
- VScode
- zoom
- inkscape
- github desktop

### Mac setup

- [Cursor Speed](https://www.maketecheasier.com/adjust-cursor-speed-in-mac/)
- [show app switcher across all displays](https://gist.github.com/jthodge/c4ba15a78fb29671dfa072fe279355f0)
- [macOS System Preferences](https://amiryonatan.medium.com/increase-development-productivity-in-macos-c936fce43c17)
- [macOS System Preferences (Video)](https://www.youtube.com/watch?v=2_ZbslLnshw)

### Terminal

Software :

- Iterm2
- Warp
- macOS Terminal

OhMyZsh
[Spaceship prompt](https://github.com/spaceship-prompt/spaceship-prompt)

MesloLGS NF font

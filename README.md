# Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.

   ```zsh
   xcode-select --install
   ```

2. Clone repo into new hidden directory.

   ```zsh
   # Use SSH (if set up)...
   git clone git@github.com:eieioxyz/Beyond-Dotfiles-in-100-Seconds.git ~/.dotfiles

   # ...or use HTTPS and switch remotes later.
   git clone https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds.git ~/.dotfiles
   ```

3. Create symlinks in the Home directory to the real files in the repo.

   ```zsh
   # There are better and less manual ways to do this;
   # investigate install scripts and bootstrapping tools.

   ln -s ~/.dotfiles/.zshrc ~/.zshrc
   ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
   ```

4. Install Homebrew, followed by the software listed in the Brewfile.

   ```zsh
   # These could also be in an install script.

   # Install Homebrew
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   # Then pass in the Brewfile location...
   brew bundle --file ~/.dotfiles/Brewfile

   # ...or move to the directory first.
   cd ~/.dotfiles && brew bundle
   ```

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
- Hyper terminal
- Wrap terminal
- Kap (capture screen videos)
- Lightshot (screenshots) https://app.prntscr.com/en/privacy.html
- Maccy (clipboard)
- Notion
- postman
- spectacle (moving windows) https://github.com/eczarny/spectacle
- Slack
- Sublime text
- VScode
- zoom
- inkscape
- z (for terminal)
- github desktop

### Mac setup

- [Cursor Speed](https://www.maketecheasier.com/adjust-cursor-speed-in-mac/)
- [show app switcher across all displays](https://gist.github.com/jthodge/c4ba15a78fb29671dfa072fe279355f0)
- [macOS System Preferences](https://amiryonatan.medium.com/increase-development-productivity-in-macos-c936fce43c17)
- [macOS System Preferences (Video)](https://www.youtube.com/watch?v=tMNOpaQrfAE)

## Brew list

### Formulae

- bdw-gc
- heroku-node
- libssh2
- nghttp2
- protobuf
  brotli
- icu4c
- libtasn1
- node
- readline
  c-ares
- jansson
- libtool
- node@14
- rtmpdump
  ca-certificates
- jemalloc
- libunistring
- node@16
- six
  cloudflared
- jq
- libuv
- nvm
- tailscale
  curl
- krb5
- lz4
- oniguruma
- tree
  emacs
- libcbor
- m4
- openldap
- unbound
  gettext
- libev
- macos-term-size
- openssl@1.1
- xz
  gh
- libevent
- mongodb-community
- p11-kit
- yarn
  git
- libffi
- mongodb-database-tools
- pcre
- zlib
  gmp
- libfido2
- mongosh
- pcre2
- zsh
  gnutls
- libidn2
- mysql
- pkg-config
- zsh-syntax-highlighting
  guile
- libmetalink
- ncurses
- postgresql
- zstd
  heroku
- libnghttp2
- nettle
- postgresql@14

### Casks

- font-fira-code

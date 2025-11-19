# Software Inventory

This file captures the current machine's required software plus how each item was installed. Treat it as the source of truth when bootstrapping a new Mac.

## Homebrew Bundle

Use the `Brewfile` in the repo root:

```sh
brew bundle --file=~/Developer/dotfiles/Brewfile
```

| Package | Type | Install | Purpose |
| --- | --- | --- | --- |
| asdf | formula | Homebrew | Version manager for multiple runtimes |
| fish | formula | Homebrew | Alternate shell occasionally used |
| gawk | formula | Homebrew | GNU awk for scripting |
| gh | formula | Homebrew | GitHub CLI |
| git | formula | Homebrew | Primary VCS |
| glab | formula | Homebrew | GitLab CLI |
| gnupg | formula | Homebrew | GPG tooling |
| lsd | formula | Homebrew | Modern `ls` used via alias |
| node | formula | Homebrew | Node.js runtime |
| tree | formula | Homebrew | Directory tree viewer used by `t` function |
| wget | formula | Homebrew | CLI downloader |
| zsh-syntax-highlighting | formula | Homebrew | Zsh syntax highlighting plugin |
| ariga/tap/atlas | formula | Homebrew | Database schema toolkit |
| fig | cask | Homebrew | Fig CLI/terminal enhancements |
| font-fira-code | cask | Homebrew | Dev font |
| iterm2 | cask | Homebrew | Main terminal emulator |

## Additional GUI + Utilities

These items aren't captured by `brew bundle` and must be installed manually as documented below (mainly App Store or vendor downloads).

| App | Install Method | Notes |
| --- | --- | --- |
| Google Chrome | Direct download | Install listed extensions: Wordtune, AdBlock for YouTube, EditThisCookie, Google Translate, Grepper, JSON Viewer, Page Ruler, React DevTools, uBlock Origin |
| Alfred | Direct download | Import settings from synced prefs if available |
| Docker Desktop | Direct download | Required for container workflows |
| Kap | Direct download | Screen capture tool |
| Lightshot | Direct download | Screenshot utility |
| Maccy | Direct download | Clipboard manager |
| Notion | Direct download/App Store | Notes + docs |
| Postman | Direct download | API client |
| Spectacle / Rectangle | Direct download | Window manager (set Rectangle behavior) |
| Slack | App Store/Direct | Workspace chat |
| Sublime Text | Direct download/Homebrew cask | Secondary editor |
| Visual Studio Code | Homebrew cask/Direct download | Editor; import settings sync |
| Zoom | Direct download | Meetings |
| Inkscape | Direct download/Homebrew cask | Vector editing |
| GitHub Desktop | Direct download | GUI client |
| Excalidraw | Web app | Diagramming |
| Warp | Direct download | Alternative terminal; copy custom themes from `warp/` |
| macOS Terminal | Built-in | Profiles exported in `macterminal/` |

## Terminal + Shell Tooling

- **Oh My Zsh**: Installed via curl script; configs stored in `.zshrc`, `.zprofile`, `.spaceshiprc.zsh`.
- **Spaceship Prompt**: Installed via Homebrew and sourced in `.zshrc`.
- **tmux**: Config (`.tmux.conf`) plus session bootstrap script in `config/tmux/startup.sh`.
- **Login Script**: `com.user.loginscript.plist` maps modifier keys via `launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist`.
- **Custom Scripts**: `branch-name-script.sh`, `gitfixup.sh`. Move to `~/.local/bin` or symlink from repo.

## Fonts

`fonts/` contains MesloLGS Nerd Font variants. Install via Font Book or `open fonts/*.ttf`.

## Verification Checklist

1. Symlink each dotfile in `~` to the repo versions (see `README.md`).
2. Run `brew bundle --file=Brewfile` for formulas/casks.
3. Install the manual apps listed above.
4. Copy Warp themes (`warp/themes/*`) into `~/Library/Application Support/dev.warp.Warp*/Themes`.
5. Import iTerm2 profile (`iterm/com.googlecode.iterm2.plist`) and macOS Terminal profile (`macterminal/Basic.terminal`).

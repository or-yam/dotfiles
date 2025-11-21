# Setup Guide

## 1. Initial Setup

1. Create workspace: `mkdir -p ~/Developer/gitlab`
2. Configure Mac settings: Follow `macsetup.md`

## 2. Installations

1. Shell tools: Follow `shell_installs.md`
2. Homebrew bundle: `brew bundle install`
3. GUI Apps: Follow `apps.md`

## 3. Configuration (Automated)

It uses symlinks so changes in this repo are instantly reflected on your system.

> [!WARNING]
> The `install.sh` script is AI generated and not tested. Use at your own risk. Review the code before running it.

1. Make the script executable:

   ```bash
   chmod +x install.sh
   ```

2. Run the install script:

   ```bash
   ./install.sh
   ```

## 4. Manual Configuration (Reference)

> Only use this if you can't use the script. Prefer symlinking (`ln -sf source target`) over copying.

### Shell & Git

- Copy `.zshrc` -> `~/.zshrc`
- Copy `.spaceshiprc.zsh` -> `~/.spaceshiprc.zsh`
- Copy `.gitconfig` -> `~/.gitconfig`
- Copy `gitlab-config/.gitconfig` -> `~/Developer/gitlab/.gitconfig`

### Tmux

- Copy `tmux/.tmux.conf` -> `~/.tmux.conf`
- Copy `tmux/startup.sh` -> `~/.config/tmux/startup.sh` (Ensure directory exists: `mkdir -p ~/.config/tmux`)

### Terminal

- **Ghostty:** Copy `terminal/ghostty/config` -> `~/.config/ghostty/config`
- **Karabiner:** Copy `karabiner/karabiner.json` -> `~/.config/karabiner/karabiner.json`

### Scripts

1. Copy script files to `~/.local/bin/` (remove `.sh` extension if desired)
   - Example: `cp gitfixup.sh ~/.local/bin/gitfixup`
2. Make them executable: `chmod +x ~/.local/bin/<script_name>`

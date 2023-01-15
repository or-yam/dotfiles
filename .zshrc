# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting alias-tips npm node macos yarn)

source $ZSH/oh-my-zsh.sh


. /opt/homebrew/opt/asdf/libexec/asdf.sh
source /Users/oryam/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

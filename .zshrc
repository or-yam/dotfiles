# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git z zsh-autosuggestions  npm node macos yarn asdf)

source /opt/homebrew/opt/spaceship/spaceship.zsh
. /opt/homebrew/opt/asdf/libexec/asdf.sh

DISABLE_LS_COLORS="true"
alias ls='lsd'
alias cat='bat'

function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# create and cd into a directory
function mkd(){
  mkdir -p "$@" && cd "$@"
}

# clone and cd into a repository
function clonecd(){
  git clone "$@" && cd "$(basename "$_" .git)"
}


# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
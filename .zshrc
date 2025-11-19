export ZSH="/Users/oryam/.oh-my-zsh"

plugins=(git z zsh-autosuggestions npm node macos yarn)

source $ZSH/oh-my-zsh.sh
source /opt/homebrew/opt/spaceship/spaceship.zsh

# Auto-start tmux with custom layout only if no sessions are running
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    tmux has-session &> /dev/null
    if [ $? != 0 ]; then
        ~/.config/tmux/startup.sh
    fi
fi


DISABLE_LS_COLORS="true"
alias ls='lsd'
alias cat='bat -p'
alias python='python3'
# Get the IP address
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}' | head -n1"

# Open with vscode insider
# alias code="open $1 -a \"Visual Studio Code - Insiders"\"

# Open Cursor
alias cursor="open $1 -a \"Cursor"\"

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

# bun completions
[ -s "/Users/oryam/.bun/_bun" ] && source "/Users/oryam/.bun/_bun"


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# pnpm
export PNPM_HOME="/Users/oryam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"

eval "$(gh copilot alias -- zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(mise activate zsh)"


# opencode
export PATH=/Users/oryam/.opencode/bin:$PATH

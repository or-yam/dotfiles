# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git zsh-autosuggestions npm node macos yarn)
source $ZSH/oh-my-zsh.sh

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
alias myip="ipconfig getifaddr en0"

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


# pnpm
export PNPM_HOME="/Users/oryam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH="$HOME/.local/bin:$PATH"


eval "$(zoxide init --cmd cd zsh)"





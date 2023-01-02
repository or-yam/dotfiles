# https://spaceship-prompt.sh/config/prompt/
SPACESHIP_CHAR_SYMBOL="${SPACESHIP_CHAR_SYMBOL="🌊 ➜ "}"
SPACESHIP_PROMPT_ASYNC=false
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_SUFFIX=" "
SPACESHIP_NODE_PREFIX=""
SPACESHIP_NODE_SUFFIX=" "
SPACESHIP_DOCKER_PREFIX=""
SPACESHIP_DOCKER_SUFFIX=" "


SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  python
  docker        # Docker section
  line_sep      # Line break
  char         
)
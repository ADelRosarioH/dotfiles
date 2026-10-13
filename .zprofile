eval "$(/opt/homebrew/bin/brew shellenv)"

# Docker Desktop CLI helpers
[ -d "$HOME/.docker/bin" ] && export PATH="$PATH:$HOME/.docker/bin"

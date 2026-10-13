# ~/.zshrc — plugins in ~/.zsh_plugins.txt (antidote), prompt in ~/.config/starship.toml

# ── History ───────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history hist_ignore_all_dups hist_ignore_space hist_reduce_blanks extended_history
setopt auto_cd interactive_comments

export EDITOR="code --wait"
export LANG=en_US.UTF-8
export BAT_THEME="OneHalfDark"

# ── nvm: host-only (Expo/iOS), lazy so shells start fast ──
export NVM_DIR="$HOME/.nvm"
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd npx pnpm corepack expo eas

# ── Plugins ───────────────────────────────────────
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# ── Tools ─────────────────────────────────────────
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"        # z <dir>, zi = interactive
source <(fzf --zsh)              # Ctrl-R history, Ctrl-T files, Alt-C dirs
eval "$(starship init zsh)"

# ── Files ─────────────────────────────────────────
alias ls='eza --group-directories-first --icons=auto'
alias ll='eza -l --git --group-directories-first --icons=auto'
alias la='eza -la --git --group-directories-first --icons=auto'
alias lt='eza --tree --level=2 --git-ignore --icons=auto'
alias cat='bat --paging=never'
alias del='trash'                # to the Trash, not gone
alias p='cd ~/Projects'
alias dl='cd ~/Downloads'

# ── Git / GitHub ──────────────────────────────────
alias g='git'
alias prs='gh pr list'
alias prv='gh pr view --web'

# ── Docker / dev containers ───────────────────────
alias d='docker'
alias dc='docker compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dprune='docker system prune -f'

# ── macOS ─────────────────────────────────────────
alias update='brew update && brew upgrade && brew cleanup && rustup update && antidote update'
alias brewcheck='brew bundle cleanup --file ~/Projects/dotfiles/Brewfile'   # lists strays, removes nothing
alias flush='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias localip='ipconfig getifaddr en0'
alias myip='curl -s https://ifconfig.me; echo'

# ── Functions ─────────────────────────────────────
mkd()  { mkdir -p "$@" && cd "$_"; }
port() { lsof -nP -iTCP:"$1" -sTCP:LISTEN; }                 # who's on port N
serve(){ python3 -m http.server "${1:-8000}"; }

# Jump to any repo under ~/Projects
proj() {
  local d
  d=$(find ~/Projects -mindepth 2 -maxdepth 4 -type d -name .git -prune 2>/dev/null | sed 's|/.git$||' | fzf --height 40%) && cd "$d"
}

# Drop the dev container starter into the current project
devc() {
  [ -d .devcontainer ] && { echo ".devcontainer already exists"; return 1; }
  cp -R ~/Projects/dotfiles/devcontainer/.devcontainer . && echo "Added .devcontainer → VS Code: Reopen in Container"
}

[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.zsh

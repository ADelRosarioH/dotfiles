[ -n "$PS1" ] && source ~/.bash_profile;

. "$HOME/.local/bin/env"

alias claude-mem='/Users/anthony/.bun/bin/bun "/Users/anthony/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
. "$HOME/.cargo/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/anthony/.lmstudio/bin"
# End of LM Studio CLI section


#!/usr/bin/env bash
# Copies the dotfiles into ~. Run: ./bootstrap.sh [-f]
cd "$(dirname "${BASH_SOURCE}")"
git pull origin main

doIt() {
  rsync -avh --no-perms \
    --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "dock.sh" \
    --exclude ".macos" --exclude "Brewfile" --exclude "devcontainer/" \
    --exclude "README.md" --exclude "LICENSE-MIT.txt" \
    . ~
  echo "Done. Open a new shell (exec zsh)."
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite files in your home directory. Continue? (y/n) " -n 1; echo
  [[ $REPLY =~ ^[Yy]$ ]] && doIt
fi
unset doIt

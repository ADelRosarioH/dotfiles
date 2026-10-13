# dotfiles

zsh + antidote + starship, a lean Brewfile, and a dev container starter. Dev runtimes (.NET, Node, DBs) live in containers; the Mac keeps only nvm/watchman/CocoaPods for Expo, plus Rust via rustup.

```bash
git clone https://github.com/ADelRosarioH/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
brew bundle --file=Brewfile
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
./bootstrap.sh -f && exec zsh
```

| File | What |
|---|---|
| `.zshrc` | History, plugins, tools (zoxide, fzf, direnv, starship), aliases, `proj`, `devc`, `port` |
| `.zsh_plugins.txt` | antidote plugin list |
| `.config/starship.toml` | Prompt (Catppuccin colors) |
| `.macos` | Raycast on ⌘Space, dev Dock, Finder/animation/screenshot tweaks — run once: `./.macos` |
| `devcontainer/` | Starter: `devc` in any project |
| `Brewfile` | `brewcheck` lists anything installed that isn't in it |

Set iTerm2's font to **JetBrainsMono Nerd Font** for the prompt icons.

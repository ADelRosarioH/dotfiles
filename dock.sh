#!/usr/bin/env bash
# Rebuild the Dock: dev + work apps only, Downloads stack. Run: ./dock.sh
# "---" in APPS = small separator between groups
APPS=(
  "/System/Applications/Utilities/Terminal.app"
  "/Applications/Visual Studio Code.app"
  "/Applications/Claude.app"
  "/Applications/Docker.app"
  "/Applications/DBeaver.app"
  "/Applications/Xcode.app"
  "---"
  "/Applications/Google Chrome.app"
  "/Applications/Firefox.app"
  "---"
  "/Applications/Citrix Workspace.app"
)
tile() { printf '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>%s</string><key>_CFURLStringType</key><integer>0</integer></dict></dict><key>tile-type</key><string>file-tile</string></dict>' "$1"; }
args=()
for a in "${APPS[@]}"; do
  if [ "$a" = "---" ]; then args+=('<dict><key>tile-data</key><dict/><key>tile-type</key><string>small-spacer-tile</string></dict>'); continue; fi
  if [ -d "$a" ]; then args+=("$(tile "$a")"); echo "  + $(basename "$a" .app)"; else echo "  - skip $(basename "$a" .app) (not installed)"; fi
done
defaults write com.apple.dock persistent-apps -array "${args[@]}"
defaults write com.apple.dock persistent-others -array "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file://$HOME/Downloads/</string><key>_CFURLStringType</key><integer>15</integer></dict><key>arrangement</key><integer>2</integer><key>displayas</key><integer>1</integer><key>showas</key><integer>2</integer></dict><key>tile-type</key><string>directory-tile</string></dict>"
killall Dock

#!/bin/zsh

CURRENT_MODE=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [[ "$CURRENT_MODE" == "Dark" ]]; then
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
  echo "Switched to Light Mode."
else
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
  echo "Switched to Dark Mode."
fi


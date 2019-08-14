#!/bin/bash

# <bitbar.title>yabai/skhd helper</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Ben Allan</bitbar.author>
# <bitbar.author.github>benallan</bitbar.author.github>
# <bitbar.desc>Display yabai space id and mode.</bitbar.desc>
# <bitbar.dependencies>bash,brew,yabai,skhd,jq</bitbar.dependencies>

# yabai is a tiling window manager for MacOS (successor to chunkwm)
# https://github.com/koekeishiya/yabai

# skhd is a hotkey daemon commonly used with yabai
# https://github.com/koekeishiya/skhd/

export PATH=/usr/local/bin:$PATH

if [[ "$1" == "stop" ]]; then
  brew services stop yabai
  brew services stop skhd
fi

if [[ "$1" == "restart" ]]; then
  brew services restart yabai
  brew services restart skhd
fi

echo "$(yabai -m query --spaces --space | jq .index):$(yabai -m query --spaces --space | jq -r .type) | length=5"
echo "---"
echo "Restart yabai & skhd | bash='$0' param1=restart terminal=false"
echo "Stop yabai & skhd | bash='$0' param1=stop terminal=false"

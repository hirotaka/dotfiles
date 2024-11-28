#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Yazi
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
#
tell application "WezTerm"
	#tell application "System Events"
	#	key code 45 using {command down}
	#end tell
  do shell script "wezterm cli spawn --new-window -- yazi"
end tell

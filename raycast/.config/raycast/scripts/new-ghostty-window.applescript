#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New Ghostty Window
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👻 
#
tell application "Ghostty"
  activate
  tell application "System Events" to keystroke "n" using command down
	#	key code 45 using {command down}
end tell

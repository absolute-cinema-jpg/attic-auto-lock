#!/bin/zsh

# The volume name is machine-specific and lives outside the repo. To set up:
#   mkdir -p ~/.config/attic-auto-lock
#   cp config.example ~/.config/attic-auto-lock/config
# then edit the copy.
configFile="$HOME/.config/attic-auto-lock/config"
[[ -r "$configFile" ]] && source "$configFile"

if [[ ! -d "$atticVolume" ]]; then
  echo "attic-auto-lock.sh: set atticVolume to a mounted volume in $configFile (see config.example)" >&2
  osascript -e 'display notification "Attic not locked: check the volume in your config" with title "Attic Auto-Lock"'
  exit 1
fi

attic_location="$atticVolume/Unity Attic"
archive_location="$atticVolume/Unity Attic_Archive"

mv $attic_location $archive_location
cd $archive_location
zip -r "$archive_location/$(date +%y%m%d)_Unity Attic.zip" "Unity Attic"
rm -r "$archive_location/Unity Attic"

osascript -e 'display notification "Attic locked" with title "Attic Auto-Lock" sound name "Glass"'

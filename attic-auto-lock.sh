#!/bin/zsh

attic_location="/Volumes/IS_Nexis/Unity Attic"
archive_location="/Volumes/IS_Nexis/Unity Attic_Archive"

mv $attic_location $archive_location
cd $archive_location
zip -r "$archive_location/$(date +%y%m%d)_Unity Attic.zip" "Unity Attic"
rm -r "$archive_location/Unity Attic"

osascript -e 'display notification "Attic locked" with title "Attic Auto-Lock" sound name "Glass"'

#!/bin/bash

# load the list of items to track
source track_list.source

# load the configs
source settings.conf

# get home folder
home_folder="$HOME"

# loop on items to sync
while read relpath item ; do
	echo "Restoring $item"
	mkdir -p "$home_folder/$relpath"
	cp "$SAVE_FOLDER/$relpath/$item" "$home_folder/$relpath/$item"
	if [ $? -ne 0 ];then
		echo "Restore of $item failed";
		exit 1;
	fi
done < <(echo "$tracked_items")

echo ""
echo "Restore completed"
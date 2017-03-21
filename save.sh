#!/bin/bash

# load the list of items to track
source track_list.source

# load the configs
source settings.conf

# making save folder if doesn't already exists
mkdir -p "$SAVE_FOLDER"

# get home folder
home_folder="$HOME"

# loop on items to sync
while read relpath item ; do
	echo "Saving $item"
	mkdir -p "$SAVE_FOLDER/$relpath"
	cp "$home_folder/$relpath/$item" "$SAVE_FOLDER/$relpath/$item"
	if [ $? -ne 0 ];then
		echo "Save of $item failed";
		exit 1;
	fi
done < <(echo "$tracked_items")

echo ""
echo "Save completed"



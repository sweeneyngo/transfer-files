#!/bin/bash

# add target directory for monitoring
TARGET=

# omit -r tag if you don't want recursive checking 
# inotifywait -m -e create -e moved_to --format "%f" $TARGET \
inotifywait -m -r -e create -e moved_to --format "%w%f" $TARGET \
	| while read FILENAME
		do 
			echo Detected $FILENAME, notifying user.
      
      # for dunst-stacking
			# notify-send --hint=string:x-dunst-stack-tag:test "A new file was dropped in $TARGET (pscp):" "$SUB"
      notify-send "A new file was dropped in $TARGET (pscp):" "$FILENAME"
		done


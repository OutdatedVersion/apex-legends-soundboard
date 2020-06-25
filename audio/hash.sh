#!/bin/bash

# Taunts
mkdir public
for fileName in legend/*/taunts/*.mp3; do
    [ -e "$fileName" ] || continue

    hash=$(sha1sum "$fileName" | awk '{ print $1 }')
    mv "$fileName" ./public/$hash

    echo "moved $fileName to ./public/$hash"
done
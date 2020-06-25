#!/bin/bash

# Taunts
mkdir -p public/taunt
for fileName in legend/*/taunts/*.mp3; do
    [ -e "$fileName" ] || continue

    hash=$(sha1sum "$fileName" | awk '{ print $1 }')
    mv "$fileName" ./public/taunt/$hash

    echo "moved $fileName to ./public/taunt/$hash"
done
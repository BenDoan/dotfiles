#!/bin/bash

for f in *; do
  newname=$(echo "$f" | sed 's/ /-/g' | sed "s/'//g" | sed 's/"//g' | sed 's/!//g')
  if [[ "$newname" != "$f" ]]; then
    mv -v "$f" "$newname"
  fi
done

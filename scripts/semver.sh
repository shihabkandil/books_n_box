#! /bin/bash

RE='([0-9]+)\.([0-9]+)\.([0-9]+)\+?([0-9]+)?'

lastVersion="$1"

if [ -z "$2" ]
then
  nextVersion=$lastVersion
else
  nextVersion="$2"
fi


NEXT_VERSION_MAJOR=`echo $nextVersion | sed -E "s/$RE/\1/"`
NEXT_VERSION_MINOR=`echo $nextVersion | sed -E "s/$RE/\2/"`
LAST_PATCH_NUMBER=`echo $nextVersion | sed -E "s/$RE/\3/"`

((LAST_PATCH_NUMBER++))
echo "$NEXT_VERSION_MAJOR.$NEXT_VERSION_MINOR.$LAST_PATCH_NUMBER"

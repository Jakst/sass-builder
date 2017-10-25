#!/bin/bash

# Add SETUID & SETGUID to binaries to make them run with the same user as
# your processed files. In case you mount a folder from your host computer to
# autocompile `.css` files, this is useful because otherwise all `.css` files
# would be owned by `root`.
bins=$(which compass sass sass-convert scss)
gid=$(stat -c "%g" ${SASS_PATH})
uid=$(stat -c "%u" ${SASS_PATH})

groupadd --gid $gid foo
useradd --gid $gid --uid $uid foo

# Run the user's command
su $(id --user --name $uid) -c "$*"

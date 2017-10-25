#!/bin/bash

# This script must be named /some/path/watch-$engine
engine="$(which $(basename "$0" | sed -e s/watch-//))"

/usr/local/sbin/entrypoint.sh $engine\
	--cache-location /var/cache/sass\
	--compass\
	--require bootstrap-sass\
	--watch ${SASS_PATH}:${SASS_PATH}\
	$@

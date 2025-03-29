#!/bin/bash



catfile_path="$HOME/.local/state/nvim/mycache/"
if [ ! -d "$catfile_path" ]; then
	mkdir "$catfile_path" > /dev/null
fi
catfile_full="$catfile_path/pomxml_cache.txt"


find_command () {
rg --files --hidden \
	--glob '!**/Library/**' \
	--glob '!**/.local/**' \
	--glob '!**/.gradle/**' \
	--glob '!**/.Trash' \
	~ \
	2>/dev/null \
	| rg 'Jenkinsfile|pom.xml' \
	> "$catfile_full"
}

if [ ! -f "$catfile_full" ]; then
	find_command
fi

cat "$catfile_full"

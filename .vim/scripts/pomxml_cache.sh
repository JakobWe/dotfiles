

catfile_path="$HOME/.local/state/nvim/mycache/pomxml.txt"
#find_command=("find ~ 2>/dev/null -name pom.xml > $catfile_path")

find_command () {
	#find ~ 2>/dev/null -name pom.xml > "$catfile_path"

	find ~ 2>/dev/null -name .git -prune -not -path "*/.*/.*" > "$catfile_path"
}

if [ ! -f "$catfile_path" ]; then
 find_command
fi

searchresults=$(cat "$catfile_path")

find_command &
echo "$searchresults"

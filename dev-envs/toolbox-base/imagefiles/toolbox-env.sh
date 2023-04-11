# Loead env var from all .sh files in /toolbox/bin/env folder

if [ -d /toolbox/bin/env ]; then
	for rc in /toolbox/bin/env/*.sh; do
		if [ -f "$rc" ]; then
			echo "Loading env vars from $rc"
			source "$rc"
		fi
	done
fi

unset rc

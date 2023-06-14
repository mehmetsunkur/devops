# toolbox specific aliases and functions
if [ -d $SDK_HOME/bin/env ]; then
	for rc in $SDK_HOME/bin/env/*.sh; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolboz!" ; exit 1;
fi

export TOOLBOX_NAME=$(cat toolbox-name.txt)
podman rm ${TOOLBOX_NAME} -f && echo "kill-container complete"


if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolbox!" ; exit 1;
fi

TOOLBOX_NAME=$(cat toolbox-name.txt)
podman rm ${TOOLBOX_NAME} -f && echo "kill-container complete"


if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolbox!" ; exit 1;
fi

IMAGE_NAME=$(cat image-name.txt)
TOOLBOX_NAME=$(cat toolbox-name.txt)
toolbox create -i localhost/${IMAGE_NAME}:latest ${TOOLBOX_NAME};

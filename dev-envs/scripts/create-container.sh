if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolboz!" ; exit 1;
fi

export IMAGE_NAME=$(cat image-name.txt)
export TOOLBOX_NAME=$(cat toolbox-name.txt)
toolbox create -i localhost/${IMAGE_NAME}:latest ${TOOLBOX_NAME};

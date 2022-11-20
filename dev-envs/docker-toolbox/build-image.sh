export IMAGE_NAME=$(cat image-name.txt)
podman build . -t $IMAGE_NAME --build-arg=HOMEUSER="$(whoami)"

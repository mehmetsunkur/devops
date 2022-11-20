export IMAGE_NAME=$(cat image-name.txt)
export CONTAINER_NAME=$IMAGE_NAME
podman stop ${CONTAINER_NAME};
podman kill ${CONTAINER_NAME};
podman rm ${CONTAINER_NAME};
rm -f /home/$(whoami)/bin/dockerd;
rm -f /home/$(whoami)/.config/systemd/user/docker.service;

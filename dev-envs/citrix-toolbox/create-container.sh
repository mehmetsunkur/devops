export IMAGE_NAME=$(cat image-name.txt)
export CONTAINER_NAME=$IMAGE_NAME
toolbox create -c ${CONTAINER_NAME} -i localhost/${CONTAINER_NAME}:latest;

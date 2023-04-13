RED='\033[0;31m'
NC='\033[0m' # No Color

if [ -f "/run/.containerenv" ]; then
 echo -e "${RED}!!!!!${NC}"
 echo "don't run this inside a toolbox!" ; exit 1;
fi

IMAGE_NAME=$(cat image-name.txt)

if [ -z "$1" ];
then
  echo -e "${RED}!!!!!${NC}"
  echo "!! toolbox id not provided. Setting to one"
  TOOLBOX_ID=
  TOOLBOX_NAME="$IMAGE_NAME"
else
  TOOLBOX_ID="$1"
  TOOLBOX_NAME="$IMAGE_NAME-$1"
fi
rm -rf ./build/
rm ./toolbox-id.txt
rm ./toolbox-name.txt
mkdir build
echo "$TOOLBOX_ID" > ./toolbox-id.txt
echo "$TOOLBOX_NAME" > ./toolbox-name.txt

if [ -d "./imagefiles" ];  then
  cp ./imagefiles/* ./build/
fi

cat ../toolboxkit/Containerfile-Begin > ./build/Containerfile
cat ./Containerfile >> ./build/Containerfile
cat ../toolboxkit/Containerfile-End >> ./build/Containerfile

HOSTUSER="$(whoami)"
HOSTUSER_ID="$(id -u)"
TOOLBOX_HOME_ROOT_DIR_NAME=dev
TOOLBOX_HOME_DIR_NAME=toolbox
TOOLBOX_HOME=/var/home/${HOSTUSER}/${TOOLBOX_HOME_ROOT_DIR_NAME}/${TOOLBOX_HOME_DIR_NAME}/${TOOLBOX_NAME}

podman build  ./build/ -t $IMAGE_NAME --env=HOSTUSER="$HOSTUSER" --env=HOSTUSER_ID="$HOSTUSER_ID" --env=TOOLBOX_NAME="$TOOLBOX_NAME" --env=HOME="$TOOLBOX_HOME"

rm -rf ./build/


if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolboz!" ; exit 1;
fi

if [ ! -f "toolbox-id.txt" ]; then
    echo "toolbox-id.txt not found run sh build-image.sh first";
    exit 1;
fi

sh kill-container.sh && sh build-image.sh $(cat toolbox-id.txt) && sh create-container.sh && toolbox enter $(cat toolbox-name.txt)

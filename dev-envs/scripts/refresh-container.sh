if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolbox!" ; exit 1;
fi

sh kill-container.sh && sh create-container.sh && toolbox enter $(cat toolbox-name.txt)

if [ -f "/run/.containerenv" ]; then
 echo "don't run this inside a toolboz!" ; exit 1;
fi

rm build-image.sh
ln -s ../scripts/build-image.sh .
rm create-container.sh
ln -s ../scripts/create-container.sh .
rm kill-container.sh
ln -s ../scripts/kill-container.sh .
rm rebuild-run.sh
ln -s ../scripts/rebuild-run.sh .

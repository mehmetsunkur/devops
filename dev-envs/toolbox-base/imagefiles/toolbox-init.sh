## runs toolbox-boot.sh only firrt time the toolbox run

if [ ! -f "/toolbox/toolbox-boot.sh.done" ]; then
    echo "/toolbox/toolbox-boot.sh.done does not exists. Running /toolbox/toolbox-boot.sh.done"
    sh /toolbox/toolbox-boot.sh && touch /toolbox/toolbox-boot.sh.done
fi

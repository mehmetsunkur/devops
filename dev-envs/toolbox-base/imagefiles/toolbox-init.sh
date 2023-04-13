## runs toolbox-boot.sh only firrt time the toolbox run

if [ ! -f "/toolbox/bin/toolbox-boot.sh.done" ]; then
    echo "/toolbox/bin/toolbox-boot.sh.done does not exists. Running /toolbox/bin/toolbox-boot.sh.done"
    sh /toolbox/bin/toolbox-boot.sh && touch /toolbox/bin/toolbox-boot.sh.done
fi

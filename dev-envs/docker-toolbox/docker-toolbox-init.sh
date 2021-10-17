if [ ! -e "$HOME/.config/systemd/user/docker.service" ]; then
  dockerd-rootless-setuptool.sh install
fi
if [ ! -e "systemctl is-active --user --quiet docker.service" ]; then
  systemctl --user start docker.service
fi

export DOCKER_HOST=unix\:///run/user/1000/docker.sock

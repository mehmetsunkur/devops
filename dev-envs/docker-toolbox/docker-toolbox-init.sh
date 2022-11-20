if [ ! -e "$HOME/.config/systemd/user/docker.service" ]; then
  # run this to unistall previous installation: systemctl --user stop docker; rm -f /home/msunkur/bin/dockerd;
  curl -fsSL https://get.docker.com/rootless | sh
fi
if [ ! -e "systemctl is-active --user --quiet docker.service" ]; then
  systemctl --user start docker.service
fi

export DOCKER_HOST=unix\:///run/user/$(id -u)/docker.sock
export PATH=/home/$(whoami)/bin:$PATH

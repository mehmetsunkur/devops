# Install NVidia drivers by instructions from https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/
# Install VMWare Workstation latest version from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html

# Install flatpak repo and VS code
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install -y app/com.visualstudio.code/x86_64/stable;
flatpak install -y flathub com.jetbrains.IntelliJ-IDEA-Community;
flatpak install -y flathub com.jetbrains.PyCharm-Community;


# Add winehq repo for the latest version of wine
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo;

# Install Chrome, XRDP, wine
sudo dnf install -y xrdp xorgxrdp git winehq-stable https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;

# Install game platforms
flatpak install -y net.lutris.Lutris;
flatpak install -y flathub com.heroicgameslauncher.hgl;

# Docker
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo;
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin;
sudo systemctl enable docker;
sudo systemctl start docker;
sudo groupadd docker;
sudo usermod -aG docker $USER;
docker run hello-world;

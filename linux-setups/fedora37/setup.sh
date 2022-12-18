# Install NVidia drivers by instructions from https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/
# Install VMWare Workstation latest version from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html

# Install flatpak repo and VS code
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install -y app/com.visualstudio.code/x86_64/stable;


# Add winehq repo for the latest version of wine
sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/35/winehq.repo;

# Install Chrome, XRDP, wine
sudo dnf install -y xrdp xorgxrdp winehq-stable https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;

# Install game platforms
flatpak install -y net.lutris.Lutris;
flatpak install -y flathub com.heroicgameslauncher.hgl;

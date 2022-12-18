# Install NVidia drivers by instructions from https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/
# Install VMWare Workstation latest version from https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html

# Install flatpak repo and VS code
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install -y app/com.visualstudio.code/x86_64/stable;

# Install Chrome and XRDP
sudo dnf install -y xrdp xorgxrdp https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm;

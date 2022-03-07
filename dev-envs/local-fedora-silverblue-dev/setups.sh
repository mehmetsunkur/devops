flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install app/com.visualstudio.code/x86_64/stable;

# install tools at once
sudo rpm-ostree install net-tools xrdp xorgxrdp code keepassxc;

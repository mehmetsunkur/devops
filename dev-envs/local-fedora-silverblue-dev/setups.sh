flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install app/com.visualstudio.code/x86_64/stable;

# install tools at once
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo rpm-ostree install xrdp xorgxrdp google-chrome-stable_current_x86_64.rpm;


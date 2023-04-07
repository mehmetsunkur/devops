flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo;
flatpak install app/com.visualstudio.code/x86_64/stable;
flatpak install flathub com.google.Chrome;


# install tools at once
sudo rpm-ostree install virt-install libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm virt-manager virt-viewer libguestfs-tools virt-top tlp;


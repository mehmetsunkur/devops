
# disable firewall for remote rdp/ssh connections
sudo systemctl stop firewalld;
sudo systemctl disable firewalld;

#enable ssh server
sudo systemctl start sshd;
sudo systemctl enable sshd;

# setup rdp server
sudo cp xrdp.ini /etc/xrdp/xrdp.ini
sudo Xwrapper.config /etc/X11/Xwrapper.config
sudo systemctl stop xrdp-sesman;
sudo systemctl stop xrdp;
sudo systemctl start xrdp;
sudo systemctl start xrdp-sesman;

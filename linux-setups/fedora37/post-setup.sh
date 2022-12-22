#enable ssh server
sudo systemctl start sshd;
sudo systemctl enable sshd;


# XRDP
sudo systemctl enable xrdp;
sudo systemctl enable xrdp-sesman;
sudo systemctl start xrdp;
sudo systemctl start xrdp-sesman;

# XRDP
sudo vi /etc/xrdp/xrdp.ini;
# find replace crypt_level=high => crypt_level=none
# find and replace  port=3389 => port=tcp://172.16.58.1:3389  (to find vmware vmnet ipaddressrun 'ifconfig vmnet8;' )
# find and replace max_bpp=32 => max_bpp=16
# uncomment [Xorg] section lines
# comment [Xvnc] section lines
echo 'allowed_users=anybody' | sudo tee -a /etc/X11/Xwrapper.config;
# restart XRDP services
sudo systemctl stop xrdp-sesman;
sudo systemctl stop xrdp;
sudo systemctl start xrdp;
sudo systemctl start xrdp-sesman;

#samba
sudo dnf install -y samba;
sudo systemctl enable smb;
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-service=samba;
sudo firewall-cmd --add-service samba;
sudo firewall-cmd --reload;
sudo smbpasswd -a sambauser;
sudo setsebool -P samba_enable_home_dirs 1;




# incase multipe drives, change boot label to set it unique for nvme drive
wget https://github.com/s-n-ushakov/rename-efi-entry/blob/master/rename-efi-entry.bash && chmod +x rename-efi-entry.bash;
sudo ./rename-efi-entry.bash Fedora 'nvme1_Fedora' 001;



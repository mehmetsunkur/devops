# attaches a physcical disk to a VM
ls /dev/disk/by-id/nvme-SAM*
sudo virsh attach-disk win10 /dev/disk/by-id/nvme-SAMSUNG_MZVLB2T0HMLB-00000_S4C2NY0N202137 vdc --config --type disk

sudo virsh attach-disk win10 /dev/disk/by-id/nvme-SAMSUNG_MZVLB2T0HMLB-00000_S4C2NY0N202137-part4 vdc --config --type disk
sudo virsh attach-disk winc-no-bootefi /dev/disk/by-id/nvme-SAMSUNG_MZVLB2T0HMLB-00000_S4C2NY0N202137-part4 vdd --config --type sata --print-xml


# attaches a disk image file to a VM

virsh attach-disk win10 /var/mnt/data/virt-images/winc-virt-diskwinc-disk2vhd-0.qcow2 vdp --subdriver qcow2
virsh attach-disk win10 /var/mnt/data/virt-images/winc-virt-diskwinc-disk2vhd-1.qcow2 vdr --subdriver qcow2
virsh attach-disk win10 /var/mnt/data/virt-images/winc-virt-diskwinc-disk2vhd-1.qcow2 vdr --subdriver qcow2

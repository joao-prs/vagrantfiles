### install libvirt
  sudo dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
  sudo dnf distro-sync -y

  sudo -i
  # Installing kvm
  dnf module install virt
  dnf install virt-install virt-viewer libguestfs-tools

  systemctl enable libvirtd.service
  systemctl start libvirtd.service
  systemctl status libvirtd.service
  # Verify your kvm installation
  lsmod | grep -i kvm
  # Configure bridged networking
  virsh net-info default
  nmcli device
  nmcli connection show

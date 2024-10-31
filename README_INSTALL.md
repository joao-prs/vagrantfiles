### 🟦 Instalando o vagrant

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=arch,rhel,debian"/>
  </a>
</p>

O vagrant precisa utilizar um motor de virtualização para funcionar por virtualbox ou libvirt
```bash
#
sudo apt-get -y install virtualbox
sudo dnf -y install virtualbox
yay -S virtualbox

sudo apt install -y libvirt-daemon-system libvirt-clients bridge-utils
sudo apt install -y qemu-kvm
sudo usermod -aG libvirt $(whoami)

```

instalando `vagrant` em sistemas baseados em 
![Arch](https://img.shields.io/badge/-Debian-ffffff?style=plastic&logo=debian&logoColor=red)
```bash
# method 1
sudo apt -y upgrade
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt install vagrant
vagrant --version
```
```bash
# method 2
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -y install vagrant
```
```bash
# method 3
sudo apt install aptitude
sudo aptitude update
sudo aptitude -y install vagrant
```
instalando `vagrant` em sistemas baseados em 
![redhat](https://img.shields.io/badge/-RHEL-da1414?style=plastic&logo=redhat&logoColor=white)
```bash
# method 1
sudo dnf -y update 
sudo dnf -y install vagrant
```
```bash
# method 2
sudo yum update
sudo yum –y install epel-release
sudo wget https://releases.hashicorp.com/vagrant/2.2.2/vagrant_2.2.2_x86_64.rpm
sudo yum –y localinstall vagrant_2.2.2_x86_64.rpm
```

instalando `vagrant` em sistemas baseados em 
![Arch](https://img.shields.io/badge/-Arch-168eca?style=plastic&logo=arch-linux&logoColor=white)
```bash
# method 1
sudo pacman -S vagrant
```
```bash
# method 2
yay -S vagrant
```

Depois execute `vagrant plugin install vagrant-libvirt` para instalar o plugin
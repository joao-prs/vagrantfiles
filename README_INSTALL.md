### 🟦 Instalando o vagrant

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=arch,rhel,debian"/>
  </a>
</p>

instalando `vagrant` em sistemas baseados em 
![Arch](https://img.shields.io/badge/-Debian-ffffff?style=plastic&logo=debian&logoColor=red)
```bash
# method 1
sudo apt -y upgrade
wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
sudo apt install ./vagrant_2.2.19_x86_64.deb
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
<!--
![imagem](.asciiart/capa.jpg)
-->
<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=git,bash,ruby,jenkins" />
  </a>
</p>

### 🟦 Sobre o Vagrant
Fluxo de trabalho único para criar e gerenciar ambientes de máquinas virtuais. **Melhora o tempo de configuração do desenvolvimento**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. **Aumente a paridade de produção**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. Espelhe ambientes de produção fornecendo o mesmo sistema operacional, pacotes, usuários e configurações, ao mesmo tempo em que oferece aos usuários a flexibilidade de usar seu editor, IDE e navegador favoritos. para saber mais, visite https://www.vagrantup.com/

### 🟦 Este repositório
Uma piscina de arquivos vagrantfile para subir vms de diferentes tipos e configurações, para a construção desses ambientes foi utilizado o virt-manager, então os arquivos vagrantfiles chamam pelo plugin do libvirt no inicio de cada arquivo *Vagrantfile*. Entre na pasta desejada e digite `vagrant up`
Futuramente todas as pastas de pequenos labs vão ter páginas de readme com algum comentário.

### 🟦 Instalar o vagrant
instalando `vagrant` em sistemas baseados em debian

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

instalando `vagrant` em sistemas baseados em RHEL
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

instalando `vagrant` em sistemas baseados em Arch
```bash
# method 1
sudo pacman -S vagrant
```
```bash
# method 2
yay -S vagrant
```

e depois `vagrant plugin install vagrant-libvirt` para instalar o plugin

### 🟦 testados e atualizados

| description | status emoji |
| --- | --- |
| OK | 🟩|
| OK? | 🟨 |
| NOT OK | 🟥 |
| LOADING | ⬜ |

> Este repositório está sendo constantemente atualizado, futuramente cada projeto terá uma aplicação diferente dentro de sí, visando o aprendizado de sua instalação dentro do script de automação de diferentes ambientes.

| project | ok? | description |
| --- | --- | --- |
| Alma Linux | 🟩 | for redhat environments |
| CentOS | 🟩 | for redhat environments |
| docker_simple | 🟩 | docker with configured nginx |
| docker_swarm | 🟩 | docker with swarm tests |
| jenkins | 🟩 | Jenkins for tests |
| mariadb-cluster | 🟩 | Database cluster using Galera with 3 machines |
| Rocky Linux | 🟩 | Rocky with configured cockpit |
| ubuntu | 🟩 | ubuntu simple image |
| ubuntu-02 | 🟩 | future customizations |
| windows | 🟩 | for virtualbox |

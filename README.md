<!--
![imagem](.asciiart/capa.jpg)

<p align="center">
  <a href="https://skillicons.dev">
    <img src="https://skillicons.dev/icons?i=git,bash,ruby,jenkins,linux"/>
  </a>
</p>
-->


<!--
https://cdn.worldvectorlogo.com/logos/vagrant.svg
-->
<img style="float: right;" src="https://cdn.worldvectorlogo.com/logos/vagrant.svg" width=15%>

### 🟦 Sobre o Vagrant
Fluxo de trabalho único para criar e gerenciar ambientes de máquinas virtuais. **Melhora o tempo de configuração do desenvolvimento**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. **Aumente a paridade de produção**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. Espelhe ambientes de produção fornecendo o mesmo sistema operacional, pacotes, usuários e configurações, ao mesmo tempo em que oferece aos usuários a flexibilidade de usar seu editor, IDE e navegador favoritos. para saber mais, visite https://www.vagrantup.com/

### 🟦 Este repositório
Uma piscina de arquivos vagrantfile para subir vms de diferentes tipos e configurações, para a construção desses ambientes foi utilizado o **virt-manager**, então os arquivos vagrantfiles chamam pelo plugin do **libvirt** no inicio de cada arquivo *Vagrantfile*. Entre na pasta desejada e digite `vagrant up`
Futuramente todas as pastas de pequenos labs vão ter páginas de readme com algum comentário.


Aprenda a instalar o `vagrant` em seu ambiente clicando <a href="https://github.com/joao-prs/vagrantfiles/blob/main/README_INSTALL.md">aqui</a>.

Depois `vagrant plugin install vagrant-libvirt` para instalar o plugin

### 🟦 testados e atualizados

> Este repositório está sendo constantemente atualizado, futuramente cada projeto terá uma aplicação diferente dentro de sí, visando o aprendizado de sua instalação dentro do script de automação de diferentes ambientes.

<!--
| description | status emoji |
| --- | --- |
| OK | 🟩|
| OK? | 🟨 |
| NOT OK | 🟥 |
| LOADING | ⬜ |
-->


<!--
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
-->
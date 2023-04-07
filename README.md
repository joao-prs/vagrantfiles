![imagem](.asciiart/capa.jpg)
#### Vagrant
Fluxo de trabalho único para criar e gerenciar ambientes de máquinas virtuais. **Melhora o tempo de configuração do desenvolvimento**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. **Aumente a paridade de produção**, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. Espelhe ambientes de produção fornecendo o mesmo sistema operacional, pacotes, usuários e configurações, ao mesmo tempo em que oferece aos usuários a flexibilidade de usar seu editor, IDE e navegador favoritos. para saber mais, visite https://www.vagrantup.com/

## Este repositório
Uma piscina de arquivos vagrantfile para subir vms de diferentes tipos e configurações, para a construção desses ambientes foi utilizado o virt-manager, então os arquivos vagrantfiles chamam pelo plugin do libvirt no inicio de cada arquivo *Vagrantfile*. Entre na pasta desejada e digite `vagrant up`
Futuramente todas as pastas de pequenos labs vão ter páginas de readme com algum comentário.

#### Instalar o vagrant
instale o `vagrant` em seu sistema

e depois `vagrant plugin install vagrant-libvirt` para instalar o plugin

#### testados e atualizados

| description | status emoji |
| --- | --- |
| OK | 🟩|
| OK? | 🟨 |
| NOT OK | 🟥 |
| LOADING | ⬜ |


| project | ok? | description |
| --- | --- | --- |
| Alma Linux | 🟩 |  |
| CentOS | 🟩 |  |
| docker_simple | 🟩 | docker with configured nginx |
| docker_teste | 🟥 |  |
| jenkins | 🟩 | Jenkins for tests |
| kubernetes | 🟩 |  |
| lab_node3 | 🟥 |  |
| mariadb-cluster | 🟩 | Database cluster using Galera with 3 machines |
| monitoring | ⬜ |  |
| OpenSUSE | 🟩 |  |
| oracle-database | ⬜ |  |
| perola | 🟩 |  |
| Rocky Linux | 🟩 | Rocky with configured cockpit |
| ubuntu | 🟩 |  |
| windows | 🟩 for virtualbox |  |

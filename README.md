<!--
![imagem](.asciiart/capa.jpg)

<img style="float: right;" src="https://cdn.worldvectorlogo.com/logos/vagrant.svg" width=15%>

-->
### 🟦 Sobre o Vagrant

<p align="center">
  <a href="https://www.vagrantup.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/vagrantup/vagrantup-icon.svg" alt="vagrant" width="60" height="60"/> </a>
</p>

<table>
  <tr>
    <td width=40%>
      Fluxo de trabalho único para criar e gerenciar ambientes de máquinas virtuais. Melhora o tempo de configuração do desenvolvimento, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente.
    </td>
    <td>
      Aumente a paridade de produção, o arquivo de configuração declarativa descreve todos os requisitos e os constrói por meio de um fluxo de trabalho consistente. Espelhe ambientes de produção fornecendo o mesmo sistema operacional, pacotes, usuários e configurações, ao mesmo tempo em que oferece aos usuários a flexibilidade de usar seu editor, IDE e navegador favoritos. para saber mais, visite https://www.vagrantup.com/
    </td>
  </tr>
</table>

### 🟦 Este repositório
Uma piscina de arquivos vagrantfile para subir vms de diferentes tipos e configurações, para a construção desses ambientes foi utilizado o **virt-manager**, então os arquivos vagrantfiles chamam pelo plugin do **libvirt** no inicio de cada arquivo *Vagrantfile*. Entre na pasta desejada e digite `vagrant up`
Futuramente todas as pastas de pequenos labs vão ter páginas de readme com algum comentário.

Aprenda a instalar o `vagrant` em seu ambiente clicando <a href="https://github.com/joao-prs/vagrantfiles/blob/main/README_INSTALL.md">aqui</a>.

Depois `vagrant plugin install vagrant-libvirt` para instalar o plugin, se houver erros para instalar plugins, verifique se esta instalado `base-devel`.
Se você tiver problemas com incompatibilidade de dependências, a variavel de ambiente a seguir pode ser definida para ignorar versões de **gem**.
```bash
export VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1
```
OU siga os passos da resolução deste problema <a href="https://wiki.archlinux.org/title/Vagrant">aqui</a> na documentação do archlinux.

### 🟦 Sumário
- **OS**: Vagrantfiles de sistemas operacionais distintos para testar
- **Applications**: Vagrantfiles para testar algumas aplicações

> [!NOTE]
> Este repositório está sendo constantemente atualizado, futuramente cada projeto terá uma aplicação diferente dentro de sí, visando o aprendizado de sua instalação dentro do script de automação de diferentes ambientes. ☺️

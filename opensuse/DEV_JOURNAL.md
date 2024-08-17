# BACKLOG

### 0.0.2
- por alguma razão da qual eu não sei e tambem depois eu arrumo, não está subindo duas VMs ao mesmo tempo. Então se precisar subir duas VMs, você altera o `size` para 2 e muda o `(1..size)` para `(2..size)`, desta forma você consegue puxar a segunda vm. 
Se quiser puxar apenas a primeira, altere ambos para 1.
o comando `vagrant ssh` funciona e você se conectará na VM mais recente.

### 0.0.3
- Tem um bug que simplesmente ele fica atualizando o ip da interface todo tempo, então se tiver este erro, defina como ip estatico


execute `vim /etc/sysconfig/network/ifcfg-eth0` e escreva:
```conf
BOOTPROTO='static'
IPADDR='192.168.121.100/24'
NETMASK='255.255.255.0'
STARTMODE='auto'
GATEWAY='192.168.121.1'
```
> meu ip era 192.168.121.100

e execute:
```
systemctl restart wicked
```


### 0.0.4
- criei duas interfaces para resolver o problema
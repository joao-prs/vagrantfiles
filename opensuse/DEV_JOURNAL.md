# BACKLOG

### 0.0.2
    por alguma razão da qual eu não sei e tambem depois eu arrumo, não está subindo duas VMs ao mesmo tempo. Então se precisar subir duas VMs, você altera o `size` para 2 e muda o `(1..size)` para `(2..size)`, desta forma você consegue puxar a segunda vm. 

    Se quiser puxar apenas a primeira, altere ambos para 1.

    o comando `vagrant ssh` funciona e você se conectará na VM mais recente.
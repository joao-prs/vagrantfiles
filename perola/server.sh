#!/bin/bash

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+---------------------+
| bem vindo ao server |
+---------------------+
EOF



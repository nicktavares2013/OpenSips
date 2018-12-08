#!/bin/bash
echo 'opensips' > /etc/hostname
cat << EOF > /etc/hosts
127.0.0.1 localhost
10.0.0.10 opensip
10.0.0.21 pbx1
10.0.0.22 pbx2
10.0.0.23 pbx3
EOF
IFLAN=` ip -o -4 l | awk '{ print $ 2 }'  | sed 's/://g' | egrep -v lo| tail -1`
cat << EOF > /etc/network/interfaces.s/intnet-config
iface $IFLAN inet static
address 10.0.0.10/25
EOF


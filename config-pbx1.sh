#!/bin/bash
echo 'pbx1' > /etc/hostname
cat << EOF > /etc/hosts
127.0.0.1 localhost
10.0.0.10 opensip
10.0.0.21 pbx1
10.0.0.22 pbx2
10.0.0.23 pbx3
EOF
IFLAN=` ip -o -4 l | awk '{ print $ 2 }'  | sed 's/://g' | egrep -v lo`
cat << EOF > /etc/network/interfaces
auto $IFLAN lo
iface lo inet loopback
iface $IFLAN inet static
address 10.0.0.21/25
gateway 10.0.0.10
EOF


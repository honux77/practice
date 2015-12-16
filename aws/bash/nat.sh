#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects
/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 0.0.0.0/0 -j MASQUERADE
/sbin/iptables-save > /etc/sysconfig/iptables
mkdir -p /etc/sysctl.d/
cat <<EOF > /etc/sysctl.d/nat.conf
net.ipv4.ip_forward = 1
net.ipv4.conf.eth0.send_redirects = 0
EOF

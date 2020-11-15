#!/bin/bash
# chkconfig: 2345 10 90
# description: tcpstart


expect_tcp(){
/usr/bin/expect <<EOF
set timeout 3000
spawn bash /root/tcp.sh
send "7\r"
expect "fuck"
EOF
}
expect_tcp
iptables -I INPUT -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -p tcp --dport 80 -j ACCEPT

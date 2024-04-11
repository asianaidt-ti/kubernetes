#!/bin/sh
yum check-update

# recommend
# net-tools: ifconfig
# bind-utils: nslookup
yum install git wget net-tools telnet bind-utils bash-completion -y

# optional
yum install vim tree -y

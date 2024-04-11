#!/bin/sh

# recommend: git wget net-tools telnet bind-utils bash-completion
#  |- net-tools: ifconfig
#  |- bind-utils: nslookup
# optional: vim tree

dnf check-update
dnf install git wget net-tools telnet bind-utils bash-completion -y
dnf install vim tree -y

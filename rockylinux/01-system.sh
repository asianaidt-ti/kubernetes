#!/bin/sh

# recommend: git wget net-tools telnet bind-utils bash-completion
#  |- net-tools: ifconfig
#  |- bind-utils: nslookup
# optional: vim tree

sudo dnf check-update
sudo dnf install git wget net-tools telnet bind-utils bash-completion -y
sudo dnf install vim tree -y

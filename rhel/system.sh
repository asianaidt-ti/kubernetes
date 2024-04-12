#!/bin/sh

# recommend: git wget net-tools telnet bind-utils bash-completion
#  |- net-tools: ifconfig
#  |- bind-utils: nslookup
# optional: vim tree

dnf check-update
dnf install git wget net-tools telnet bind-utils bash-completion -y
dnf install vim tree -y

cat << EOF >> ~/.bashrc
export KUBECONFIG=/etc/kubernetes/admin.conf
source <(kubectl completion bash)
echo "source <(kubectl completion bash)" >> ~/.bashrc
alias k=kubectl
complete -o default -F __start_kubectl k
EOF
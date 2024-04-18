#!/bin/sh

# Source: https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises


cat << EOF >> ~/.bashrc
# export KUBECONFIG=/etc/kubernetes/admin.conf
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
EOF

# kubeadm init --apiserver-advertise-address 192.168.56.11 --pod-network-cidr 10.244.0.0/16
sudo kubeadm init --pod-network-cidr 192.168.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O
kubectl apply -f calico.yaml

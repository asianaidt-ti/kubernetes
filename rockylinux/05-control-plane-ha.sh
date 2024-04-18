#!/bin/sh

# Source: https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/
# Source: https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises


cat << EOF >> ~/.bashrc
# export KUBECONFIG=/etc/kubernetes/admin.conf
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
EOF
source ~/.bashrc

sudo kubeadm init --control-plane-endpoint control-plane-endpoint.cnct.asianaidt.com:6443 --upload-certs --pod-network-cidr 192.168.0.0/16

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O
kubectl apply -f calico.yaml

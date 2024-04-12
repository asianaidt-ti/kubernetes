#!/bin/sh

# Source: https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises

echo kubeadm init --apiserver-advertise-address 192.168.56.11 --pod-network-cidr 10.244.0.0/16
echo curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O
echo kubectl apply -f calico.yaml
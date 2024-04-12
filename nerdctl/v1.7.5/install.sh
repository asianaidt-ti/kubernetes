#!/bin/sh

KUBE_VERSION=1.29.2
CONTAINERD_VERSION=1.7.5

wget https://github.com/containerd/nerdctl/releases/download/v${CONTAINERD_VERSION}/nerdctl-full-${CONTAINERD_VERSION}-linux-amd64.tar.gz
tar Cxzvvf /usr/local nerdctl-full-${CONTAINERD_VERSION}-linux-amd64.tar.gz
systemctl enable --now containerd

rm -rf /usr/bin/nerdctl || true
ln -s /usr/local/bin/nerdctl /usr/bin/nerdctl

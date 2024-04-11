#!/bin/sh
wget https://github.com/containerd/nerdctl/releases/download/v1.7.5/nerdctl-full-1.7.5-linux-amd64.tar.gz
tar Cxzvvf /usr/local nerdctl-full-1.7.5-linux-amd64.tar.gz
ln -s /usr/local/bin/nerdctl /usr/bin/nerdctl
systemctl enable --now containerd

#!/bin/sh

# Source: https://docs.rockylinux.org/gemstones/containers/docker/

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install containerd.io

sudo systemctl enable --now containerd

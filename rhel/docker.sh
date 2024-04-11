#!/bin/sh

# Source: https://docs.rockylinux.org/gemstones/containers/docker/

sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl --now enable docker

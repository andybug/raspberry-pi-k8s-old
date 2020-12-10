#!/bin/zsh

MASTER_IP=192.168.1.197

k3sup install --ip ${MASTER_IP} --user andy --ssh-key ~/.ssh/id_ed25519 --context k8s0 --k3s-extra-args '--node-name node-0.k8s0.weirwd.net --node-ip 192.168.1.197 --tls-san kube-api.k8s0.weirwd.net --disable servicelb --disable traefik'

#!/bin/zsh

SERVER_IP=192.168.1.197
USER=andy
SSH_KEY=~/.ssh/id_ed25519

# node-1
AGENT_IP=192.168.1.103
# k3sup join --ip $AGENT_IP --server-ip $SERVER_IP --user $USER --ssh-key "${SSH_KEY}" \
# 	--k3s-extra-args "--node-name node-1.k8s0.weirwd.net --node-ip ${AGENT_IP}"

# node-2
AGENT_IP=192.168.1.11
k3sup join --ip $AGENT_IP --server-ip $SERVER_IP --user $USER --ssh-key "${SSH_KEY}" \
	--k3s-extra-args "--node-name node-2.k8s0.weirwd.net --node-ip ${AGENT_IP}"

# node-3
AGENT_IP=192.168.1.146
k3sup join --ip $AGENT_IP --server-ip $SERVER_IP --user $USER --ssh-key "${SSH_KEY}" \
	--k3s-extra-args "--node-name node-3.k8s0.weirwd.net --node-ip ${AGENT_IP}"

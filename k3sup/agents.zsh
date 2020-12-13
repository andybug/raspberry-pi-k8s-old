#!/bin/zsh

MASTER_IP=192.168.1.197
USER=andy
SSH_KEY=~/.ssh/id_ed25519

agents=( "192.168.1.103" "192.168.1.11" "192.168.1.146" )
index=1
for agent in "${agents[@]}"
do
	k3sup join --ip $agent --server-ip $MASTER_IP --user $USER --ssh-key "${SSH_KEY}" \
		--k3s-extra-args "--node-name node-$index.k8s0.weirwd.net --node-ip ${agent}"
	index=$(($index + 1))
done

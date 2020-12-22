#!/bin/zsh

SERVICE_PORT=8200
LOCAL_PORT=8200

echo export VAULT_ADDR='https://127.0.0.1:8200'
echo export VAULT_CACERT=/etc/ssl/certs/weirwd_net_k8s0.pem
exec kubectl -n vault port-forward svc/vault $LOCAL_PORT:$SERVICE_PORT

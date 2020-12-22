#!/bin/zsh

SERVICE_PORT=8200
LOCAL_PORT=8200

/bin/zsh -c "sleep 2; xdg-open https://127.0.0.1:$LOCAL_PORT" &
exec kubectl -n vault port-forward svc/vault-ui $LOCAL_PORT:$SERVICE_PORT

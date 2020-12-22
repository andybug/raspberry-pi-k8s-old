#!/bin/zsh

TRAEFIK_PORT=9000
LOCAL_PORT=9000

/bin/zsh -c "sleep 2; xdg-open http://localhost:$LOCAL_PORT/dashboard/" &
exec kubectl -n traefik port-forward pod/$(kubectl -n traefik get pods -l app.kubernetes.io/name=traefik -o=jsonpath="{.items[0].metadata.name}") $LOCAL_PORT:$TRAEFIK_PORT

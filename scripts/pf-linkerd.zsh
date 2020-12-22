#!/bin/zsh

/bin/zsh -c "sleep 2; xdg-open http://localhost:8084" & 
exec kubectl -n linkerd port-forward svc/linkerd-web 8084

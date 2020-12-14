This comes from the argo-cd repo and getting started guide:
- <https://github.com/argoproj/argo-cd/tree/master/manifests>
- <https://argoproj.github.io/argo-cd/getting_started/>
- <https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.10/manifests/install.yaml>
- <https://registry.hub.docker.com/r/cyrilix/argocd>
- <https://registry.hub.docker.com/r/argoproj/argocd>

    
    kubectl create ns argocd
    kustomize build . | kubectl apply -f -
    kubectl port-forward -n argocd service/argocd-server 8080:443
    # defaults to admin/server pod name
    argocd login localhost:8080
    argocd account list
    argocd account update-password --account <name> --current-password <current-admin> --new-password <new-user-password>
    argocd proj create system --description "cluster-wide resources" -s git@git.andybug.com:andy/k8s0.git
    argocd proj add-destination system https://kubernetes.default.svc '*'
    argocd proj allow-cluster-resource system '*' '*'
    argocd repocreds add git@git.andybug.com:andy/k8s0.git --ssh-private-key-path  ~/tmp/ceph/argocd/id_argocd
    ssh-keyscan git.andybug.com | argocd cert add-ssh --batch
    argocd repo add git@git.andybug.com:andy/k8s0.git --ssh-private-key-path ~/tmp/ceph/argocd/id_argocd


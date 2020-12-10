This comes from the argo-cd repo and getting started guide:
- <https://github.com/argoproj/argo-cd/tree/master/manifests>
- <https://argoproj.github.io/argo-cd/getting_started/>
- <https://raw.githubusercontent.com/argoproj/argo-cd/v1.7.10/manifests/install.yaml>
- <https://registry.hub.docker.com/r/cyrilix/argocd>
- <https://registry.hub.docker.com/r/argoproj/argocd>

argocd does not currently publish `arm64` images; replace it with cyrilix's build:

    sed -r -e 's#argoproj/argocd:#cyrilix/argocd:#'

# Linkerd Bootstrap
This app creates a trust anchor (CA) for the linkerd deployment, cert-manager
issuer for that CA, and a certificate. This removes the need for the linkerd
helm chart from generating the trust anchor and certificates; when that happens
argocd will see drift on certificate rotation.

## Prerequisites?
- cert-manager
- sealed-secrets

## Steps
```bash
step-cli certificate create \
  identity.linkerd.cluster.local \
  linkerd-trust.crt \
  linkerd-trust.key \
  --profile root-ca \
  --no-password \
  --not-after 43800h \
  --insecure

step-cli certificate inspect linkerd-trust.crt

kubectl -n linkerd create secret tls linkerd-trust-anchor \
  --cert linkerd-trust.crt \
  --key linkerd-trust.key \
  --dry-run=client -o yaml

xsel -ob | kubeseal --controller-namespace=sealed-secrets --controller-name sealed-secrets -o yaml -

# be sure to get the expiration date from the inspect above
xsel -ob | kubectl patch -f - \
  -p '{"spec": {"template": {"type":"kubernetes.io/tls", "metadata": {"labels": {"linkerd.io/control-plane-component":"identity", "linkerd.io/control-plane-ns":"linkerd"}, "annotations": {"linkerd.io/created-by":"linkerd/cli stable-2.9.1", "linkerd.io/identity-issuer-expiry":"2025-12-29T16:09:10Z"}}}}}' \
  --dry-run=client \
  --type=merge \
  --local -o yaml
```

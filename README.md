# score-kro-example

```bash
score-k8s init \
    --no-sample \
    --provisioners https://raw.githubusercontent.com/score-spec/community-provisioners/refs/heads/main/horizontal-pod-autoscaler/score-k8s/10-hpa.provisioners.yaml \
    --patch-templates https://raw.githubusercontent.com/score-spec/community-patchers/refs/heads/main/score-k8s/service-account.tpl \
    --patch-templates https://raw.githubusercontent.com/score-spec/community-patchers/refs/heads/main/score-k8s/unprivileged.tpl \
    --patch-templates ./init/score-k8s/patchers/netpol.tpl
```

```bash
score-k8s generate score.yaml \
    --image ghcr.io/la-cc/simple-webapp:1.0.1
```

```bash
kubectl create ns my-webapp-instance
kubectl label ns my-webapp-instance pod-security.kubernetes.io/enforce=restricted
```

```bash
kubectl apply -f manifests.yaml -n my-webapp-instance
```
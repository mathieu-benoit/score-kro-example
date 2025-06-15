# score-kro-example

```bash
score-k8s init \
    --no-sample \
    --provisioners https://raw.githubusercontent.com/score-spec/community-provisioners/refs/heads/main/horizontal-pod-autoscaler/score-k8s/10-hpa.provisioners.yaml \
    --provisioners https://raw.githubusercontent.com/score-spec/community-provisioners/refs/heads/main/environment/score-k8s/10-env.provisioners.yaml \
    --provisioners ./init/score-k8s/provisioners/ingress.yaml \
    --patch-templates https://raw.githubusercontent.com/score-spec/community-patchers/refs/heads/main/score-k8s/service-account.tpl \
    --patch-templates https://raw.githubusercontent.com/score-spec/community-patchers/refs/heads/main/score-k8s/unprivileged.tpl \
    --patch-templates https://raw.githubusercontent.com/score-spec/community-patchers/refs/heads/main/score-k8s/namespace-pss-restricted.tpl
```

```bash
score-k8s generate score.yaml \
    --image ghcr.io/la-cc/simple-landing-page:0.0.6 \
    --namespace my-webapp-instance \
    --generate-namespace
```

```bash
kubectl apply -f manifests.yaml
```

From there, you can use the exact same `score.yaml` file with Docker Compose:
```bash
score-compose init \
    --no-sample \
    --provisioners https://raw.githubusercontent.com/score-spec/community-provisioners/refs/heads/main/horizontal-pod-autoscaler/score-compose/10-hpa.provisioners.yaml \
    --provisioners https://raw.githubusercontent.com/score-spec/community-provisioners/refs/heads/main/environment/score-compose/10-env.provisioners.yaml

score-compose generate score.yaml \
    --image ghcr.io/la-cc/simple-landing-page:0.0.6

docker compose up --build -d --remove-orphans
```
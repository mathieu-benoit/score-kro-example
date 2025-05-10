{{ range $i, $m := .Manifests }}
{{ if eq $m.kind "Deployment" }}
- op: set
  path: -1
  value:
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: {{ $m.metadata.name }}
    spec:
      podSelector:
        matchLabels:
          app: {{ $m.metadata.name }}
      policyTypes:
        - Ingress
      ingress:
      - from:
        - podSelector:
            matchLabels:
              app: ingress-nginx
        ports:
        - protocol: TCP
          port: 8080
{{ end }}
{{ end }}
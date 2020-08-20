# Deploying Container via Helm

To install helm follow the docs [here](https://helm.sh/docs/intro/install/)

To install Redis, we will use the following helm command(s)

``` bash
kubectl create ns redis
helm repo add azure-marketplace https://marketplace.azurecr.io/helm/v1/repo
helm install redis azure-marketplace/redis --namespace redis
```

We will also use NGINX Ingress

``` bash
kubectl create ns traefik
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install traefik stable/traefik --namespace traefik --set kubernetes.ingressClass=traefik --set rbac.enabled=true --set kubernetes.ingressEndpoint.useDefaultPublishedService=true --set ssl.enabled=true --set ssl.enforced=true --set ssl.permanentRedirect=true --version 1.85.0
```

For HTTPS we will use Cert Manager

``` bash
kubectl create ns cert-manager
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager --namespace cert-manager --version v0.16.1 jetstack/cert-manager --set installCRDs=true --set ingressShim.defaultIssuerName=letsencrypt --set ingressShim.defaultIssuerKind=ClusterIssuer
```

Finally create DNS Entry

``` bash
kubectl get services traefik --namespace traefik
ipAddress=""
dnsName=""
publicIpId=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$ipAddress')].[id]" --output tsv)
az network public-ip update --ids $publicIpId --dns-name $dnsName
```

To install our application that exists on ACR, we will use the following helm command(s)

``` bash
helm install signalronaks ./
```

To uninstall our application

``` bash
helm uninstall signalronaks
```

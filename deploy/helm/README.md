# Deploying Container via Helm

To install helm follow the docs [here](https://helm.sh/docs/intro/install/)

To install Redis, we will use the following helm command(s)

``` bash
helm repo add azure-marketplace https://marketplace.azurecr.io/helm/v1/repo
helm install azure-marketplace/redis --generate-name
```

We will also use NGINX Ingress

``` bash
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install nginx-ingress stable/nginx-ingress --set controller.replicaCount=2 --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux --set controller.service.loadBalancerIP="[STATIC_IP]" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-dns-label-name"="[CLUSTER_NAME]"
```

To install our application that exists on ACR, we will use the following helm command(s)

``` bash
helm install socketonaks ./
```

To uninstall our application

``` bash
helm uninstall socketonaks
```

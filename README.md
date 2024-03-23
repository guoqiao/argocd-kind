# argocd-kind

Create Kubernetes Cluster with kind and manage with ArgoCD.

# Quick Start

```
# default node image: kindest/node
kind create cluster  # default name "kind"
kind create cluster --name kind-2
kind create cluster --wait 1m
kind create cluster --config kind-example-config.yaml

kind delete cluster  # delete default "kind" cluster
kind delete cluster --name kind-2

kind get clusters

# use cluster
kubectl cluster-info --context kind-kind
kubectl cluster-info dump
```

# ArgoCD

```
brew install argocd

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward svc/argocd-server -n argocd 8080:8080
# show secret argocd-initial-admin-secret
argocd admin initial-password -n argocd
argocd account update-password

# create app with cli
kubectl config set-context --current --namespace=argocd
argocd app create guestbook --repo https://github.com/argoproj/argocd-example-apps.git --path guestbook --dest-server https://kubernetes.default.svc --dest-namespace default
argocd app get guestbook

kubectl apply -f root-app.yaml
```

https://github.com/argoproj/argocd-example-apps.git


# Errors

## Unable to delete resource: Service guestbook-ui not found as part of application root-app

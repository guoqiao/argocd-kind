brew:
	brew install kubectl kind

create:
	kind create cluster --config ./cluster-config.yaml
	kind get clusters

delete:
	kind delete cluster

info:
	kubectl cluster-info --context kind-kind
	kubectl cluster-info dump

argocd:
	brew install argocd
	kubectl create namespace argocd
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl port-forward svc/argocd-server -n argocd 8080:8080


kubeconfig:
	@kind get kubeconfig

admin-password:
	argocd admin initial-password -n argocd

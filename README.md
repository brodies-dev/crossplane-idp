# crossplane-idp
Testing Crossplane / Argo

## Bootstrap Notes

Devcontainer configured to run local K8.

### automate all these steps
```
minikube start
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl get pods -n argocd
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
```
### Install crossplane
```
helm install crossplane \
--namespace crossplane-system \
--create-namespace crossplane-stable/crossplane
kubectl get pods -n crossplane-system
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
### Reset default password
```
argocd admin initial-password -n argocd
argocd login localhost:8080
argocd account update-password
kubectl delete secret -n argocd argocd-initial-admin-secret
```
### point argo at itself.
```
argocd repo add https://github.com/brodies-dev/crossplane-idp
```

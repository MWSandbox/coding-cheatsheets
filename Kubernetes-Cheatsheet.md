# Kubernetes Cheatsheet

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [kubectl](#kubectl)
- [Azure kubelogin](#azure-kubelogin)
- [Azure CLI](#azure-cli)
- [eksctl](#eksctl)
- [AWS CLI](#aws-cli)
- [MicroK8s](#microk8s)
- [helm](#helm)
- [argo-rollouts](#argo-rollouts)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# kubectl

| Description                                              | Command                                                      |
| :------------------------------------------------------- | :----------------------------------------------------------- |
| Get pods | `kubectl get pods` |
| Open bash in container | `kubectl exec --stdin --tty [POD] -- /bin/bash` |
| Follow logs of pod | `kubectl logs -f [POD]` |
| List all pods from all namespaces | `kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces` |
| Set current config                                       | `kubectl config use-context [context-name]`                  |
| Get user from config                                     | `kubectl config view --minify --flatten \| grep user` |
| Check if current user has permissions to execute command | `kubectl auth can-i [command]`                               |
| Check permissions                                        | `kubectl auth can-i --list`                                  |
| Get clusterrolebinding                                   | `kubectl get clusterrolebinding [role-binding-name] -o json` |
| Restart Deployment | `kubectl rollout restart deployment [deployment]` |
| Port Forward a service locally | `kubectl port-forward svc/[service-name] [local-port]:[k8s-port]` |
| Retrieve secret value | `kubectl get secrets/[NAME] --template={{.data[.PATH]}} \| base64 -d` |
| Run network utils shell | `kubectl run tmp-shell --rm -i --tty --image nicolaka/netshoot` |
| Drain a node | `kubectl cordon [node]` |

# Azure kubelogin

| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Login using Azure AD integration    | `kubelogin convert-kubeconfig -l interactive` |
| Remove cached tokens from kubelogin | `kubelogin remove-tokens`                     |

# Azure CLI

| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Retrieves kubeconfig for AKS cluster | `az aks get-credentials --overwrite-existing --resource-group [RG] --name [CLUSTER-NAME]` |

# eksctl

| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Enables a new identity access to the cluster using a specific role | `eksctl create iamidentitymapping --cluster [CLUSTER-NAME] --region=[REGION] --arn [AWS-ROLE-ARN] --username [K8S-ROLE-NAME] --group [K8S-GROUP-NAME] [--no-duplicate-arns]` |
| Get all identitymappings enabled for the cluster | `eksctl get iamidentitymapping --cluster [CLUSTER-NAME] --region=[REGION]` |

# AWS CLI

| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Retrieves kubeconfig for EKS cluster | `aws eks update-kubeconfig --profile [AWS-PROFILE] --region [REGION] --name [CLUSTER-NAME]`|

# MicroK8s

| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Start | `microk8s.start` |
| Inspect | `microk8s.inspect` |
| Stop | `microk8s.stop` |
| Add main node | `microk8s.add-node` |
| Add leaf node | `microk8s.join [IP]:[PORT]/[TOKEN]` |
| Generate kube config | `microk8s config` |
| Import image | `microk8s ctr image import [IMAGE].tar` |
| Remove node | `microk8s remove-node [IP] --force` |

# helm

| Description | Command |
| :---------- | :------ |
| Render helm chart | `helm template [name] [chart] -f [values.yaml]` |

# argo-rollouts

| Description | Command |
| :---------- | :------ |
| View rollout | `kubectl argo rollouts get rollout [NAME] -n [NAMESPACE] --watch` |
| Promote rollout | `kubectl argo rollouts promote rollout [NAME] -n [NAMESPACE]` |
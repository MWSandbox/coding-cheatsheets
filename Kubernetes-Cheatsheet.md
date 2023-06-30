# Kubernetes Cheatsheet

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [kubectl](#kubectl)
- [Azure kubelogin](#azure-kubelogin)
- [Azure CLI](#azure-cli)
- [eksctl](#eksctl)
- [AWS CLI](#aws-cli)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# kubectl

| Description                                              | Command                                                      |
| :------------------------------------------------------- | :----------------------------------------------------------- |
| Open bash in container | `kubectl exec --stdin --tty [POD] -- /bin/bash` |
| Follow logs of pod | `kubectl logs -f [POD]` |
| List all pods from all namespaces | `kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces` |
| Set current config                                       | `kubectl config use-context [context-name]`                  |
| Get user from config                                     | `kubectl config view --minify --flatten \| grep user` |
| Check if current user has permissions to execute command | `kubectl auth can-i [command]`                               |
| Check permissions                                        | `kubectl auth can-i --list`                                  |
| Get clusterrolebinding                                   | `kubectl get clusterrolebinding [role-binding-name] -o json` |

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


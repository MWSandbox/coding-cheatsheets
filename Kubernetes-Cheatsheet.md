# Kubernetes Cheatsheet

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [kubectl](#kubectl)
- [Azure kubelogin](#azure-kubelogin)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# kubectl

| Description                                              | Command                                                      |
| :------------------------------------------------------- | :----------------------------------------------------------- |
| List all pods from all namespaces |  |
| Set current config                                       | `kubectl config use-context [context-name]`                  |
| Get user from config                                     | `kubectl config view --minify --flatten                      | grep user` |
| Check if current user has permissions to execute command | `kubectl auth can-i [command]`                               |
| Check permissions                                        | `kubectl auth can-i --list`                                  |
| Get clusterrolebinding                                   | `kubectl get clusterrolebinding [role-binding-name] -o json` |

# Azure kubelogin
| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Login using Azure AD integration    | `kubelogin convert-kubeconfig -l interactive` |
| Remove cached tokens from kubelogin | `kubelogin remove-tokens`                     |

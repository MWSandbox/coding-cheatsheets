# Kubernetes Cheatsheet <!-- omit in toc -->

1. [kubectl](#kubectl)
2. [Azure](#azure)

# kubectl

| Description                                              | Command                                                      |
| :------------------------------------------------------- | :----------------------------------------------------------- |
| Set current config                                       | `kubectl config use-context [context-name]`                  |
| Get user from config                                     | `kubectl config view --minify --flatten                      | grep user` |
| Check if current user has permissions to execute command | `kubectl auth can-i [command]`                               |
| Check permissions                                        | `kubectl auth can-i --list`                                  |
| Get clusterrolebinding                                   | `kubectl get clusterrolebinding [role-binding-name] -o json` |

# Azure
| Description                         | Command                                       |
| :---------------------------------- | :-------------------------------------------- |
| Login using Azure AD integration    | `kubelogin convert-kubeconfig -l interactive` |
| Remove cached tokens from kubelogin | `kubelogin remove-tokens`                     |
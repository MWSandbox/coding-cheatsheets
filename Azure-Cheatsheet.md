# Azure Cheatsheet <!-- omit in toc -->

My personal cheatsheet when working with Azure. Feel free to reuse and adjust it to your needs.

# Azure CLI

| Description                  | Command                                                                         |
| :--------------------------- | :------------------------------------------------------------------------------ |
| Retrieve kubeconfig of an AKS cluster | `az aks get-credentials --resource-group [RG] --name [CLUSTER-NAME]` |
| Login                        | `az login`                                                                      |
| Set subscription             | `az account set --subscription [id]`                                            |
| List available VMs in region | `az vm list-skus -l [region] -o table \| grep -v "NotAvailableForSubscription"` |

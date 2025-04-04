# Azure Cheatsheet <!-- omit in toc -->

My personal cheatsheet when working with Azure. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Azure CLI](#azure-cli)
- [Powershell](#powershell)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Azure CLI

| Description                           | Command                                                                                                                       |
| :------------------------------------ | :---------------------------------------------------------------------------------------------------------------------------- |
| Breaks a lease  in blob storage       | `az storage blob lease break --blob-name [file-name] --container-name [container] --account-name [account] --auth-mode login` |
| Retrieves value of keyvault secret    | `az keyvault secret show --vault-name [VAULT-NAME] --name [SECRET-NAME] --query value -o tsv`                                 |
| Retrieve kubeconfig of an AKS cluster | `az aks get-credentials --resource-group [RG] --name [CLUSTER-NAME]`                                                          |
| Login                                 | `az login`                                                                                                                    |
| Set subscription                      | `az account set --subscription [id]`                                                                                          |
| List available VMs in region          | `az vm list-skus -l [region] -o table \| grep -v "NotAvailableForSubscription"`                                               |

# Powershell
| Description             | Command              |
| :---------------------- | :------------------- |
| Interact as cloud shell | `Connect-AzAccount"` |

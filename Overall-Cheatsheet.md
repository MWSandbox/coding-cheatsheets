<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [CDK CLI](#cdk-cli)
- [AWS CLI](#aws-cli)
- [Payara App Server](#payara-app-server)
- [Other](#other)
- [Docker](#docker)
  - [Docker: General](#docker-general)
  - [Docker: Cleanup](#docker-cleanup)
  - [Docker: Compose](#docker-compose)
  - [Docker: ECR](#docker-ecr)
- [Infracost](#infracost)
- [Maven](#maven)
- [Payara](#payara)
- [Azure](#azure)
- [General](#general)
- [VI](#vi)
- [AWS CLI](#aws-cli-1)
- [Payara App Server](#payara-app-server-1)
- [Other](#other-1)
- [Docker](#docker-1)
  - [Docker: General](#docker-general-1)
  - [Docker: Cleanup](#docker-cleanup-1)
  - [Docker: Compose](#docker-compose-1)
  - [Docker: ECR](#docker-ecr-1)
- [Infracost](#infracost-1)
- [Maven](#maven-1)
- [Payara](#payara-1)
- [Azure](#azure-1)
- [General](#general-1)
- [VI](#vi-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# CDK CLI

| Description                                                                  | Command                                         |
| :--------------------------------------------------------------------------- | :---------------------------------------------- |
| Create new project in typescript                                             | `cdk init -l typescript`                        |
| Compile CDK code -> CloudFormation templates                                 | `cdk synth`                                     |
| Deploy                                                                       | `cdk deploy`                                    |
| Deploy a specific stack                                                      | `cdk deploy [STACK-NAME]`                       |
| Delete all resources created by cdk                                          | `cdk destroy`                                   |
| Bootstrap your account (first time or after activating features in cdk.json) | `cdk bootstrap aws://[ACCOUNT-NUMBER]/[REGION]` |
| List all available stacks                                                    | `cdk list`                                      |

# AWS CLI

| Description                             | Command                                                                                                             |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------------ |
| Upload file to S3                       | `aws s3 cp [file] s3://[bucket-name]`                                                                               |
| List all entries from a Dynamo DB table | `aws dynamodb scan --table-name [table-name]`                                                                       |
| Empty S3 Bucket                         | `aws s3 rm --recursive s3://[bucket-name]`                                                                          |
| Retrieve Secret                         | `aws secretsmanager get-secret-value --secret-id [secret-name] --region [region] --query SecretString --output text | cut -d: -f2 | tr -d \"}` |

# Payara App Server
| Description                             | Command                                                                                                               |
| :-------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| Add AWS Secret to Payara config         | `asadmin set-aws-config-source-configuration --dynamic true --enabled true --secretName [name] --regionName [region]` |
| Retrieve AWS secret value               | `asadmin get-config-property --source cloud --sourceName aws --propertyName [key-of-aws-secret]`                      |
| Retrieve all AWS secrets used in Payara | `asadmin get-aws-config-source-configuration`                                                                         |

# Other

| Description                                  | Command                                              |
| :------------------------------------------- | :--------------------------------------------------- |
| pem to ppk key for putty EC2 instance access | `puttygen ~/k8s-key.pem -o ~/k8s-key.ppk -O private` |
# Azure CLI

| Description                  | Command                                                                         |
| :--------------------------- | :------------------------------------------------------------------------------ |
| Retrieve kubeconfig of an AKS cluster | `az aks get-credentials --resource-group [RG] --name [CLUSTER-NAME]` |
| Login                        | `az login`                                                                      |
| Set subscription             | `az account set --subscription [id]`                                            |
| List available VMs in region | `az vm list-skus -l [region] -o table \| grep -v "NotAvailableForSubscription"` |
# Terraform

| Description                                                               | Command             |
| :------------------------------------------------------------------------ | :------------------ |
| Sets up working directory, downloads plugins. Safe to run multiple times. | `terraform init`    |
| Create execution plan for rollout                                         | `terraform plan`    |
| Deploys changes                                                           | `terraform apply`   |
| Removes resources from cloud                                              | `terraform destroy` |

# Docker

## Docker: General

| Description                                                          | Command                                        |
| :------------------------------------------------------------------- | :--------------------------------------------- |
| Get all information about the container, including networking config | `docker inspect [container-name]`              |
| Get all information about the network                                | `docker network inspect [network-name]`        |
| Connect container to the network                                     | `docker network connect [network] [container]` |

## Docker: Cleanup

| Description                                      | Command                                                                                         |
| :----------------------------------------------- | :---------------------------------------------------------------------------------------------- |
| Stops ALL containers                             | `docker stop $(docker ps -a -q)`                                                                |
| Removes ALL containers                           | `docker rm $(docker ps -a -q)`                                                                  |
| Removes all containers based on a specific image | `docker rm $(docker ps -a \| awk '{ print $1,$2 }' \| grep [image-name] \| awk '{ print $1 }')` |
| Removes all unused volumes                       | `docker volume prune`                                                                           |
| Removes all unused networks                      | `docker network prune`                                                                          |
| Removes all unused images                        | `docker rmi $(docker images --filter "dangling=true" -q --no-trunc)`                             |

## Docker: Compose

| Description                  | Command                       |
| :--------------------------- | :---------------------------- |
| Pull most recent base images | `docker-compose build --pull` |
| Run containers               | `docker-compose up -d`        |

## Docker: ECR
| Description                | Command                                                                                                    |
| :------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Tag image for ECR          | `docker tag [image-name]:[image-tag] [account-id].dkr.ecr.[region].amazonaws.com/[repository]:[image-tag]` |
| Push image to ECR          | `docker push [account-id].dkr.ecr.[region].amazonaws.com/[repository]:[image-tag]`                         |
| Install credentials helper | `apt install amazon-ecr-credential-helper`                                                                 |

# Infracost
| Description           | Command                                                                            |
| :-------------------- | :--------------------------------------------------------------------------------- |
| Create cost breakdown | `infracost breakdown --path=./ --format html --out-file=infracost-breakdown.html`  |
| Sync usage file       | `infracost breakdown --path=./ --sync-usage-file --usage-file=infracost-usage.yml` |

# Maven
| Description                              | Command                  |
| :--------------------------------------- | :----------------------- |
| Generate dependency tree                 | `mvn dependency:tree`    |
| Analyze dependencies for possible errors | `mvn dependency:analyze` |

# Payara
| Description             | Command                                                                    |
| :---------------------- | :------------------------------------------------------------------------- |
| Run payara docker image | `docker run -p 8080:8080 -p 4848:4848 -d --name payara payara/server-full` |
| List password aliases | `asadmin list-password-aliases` |
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
# Package Manager

| Description                                 | Command                            |
| :------------------------------------------ | :--------------------------------- |
| Lists all available versions of the package | `apt-cache madison [package-name]` |

# General

| Description                    | Command                                 |
| :----------------------------- | :-------------------------------------- |
| Enables a service at boot time | `systemctl enable [command]`            |
| Reboot system                  | `systemctl reboot`                      |
| Read from syslog               | `tail -f /var/log/syslog`               |
| Get external IP address        | `curl -s http://whatismyip.akamai.com/` |

# VI

| Description        | Command |
| :----------------- | :------ |
| Search             | `/`     |
| Next Search Result | `n`     |
| Delete Line        | `dd`    |
# CDK CLI

| Description                                                                  | Command                                         |
| :--------------------------------------------------------------------------- | :---------------------------------------------- |
| Create new project in typescript                                             | `cdk init -l typescript`                        |
| Compile CDK code -> CloudFormation templates                                 | `cdk synth`                                     |
| Deploy                                                                       | `cdk deploy`                                    |
| Deploy a specific stack                                                      | `cdk deploy [STACK-NAME]`                       |
| Delete all resources created by cdk                                          | `cdk destroy`                                   |
| Bootstrap your account (first time or after activating features in cdk.json) | `cdk bootstrap aws://[ACCOUNT-NUMBER]/[REGION]` |
| List all available stacks                                                    | `cdk list`                                      |

# AWS CLI

| Description                             | Command                                                                                                             |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------------ |
| Upload file to S3                       | `aws s3 cp [file] s3://[bucket-name]`                                                                               |
| List all entries from a Dynamo DB table | `aws dynamodb scan --table-name [table-name]`                                                                       |
| Empty S3 Bucket                         | `aws s3 rm --recursive s3://[bucket-name]`                                                                          |
| Retrieve Secret                         | `aws secretsmanager get-secret-value --secret-id [secret-name] --region [region] --query SecretString --output text | cut -d: -f2 | tr -d \"}` |

# Payara App Server
| Description                             | Command                                                                                                               |
| :-------------------------------------- | :-------------------------------------------------------------------------------------------------------------------- |
| Add AWS Secret to Payara config         | `asadmin set-aws-config-source-configuration --dynamic true --enabled true --secretName [name] --regionName [region]` |
| Retrieve AWS secret value               | `asadmin get-config-property --source cloud --sourceName aws --propertyName [key-of-aws-secret]`                      |
| Retrieve all AWS secrets used in Payara | `asadmin get-aws-config-source-configuration`                                                                         |

# Other

| Description                                  | Command                                              |
| :------------------------------------------- | :--------------------------------------------------- |
| pem to ppk key for putty EC2 instance access | `puttygen ~/k8s-key.pem -o ~/k8s-key.ppk -O private` |
# Azure CLI

| Description                  | Command                                                                         |
| :--------------------------- | :------------------------------------------------------------------------------ |
| Retrieve kubeconfig of an AKS cluster | `az aks get-credentials --resource-group [RG] --name [CLUSTER-NAME]` |
| Login                        | `az login`                                                                      |
| Set subscription             | `az account set --subscription [id]`                                            |
| List available VMs in region | `az vm list-skus -l [region] -o table \| grep -v "NotAvailableForSubscription"` |
# Terraform

| Description                                                               | Command             |
| :------------------------------------------------------------------------ | :------------------ |
| Sets up working directory, downloads plugins. Safe to run multiple times. | `terraform init`    |
| Create execution plan for rollout                                         | `terraform plan`    |
| Deploys changes                                                           | `terraform apply`   |
| Removes resources from cloud                                              | `terraform destroy` |

# Docker

## Docker: General

| Description                                                          | Command                                        |
| :------------------------------------------------------------------- | :--------------------------------------------- |
| Get all information about the container, including networking config | `docker inspect [container-name]`              |
| Get all information about the network                                | `docker network inspect [network-name]`        |
| Connect container to the network                                     | `docker network connect [network] [container]` |

## Docker: Cleanup

| Description                                      | Command                                                                                         |
| :----------------------------------------------- | :---------------------------------------------------------------------------------------------- |
| Stops ALL containers                             | `docker stop $(docker ps -a -q)`                                                                |
| Removes ALL containers                           | `docker rm $(docker ps -a -q)`                                                                  |
| Removes all containers based on a specific image | `docker rm $(docker ps -a \| awk '{ print $1,$2 }' \| grep [image-name] \| awk '{ print $1 }')` |
| Removes all unused volumes                       | `docker volume prune`                                                                           |
| Removes all unused networks                      | `docker network prune`                                                                          |
| Removes all unused images                        | `docker rmi $(docker images --filter "dangling=true" -q --no-trunc)`                             |

## Docker: Compose

| Description                  | Command                       |
| :--------------------------- | :---------------------------- |
| Pull most recent base images | `docker-compose build --pull` |
| Run containers               | `docker-compose up -d`        |

## Docker: ECR
| Description                | Command                                                                                                    |
| :------------------------- | :--------------------------------------------------------------------------------------------------------- |
| Tag image for ECR          | `docker tag [image-name]:[image-tag] [account-id].dkr.ecr.[region].amazonaws.com/[repository]:[image-tag]` |
| Push image to ECR          | `docker push [account-id].dkr.ecr.[region].amazonaws.com/[repository]:[image-tag]`                         |
| Install credentials helper | `apt install amazon-ecr-credential-helper`                                                                 |

# Infracost
| Description           | Command                                                                            |
| :-------------------- | :--------------------------------------------------------------------------------- |
| Create cost breakdown | `infracost breakdown --path=./ --format html --out-file=infracost-breakdown.html`  |
| Sync usage file       | `infracost breakdown --path=./ --sync-usage-file --usage-file=infracost-usage.yml` |

# Maven
| Description                              | Command                  |
| :--------------------------------------- | :----------------------- |
| Generate dependency tree                 | `mvn dependency:tree`    |
| Analyze dependencies for possible errors | `mvn dependency:analyze` |

# Payara
| Description             | Command                                                                    |
| :---------------------- | :------------------------------------------------------------------------- |
| Run payara docker image | `docker run -p 8080:8080 -p 4848:4848 -d --name payara payara/server-full` |
| List password aliases | `asadmin list-password-aliases` |
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
# Package Manager

| Description                                 | Command                            |
| :------------------------------------------ | :--------------------------------- |
| Lists all available versions of the package | `apt-cache madison [package-name]` |

# General

| Description                    | Command                                 |
| :----------------------------- | :-------------------------------------- |
| Enables a service at boot time | `systemctl enable [command]`            |
| Reboot system                  | `systemctl reboot`                      |
| Read from syslog               | `tail -f /var/log/syslog`               |
| Get external IP address        | `curl -s http://whatismyip.akamai.com/` |

# VI

| Description        | Command |
| :----------------- | :------ |
| Search             | `/`     |
| Next Search Result | `n`     |
| Delete Line        | `dd`    |

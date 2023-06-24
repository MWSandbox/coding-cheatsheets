# Cloud Cheatsheet

My personal cheatsheet when working with general Cloud technologies. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Terraform](#terraform)
- [Docker](#docker)
  - [Docker: General](#docker-general)
  - [Docker: Cleanup](#docker-cleanup)
  - [Docker: Compose](#docker-compose)
  - [Docker: ECR](#docker-ecr)
- [Infracost](#infracost)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Terraform

| Description                                                               | Command             |
| :------------------------------------------------------------------------ | :------------------ |
| Lists content of terraform state. | `terraform state list` |
| Imports an existing cloud resource by ID into the terraform state to be managed by terraform in the future. | `terraform state import [RESOURCE-PATH] [ID]` |
| Moves resources in terraform state. Can be used if module path changes. | `terraform state mv [OLD-PATH] [NEW-PATH]` |
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

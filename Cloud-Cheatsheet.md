# Cloud Cheatsheet <!-- omit in toc -->

My personal cheatsheet when working with Cloud technologies. Feel free to reuse and adjust it to your needs.

1. [CDK CLI](#cdk-cli)
2. [AWS CLI](#aws-cli)
3. [Terraform](#terraform)
4. [Docker](#docker)
   1. [Docker: General](#docker-general)
   2. [Docker: Cleanup](#docker-cleanup)
   3. [Docker: Compose](#docker-compose)
   4. [Docker: ECR](#docker-ecr)
5. [Infracost](#infracost)
6. [Payara App Server](#payara-app-server)
7. [Other](#other)

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

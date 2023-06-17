# AWS Cheatsheet

My personal cheatsheet when working with AWS. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [CDK CLI](#cdk-cli)
- [AWS CLI](#aws-cli)
- [Payara App Server](#payara-app-server)
- [Other AWS Commands](#other-aws-commands)

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

# Other AWS Commands

| Description                                  | Command                                              |
| :------------------------------------------- | :--------------------------------------------------- |
| pem to ppk key for putty EC2 instance access | `puttygen ~/k8s-key.pem -o ~/k8s-key.ppk -O private` |

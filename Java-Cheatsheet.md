# Cloud Cheatsheet

My personal cheatsheet when programming Java projects. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Maven](#maven)
- [Payara](#payara)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

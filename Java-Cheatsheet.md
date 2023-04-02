# Cloud Cheatsheet <!-- omit in toc -->

My personal cheatsheet when programming Java projects. Feel free to reuse and adjust it to your needs.

1. [Maven](#maven)
2. [Payara](#payara)

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

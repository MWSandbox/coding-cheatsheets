# Linux Cheatsheet

My personal cheatsheet when working with Linux. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Package Manager](#package-manager)
- [General](#general)
- [VI](#vi)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Linux Package Manager

| Description                                 | Command                            |
| :------------------------------------------ | :--------------------------------- |
| Lists all available versions of the package | `apt-cache madison [package-name]` |

# General Linux commands

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

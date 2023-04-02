# Linux Cheatsheet <!-- omit in toc -->

My personal cheatsheet when working with Linux. Feel free to reuse and adjust it to your needs.

1. [Package Manager](#package-manager)
2. [General](#general)
3. [VI](#vi)

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

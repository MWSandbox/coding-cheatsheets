# Linux Cheatsheet

My personal cheatsheet when working with Linux. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Linux Package Manager](#linux-package-manager)
- [General Linux commands](#general-linux-commands)
- [VI](#vi)
- [Networking](#networking)
- [openssl](#openssl)

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
| Show runtime       | `h rtp  |
| Execute lua file   | `luafile % |
| Source file        | `so %`  |
| Create file        | `%`     |
| Create dir         | `d`     |
| Explore            | `Ex`    |
| Open package manger | `PackerSync` |
| Align in visual mode | `=` |
| Copy in visual mode | `y` |
| Paste in visual mode | `p` |
| Switch between windows `CTRL + W` |
| Show all lsp configs | `help lspconfig-all` |
| Show mason packages | `Mason` |
| Jump to end of file | `G` |
| Jump to end of line | `$` |
| Jump to start of line | `0` |
| Jump to start of file | `gg` |
| Jump to end of word | `e` |
| Append | `A` |
| Delete word | `dw` |
| Delete until end of ... | `d$` `de` |
| Delete line | `dd` |
| Undo | `u` |
| Redo | `<C-r>` |
| Telescope help | `help telescope` |
| nvim tree help | `g?` |
| Open terminal | `term` |
| Replace in current line | `s/to-replace/replacement` |
| Replace all occurences in whole file | `%s/to-replace/replacement/g` |
| Git diff (vim-fugitive) | `Gdiffsplit` |
| LSP info | `LspInfo` |

# Networking

| Description        | Command |
| :----------------- | :------ |
| Scan IP range for active devices | `nmap -sn CIDR` |
| Show all iptable rules for kube-proxy | `sudo iptables-legacy -t nat -S \| grep KUBE` |

# openssl
| Decrypt key | `openssl rsa -in encrypted.key -out decrypted.key` |
| Show Cert chain | `openssl s_client -showcerts -connect [DNS]:443` |

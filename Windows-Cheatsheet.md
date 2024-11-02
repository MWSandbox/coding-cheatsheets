# Windows Cheatsheet<!-- omit in toc -->

My personal cheatsheet when working with Windows. Feel free to reuse and adjust it to your needs.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
1. [Powershell](#powershell)
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Powershell

| Description                                 | Command                            |
| :------------------------------------------ | :--------------------------------- |
| Adds a new Firewall Rule to allow traffic from given protocol (e.g. ICMPv4) | `New-NetFirewallRule -DisplayName "[rule-name]" -Protocol [procol-name]` |
| Allow IP forwarding | `Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters -Name IpEnableRouter -Value 1` |


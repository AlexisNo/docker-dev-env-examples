Ubuntu base dockerfile
======================

Ubuntu docker image with some basic packages
--------------------------------------------

This image is designed for development environments

**Installed**

 * vim
 * git + custom .gitconfig
 * zsh + oh-my-zsh + custom theme
 * curl
 * wget
 * telnet

A `dev` user is created to perform non-root operations.
The `dev` user does not have password and is sudoer.

To change the `dev` user UID/GID, use the `change-dev-id` command.
```
change-dev-id <NEWUID> [<NEWGID>]
```
If `NEWGID` is not specified, it will have the same value than `NEWUID`.

This command is useful to set the same permissions on files shared via a volume with the user on the host machine.

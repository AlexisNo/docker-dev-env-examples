Ubuntu base dockerfile
==============

Ubuntu docker image with some basic packages
--------------

Based on [phusion/baseimage-docker](http://phusion.github.io/baseimage-docker/)

**Installed**

 * vim
 * git + custom .gitconfig
 * zsh + oh-my-zsh + custom theme
 * curl
 * wget
 * telnet

SSH is disabled. Use [nsenter](https://github.com/jpetazzo/nsenter) instead.

# Use phusion/baseimage as base image.
FROM phusion/baseimage:0.9.15

MAINTAINER Alexis N-o "alexis@henaut.net"

# Disable ssh (use nsenter instead)
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install basic packages.
RUN apt-get update && apt-get install -y software-properties-common zsh curl wget git htop unzip vim telnet

# Install oh-my-zsh and define zsh as default shell
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | /bin/zsh
RUN chsh -s /bin/zsh

# Apply custom theme and disable auto-update
COPY /root/.oh-my-zsh/themes/anoio-docker.zsh-theme /root/.oh-my-zsh/themes/anoio-docker.zsh-theme
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="anoio-docker"/g' /root/.zshrc
RUN sed -i 's/# DISABLE_AUTO_UPDATE=true/DISABLE_AUTO_UPDATE=true/g' /root/.zshrc

# Fix backspace displaying space in the prompt
RUN echo TERM=xterm >> /root/.zshrc


# Aplly custom .gitconfig
COPY /root/.gitconfig /root/.gitconfig


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use a base image of Ubuntu
FROM ubuntu:latest

# Author of the image
MAINTAINER Andrae Carotta andrae.carotta@hotmail.com

# Update package lists and install useful tools
RUN apt-get update && \
    apt-get install -y \
    curl \
    wget \
    vim \
    neovim \
    tmux \
    htop \
    tree \
    unzip \
    zip \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv && \
    #cmake \
    #code \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
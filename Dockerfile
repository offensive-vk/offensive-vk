#####################################################
# All Rights Reserved. 2020 - Present. (offensive-vk)
#####################################################

# Use the Debian Bullseye base image
FROM node:current-bullseye

# The Owner of this environment & this file (The Real OG)
LABEL owner="Vedansh <https://github.com/offensive-vk/>"
LABEL url="https://github.com/offensive-vk/offensive-vk"
LABEL maintainer="Hamster [bot] <https://github.com/TheHamsterBot>"

# Change default shell to /bin/bash
SHELL ["/bin/bash", "-c"]

# settings
RUN export DEBIAN_FRONTEND=noninteractive

# Update the package list and install essential packages
RUN apt-get update && apt-get install -y --fix-broken libc-bin && dpkg --configure -a \
    curl \
    wget \
    htop \
    neofetch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Run some basic system checks
RUN neofetch; df -T; uname -a

# Install pnpm
RUN npm i -g pnpm@10.0.0; pnpm -v

# Expose the container port
EXPOSE 9999

# Healthcheck to ensure the container is running
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:9999 || exit 1

# setup envs
ENV PORT=9999

# Set the default Docker host
ENV DOCKER_HOST=tcp://docker-daemon:2375

# Set the default command to keep the container running
CMD ["/bin/bash"]

#####################################################
# All Rights Reserved. 2020 - Present. (offensive-vk)
#####################################################

# Use the Debian Bullseye base image
FROM node:current-bullseye

# The Owner of this environment & this file (The Real OG)
LABEL owner="Vedansh ⚡ <https://github.com/offensive-vk/>"
LABEL url="https://github.com/offensive-vk/offensive-vk"
LABEL maintainer="Hamster [bot] <https://github.com/TheHamsterBot>"

# Change default shell to /bin/bash
SHELL ["/bin/bash", "-c"]

# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    htop \
    neofetch \
    docker.io \
    nodejs \
    npm \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Run some basic system checks
RUN neofetch; df -T; uname -a

# Set the default command to keep the container running
CMD ["/bin/bash"]

# Install pnpm
RUN npm i -g pnpm@9.0.0; pnpm -v

# Expose the container port
EXPOSE 9999

# Healthcheck to ensure the container is running
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:9999 || exit 1

# Additional flags
ENV NODE_ENV=production
ENV PORT=9999
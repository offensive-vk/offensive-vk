#####################################################
# All Rights Reserved. 2020 - Present. (offensive-vk)
#####################################################

# Use the Debian Bullseye base image
FROM node:lts-bullseye

# The Owner of this environment & this file
LABEL url="https://github.com/offensive-vk/offensive-vk"
LABEL owner="Vedansh <https://github.com/offensive-vk/>"
LABEL maintainer="Hamster <https://github.com/TheHamsterBot>"

# Change default shell to /bin/bash
SHELL ["/bin/bash", "-c"]

# Persist DEBIAN_FRONTEND setting
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install essential packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    htop \
    neofetch \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install pnpm
RUN npm install -g pnpm@10.10.0

# Expose the container port (metadata only)
EXPOSE 9999

# Healthcheck to ensure the container is running
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:9999 || exit 1

# Setup environment variables
ENV PORT=9999

# Set the default command to keep the container running (adjust as needed)
CMD ["tail", "-f", "/dev/null"]

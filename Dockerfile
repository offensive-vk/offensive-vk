#####################################################
# All Rights Reserved. 2022 - Present. (offensive-vk)
#####################################################

# Use the Debian Bullseye base image
FROM debian:bullseye

# The Owner of this environment & this file (The Real OG)
LABEL owner="Vedansh <https://github.com/offensive-vk/>"
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Run some basic system checks
RUN neofetch; df -T; uname -a

# Set the default command to keep the container running
CMD ["/bin/bash"]

# Expose the container port
EXPOSE 9999
########################################
# Copyright (c) Vedansh (offensive-vk).#
# All Rights Reserved. 2020 - Present  #
########################################

# Base image
FROM ubuntu:focal

# The Owner of this environment & this file (The Real OG)
LABEL owner="Vedansh <https://github.com/offensive-vk/>"
LABEL url="https://github.com/offensive-vk/offensive-vk"
LABEL maintainer="Hamster [bot] <https://github.com/TheHamsterBot>"
LABEL devcontainer="true"

# Build arguments for flexibility
ARG SCRIPT_DIR=/usr/share/scripts
ARG DEV_CONTAINER_CONFIG_DIR=/usr/local/etc/vedansh-dev-container

# Set default environment variables
ENV LANG="C.UTF-8" \
    SHELL=/bin/bash \
    DOCKER_BUILDKIT=1 \
    NODE_ENV=production \
    PORT=9999

# Copy required scripts
COPY ./hello-world.txt /tmp/scripts/
COPY ./install.sh ${SCRIPT_DIR}/

# Install required tools and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    curl wget htop neofetch docker.io make unzip build-essential \
    swig3.0 unixodbc-dev libpq-dev default-libmysqlclient-dev \
    moreutils rsync zip libgdiplus jq python3-pip libc6 libgcc1 \
    libgssapi-krb5-2 libncurses5 liblttng-ust0 libssl-dev \
    libstdc++6 zlib1g libuuid1 libunwind8 sqlite3 libsqlite3-dev \
    software-properties-common tk-dev uuid-dev gettext inotify-tools \
    build-essential cmake cppcheck valgrind clang lldb llvm gdb python3-dev \
    vim vim-doc xtail libsecret-1-dev libnss3 libnspr4 libatk-bridge2.0-0 \
    libatk1.0-0 libx11-6 libpangocairo-1.0-0 libx11-xcb1 libcups2 \
    libxcomposite1 libxdamage1 libxfixes3 libpango-1.0-0 libgbm1 \
    libgtk-3-0 fish && \
    add-apt-repository universe && \
    apt-get autoremove -y && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p "${DEV_CONTAINER_CONFIG_DIR}" && \
    mv /tmp/scripts/hello-world.txt ${DEV_CONTAINER_CONFIG_DIR}/

# Configure Fish shell
RUN FISH_PROMPT="function fish_prompt\n    set_color green\n    echo -n (whoami)\n    set_color normal\n    echo -n \":\"\n    set_color blue\n    echo -n (pwd)\n    set_color normal\n    echo -n \"> \"\nend\n" && \
    printf "$FISH_PROMPT" >> /etc/fish/functions/fish_prompt.fish && \
    printf "if type code-insiders > /dev/null 2>&1; and not type code > /dev/null 2>&1\n  alias code=code-insiders\nend" >> /etc/fish/conf.d/code_alias.fish

# Execute node installation script
RUN bash ${SCRIPT_DIR}/install.sh

# Healthcheck to ensure the container is running
HEALTHCHECK --interval=30s --timeout=10s CMD curl -f http://localhost:${PORT} || exit 1

# Mount for docker-in-docker
VOLUME [ "/var/lib/docker" ]

# Expose the container port
EXPOSE ${PORT}

# Display a message
RUN cat ${DEV_CONTAINER_CONFIG_DIR}/hello-world.txt && sleep 2

# Keep stdin open for commands
CMD ["sleep", "infinity"]

# Final clean up
RUN apt-get clean -y && rm -rf /var/lib/apt/lists/*

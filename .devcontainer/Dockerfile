########################################
# Copyright (c) Vedansh (offensive-vk).#
# All Rights Reserved. 2020 - Present  #
########################################

FROM ubuntu:focal

# The Owner of this environment & this file (The Real OG)
LABEL owner="Vedansh <https://github.com/offensive-vk/>"
LABEL url="https://github.com/offensive-vk/offensive-vk"
LABEL maintainer="Hamster [bot] <https://github.com/TheHamsterBot>"
LABEL devcontainer="true"
LABEL baseimage="ubuntu:focal"

# Copy requrired scripts
COPY ./hello-world.txt /tmp/scripts/

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && yes | unminimize 2>&1 

ENV LANG="C.UTF-8"

# Install basic build tools
RUN apt-get update \
    && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl \
    wget \
    htop \
    neofetch \
    docker.io \
    nodejs \
    npm \ 
    make \
    unzip \
    build-essential \
    swig3.0 \
    unixodbc-dev \
    libpq-dev \
    default-libmysqlclient-dev \
    moreutils \
    rsync \
    zip \
    libgdiplus \
    jq \
    python-pip-whl \
    python3-pip \
    libc6 \
    libgcc1 \
    libgssapi-krb5-2 \
    libncurses5 \
    liblttng-ust0 \
    libssl-dev \
    libstdc++6 \
    zlib1g \
    libuuid1 \
    libunwind8 \
    sqlite3 \
    libsqlite3-dev \
    software-properties-common \
    tk-dev \
    uuid-dev \
    gettext \
    inotify-tools \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get upgrade -y \
    && add-apt-repository universe \
    && rm -rf /var/lib/apt/lists/*

# Verify expected build and debug tools are present
RUN apt-get update \
    && apt-get -y install build-essential cmake cppcheck valgrind clang lldb llvm gdb python3-dev \
    && apt-get install -yq vim vim-doc xtail software-properties-common libsecret-1-dev \
    && apt-get install -y --no-install-recommends libnss3 libnspr4 libatk-bridge2.0-0 libatk1.0-0 libx11-6 libpangocairo-1.0-0 \
    libx11-xcb1 libcups2 libxcomposite1 libxdamage1 libxfixes3 libpango-1.0-0 libgbm1 libgtk-3-0 \
    && apt-get autoremove -y && apt-get clean -y \
    && mkdir -p "/usr/local/etc/vedansh-dev-container/" \
    && mv -f /tmp/scripts/hello-world.txt /usr/local/etc/vedansh-dev-container/

# Default to bash shell (other shells available at /usr/bin/fish and /usr/bin/zsh)
ENV SHELL=/bin/bash \
    DOCKER_BUILDKIT=1

# Install and setup fish
RUN apt-get install -yq fish \
    && FISH_PROMPT="function fish_prompt\n    set_color green\n    echo -n (whoami)\n    set_color normal\n    echo -n \":\"\n    set_color blue\n    echo -n (pwd)\n    set_color normal\n    echo -n \"> \"\nend\n" \
    && printf "$FISH_PROMPT" >> /etc/fish/functions/fish_prompt.fish \
    && printf "if type code-insiders > /dev/null 2>&1; and not type code > /dev/null 2>&1\n  alias code=code-insiders\nend" >> /etc/fish/conf.d/code_alias.fish

# Remove scripts now that we're done with them
RUN apt-get clean -y && rm -rf /tmp/scripts

# Mount for docker-in-docker 
VOLUME [ "/var/lib/docker" ]

# Run some basic system checks
RUN neofetch; df -T; uname -a

# Expose the container port
EXPOSE 9999

# Healthcheck to ensure the container is running
HEALTHCHECK --interval=30s --timeout=10s \
  CMD curl -f http://localhost:9999 || exit 1

# Additional flags
ENV NODE_ENV=production
ENV PORT=9999

# Fire Docker/Moby script if needed
ENTRYPOINT [ "/usr/local/share/docker-init.sh", "/usr/local/share/ssh-init.sh"]

# Show Message
RUN cat /usr/local/etc/vedansh-dev-container/hello-world.txt ; sleep 2

# Keep stdin open for commands
CMD [ "sleep", "infinity" ]

########################################
# Copyright (c) Vedansh (offensive-vk).#
# All Rights Reserved. 2020 - Present  #
########################################
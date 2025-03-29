# Start from one of Gitpod's base images that already includes common tools.
FROM gitpod/workspace-full

# Switch to root (because installing packages requires root privileges)
USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends fonts-firacode \
    && rm -rf /var/lib/apt/lists/*

# Switch back to gitpod user
USER gitpod
WORKDIR /home/gitpod

# 1. Install the Clojure CLI
RUN curl -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh \
&& chmod +x linux-install.sh \
    && ./linux-install.sh \
    && rm linux-install.sh

# 2. Create a "workshop" directory (this is optional — Gitpod auto-clones your repo).
RUN mkdir -p /home/gitpod/workshop
WORKDIR /home/gitpod/workshop

# (Optional) You can also pre-install other tools or libraries here if needed.

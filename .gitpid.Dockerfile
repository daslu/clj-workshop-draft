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
RUN curl -O https://download.clojure.org/install/linux-install-1.11.1.1200.sh \
    && chmod +x linux-install-1.11.1.1200.sh \
    && ./linux-install-1.11.1.1200.sh \
    && rm linux-install-1.11.1.1200.sh

# 2. Create a "workshop" directory (this is optional — Gitpod auto-clones your repo).
RUN mkdir -p /home/gitpod/workshop
WORKDIR /home/gitpod/workshop

# (Optional) You can also pre-install other tools or libraries here if needed.

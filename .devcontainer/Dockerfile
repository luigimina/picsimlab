# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.166.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

COPY library-scripts/desktop-lite-debian.sh /tmp/library-scripts/
RUN apt-get update && bash /tmp/library-scripts/desktop-lite-debian.sh root
RUN sed -i '/it_IT.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV DBUS_SESSION_BUS_ADDRESS="autolaunch:" DISPLAY=":1" LANG="it_IT.UTF-8" LANGUAGE="it_IT.UTF-8" LC_ALL="it_IT.UTF-8"
ENTRYPOINT ["/usr/local/share/desktop-init.sh"]
CMD ["sleep", "infinity"]

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>


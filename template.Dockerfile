# Pull base image.
FROM @DOCKER_IMAGE@

# Make sure APT operations are non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Add basic tools
RUN apt-get update && apt-get --yes install wget

# Add files.
ADD @FILES@ /

###################################
# Set up repositories
###################################

# Add linuxmint-keyring
RUN \
   wget http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_@KEYRING@_all.deb > dev/null 2>&1 \
&& dpkg -i linuxmint-keyring_@KEYRING@_all.deb \
&& rm linuxmint-keyring_@KEYRING@_all.deb

# Empty default sources.list
RUN echo "" > /etc/apt/sources.list

# Update APT cache.
RUN apt-get update

###################################
# Apply updates
###################################

RUN apt-get dist-upgrade --yes

###################################
# Install stuff
###################################

RUN apt-get --yes install @PACKAGES@

# Pull base image.
FROM @DOCKER_IMAGE@

# Make sure APT operations are non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Add basic tools
RUN apt-get update && apt-get --yes install wget gnupg locales unzip

# Set locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add GHR
RUN \
   wget https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip \
&& unzip ghr_v0.5.4_linux_amd64.zip \
&& mv ghr /usr/bin/ghr \
&& rm ghr_v0.5.4_linux_amd64.zip

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

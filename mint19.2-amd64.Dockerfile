# Pull base image.
FROM ubuntu:18.04

# Make sure APT operations are non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Add basic tools
RUN apt-get update && apt-get --yes install wget gnupg locales unzip libfile-fcntllock-perl

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
ADD mint19.2 /

###################################
# Set up repositories
###################################

# Add linuxmint-keyring
RUN \
   wget http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_2016.05.26_all.deb > dev/null 2>&1 \
&& dpkg -i linuxmint-keyring_2016.05.26_all.deb \
&& rm linuxmint-keyring_2016.05.26_all.deb

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

RUN apt-get --yes install mint-dev-tools build-essential devscripts fakeroot quilt dh-make automake libdistro-info-perl less nano ubuntu-dev-tools python python2.7 python3

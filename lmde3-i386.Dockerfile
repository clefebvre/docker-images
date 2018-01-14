# Pull base image.
FROM i386/debian:stretch

# Make sure APT operations are non-interactive
ENV DEBIAN_FRONTEND noninteractive

# Add basic tools
RUN apt-get update && apt-get --yes install wget

# Add files.
ADD lmde3 /

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

FROM ubuntu:16.04
MAINTAINER Goran Jovanov <goran.jovanov@gmail.com>

# define environment variables
ENV USR_PATH="/usr"
ENV JANUS_PATH="/root/janus"
ENV SCRIPTS_PATH="/root/scripts"

# define build arguments
ARG JANUS_DEPS="\
    libmicrohttpd-dev \
    libcurl4-openssl-dev \
    libjansson-dev \
    libnice-dev \
    libssl-dev \
    libsofia-sip-ua-dev \
    libglib2.0-dev \
    libopus-dev \
    libogg-dev \
    pkg-config \
    nodejs \
    npm"

ARG JANUS_DEPS_EXTRA="\
    libavutil-dev \
    libavcodec-dev \
    libavformat-dev \
    gengetopt \
    libtool \
    automake \
    git-core \
    build-essential \
    cmake \
    ca-certificates \
    curl"

# use aarnet mirror for quicker building while developing
# RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

# Add web examples
ADD web/ $JANUS_PATH/web/

# Add installation scripts
ADD scripts/*.* $SCRIPTS_PATH/

# Add certificates
ADD certs/mycert.* $JANUS_PATH/certs/

# Prepare the system
RUN $SCRIPTS_PATH/setup.sh

# Install dependencies
RUN $SCRIPTS_PATH/dependencies.sh

# Install dependencies - extras
RUN $SCRIPTS_PATH/extras.sh

# Update libsrtp 1.5.0 to avoid Janus issues with the default 1.4.x
RUN $SCRIPTS_PATH/libsrtp.sh

# Install usrsctp for data channel support
RUN $SCRIPTS_PATH/usrsctp.sh

# Install web sockets support
RUN $SCRIPTS_PATH/websockets.sh

# Fetch, build and install the gateway
RUN $SCRIPTS_PATH/janus.sh

# Install http-server and server static examples
RUN $SCRIPTS_PATH/http.sh

# Declare the ports we use
EXPOSE 80 443 7777 7088 7889 7188 7988 8088 8089 8188 8189 10000:10200

# Cleanup packages and files
RUN $SCRIPTS_PATH/cleanup.sh

# Overwrite Janus configs with our customized ones
ADD conf/*.cfg $JANUS_PATH/etc/janus/

# Define the run command
CMD $SCRIPTS_PATH/run.sh

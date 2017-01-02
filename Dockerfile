FROM ubuntu:16.04
MAINTAINER Goran Jovanov <goran.jovanov@gmail.com>

# bootstrap environment
ENV DEPS_HOME="/root/janus"
ENV SCRIPTS_PATH="/root/scripts"

# use aarnet mirror for quicker building while developing
RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

# Add installation scripts
ADD scripts/*.* $SCRIPTS_PATH/

# Add certificates
ADD certs/mycert.* $DEPS_HOME/certs/

# Prepare the system
RUN $SCRIPTS_PATH/setup.sh

# Install dependencies
RUN $SCRIPTS_PATH/dependencies.sh

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
EXPOSE 8081 8088 8089 8188 8189

# Cleanup packages and files
RUN $SCRIPTS_PATH/cleanup.sh

# Add configs
ADD conf/*.cfg $DEPS_HOME/etc/janus/

# Define the default start-up command
CMD $SCRIPTS_PATH/startup.sh

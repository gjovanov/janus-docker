FROM ubuntu:16.04
MAINTAINER Goran Jovanov <goran.jovanov@gmail.com>


# use aarnet mirror for quicker building while developing
RUN sed -i 's/archive.ubuntu.com/mirror.aarnet.edu.au\/pub\/ubuntu\/archive/g' /etc/apt/sources.list

# add build & installation scripts
ADD build /root/build
RUN chmod 755 /root/build/*.sh

# add janus configuration
ADD conf /etc/janus

# Prepare the system
RUN /root/build/setup.sh

# Install dependencies
RUN /root/build/dependencies.sh

# Install extras
RUN /root/build/extras.sh

# Update libsrtp 1.5.0 to avoid Janus issues with the default 1.4.x
RUN /root/build/libsrtp.sh

# Install usrsctp for data channel support
RUN /root/build/usrsctp.sh


# Install web sockets support
RUN /root/build/websockets.sh


# Fetch, build and install the gateway
RUN /root/build/janus.sh

# Run http server for the demos
RUN /root/build/http.sh


# Declare the ports we use
EXPOSE 8080 8088 8089 8188 8189 7777

# Cleanup the build libraries
RUN /root/build/cleanup.sh


# Define the default start-up command
CMD /root/build/startup.sh

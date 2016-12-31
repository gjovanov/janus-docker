FROM ubuntu:16.04
MAINTAINER Goran Jovanov <goran.jovanov@gmail.com>


# add build & installation scripts
ADD build /root/build

# add janus configuration
ADD conf /etc/janus

# Prepare the system
RUN /root/build/setup.sh

# Install dependencies
RUN /root/build/dependencies.sh

# Install extras
RUN /root/extras.sh

# Update libsrtp 1.5.0 to avoid Janus issues with the default 1.4.x
RUN /root/build/libsrtp.sh

# Install usrsctp for data channel support
RUN /root/build/usrsctp.sh


# Install web sockets support
RUN /root/build/websockets.sh


# Install and prepare apache
RUN ./apache.sh


# Fetch, build and install the gateway
RUN /root/build/janus.sh


# Declare the ports we use
EXPOSE 80 8088 8188


# Define the default start-up command
CMD /root/build/startup.sh

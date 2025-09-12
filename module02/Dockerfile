FROM ubuntu:latest

LABEL author="nghaddar"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openssh-server nginx tor

# Create user ubuntu if it doesn't exist and set passwords
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu || true && \
    echo 'ubuntu:password' | chpasswd && \
    echo 'root:password' | chpasswd

# Configure SSH
RUN mkdir -p /var/run/sshd
COPY sshd_config /etc/ssh/
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Configure nginx service
COPY nginx.conf /etc/nginx/sites-available/default
RUN mkdir /var/lib/tor-website/
COPY index.html /var/lib/tor-website/

# Configure TOR service
COPY torrc /etc/tor/torrc
RUN mkdir /var/lib/tor/hidden_service/
RUN chown debian-tor:debian-tor /var/lib/tor/hidden_service/ 
RUN chmod 0700 /var/lib/tor/hidden_service/

# Launch everything
WORKDIR /
COPY start.sh .
RUN chmod +x start.sh
CMD [ "/start.sh" ]
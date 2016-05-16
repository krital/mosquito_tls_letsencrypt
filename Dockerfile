FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openssl git

RUN mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN wget https://letsencrypt.org/certs/isrgrootx1.pem
RUN git clone https://github.com/certbot/certbot
WORKDIR /etc/mosquitto/certbot
RUN./certbot-auto --help

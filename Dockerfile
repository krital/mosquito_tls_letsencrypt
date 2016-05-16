FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openssl

RUN mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN wget https://letsencrypt.org/certs/isrgrootx1.pem

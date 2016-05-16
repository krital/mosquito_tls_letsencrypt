FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>



USER root
RUN echo "root:Mosquitto!" | chpasswd
RUN sudo apt-get update
RUN sudo apt-get upgrade -y
RUN apt-get install openssl git -y

RUN mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN chown -R mosquitto /etc/mosquitto
#RUN wget https://letsencrypt.org/certs/isrgrootx1.pem
USER mosquitto
RUN git clone https://github.com/certbot/certbot
WORKDIR /etc/mosquitto/certbot
RUN ./certbot-auto --help


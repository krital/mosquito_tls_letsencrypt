FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>

#RUN sudo apt-get update
#RUN sudo apt-get upgrade -y
RUN sudo apt-get install openssl git -y

RUN sudo mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN sudo chown -R mosquitto /etc/mosquitto
#RUN wget https://letsencrypt.org/certs/isrgrootx1.pem
RUN git clone https://github.com/certbot/certbot
WORKDIR /etc/mosquitto/certbot
RUN ./certbot-auto --help

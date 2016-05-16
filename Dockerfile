FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>



USER root

RUN sudo apt-get update
RUN sudo apt-get upgrade -y
RUN apt-get install openssl git  -y
RUN echo 'root:Mosquitto!' | chpasswd

RUN mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN chown -R mosquitto /etc/mosquitto
#RUN wget https://letsencrypt.org/certs/isrgrootx1.pem
#USER mosquitto
RUN git clone https://github.com/certbot/certbot
WORKDIR /etc/mosquitto/certbot
#USER root
RUN ./certbot-auto certonly --standalone -n -d example.com -d www.example.com
USER mosquitto
RUN printenv

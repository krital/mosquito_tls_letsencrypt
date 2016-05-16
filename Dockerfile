FROM ansi/mosquitto

MAINTAINER Alex Kritikos <alex@kritikal.org>



USER root

RUN sudo apt-get update
RUN sudo apt-get upgrade -y
RUN apt-get install openssl git augeas-lenses dialog libaugeas0 libexpat1-dev libffi-dev libpython-dev libpython2.7 libpython2.7-dev python-dev python-pkg-resources python-setuptools python-virtualenv python2.7-dev  -y
RUN echo 'root:Mosquitto!' | chpasswd

RUN mkdir -p /etc/mosquitto
WORKDIR /etc/mosquitto
RUN chown -R mosquitto /etc/mosquitto
#RUN wget https://letsencrypt.org/certs/isrgrootx1.pem
#USER mosquitto
RUN git clone https://github.com/certbot/certbot
WORKDIR /etc/mosquitto/certbot
#USER root
RUN ./certbot-auto certonly --standalone -n --agree-tos --email alex@kritikal.org -d example.com -d www.example.com --config-dir /etc/mosquitto --work-dir /etc/mosquitto --logs-dir /etc/mosquitto
USER mosquitto
RUN printenv

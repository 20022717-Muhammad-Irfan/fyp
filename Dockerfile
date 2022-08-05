FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install net-tools
RUN apt-get install -y wget
RUN wget https://downloadsapachefriends.global.ssl.fastly.net/8.1.6/xampp-linux-x64-8.1.6-0-installer.run?from_af=true
RUN chmod 755 xampp-linux-x64-8.1.6-0-installer.run?from_af=true
RUN ./xampp-linux-x64-8.1.6-0-installer.run?from_af=true --mode unattended
RUN rm xampp-linux-x64-8.1.6-0-installer.run?from_af=true

VOLUME ["opt/lampp/htdocs"]

COPY . /opt/lampp/htdocs
COPY httpd-xampp.conf /opt/lampp/etc/extra

RUN /opt/lampp/lampp start

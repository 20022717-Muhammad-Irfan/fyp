FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install net-tools
RUN apt-get install dialog apt-utils 
RUN apt-get install -y wget
RUN wget https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.1.6/xampp-linux-x64-8.1.6-0-installer.run/download
RUN chmod 755 download
RUN ./download --mode unattended
RUN rm download

VOLUME ["opt/lampp/htdocs"]

COPY . /opt/lampp/htdocs
COPY httpd-xampp.conf /opt/lampp/etc/extra

RUN /opt/lampp/lampp start

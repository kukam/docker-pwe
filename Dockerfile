FROM debian:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apt-get clean all
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install perl libcgi-fast-perl libclass-inspector-perl cstocs libmail-rfc822-address-perl libjson-perl libtemplate-perl libdbd-mysql-perl libdbd-pg-perl libmoose-perl
RUN apt-get -y install git procps net-tools
RUN apt-get clean all
RUN git clone https://github.com/kukam/PWE.git /PWE
WORKDIR /PWE
RUN git pull
RUN git reset --hard
ADD https://raw.githubusercontent.com/kukam/docker-pwe/master/nginx-genericweb.conf /NGINX/generic/default.conf
RUN cat /NGINX/generic/default.conf
VOLUME /PWE
VOLUME /NGINX

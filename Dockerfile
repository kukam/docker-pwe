FROM debian:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apt-get clean all
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install libterm-ui-perl
RUN apt-get -y install procps net-tools perl libcgi-fast-perl libclass-inspector-perl cstocs libmail-rfc822-address-perl libjson-perl libtemplate-perl
RUN apt-get -y install bsdtar wget
RUN wget -qO- https://github.com/kukam/PWE/archive/master.zip | bsdtar -xvf-
RUN mv /PWE-master /PWE
RUN apt-get clean all

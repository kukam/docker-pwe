FROM debian:latest

RUN apt-get clean all
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install procps net-tools perl libcgi-fast-perl libclass-inspector-perl cstocs libmail-rfc822-address-perl libjson-perl libtemplate-perl
RUN apt-get -y install subversion
#RUN yes 't' | svn --non-interactive --no-auth-cache --trust-server-cert co https://svn.freebox.cz/PWE/trunk /PWE
RUN apt-get clean all

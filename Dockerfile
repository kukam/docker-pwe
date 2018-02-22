FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add git bash \
    && git clone https://github.com/kukam/PWE /PWE

VOLUME /PWE
WORKDIR /PWE

#CMD cp -r /PWE.git/* /PWE
#CMD git clone https://github.com/kukam/PWE /PWE
CMD git pull

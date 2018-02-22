FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add git bash \
    && git clone --no-checkout repo-to-clone https://github.com/kukam/PWE /PWE.temp

COPY entrypoint.sh /entrypoint.sh

VOLUME /PWE
WORKDIR /PWE

ENTRYPOINT ["/entrypoint.sh"]
#CMD cp -r /PWE.git/* /PWE
#CMD git clone https://github.com/kukam/PWE /PWE
#CMD git pull

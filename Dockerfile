FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add git bash && \
  rm -fr /PWE && \
  rm -fr /PWEtemp && \
  mkdir /PWEtemp && \
  mkdir /PWE && \
  git clone https://github.com/kukam/PWE.git /PWEtemp && \
  mv /PWEtemp/* /PWE && \
  mv /PWEtemp/.git /PWE && \
  rm -fr /PWEtemp && \
  rm -fr /var/cache/apk/*

VOLUME /PWE

WORKDIR /PWE

CMD git pull

FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

VOLUME /PWE

RUN apk --no-cache add --update git bash && \
  rm -fr /var/cache/apk/* && \
  rm -fr /PWE/*
  git clone https://github.com/kukam/PWE.git /PWE

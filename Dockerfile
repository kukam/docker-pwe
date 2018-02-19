FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add git bash && \
  rm -fr /PWE && \
  rm -fr /PWEtemp && \
  mkdir /PWEtemp && \
  mkdir /PWE && \
  git clone https://github.com/kukam/PWE.git /PWEtemp

VOLUME /PWE

RUN cp -r /PWEtemp/* /PWE

WORKDIR /PWE

CMD git pull

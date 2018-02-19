FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

VOLUME /PWE

RUN apk --no-cache add --update git bash && \
  rm -fr /var/cache/apk/* && \
  git clone https://github.com/kukam/PWE.git /PWEtemp && \
  mv /PWEtemp/* /PWE && mv /PWEtemp/.git /PWE && rm -fr /PWEtemp

WORKDIR /PWE
ENTRYPOINT ["git pull"]

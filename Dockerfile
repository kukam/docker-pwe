FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache add --update git bash && \
  rm -fr /var/cache/apk/* && \
  git clone https://github.com/kukam/PWE.git /PWE

VOLUME /PWE

WORKDIR /PWE

ENTRYPOINT [ "git pull" ]

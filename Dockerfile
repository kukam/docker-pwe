FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add git bash && \
    mkdir -p /PWE
    
#  git clone https://github.com/kukam/PWE.git /PWE.git

VOLUME /PWE

#CMD cp -r /PWE.git/* /PWE
CMD git clone https://github.com/kukam/PWE /PWE

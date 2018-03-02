FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add subversion git bash 

VOLUME /PWE
WORKDIR /PWE

CMD if [[ -d .svn ]]; then svn up; else svn co https://github.com/kukam/PWE.git ./; fi

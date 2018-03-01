FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

RUN apk --no-cache --update add subversion bash 
    #&& git clone --no-checkout https://github.com/kukam/PWE /PWE.temp

#COPY ./entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

VOLUME /PWE
WORKDIR /PWE

#ENTRYPOINT /entrypoint.sh

#CMD ["svn", "co", "https://github.com/kukam/PWE/trunk", "./"]
CMD if [[ -d .svn ]]; then svn up; else svn co https://svn.freebox.cz/PWE/trunk ./; fi

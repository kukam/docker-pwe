FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

ENV PWESOURCE 'https://github.com/kukam/PWE/trunk'
ENV MYPROJECT 'https://github.com/kukam/PWE/trunk/examples/generic_web'
ENV PWE_CONF_pwe_home '/PWE/webapps/myproject'

ADD https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm /usr/local/bin/cpanm
RUN chmod +x /usr/local/bin/cpanm

#    curl tar gcc build-base gnupg \ 
RUN apk --update --no-cache add bash subversion wget make perl gcc musl-dev perl-dev \
    perl-cgi-fast perl-class-inspector perl-json perl-lwp-mediatypes perl-moose \
    perl-template-toolkit perl-dbi perl-dbd-pg perl-dbd-odbc perl-dbd-mysql \
    && cpanm Cz::Cstocs \
    && cpanm Mail::RFC822::Address \
    && cpanm Devel::OverloadInfo \
    && rm -fr ./cpanm /root/.cpanm \
    && rm -fr /var/cache/apk/*

RUN svn co ${PWESOURCE} /PWE

#COPY ./entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

EXPOSE 7779

VOLUME ${PWE_CONF_pwe_home}
WORKDIR ${PWE_CONF_pwe_home}

#ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT if [[ -d .svn ]]; then svn up; else svn co ${MYPROJECT} ${PWE_CONF_pwe_home} fi

CMD ["perl", "pwe.fcgi"]

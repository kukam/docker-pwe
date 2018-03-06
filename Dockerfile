FROM alpine:latest

MAINTAINER kukam <kukam@freebox.cz>

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

EXPOSE 7779

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV PWESOURCE 'https://github.com/kukam/PWE/trunk'
ENV MYPROJECT 'https://github.com/kukam/PWE/trunk/examples/generic_web'

VOLUME /PWE

ENTRYPOINT ["/entrypoint.sh"]

CMD ["perl", "pwe.fcgi"]

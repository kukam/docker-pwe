#!/bin/sh

if [ -d "/PWE/.svn" ]; then
    svn up /PWE
else
    svn co $PWESOURCE /PWE
fi

if [ -d "/PWE/webapps/myproject/.svn" ]; then
    svn up ./
else
    svn co $MYPROJECT /PWE/webapps/myproject
fi

cd /PWE/webapps/myproject

export PWE_CONF_pwe_home="/PWE/webapps/myproject"

exec "$@"

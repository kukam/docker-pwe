#!/bin/sh

if [ -d .svn ]; then
    svn up ./
else
    svn co $MYPROJECT ./
fi

exec "$@"

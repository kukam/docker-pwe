#/bin/sh

if [ ! -d "/PWE/.git" ]; then
    cp -r /PWE.temp/.git /PWE
    cd /PWE
    git reset --hard HEAD
fi

exec git pull

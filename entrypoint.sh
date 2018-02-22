#/bin/sh

if [ ! -d "/PWE/.git" ]; then
    cp -r /PWE.temp/.git /PWE
    git reset --hard HEAD
fi

git pull

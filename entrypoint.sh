#/bin/sh

if [ ! -d "/PWE/.git" ]; then
    cp -r /PWE.temp/.git /PWE
fi

git reset --hard HEAD
git pull

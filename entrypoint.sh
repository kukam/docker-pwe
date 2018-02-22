/bin/sh

if [ ! -d .git ]; then
    cp -r /PWE.temp/.git /PWE
    cd /PWE
    git reset --hard HEAD
fi

git pull

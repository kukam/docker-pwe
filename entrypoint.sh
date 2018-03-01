#/bin/sh

if [ ! -d ".git" ]; then
    git clone https://github.com/kukam/PWE ./
    #cp -r /PWE.temp/.git /PWE
fi

git reset --hard HEAD
git pull

#!/bin/bash
cd /aptly/public/

# Key
gpg --armor --output /aptly/public/Release.gpg --export $KEY_ID

echo "
    echo 'GPGKEY' | apt-key add -
    echo deb URLADD URLMAIN
    apt update
" | sed "s|GPGKEY|$(cat Release.gpg)|g" | sed "s|URLADD|$URL_REPO|g" | sed "s|URLMAIN|$(ls pool/)|g" > add-repo.sh

# Criando algumas pastas e publicando
mkdir -p /public
mkdir -p $WORKDIR_SH23/public
cp -rf /aptly/public/* /public
cp -rf /aptly/public/* $WORKDIR_SH23/public

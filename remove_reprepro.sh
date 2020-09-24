#!/bin/bash
cd /aptly/public/

# Key
gpg --armor --output /aptly/public/Release.gpg --export $KEY_ID

POOL="$(ls pool/)"
KEYGPG="$(cat Release.gpg)"
echo "
#!/bin/bash
echo 'GPGKEY' | apt-key add -
echo deb URLADD URLMAIN
apt update
" > add-repo.sh

sed -i "s|GPGKEY|$KEYGPG|g" add-repo.sh
sed -i "s|URLADD|$URL_REPO|g" add-repo.sh
sed -i "s|URLMAIN|$POOL|g" add-repo.sh


# Criando algumas pastas e publicando
mkdir -p /public
mkdir -p $WORKDIR_SH23/public
cp -rf /aptly/public/* /public
cp -rf /aptly/public/* $WORKDIR_SH23/public

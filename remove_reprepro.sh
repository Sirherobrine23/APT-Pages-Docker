#!/bin/bash
cd /aptly/public/

# Key
gpg --armor --output /aptly/public/Release.gpg --export $KEY_ID

POOL="$(ls pool/)"
KEYGPG="$(cat Release.gpg)"
echo "
#!/bin/bash
echo '$KEYGPG' | apt-key add -
echo "deb $URL_REPO $DIST $POOL" > /etc/apt/sources.list.d/$DIST.list
apt update
" > add-repo.sh

# Criando algumas pastas e publicando
mkdir -p /public
mkdir -p $WORKDIR_SH23/public
cp -rf /aptly/public/* /public
cp -rf /aptly/public/* $WORKDIR_SH23/public

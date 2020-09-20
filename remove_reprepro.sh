#!/bin/bash
cd /aptly/public/

# Key
gpg --armor --output /aptly/public/Release.gpg --export $KEY_ID

# Criando algumas pastas e publicando
mkdir -p /public
mkdir -p $WORKDIR_SH23/public
cp -rf /aptly/public/* /public
cp -rf /aptly/public/* $WORKDIR_SH23/public

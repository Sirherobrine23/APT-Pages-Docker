#!/bin/bash
echo "Pasta do gpg: $gpg_folder"
mkdir -p "$gpg_folder"
chown -R $(whoami) "$gpg_folder/"
chown -R $(whoami) "$gpg_folder"
chmod 600 "$gpg_folder/*"
chmod 700 "$gpg_folder"
echo "-----------------------------------------------------------------------------------------------"
 echo "default-key $KEY_ID" >> $gpg_folder/gpg.conf
 echo use-agent >> $gpg_folder/gpg.conf
 echo "pinentry-mode loopback" >> $gpg_folder/gpg.conf
 echo "allow-loopback-pinentry" >> $gpg_folder/gpg-agent.conf
 echo "UPDATESTARTUPTTY" | gpg-connect-agent
 echo "RELOADAGENT" | gpg-connect-agent
 gpg -v --passphrase "$pass" --no-tty --batch --yes --import <(cat "keys/$PRIV_KEY")
 gpg -v --import <(cat "keys/$PUB_KEY")
echo "-----------------------------------------------------------------------------------------------"

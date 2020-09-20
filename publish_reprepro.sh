#/bin/bash
cd /aptly/
for as in $(ls /aptly/package/)
do
aptly repo create -distribution=$DIST -component=$as $as
aptly repo add  soft-$as /aptly/package/$as/*.deb

if [ -z $cop ] ;then
  cop="$as"
else
  cop="$cop $as"
fi
if [ -z $cop2 ] ;then
  cop2="$as"
else
  cop2="$cop2,$as"
fi
done

aptly publish repo -passphrase="$pass" -batch -label="$DIST" -component=$cop2 $cop

#/bin/bash
cd /aptly/
for as in $(ls /aptly/package/)
do

aptly repo create -distribution=$DIST -component=$as soft-$as

aptly repo add  soft-$as /aptly/package/$as/*.deb

aptly publish repo -passphrase="$pass" -batch -distribution=$DIST -component=, $as || echo

if [ -z $cop ] ;then
  cop="soft-$as"
else
  cop="$cop soft-$as"
fi

if [ -z $cop2 ] ;then
  cop2="soft-$as"
else
  cop2="$cop2,soft-$as"
fi

if [ -z $virg ] ;then
  echo
else
  virg="$virg,"
fi
done

aptly publish repo -passphrase="$pass" -batch -distribution=$DIST -component=$cop2 || aptly publish repo -passphrase="$pass" -batch -distribution=$DIST -component=$virg $cop

#/bin/bash
cd /aptly/
for as in $(ls /aptly/package/)
do

aptly repo create -distribution=$DIST -component=$as soft-$as

aptly repo add  soft-$as /aptly/package/$as/*.deb

if [ -z $cop ] ;then
  cop="soft-$as"
else
  cop="$cop soft-$as"
fi

if [ -z $virg ] ;then
  echo
else
  virg="$virg,"
fi
done

aptly publish repo -passphrase="$pass" -batch -distribution=$DIST -component=$virg $cop

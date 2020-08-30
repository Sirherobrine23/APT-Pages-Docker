#/bin/bash
cd /aptly/

aptly repo create -component=main -config="/aptly/aptly.conf" $DIST 
aptly repo create -component=contrib -config="/aptly/aptly.conf" $DIST 
aptly repo create -component=non-free -config="/aptly/aptly.conf" $DIST 

aptly repo add $DIST /aptly/package/main/* -component=main -config="/aptly/aptly.conf" $DIST
aptly repo add $DIST /aptly/package/contrib/* -component=contrib -config="/aptly/aptly.conf" $DIST
aptly repo add $DIST /aptly/package/non-free/* -component=non-free -config="/aptly/aptly.conf" $DIST

aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=main -config="/aptly/aptly.conf" -distribution=$DIST $DIST
aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=contrib -config="/aptly/aptly.conf" -distribution=$DIST $DIST
aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=non-free -config="/aptly/aptly.conf" -distribution=$DIST $DIST

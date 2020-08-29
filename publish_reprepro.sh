#/bin/bash
cd /aptly/

aptly repo create $DIST -component=main -config="/aptly/aptly.conf"
aptly repo create $DIST -component=contrib -config="/aptly/aptly.conf"
aptly repo create $DIST -component=non-free -config="/aptly/aptly.conf"

aptly repo add $DIST /aptly/package/main/* -component=main -config="/aptly/aptly.conf"
aptly repo add $DIST /aptly/package/contrib/* -component=contrib -config="/aptly/aptly.conf"
aptly repo add $DIST /aptly/package/non-free/* -component=non-free -config="/aptly/aptly.conf"

aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=main -distribution=$DIST $DIST -config="/aptly/aptly.conf"
aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=contrib -distribution=$DIST $DIST -config="/aptly/aptly.conf"
aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component=non-free -distribution=$DIST $DIST -config="/aptly/aptly.conf"

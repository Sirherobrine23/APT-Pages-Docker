#/bin/bash
cd /aptly/
for as in $(ls /aptly/package/)
do
aptly repo create -config="/aptly/aptly.conf" -component="$as" -distribution="$DIST" $as

aptly repo add -config="/aptly/aptly.conf" $as /aptly/package/$as/*.deb

cop="$cop $as"
done

aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -config="/aptly/aptly.conf" -components=, $cop





#echo "Criando um repositorio"
#aptly repo create -config="/aptly/aptly.conf" $DIST 
#echo "Adicionando os arquivos"
#echo "publicando"
#aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -config="/aptly/aptly.conf" -distribution=$DIST $DIST
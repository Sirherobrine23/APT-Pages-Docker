#/bin/bash
cd /aptly/
#
echo "Criando um repositorio"
aptly repo create -config="/aptly/aptly.conf" $DIST 
echo "Adicionando os arquivos"
aptly repo add -config="/aptly/aptly.conf" $DIST /aptly/package/main/*.deb
echo "publicando"
aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -config="/aptly/aptly.conf" -distribution=$DIST $DIST

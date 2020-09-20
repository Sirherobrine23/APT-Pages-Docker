#/bin/bash
cd /aptly/
for as in $(ls /aptly/package/)
do
aptly repo create -config="/aptly/aptly.conf" -component="$as" -distribution="$DIST" $as

aptly repo add -config="/aptly/aptly.conf" $as /aptly/package/$as/*.deb

aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -distribution=$DIST $as

if [ -z $cop ] ;then
  echo "$cop $as"
  cop="$as"
else
  echo "$as"
  cop="$cop, $as"
fi
done

#aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component="$cop"  $DIST || aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component="$cop"  $DIST -distribution=$DIST || 



#echo "Criando um repositorio"
#aptly repo create -config="/aptly/aptly.conf" $DIST 
#echo "Adicionando os arquivos"
#echo "publicando"
#aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -config="/aptly/aptly.conf" -distribution=$DIST $DIST

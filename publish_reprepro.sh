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


aptly publish repo -passphrase="$pass" -batch -component=$virg $cop -distribution=$DIST





# testes e script velho

#aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component="$cop"  $DIST || aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component="$cop"  -distribution=$DIST $DIST || aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -component="$cop"  -distribution=$DIST $DIST


#echo "Criando um repositorio"
#aptly repo create -config="/aptly/aptly.conf" $DIST 
#echo "Adicionando os arquivos"
#echo "publicando"
#aptly publish repo -passphrase="$pass" -batch -force-overwrite=true -config="/aptly/aptly.conf" -distribution=$DIST $DIST

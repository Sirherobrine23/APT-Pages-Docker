#!/bin/bash
echo "Por qualquer problema nos informe pela issue no seguinte link: https://github.com/Sirherobrine23/APT-Pages-Docke/issues"
echo "E Também uma copia do Log"
export WORKDIR_SH23="$(pwd)"
export gpg_folder=$(gpg-connect-agent --help | grep 'Home:' | sed 's|Home: ||g')
export DIST
export MORE
export DEBUG
export PUB_KEY
export PRIV_KEY
export KEY_ID
export pass
export CONF_FILE
export URL_REPO
echo "--------------------------------------------------------"
echo "O Diretorio está: $WORKDIR_SH23"
echo "A distro selecionada: $DIST"
echo "Opção atual do debug é: $DEBUG"
echo "Seu arquivo de chave publica é: $PUB_KEY"
echo "Seu arquivo de chave privada é: $PRIV_KEY"
echo "Sua id da chave publica e privada é: $KEY_ID"
echo "-------------------------------------------------------"

# Pacotes
cp -r package /aptly/

# Confirações
cp -f $CONF_FILE /aptly/aptly.conf
ln -s /aptly/aptly.conf $HOME/.aptly.conf

# ------------------------------------------------------
key
# ------------------------------------------------------
if [ $? = 0 ];then
 publish_reprepro
else
 echo "Sua chave não foi Importada ou teve algun erro, por favor verique as confiurações e o logs ou se não deixe uma issue no https://github.com/Sirherobrine23/APT-Pages-Docke/issues"
 exit 127
fi
# ------------------------------------------------------
if [ $? = 0 ];then
 remove_reprepro
else
 echo "Tivemos algun erro no reprepro ou não foi executado normamente, por favor verifique suas confiurações ou deixe uma issue no https://github.com/Sirherobrine23/APT-Pages-Docke/issues"
 exit 127
fi
exit 0

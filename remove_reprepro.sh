#!/bin/bash
cd /aptly/public/
rm -r db/
rm -r conf/
echo "
<html>
    <head>
        <title>Olâ Visitante - Hello visitor</title>
        <style>
            body{
                margin-top: 8%;
                margin-left: 5%;
                margin-right: 10%;
                background-color: white;
            }
            p{
                color: Black
            }
            .info{
                color: red;
            }
            .listen{
                background-color: grey;
                color: black;
                border-radius: 15px;
                align: center;
            }
        </style>
    </head>
    <body>
        <main>
            <p>
                Português: <a class="info">Por questão de limitação do Github/Gitlab Pages Não podemos mostrar os diretorios</a>
            </p>
            <p>
                English: <a class="info">Due to limitation of Github/Gitlab Pages We cannot show the directories</a>
            </p>
            <center>
                <div class="listen">
                    <p>
                        <a>add repo</a>
                    </p>
                    <code>wget -O - $URL_REPO/Release.gpg | sudo apt-key add -</code>
                    <br>
                    <p>$DIST sources.list</p>
                    <code>deb $URL_REPO/ $DIST main</code>
                    <p>
                        <a>package list | lista de pacotes</a>
                    </p>
                    <p>--------------------------</p>
" > /aptly/public/index.html

for a in $(find /aptly/public/ -name '*.deb' | sed 's|/aptly/public||g')
do 
echo "
                    <p>
                        <p>
                            <a>---------------</a>
                        </p>
                        <a href=${a}>${a}</a>
                    </p>
" >> /aptly/public/index.html
done

echo "

                </div>
            </center>
        </main>
    </body>
</html>
" >> /aptly/public/index.html

# Key
gpg --armor --output /aptly/public/Release.gpg --export $KEY_ID

# Criando algumas pastas e publicando
mkdir -p /public
mkdir -p $WORKDIR_SH23/public
cp -rf /aptly/public/* /public
cp -rf /aptly/public/* $WORKDIR_SH23/public

#!/bin/bash

cd ~
rm -rf $HOME/moodle
rm -f $HOME/moodle-local_boost_dark
rm -f $HOME/moodle-local_forzaprofilo
rm -f $HOME/moodle-local_confirmdep
rm -rf /var/www/moodledata
rm -rf $MOODLE

##################################################
# clone moodle
cd ~
unzip /opt/moodle-latest-500.zip

##################################################
# git clone dei plugin
cd moodle/local
git clone https://github.com/pieroproietti/moodle-local_boost_dark boost_dark
git clone https://github.com/pieroproietti/moodle-local_confirmdep confirmdep
git clone https://github.com/pieroproietti/moodle-local_forzaprofilo forzaprofilo


##################################################
# mv moodle in /var/www/html
cd ~
mv moodle /var/www/html

##################################################
# creazione dei link
cd ~
ln -s /var/www/html/moodle/local/boost_dark $HOME/moodle-local_boost_dark
ln -s /var/www/html/moodle/local/forzaprofilo $HOME/moodle-local_forzaprofilo
ln -s /var/www/html/moodle/local/confirmdep $HOME/moodle-local_confirmdep

```

## Creazione di user e database moodle
Aprire la pagina di myphpadmin e connettersi con `root/evolutio`

Scegliere `User accounts` e creare il nuovo utente `moodle` con password `evolution`. Ricordare la spunta su `Create database with same name and grant all privileges`. 

Verrà creato l'utente `moodle` ed il database `moodle` sul quale l'utente avrà pieni privilegi.


![](./img/creazione-user-database-moodle.png)

## Installazione Moodle CLI
Ho avuto diversi problemi con l'installazione di moodle da browser, consiglio pertanto l'installazione CLI che è sia più veloce che più accurata. Copia ed incolla:

```
sudo chown www-data $MOODLE
cd $MOODLE/admin/cli
sudo -u www-data /usr/bin/php install.php
sudo chown -R artisan:www-data $MOODLE


#!/bin/bash

##################################################
# cancella i link in $HOME
cd $HOME
rm -f $HOME/moodle-local_*

##################################################
# cancella $MOODLE e /var/www/moodledata
rm -rf /var/www/moodledata
rm -rf $MOODLE

##################################################
# unzip moodle
cd $HOME
unzip /opt/moodle-latest-500.zip
#unzip /opt/moodlehq-moodle-local_codechecker-v5.0.8-0-gb4422b0.zip

##################################################
# git clone dei plugin
cd $HOME/moodle/local
git clone https://github.com/pieroproietti/moodle-local_modalpresentyou modalpresentyou
#git clone https://github.com/pieroproietti/moodle-local_presentyou presentyou

##################################################
# mv moodle in /var/www/html, install codechecker
cd $HOME
mv moodle /var/www/html

##################################################
# composer
cd $MOODLE
composer install

##################################################
# pnpx 
cd $MOODLE
pnpm i
##################################################
# grunt
pnpx grunt ignorefiles
pnpx grunt amd --root=local/modalpresentyou --debug --force
#pnpx grunt amd --root=local/presentyou --debug --force

##################################################
# creazione dei link
cd $HOME
#ln -s $LOCAL/presentyou $HOME/moodle-local_presentyou
ln -s $LOCAL/modalpresentyou $HOME/moodle-local_modalpresentyou

##################################################
# installazione 
sudo chown www-data:www-data $MOODLE -R
cd $MOODLE/admin/cli
sudo -u www-data /usr/bin/php install.php

##################################################
# diritti per tutti, siamo in sviluppo..
sudo chown www-data:www-data $MOODLE -R
# user: www-data: lettura, scrittura, esecuzione; 
# gruppo: www-data lettura, scrittura, esecuzione; 
# altri: nessuno)
sudo chmod 770 $MOODLE -R

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

##################################################
# git clone dei plugin
cd $HOME/moodle/local
git clone https://github.com/pieroproietti/moodle-local_whereareyou whereareyou
cd whereareyou
git checkout ibrido
cd ..

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
grunt amd --root=local/whereareyou --debug --force

##################################################
# creazione dei link
cd $HOME
ln -s $LOCAL/whereareyou $HOME/moodle-local_whereareyou

##################################################
# installazione 
sudo chown www-data:www-data $MOODLE -R
cd $MOODLE/admin/cli
sudo -u www-data /usr/bin/php install.php

##################################################
# diritti per tutti, siamo in sviluppo..
sudo chown www-data:www-data $MOODLE -R
sudo chmod 770 $MOODLE -R

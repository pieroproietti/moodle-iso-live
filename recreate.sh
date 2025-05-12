#!/bin/bash

cd ~
rm -rf $HOME/moodle
rm -f $HOME/moodle-local_boost_dark
rm -f $HOME/moodle-local_codechecker
rm -f $HOME/moodle-local_forzaprofilo
rm -f $HOME/moodle-local_confirmdep
rm -rf /var/www/moodledata
rm -rf $MOODLE
rm -rf moodlehq-moodle-local_codechecker-b4422b0

##################################################
# clone moodle
cd ~
unzip /opt/moodle-latest-500.zip
unzip /opt/moodlehq-moodle-local_codechecker-v5.0.8-0-gb4422b0.zip

##################################################
# git clone dei plugin
cd moodle/local
git clone https://github.com/pieroproietti/moodle-local_boost_dark boost_dark
git clone https://github.com/pieroproietti/moodle-local_confirmdep confirmdep
git clone https://github.com/pieroproietti/moodle-local_forzaprofilo forzaprofilo

##################################################
# mv moodle in /var/www/html
cd $HOME
mv moodle /var/www/html
mv moodlehq-moodle-local_codechecker-b4422b0/ $LOCAL/codechecker

##################################################
# composer
cd $MOODLE
composer install

##################################################
# creazione dei link
cd $HOME
ln -s /var/www/html/moodle/local/boost_dark $HOME/moodle-local_boost_dark
ln -s /var/www/html/moodle/local/codechecker $HOME/moodle-local_codechecker
ln -s /var/www/html/moodle/local/confirmdep $HOME/moodle-local_confirmdep
ln -s /var/www/html/moodle/local/forzaprofilo $HOME/moodle-local_forzaprofilo

##################################################
# installazione 
sudo chown www-data $MOODLE
cd $MOODLE/admin/cli
sudo -u www-data /usr/bin/php install.php
sudo chown -R artisan:www-data $MOODLE

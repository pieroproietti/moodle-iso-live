#!/bin/bash

##################################################
# cancella i link in $HOME
cd $HOME
rm -rf $HOME/moodle
rm -f $HOME/moodle-local_boost_dark
rm -f $HOME/moodle-local_claude
rm -f $HOME/moodle-local_codechecker
rm -f $HOME/moodle-local_confirmdep
rm -f $HOME/moodle-local_forzaprofilo
rm -f $HOME/moodle-local_gemini

##################################################
# cancella $MOODLE e /var/www/moodledata
rm -rf /var/www/moodledata
rm -rf $MOODLE

##################################################
# clone moodle
cd $HOME
unzip /opt/moodle-latest-500.zip
#unzip /opt/moodlehq-moodle-local_codechecker-v5.0.8-0-gb4422b0.zip

##################################################
# git clone dei plugin
cd $HOME/moodle/local
#git clone https://github.com/pieroproietti/moodle-local_boost_dark local_boost_dark
git clone https://github.com/pieroproietti/moodle-local_claude claude
#git clone https://github.com/pieroproietti/moodle-local_codechecker codechecker
#git clone https://github.com/pieroproietti/moodle-local_confirmdep confirmdep
#git clone https://github.com/pieroproietti/moodle-local_forzaprofilo forzaprofilo
git clone https://github.com/pieroproietti/moodle-local_gemini gemini

##################################################
# mv moodle in /var/www/html, install codechecker
cd $HOME
mv moodle /var/www/html
#mv moodlehq-moodle-local_codechecker-b4422b0/ $LOCAL/codechecker

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
pnpx grunt amd --root=local/claude --debug --force
pnpx grunt amd --root=local/gemini --debug --force

##################################################
# creazione dei link
cd $HOME
#ln -s $LOCAL/boost_dark   $HOME/moodle-local_boost_dark
ln -s $LOCAL/claude       $HOME/moodle-local_claude
#ln -s $LOCAL/codechecker  $HOME/moodle-local_codechecker
#ln -s $LOCAL/confirmdep   $HOME/moodle-local_confirmdep
#ln -s $LOCAL/forzaprofilo $HOME/moodle-local_forzaprofilo
ln -s $LOCAL/gemini       $HOME/moodle-local_gemini

##################################################
# installazione 
sudo chown www-data $MOODLE
cd $MOODLE/admin/cli
sudo -u www-data /usr/bin/php install.php
sudo chown -R artisan:www-data $MOODLE

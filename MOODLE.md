# MOODLE
Utilizziamo [Moodle](https://moodle.org/?lang=it) direttamente dal repository [git](git://git.moodle.org/moodle.git ), per facilitarne l'aggiornamento ed il cambio versione.

Dopo i primi esperimenti con la versione `MOODLE_405_STABLE` sono passato a `MOODLE_500_STABLE`, ma è facile passare da una versione all'altra, vedi l'istruzione `git checkout MOODLE_500_STABLE`.

* Moodle 4.5 LTS requires Moodle 4.1 LTS or higher because it is an LTS release.
* Moodle 5.0 has a minimum PHP version of 8.2, therefore it requires Moodle 4.2.3 which was the first version to support PHP 8.2.

## Database
Collegati alla pagina di amministrazione di [pnpmyadmin](./phpmyadmin), login con `root/evolution`, cancella e ricrea il datase moodle.

## Files
Copia ed incolla:

```
sudo rm -R /var/www/moodledata
sudo rm -R /var/www/html/moodle
cd ~
git clone git://git.moodle.org/moodle.git 
cd moodle
git checkout MOODLE_500_STABLE
cd ..
sudo mv moodle /var/www/html
ln -s $HOME/moodle-local_boost_dark /var/www/html/moodle/local/boost_dark
#ln -s $HOME/moodle-local_the_login_popup /var/www/html/moodle/local/the_login_popup
ln -s $HOME/moodle-local_welcomemessage /var/www/html/moodle/local/welcomemessage
sudo chown www-data:www-data /var/www/html
sudo chgrp -R www-data /var/www/html
sudo chmod -R g+rw /var/www/html
find /var/www/html/moodle -type d -exec sudo chmod g+s {} \; # impiega un po'... 1 minuto
ln -s /var/www/html/moodle ~/moodle.link # per comodità
```
## Moduli AMD (Asynchronous module definition)

Per utilizzare i moduli AMD occorre installare [grunt](https://gruntjs.com/) e la versione di nodejs deve essere >=v22.15.0.

```
cd /var/www/html/moodle
```

Queindi compilare i moduli amd.
```
cd [plugin]/amd
npx grunt amd 
```


# Installazione LAMP
Sistema utilizzato Debian 12 (bookworm), apache2, mariadb, php

```
sudo apt-get install apache2 php8.2 mariadb-server php8.2-mysql libapache2-mod-php8.2 php8.2-gd php8.2-curl php8.2-xmlrpc php8.2-intl php8.2-xml php8.2-soap php8.2-zip php8.2-mbstring
```

## apache2.conf
Abilita https:
```
sudo a2enmod ssl
sudo a2ensite default-ssl.conf
```

## php.ini
```
code /etc/php/8.2/apache2/php.ini
```

Aggiungi alla fine:

```
extension=mysql.so 
extension=gd.so
memory_limit = 40M
post_max_size = 80M
upload_max_filesize = 80M 
max_input_vars=25000
```

## mariadb:
Imposta password di root:
```
mysqladmin -u root password "mySecurePassword"
```

Connetti come root:
```
mysql -u root -p
```
Create una password per root@localhost:
```
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('evolution');
```


mysql> CREATE DATABASE moodle CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

## phpmyadmin
```
apt install phpmyadmin
```

Dark theme: download darkwolf theme, and unzip it under `/usr/share/phpmyadmin/themes/darkwolf`, quindi edit `/etc/phpmyadmin/config.inc.php` ed aggiungi la linea `$cfg['ThemeDefault'] = 'darkwolf';`


# moodle installazione/reinstallazione
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


Install grunt

pnpm i
pnpx grunt amd 

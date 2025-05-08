# Installazione LAMP
Sistema utilizzato Debian 12 (bookworm), apache2, mariadb, php

```
sudo apt-get install \
    apache2 \
    libapache2-mod-php8.2 \
    mariadb-server \
    mariadb-client \
    php8.2 \
    php8.2-curl \
    php8.2-gd \
    php8.2-intl \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-soap \
    php8.2-xml \
    php8.2-xmlrpc \
    php8.2-zip \
    phpmyadmin

```

## php.ini
```
code /etc/php/8.2/apache2/php.ini
code /etc/php/8.2/cli/php.ini
```

Aggiungi ad inizio:

```
[PHP]

;;;;;;;;;;;;;;;; MOODLE ;;;;;;;;;;;;;;;
extension=mysql.so             # moodle
extension=gd.so                # moodle
memory_limit = 40M             # moodle
post_max_size = 80M            # moodle
upload_max_filesize = 80M      # moodle 
max_input_vars=25000           # moodle
;;;;;;;;;;;;;;;; MOODLE ;;;;;;;;;;;;;;;
```

## mariadb:
Imposta password di root:
```
sudo mysqladmin -u root password "evolution"
```
# phpmyadmin theme

Dark theme: download darkwolf theme
```
wget https://files.phpmyadmin.net/themes/darkwolf/5.2/darkwolf-5.2.zip
```

unzip it:
```
unzip darkwolf-5.2.zip
```
Quindi copialo in:
```
mv darkwolf /usr/share/phpmyadmin/themes/
```

A questo punto, edita `/etc/phpmyadmin/config.inc.php` ed aggiungi la riga:

```
$cfg['ThemeDefault'] = 'darkwolf';
```

# nodejs
Install nodejs > 22 needing for moodle:
```
curl -fsSL https://deb.nodesource.com/setup_23.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
sudo apt upgrade
sudo apt autoremove --purge
sudo npm i npm -g
sudo npm i pnpm -g
```

# permessi in `/var/www`
Non ci sono ancora file in `/var/www`;

```
sudo chgrp -R www-data /var/www
sudo chmod -R g+w /var/www
```

Ora dovresti riuscire a leggere/scrivere in `/var/www`


# Installazione LAMP
Sistema utilizzato Debian 12 (bookworm), apache2, mariadb, php

```
sudo apt-get install apache2 php8.2 mariadb-server php8.2-mysql libapache2-mod-php8.2 php8.2-gd php8.2-curl php8.2-xmlrpc php8.2-intl php8.2-xml php8.2-soap php8.2-zip php8.2-mbstring
```

## apache2.conf
Abilita https:
```
# sudo a2enmod ssl
# sudo a2ensite default-ssl.conf
```

## php.ini
```
code /etc/php/8.2/apache2/php.ini
```

Aggiungi inizio

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



# mdk (Moodle development kit)

MDK (Moodle Development Kit) è uno strumento essenziale per sviluppatori Moodle che semplifica la creazione, il testing e la gestione di ambienti di sviluppo per plugin Moodle. Ecco a cosa serve nel dettaglio:

Link: 
* [mdk](https://github.com/FMCorz/mdk)
* [wiki](https://github.com/FMCorz/mdk/wiki)


Tipico comando:
```
mdk create --version 500 --install --engine mariadb --run dev
```

# Installazione su Debian
Installa prerequisiti:

```
sudo apt install pkg-config default-libmysqlclient-dev build-essential
```

```
sudo apt-get install python3-pip default-libmysqlclient-dev libpq-dev python3-dev unixodbc-dev
```

```
sudo apt istall pipx
```

Installazione

```
pipx install moodle-sdk
```
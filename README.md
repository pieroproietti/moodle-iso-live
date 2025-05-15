# README

`moodledev` è una semplice live Debian bookworm, adattata per lo sviluppo con [moodle](./MOODLE.md). La puoi scaricare liberamente dal mio [drive](https://drive.google.com/drive/folders/18QIqicyecLMuU1Zmb2E039gWawzZuy3e?dmr=1&ec=wgc-drive-globalnav-goto), cerca `egg_of-debian-booworm-moodledev_amd64_...`.

Avviata la live, potrete utilizzarla così com'è, oppure installare il sistema utilizzando l'installer grafico calamares.

## User/password

* L'utente mariadb è `root/evolution`
* L'utente di [phpmyadmin](http://moodledev/phpadmin) è `phpmyadmin/evolution`
* L'utente amministratore di [moodle](http://moodledev/moodle) è: `admin/evolution`
* La cartella `moodle` è sotto `/var/www/html`
* La cartella `moodledata` è sotto `/var/www/moodledata`

## vscode extensions
Sono installate le estensioni per visual studio code: 
* [PHP InselliSense](https://marketplace.visualstudio.com/items?itemName=zobo.php-intellisense)
* [MDLCode - Moodle Plugin Development](https://marketplace.visualstudio.com/items?itemName=LMSCloud.mdlcode)

## [Plugin in sviluppo](https://github.com/pieroproietti?tab=repositories&q=moodle-&type=&language=&sort=)
Sto sviluppando alcuni semplici plugin per acquisire esperienza, li potete trovare [qui](https://github.com/pieroproietti?tab=repositories&q=moodle-&type=&language=&sort=).

## Guida sviluppo
* [Developer Resource centre](https://moodledev.io/)
* [Welcome to the Moodle community](https://moodle.org/)

# Utilizzo
Questa immagine ISO live può essere utilizzata così com'è all'interno di un virtualizzatore come [boxes](https://apps.gnome.org/en/Boxes/), [proxmox ve](https://pve.proxmox.com/wiki/Main_Page), [virtualbox](https://www.virtualbox.org/) o copiata all'interno di una USB formattata con [ventoy](https://www.ventoy.net/en/index.html).

Potete, infine, masterizzarla su una chiavetta USB con strumenti come [balena etcher](https://etcher.balena.io/), [rufus](https://rufus.ie/it/) o similari.


![](./img/install-system.png)
La live è comodissima per fare test e sperimentare, ad ogni riavvio avremo un sistema pulito e scevro dai nostri esperimenti precedent, tuttavia  questo non sempre è desiderabile e, Con il passare del tempo, se ne consiglia l'installazione.

Per l'installazione cliccate semplicemente sull'icona dell'installer, verrà avviato l'installer GUI calamares.

## Impostazioni di rete
Io ricorro a questa strategia: 
* rilevo l'indirizzo ip di una VM e lo pongo sul mio file `/etc/hosts`, esempio:
```
...
192.168.1.63 lampdev
192.168.1.14 moodledev
...
```

Poichè normalmente l'ip rilasciato dal server dhcp persiste per la stessa scgeda, non ho particolari problemi a connettermi al sito http://moodledev. Quando distruggo la VM, semplicemente aggiorno la mia riga in `/etc/hosts`.

In ogni modo è possibile anche impostare manualmente l'ip della rete, come in figura.

![](./img/configura-rete.png)


Potete usarlo anche da questa, o da qualsiasi computer in rete che abbia impostato la risoluione per `moodledev`

## Login su moodledev
Aprite il vostro browser all'indirizzo: `http://moodledev/` e cliccate sul link [moode]
![](./img/moodledev-login.png)

Non vi resta che eseguire il login con `admin/Evolution@1` e buona avventura!


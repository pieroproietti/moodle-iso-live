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

# Moodle tool pluginskel

Non esiste più il comando `mdk generate plugin`, sostituito da [Moodle tool pluginskel](https://github.com/mudrd8mz/moodle-tool_pluginskel).

Anche questo è un mezzo casino, l'ho ]installato](https://docs.moodle.org/500/en/index.php?title=Plugin_skeleton_generator&_gl=1%2Ahcxea2%2A_ga%2AMTU1NzY3NDkzNi4xNzQ1ODUzMDQ4%2A_ga_QWYJYEY9P5%2AMTc0NjQyMjA0My4xNC4xLjE3NDY0MjIwNTEuMC4wLjA.#Installation), poi sono andato in [Generate plugin skeleton](http://moodledev/moodle/admin/tool/pluginskel/index.php?) ed è una babele.

Non aiuta anche il fatto che la prima cosa che dice è che non è compatibile con il moderno tema `boost`, bisognorebbe usare una `recipe.yaml`, che però può essere costruita anche riempiendo le varie sezioni.

Conceptually, the recipe is split into three different parts:

The first part represents the options needed to create the version.php file and the language strings file located at `lang/en/<component>.php`. These two files are mandatory for all plugins, regardless of the plugin type, and the options 
are declared at the top level of the recipe. These are:

* component, name, release, version, requies, maturiy, copyright, dependencies, lang_strings

The second part consists of features that are common to (most) all plugin types. This in turn is split into two sub-parts:

* Options that have a boolean value and they control if a file is to be generated or not. These are defined under the features section of the recipe. They are:
install, uninstall, settings, readme, license, upgrade, upgradelib
* Options that needed to be defined as an array (either associative or numerically indexed). They reside at the top level of the recipe and they are:
capabilities, message_providers, cli_scripts, observers_events, mobile_addons, phpunit_tests

The last part consists of plugin specific features. All features that correspond to a plugin type will be under the `<componenttype>_features` section of the recipe.

Explanation about what the features do as well as links to relevant Moodle documentation for each of the above options can be found on the web interface, by clicking the help icons.

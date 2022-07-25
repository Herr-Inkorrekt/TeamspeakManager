# TeamspeakManager


#Installations Anleitung
Hinzufügen der Pakete

<code>sudo apt-get install tmux mailutils postfix curl file  libmariadb2</code>

wenn eine Fehlermeldung kommt unter Ubuntu 14.04
dann nimmt den Befehl

<code>sudo apt-get install tmux mailutils postfix curl file</code>

und

<code>sudo dpkg --add-architecture i386; sudo apt-get install lib32gcc1 libstdc++6:i386</code>




#Neuen User Anlegen

<code>adduser ts3server</code>

<code>su - ts3server</code>




#Als nächstes die Datei runterladen und Rechte setzten

<code>wget https://raw.githubusercontent.com/Blacktiger21/TeamspeakManager/master/TeamSpeak3/ts3server</code>

<code>chmod 777 ts3server</code>



#Zuletzt ausführen und den Anweisungen folgen

<code>./ts3server install</code>


#Weite Befehle

Für Alle Kommands

<code>./ts3server</code>

Zum Starten

<code>./ts3server start</code>

Zu Stoppen

<code>./ts3server stop</code>

Für den Restart

<code>./ts3server restart</code>

Für Infos über den Server

<code>./ts3server details</code>

Der Debug modus

<code>./ts3server debug</code>

Für ein Backup

<code>./ts3server backup</code>

#Hier findest du die log Datein

<code>/home/ts3server/logs</code>

#Um Befehle zu Automatisieren tippt ihr folgendes ein

<code>crontab -e</code>

wichtig! Tausche den Username Und Gameserver Gehen deine Einstellungen aus

Hier ist ein Beispiel von einem Automatisierten Befehl der jede 3 Minuten ausgeführt wird

<code>*/3 * * * * /home/username/gameserver monitor > /dev/null 2>&1</code>

das ist ein Beispiel auf root Basis der auch jede 3 Minuten ausgeführt wird

<code>*/3 * * * * su - username -c '/home/username/gameserver monitor' > /dev/null 2>&1</code>

für ein Tägliches Backup Diesen befehl nutzen


<code>. * 0 * * * /home/username/gameserver monitor > /dev/null 2>&1</code>


# TeamspeakManager


#Installations Anleitung
Hinzufügen der Pakete

sudo apt-get install tmux mailutils postfix curl file  libmariadb2

wenn eine Fehlermeldung kommt unter Ubuntu 14.04
dann nimmt den Befehl

sudo apt-get install tmux mailutils postfix curl file

und

sudo dpkg --add-architecture i386; sudo apt-get install lib32gcc1 libstdc++6:i386

Neuen User Anlegen

adduser ts3server

su - ts3server

Als nächstes die Datei runter-laden und Rechte setzten

wget https://raw.githubusercontent.com/Blacktiger21/TeamspeakManager/master/TeamSpeak3/ts3server

chmod 777 ts3server

zuletzt ausführen und den Anweisungen folgen

./ts3server install

#Weite Befehle

Für Alle Kommands

./ts3server

Zum Starten

./ts3server start

Zu Stoppen

./ts3server stop

Für den Restart

./ts3server restart

Für Infos über den Server

./ts3server details

Der Debug modus

./ts3server debug

Für ein Backup

./ts3server backup

#Hier findest du die log Datein

/home/ts3server/logs

#Um Befehle zu Automatisieren tippt ihr folgendes ein

crontab -e

wichtig! Tausche den Username Und Gameserver Gehen deine Einstellungen aus

Hier ist ein Beispiel von einem Automatisierten Befehl der jede 3 Minuten ausgeführt wird

*/3 * * * * /home/username/gameserver monitor > /dev/null 2>&1

das ist ein Beispiel auf root Basis der auch jede 3 Minuten ausgeführt wird

*/3 * * * * su - username -c '/home/username/gameserver monitor' > /dev/null 2>&1



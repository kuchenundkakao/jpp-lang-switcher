# Jackbox Party Pack Language Switcher
Ein simples VB-Skript für Windows, um schnell zwischen der lokalisierten Sprachversion und der originalen Sprachversion von Jackbox Party Packs zu wechseln

## Wie geht das?
- Als erstes benötigst du ein Jackbox Party Pack
- Danach besorgst du dir das passende Language Pack für deine Sprache (weitere Informationen hier: https://steamcommunity.com/groups/JackboxMods)
- Und natürlich dieses Repository. Lade es einfach über "Code" -> "Download Zip" herunter und entpacke es da, wo es dir am besten passt.

## Schritt 1: Anpassen des Installationspfades
Du benötigst zuerst den Installationspfad des Jackbox Party Packs (also den Ordner, wo die Originaldateien auf deinem PC gespeichert sind). 

Wenn du das Spiel über Steam erworben hast, kannst du den Installationspfad wie folgt finden:
- Öffne Steam und gehe auf den "Bibliothek"-Tab
- Finde das Jackbox Party Pack auf der linken Seite und klicke mit der RECHTEN Maustaste auf den Eintrag
- Klicke im Kontextmenü auf den Punkt "Eigenschaften"
- Wähle im sich öffnenden Fenster auf der linken Seite den Punkt "Lokale Dateien" aus.
- Du kannst jetzt auf der rechten Seite bei "Größe der lokalen Dateien" eine Schaltfläche "Durchsuchen" anklicken. Es müsste sich nun ein Fenster des Windows-Explorers öffnen, das dir den Speicherort des Spieles anzeigt.
- Je nach Windows-Version solltest du jetzt in die Titelzeile (da wo z.B. "Steam > common > The Jackbox Party Pack 3" drinsteht) klicken können, so dass dir der komplette Pfad angezeigt wird. (Bei mir ist das z.B. "C:\Program Files (x86)\Steam\steamapps\common\The Jackbox Party Pack 3"). Kopiere diesen Pfad nun per Rechtsklick und "Kopieren" in die Zwischenablage.
- Öffne nun die Dateien "Switch to Localized.vbs" und "Switch to Original.vbs" aus dem Language Switcher Archiv zum Bearbeiten. Klicke dazu mit der rechten Maustaste auf die entsprechende Datei und wähle im Kontextmenü den Eintrag "Bearbeiten" aus.
- In der obersten Zeile findest du folgenden Eintrag: gamedir = "INSTALLATIONSPFAD HIER EINFUEGEN"
- Füge bitte den Installationspfad des Spieles zwischen den Anführungsstrichen ein, so dass es z.B. so aussieht: gamedir = "C:\Program Files (x86)\Steam\steamapps\common\The Jackbox Party Pack 3"
- Bitte beachte: Das muss in beiden Dateien gemacht werden!
- Speichere die Dateien und schließe die Editoren

## Schritt 2: Entpacken der lokalisierten (übersetzten) Dateien am richtigen Ort
- Öffne im Explorer den Ordner, in dem du den Language Switcher entpackt hast. Du müsstest dort folgende Dateien vorfinden:
  - Switch to Localized.vbs
  - Switch to Original.vbs
- Erstelle zunächst einen Unterordner mit dem Ordnernamen **localized_files** und **backup_original_files** . **_Diese Ordner MÜSSEN vorhanden sein. Leider lässt mich github keine leeren Ordner erstellen_** 
- öffne den neuen Unterordner "localized_files".
- entpacke hier das Language Pack für das entsprechende Jackbox Party Pack. Die Spieldateien und Ordner müssen direkt in diesem Ordner liegen. Wenn du das Language Pack von github heruntergeladen hast, gibt es zuerst noch einen Hauptordner mit dem Namen des Jackbox Party Packs, du musst die Dateien daraus also eine Ebene höher verschieben, so dass diese direkt im Ordner "localized_files" liegen. Gehe einfach sicher, dass die Dateien so entpackt werden, dass der Ordner "games" direkt im Ordner "localized_files" liegt ;)

## Schritt 3: Let's switch it up, baby!
Wenn du nun die Datei "Switch to Localized.vbs" doppelklickst, sollte ein Skript ausgeführt werden, das folgendes tut:
- Die Dateien, die im Ordner localized_files liegen, werden erfasst.
- Pro Datei wird dann folgendes geprüft:
-- Wenn im Jackbox Party Pack Installationsordner eine Datei im gleichen Unterverzeichnis liegt, wird die Originaldatei in den Ordner "backup_original_files" kopiert (mit der gleichen Verzeichnisstruktur)
-- Die Datei aus dem Verzeichnis localized_files wird dann in den entsprechenden Ordner im Jackbox Party Pack-Ordner kopiert, die originale Datei wird dabei überschrieben.
- Am Schluss wird noch eine kleine Anzeige ausgegeben, dass der Vorgang erfolgreich abgeschlossen wurde.

## Das kann eine Weile dauern, und es sieht so aus, als würde nix passieren!
Ich habe noch nicht rausgefunden, wie man Fortschrittsanzeigen mit VBS machen kann. Kommt vielleicht noch. Wenn du das Gefühl hast, dass nun wirklich lange nichts passiert ist (länger als 10 Minuten) und du dich fragst, ob das Skript überhaupt läuft, kannst du das wie folgt überprüfen:
- Öffne den Task Manager
- Stelle sicher, dass die Version mit allen Details angezeigt wird (bei Windows 10 gibt es unten einen Punkt "Mehr Details" den müsst ihr anklicken)
- Wenn du in der Auflistung aller Anwendungen (Sowohl "Apps" wie auch "Hintergrundprozesse") "Microsoft ® Windows Based Script Host" findest, läuft das Skript noch.

## Jackbox Party Time!
Du kannst nach Abschluss des Skripts dein Jackbox Party Pack wie gewohnt starten und dich (sofern dieses Spiel übersetzt wurde) über Inhalte in deiner Landessprache freuen.

## I gotta get back to Hogwarts!
Wenn du das Jackbox Party Pack wieder auf die Originalsprache zurückstellen willst, führe das Skript "Switch to Original" aus. Es werden dann die Dateien aus dem "backup_original_files" Ordner wieder zurück in das Installationsverzeichnis kopiert und die geänderten Dateien überschrieben.

# Und nun viel Spaß!

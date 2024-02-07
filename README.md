# MySQL Übungen mit PDO

In dieser [Übung](https://docs.google.com/document/d/1ht-i8_ZtafdFU2oQcX4sOuE9ANa9h9oZQwxjGs-D9ko/edit?usp=sharing) lernst Du den Umgang mit MySQL in PDO.

## Start

Um zu starten, musst Du zuerst den Docker Container starten und dann die Tabelle **books.sql** in die Datenbank importieren. Und so geht's:

### Docker

1. Um den Container zu starten führe folgeden Befehl aus:

```bash
docker compose up
```

2. Um den Container zu stoppen, führe folgenden Befehl aus:

```bash
docker compose down
```

3. Um phpMyAdmin zu öffenen, verwende folgende URL:

```bash
http://localhost:8080/
```

4. Um index.php zu öffenen, verwende folgende URL:

```bash
http://localhost:8000/
```

### Tabelle importieren

Um die Tabelle in die Datenbank zu importieren, **öffnest Du PHPMyAdmin** und klickst auf der linken Seite auf die **Datenbank "library"**. Oben findest Du den Button **"Importieren"** - klicke darauf. Auf der neuen Seite kannst Du über **"Choose File"**, die Tabelle **books.sql** in Deinem Projektordner auswählen.

Wenn Du das gemacht hast, klicke unten auf **"Import"**. Nun sollte die Tabelle books, gefüllt mit Daten, in Deine Datenbank importiert worden sein.

### Projektaufbau

- Unter **utils/db.php** findest Du die Verbindung, die mit Hilfe von PDO zur Datenbank hergestellt wird.

- Unter **utils/queries.php** kannst Du die SQL Queries einfügen, um die Abfragen durchzuführen.

- Im **index.php** File werden die Bücher in einer bereits erstellten Bootstrap Tabelle ausgegeben.

### Errorhandling

Wenn Du keine Verbindung zur Datenbank aufbauen kannst, oder sonstige Errors vorhanden sind, versuche folgende Befehle:

**Alle Docker Container stoppen**

```bash
docker stop $(docker ps -a -q)
```

**Alle bestehenden Container entfernen**

```bash
docker rm $(docker ps -a -q)
```

**um Docker-Container, zugehörige Netzwerke und Volumes herunterzufahren und zu entfernen, sowie alle mit diesen Containern verbundenen Images zu löschen**
Nach diesem Befehl muss die Datenbank nochmals in PHPMyAdmin importiert werden, weil das Volume gelöscht wurde.

```bash
docker-compose down --rmi all -v
```

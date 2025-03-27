# Docker Installation Guide

## Inhaltsverzeichnis

1. [Docker auf Linux installieren](#docker-auf-linux-installieren)
2. [Docker auf Windows installieren](#docker-auf-windows-installieren)
3. [Portainer installieren](#portainer-installieren)
4. [Docker testen](#docker-testen)
5. [Weitere nützliche Docker-Befehle](#weitere-nützliche-docker-befehle)

---

## Docker auf Linux installieren

### 1. Installiere Docker mit dem `get.docker.com` Skript

Öffne ein Terminal und führe den folgenden Befehl aus, um das Docker-Installationsskript herunterzuladen:

```sh
curl -fsSL https://get.docker.com -o get-docker.sh
```

Führe das Skript aus, um Docker zu installieren:

```sh
sudo sh get-docker.sh
```
### 2. Benutzer zur Docker-Gruppe hinzufügen

Um Docker ohne `sudo` verwenden zu können, füge deinen Benutzer zur Docker-Gruppe hinzu:

```sh
sudo usermod -aG docker $USER
```

### 3. Aktualisiere die Gruppenmitgliedschaft

Damit die Gruppenänderung sofort wirksam wird, führe den folgenden Befehl aus:

```sh 
newgrp docker
```
## Docker auf Windows installieren

1. **Docker Desktop installieren:**
   - Lade Docker Desktop von der offiziellen Docker-Website herunter: [Docker Desktop für Windows](https://www.docker.com/products/docker-desktop).
   - Folge den Anweisungen auf der Website, um Docker Desktop zu installieren.

2. **Docker starten:**
   - Nach der Installation öffne Docker Desktop und stelle sicher, dass Docker läuft.

## Portainer installieren

Portainer ist eine benutzerfreundliche Verwaltungsschicht für Docker, mit der du deine Container über eine Web-Oberfläche verwalten kannst.

### 1. Portainer Container starten

Um Portainer zu installieren, führe den folgenden Befehl aus, um den Portainer-Container zu starten:

```sh 
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest 
```

### 2. Auf Portainer zugreifen

Nach dem Start des Containers kannst du Portainer über den Browser unter folgenden URLs erreichen:

- HTTP: `http://localhost:8000`
- HTTPS: `https://localhost:9443`

Erstelle ein Admin-Konto und starte die Verwaltung von Docker-Containern und -Diensten direkt über die Web-Oberfläche.

## Docker testen

Um zu überprüfen, ob Docker korrekt installiert wurde, führe den folgenden Befehl aus:

```sh 
docker --version
```
Wenn Docker richtig installiert wurde, solltest du die Version von Docker sehen.

Testen, ob Docker funktioniert, indem du einen einfachen Container startest:

```sh 
docker run hello-world
```
Dies gibt eine Bestätigung aus, dass Docker erfolgreich funktioniert.



## Weitere nützliche Docker-Befehle

### Docker-Container verwalten
```sh
docker ps -a # Alle Container anzeigen (laufende und gestoppte)
```
```sh
docker ps # Alle laufenden Container anzeigen
```
```sh
docker stop <container-name-or-id> # Container stoppen
```
```sh
docker start <container-name-or-id> # Container starten
```
```sh
docker rm <container-name-or-id> # Container löschen
```

### Docker-Images verwalten
```sh
docker images # Alle verfügbaren Images anzeigen
```
```sh
docker rmi <image-name-or-id> # Image löschen
```

### Docker-Container interaktiv ausführen
```sh
docker run -it <image-name> /bin/bash # Container mit interaktivem Bash-Zugang starten
```

### Docker-Volume verwalten

```sh
docker volume ls # Alle Volumes anzeigen
```
```sh
docker volume rm <volume-name> # Volume löschen
```

### Docker-Logs anzeigen

```sh
docker logs <container-name-or-id> # Logs eines Containers anzeigen
```

### Docker-Image erstellen

In Ordner des Dockerfiles navigieren und folgenden Befehl ausführen:

```sh
docker build -t base-image:latest -f base.Dockerfile .
```

### Docker-Image speichern um es zu verteilen und anschließendes Laden

```sh
docker save <image-name>:<tag> > <datei-name>.tar
```
```sh
docker load < <datei-name>.tar
```


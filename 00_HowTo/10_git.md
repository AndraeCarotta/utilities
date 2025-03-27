# How to git

## Inhaltsverzeichnis

1. [Git konfigurieren](#git-konfigurieren)
2. [Personal Access Token erstellen und ablegen](#personal-access-token-erstellen-und-ablegen)
3. [SSH Key erstellen und hinterlegen](#ssh-key-erstellen-und-hinterlegen)
4. [Neues Repository lokal anlegen und nach GitHub pushen](#neues-repository-lokal-anlegen-und-nach-github-pushen)
5. [Neues Repository aus GitHub auschecken](#neues-repository-aus-github-auschecken)
6. [Branch-Befehle](#branch-befehle)
7. [Allgemeine Git-Befehle](#allgemeine-git-befehle)
8. [Commits rückgängig machen oder löschen](#commits-rückgängig-machen-oder-löschen)
9. [Upstream-Änderungen einholen](#upstream-anderungen-einholen)
10. [Tags für Releases setzen](#tags-fur-releases-setzen)
11. [Weitere nützliche Befehle](#weitere-nutzliche-befehle)

---

## Git konfigurieren
```sh
git config --global user.name "John Doe"
git config --global user.email "johndoe@example.com"
```

## Personal Access Token erstellen und ablegen
1. Navigiere zu `Settings` → `Developer Settings` → `Tokens (classic)` → `Personal Access Tokens (Classic)`.
2. Erstelle einen neuen Token.
3. Credential Manager freischalten:
   - **Nicht-Windows:**
     ```sh
     git config --global credential.helper store
     ```
   - **Windows:**
     ```sh
     git config --global credential.helper manager-core
     ```
4. Repository klonen:
   ```sh
   git clone <repo-url>
   ```
   - **Benutzername:** VW User
   - **Passwort:** Access Token

## SSH Key erstellen und hinterlegen
1. SSH-Schlüssel erstellen und speichern:  
    ```sh
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```
2. SSH-Schlüssel aus `id_ed25519.pub` in GitHub hinzufügen.
3. SSH Key in GitHub einbinden:
   ```sh
   cat ~/.ssh/id_ed25519.pub
   ```
4. Zu SSH-Agent hinzufügen:
   ```sh
   ssh-add ~/.ssh/id_ed25519
   ```

## Neues Repository lokal anlegen und nach GitHub pushen
1. Ordner lokal erstellen und git initialisieren:
    ```sh
    cd <ordnername>
    git init  # Erstellt ein Git-Repository im aktuellen Verzeichnis
    ```
2. `.gitignore`-Datei anlegen und ggf. Dateinamen eintragen.
3. Erste Codedatei erstellen.
4. Repository auf GitHub anlegen.
5. Remote-Repository hinzufügen:
   ```sh
   git remote add origin git@github.com:AndraeCarotta/ArduinoGiesskanne.git
   ```
6. Repository pushen:
   ```sh
   git push --set-upstream origin <branchname>
   ```

## Neues Repository aus GitHub auschecken
```sh
git clone <repo-url> <lokaler-repo-name>
```
Falls das Repository Submodule enthält:
```sh
git clone --recurse-submodules <repo-url>
git submodule update --init --recursive  # Falls Submodule nicht geladen wurden
```

## Branch-Befehle
```sh
# Branch anzeigen
git branch -a # lokal
git branch -r # remote
git remote show origin # detailierte infos zu remote

# Neuen Branch erstellen und wechseln
git checkout -b <branchname>

# Branch wechseln
git checkout <branchname>

# Branch lokal löschen
git branch -D <branchname> # lokal
git push origin --delete <branchname> # remote

# Branch pushen
git push origin <branchname>
```

## Allgemeine Git-Befehle
```sh
# Status anzeigen
git status

# Änderungen in Staging-Area verschieben
git add .

# Unterschied anzeigen
git diff <dateiname>

# Commit erstellen
git commit -m "Commit-Nachricht"

# Änderungen direkt committen
git commit -am "Commit-Nachricht"

# Commit-Historie anzeigen
git log --pretty=oneline
```

## Commits rückgängig machen oder löschen
```sh
# Letzten Commit rückgängig machen
git revert <commit-hash>

# Letzte 2 Commits hart zurücksetzen
git reset --hard HEAD~2

# Letzten Commit weich zurücksetzen (Änderungen bleiben in Staging-Area)
git reset --soft HEAD~1

# Branch auf Remote-Version zurücksetzen
git reset --hard origin/main
```

## Upstream-Änderungen einholen
```sh
# Änderungen aus main holen und mergen
git fetch # Änderungen holen
git merge origin main # Änderungen aus origin main in aktuellen branch mergen
git pull origin main # Kombination aus fetch und merge

# Alternative: Rebase, um eine saubere Historie zu behalten
git rebase main
```

## Tags für Releases setzen
```sh
# Tag erstellen
git tag -a v1.0 -m "Erstes Release"

# Tag pushen
git push origin v1.0

# Tags anzeigen
git tag
```

## Weitere nützliche Befehle
```sh
# Ohne zu committen den Branch wechseln
git stash
git switch <branchname>
git stash pop
```

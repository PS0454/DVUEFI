
# Level 3: UEFI Variable Exploitation

In diesem Level geht es darum, wie UEFI-Treiber mit Variablen umgehen und wie Schwachstellen in Treibern ausgenutzt werden können. Im Fokus steht der Beispiel-Treiber `VulnGetVarDriver`, der als UEFI-Driver gebaut und geladen werden kann.

## Building the Driver

Um den Treiber zu bauen, stelle sicher, dass dein EDK2-Buildsystem korrekt eingerichtet ist. Baue den Treiber im Docker-Container oder deiner Build-Umgebung:

```console
build --conf ConfEDK2 -DSECURE_BOOT_ENABLE -m VulnerableCode/Stage3/VulnGetVarDriver/VulnGetVarDriver/VulnGetVarDriver.inf
```

Das Ergebnis ist eine `VulnGetVarDriver.efi`-Datei.


## Running the Challenge (Schritt-für-Schritt)

1. Starte wie in Level 2 eine QEMU-Instanz mit Secure Boot aktiviert. Beispiel (Linux):
   ```console
   ./run_shell.sh
   ```
   oder führe QEMU manuell mit OVMF/UEFI-Firmware aus.

2. Kopiere die gebaute `VulnGetVarDriver.efi` auf das virtuelle Laufwerk der VM. Das geht z. B. über ein gemountetes Verzeichnis oder indem du die Datei ins Image einfügst.

3. Starte die UEFI-Shell in der VM. Wechsle auf das Laufwerk, z. B.:
   ```console
   FS0:
   ```

4. Lade den Treiber manuell:
   ```console
   load VulnGetVarDriver.efi
   ```
   Wenn der Treiber geladen ist, gibt es (in der aktuellen Version) keine sichtbare Ausgabe, da keine Hardware unterstützt wird.

**Hinweis:**
- Es gibt kein automatisches Skript wie `./run_stage3.sh`. Die Schritte sind bewusst manuell, damit du das Verhalten nachvollziehen kannst.
- Du kannst dir aber selbst ein Skript anlegen, das QEMU startet und ggf. Dateien kopiert.

Ziel ist es, den Treiber zu analysieren, zu erweitern und Schwachstellen zu finden oder zu demonstrieren.

## Challenge 1: Analyse und Erweiterung

- Untersuche den Quellcode von `VulnGetVarDriver`.
- Implementiere eigene Logik, z. B. das Auslesen oder Setzen von UEFI-Variablen.
- Überlege, wie ein unsicherer Umgang mit Variablen zu Schwachstellen führen kann (z. B. Buffer Overflows, Rechteausweitung).

## Challenge 2: Exploiting

- Baue gezielt eine Schwachstelle in den Treiber ein (z. B. unsichere Speicheroperationen beim Variablenzugriff).
- Zeige, wie ein Angreifer diese Schwachstelle ausnutzen könnte, um z. B. geschützte Variablen zu überschreiben oder Code auszuführen.

## Hinweise

- Die mitgelieferten Dateien `SimpleTextOutput.c/h` zeigen, wie man eigene Protokolle bereitstellen kann.
- Nutze die UEFI-Shell-Befehle wie `dmpstore`, um Variablen zu inspizieren.
- Du kannst Secure Boot wie in Level 2 aktivieren und testen, ob der Treiber korrekt signiert ist.

---

Viel Erfolg beim Analysieren und Exploiten von UEFI-Treibern!

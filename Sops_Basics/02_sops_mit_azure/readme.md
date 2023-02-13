# Aufgabe

Ihr habe ein weiteres nützliches Tool installiert - direnv. Diese Tool kann Environment Variablen abhängig des Verzeichnis laden. 

* Führt mal folgendes aus:
```
unset SOPS_AGE_RECIPIENTS
```
* Wir fügen nun die Environment Variablen permanent hinzu. Hier zu führt den Befehl "direnv edit ." aus. Es sollte sich der Editor öffnen, welcher über die EDIOR Variable eingestellt wurde.

Jetzt soll der die [Azure Keyvault URL](https://hrtrainingoperations.vault.azure.net/keys/sops/ee3e2a6a26654ce7a16335670c6d5570) als Environment Variable hinzugefügt werden. Schaut mal `sops -h` an um den richtigen Variablen Name herauszufinden.

Der Eintrag sollte ungefähr wie folgt aussehen:
```
export DEN_VON_EUCH_GEFUNDENEN_VARIABLEN_NAME="https://hrtrainingoperations.vault.azure.net/keys/sops/ee3e2a6a26654ce7a16335670c6d5570"
```

* Ihr könnt jetzt wieder versuchen die test.yaml Datei zu verschlüsseln und entschlüsseln. Das geht vollig transparent und wie vorher auch.

* Fügt jetzt mit `direnv edit .` noch folgenden Eintrag hinzu:

```
export SOPS_AGE_RECIPIENTS=age19kyyjnd32na99sn2d4ktqddykrmnghu6tk34fsy9l9duyu2g95ssypk7vy
```

* Entschlüsselt und Verschlüsselt die Datei nochmal. Wie hat sich die verschlüsselte Datei verändert? Was sind die Vorteile, wenn man zwei verschiedene Schlüssel Arten verwendet?

* Es kann sein, dass nur Teile einer yaml Datei verschlüsselt werden sollen. Das ist z.b. gerade bei K8S Secrets für Flux der Fall. Hier möchte ich nur data und stringData verschlüsseln.

```
sops --encrypt --encrypted-regex '^(data|stringData)$' secret.test.yaml
```
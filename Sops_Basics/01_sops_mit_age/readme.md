# Augaben

Ihr findet die Doku für Sops hier: https://github.com/mozilla/sops

* Wir brauchen zuerst einen age key. Der wird wie folgt generiert:
  ```
  age-keygen >> ./age-key.txt

  cat ./age-key.txt
    # created: 2023-02-01T18:08:21+01:00
    # public key: age19kyyjnd32na99sn2d4ktqddykrmnghu6tk34fsy9l9duyu2g95ssypk7vy
    AGE-SECRET-KEY-1KYE508FZTJ3P3UZDPJUUNAJQRM28LVCAYSLAC8GKL0V0DMRHR06SU07L3T
  ```

* age hat einen Public Key und eine Private Key. Damit Sops die Verwenden kann benötigt es unter umständen zwei Environment Variablen:
  * SOPS_AGE_RECIPIENTS - Diese Environment Variable wird für das Verschlüsseln des Payloads benötigt. Damit kann der Payload aber 
    nicht entschlüsselt werden.
  * SOPS_AGE_KEY_FILE - sollte der Key nicht im [Default Directory](https://github.com/mozilla/sops#22encrypting-using-age) liegen, kann 
    der Pfad zum Key angegeben werden.

  ```
  export SOPS_AGE_RECIPIENTS=age19kyyjnd32na99sn2d4ktqddykrmnghu6tk34fsy9l9duyu2g95ssypk7vy
  ```
* es gibt in diesem Verzeichnis verschieden test.* Dateien. Ihr solltet diese mit folgenden Befehlen verschlüsseln können:
  ```
  sops -e test.env
  ```
  Wie du siehst, wird dir der verschlüsselte Payload nur ausgegeben, jedoch nicht gespeichert. Mit der Option -i kannst du 
  die Datei inline verschlüsseln:
  ```
  sops -i -e test.env
  sops -i -e test.json
  sops -i -e test.yaml
  sops -i -e test.yaml.copy
  ```

* Vergeiche nun die Dateien? Was fällt auf? Vergleiche vorallem test.json mit test.yaml.copy

* Versuche die Dateien zu entschlüsseln:

  ```
  sops -d test.env
  ```

  Klappt nicht? Für die Entschlüsselung der Dateien wird nun die Environment Variable SOPS_AGE_KEY_FILE benötigt:
  
  ```
  # nutzt evtl. `pwd` um den Pfad herauszubekommen.
  export SOPS_AGE_KEY_FILE=/Users/mschreib/projects/training/training_k8s-rollout-microservices/Sops_Basics/01_sops_mit_age/age-key.txt
  ```

  Jetzt sollte es klappen. Die Option "-i" enschlüsselt die Dateien inline.

* Was passiert wenn man die verschlüsselte Datei entschlüsselt und wieder verschlüsselt ohne sie zu ändern:

  ```
  shasum test.yaml
  sops -i -d test.yaml
  sops -i -e test.yaml
  shasum test.yaml
  ```
  Ist das Verhalten praktisch für git? Warum sollte man das nicht machen?

* Sops hat einen Editier Modus. Hier wird der Editor in der EDITOR Environment Variable aufgerufen. Sollte die nicht gesetzt sein, wird es der 
  Default Editor - also meistens vi(m). Wollt ihr das ändern und ihr habe Visual Studio Code und könnt schon Dateien mit `code DATEI` öffnen, dann
  setzt die EDITOR Variable auf "code -w"

  ```
  # export EDITOR="code -w"

  # Ich gehe davon aus, dass die Datei verschlüsselt ist!
  # Ändert erst mal nichts im Editor. Speichert einfach und bei Visual Studio Code schließt den Tab für die Datei.

  shasum test.yaml
  sops test.yaml
  shasum test.yaml
  ```
  Was ist jetzt hier passiert? Das ist das Verhalten, was für git gewünscht ist. 

* jetzt schauen wir uns `sops exec-env` und `sops exec-file` an:
  ```
  # Ich gehe davon aus, dass die Datei test.env verschlüsselt ist!

  sops exec-env -h 
  sops exec-env test.env export

  sops exec-file -h
  sops exec-file test.env "cat {}"
  ```
  Was ist der Vorteil von `sops exec-env` und `sops exec-file`?
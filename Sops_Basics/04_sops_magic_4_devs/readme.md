# Tipp

Oft hat man das Problem, dass man für die lokale Entwicklung auch Konfigurationen setzten muss. Evtl. sogar secrets. Mit den Tool `direnv`
und `sops` kann man das konfortabel gestalten. So lädt direnv Environment Variablen wenn man in das Verzeichnis wechselt. Evtl. will man aber auch tatsächliche Secrets mit ausliefern und die sollten bekanntlich ja verschlüsselt sein. Hier kann euch `sops` in kombination mit `direnv` weiterhelfen.

Sops unterstützt auch ein git diff:

https://github.com/mozilla/sops#47showing-diffs-in-cleartext-in-git

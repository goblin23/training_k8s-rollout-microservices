# Aufgabe

Die Zertifikate müssen noch in ein Secret gepackt werden. Der Key für das Zertifikat ist noch verschlüsselt und muss vorher entschlüsselt werden:

```
az login --tenant 76568200-a7fb-4bdb-8720-c8022e674216

sops -d demo.local.hr.jambit.space.key.enc > demo.local.hr.jambit.space.key
```

Kubernetes hat für TLS einen eigenen Secret Typ. Der Typ Opaque aus 06_configs funktioniert nicht. 

https://www.google.com/search?q=kubectl+tls+secret -> https://kubernetes.io/docs/concepts/configuration/secret/

Da solltet ihr was zu TLS Secrets finden.

Solltet ihr den Befehl ausführen, hängt noch ein `--dry-run=client -o yaml` dran.

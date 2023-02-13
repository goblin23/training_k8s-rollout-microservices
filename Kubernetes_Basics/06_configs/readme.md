# Aufgabe

* Spiele die ConfigMap, das Secret und das neue Deployment auf. Ist die Reihenfolge wichtig? Kann man alles in einem Befehl ausführen?

* Ändere mal etwas an der ConfigMap (nur im Data Feld) und lade sie auf den K8S. Wie ändert sich die Ausgabe?

* Gehe mal mit k9s in den Container und lass dir die Environmentvariablen anzeigen.

* Wie kann man den Pod so aktualisieren, dass die neuen Konfigurationen angezogen werden?

# Erweiterte Aufgabe

* pass das Deployment so an, dass configmap-file.yaml als Files gemountet werden:
    https://kubernetes.io/docs/concepts/configuration/configmap/#using-configmaps-as-files-from-a-pod

    Ihr könnt euch mit k9s eine Console im Pod öffnen und den configmap Mount untersuchen.
# Aufgaben

* Schaut euch pv-test.yaml an. Hier gibt es einige interessante Konfigurationen. AccessModus, persistentVolumeReclaimPolicy und storageClassName.
    * AccessModus: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes
    * persistentVolumeReclaimPolicy: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#reclaim-policy
    * storageClassName: https://kubernetes.io/docs/concepts/storage/storage-classes/

* Was bedeutet die node affinity in pv-test. Was für Auswirkungen hat das?

* Spielt nun pv-test.yaml und pvc-test.yaml auf. Schaut euch mal pv und pvc in k9s an. Was hat einen Namespace und was nicht?

* spielt das deployment.yaml auf und beobachtet das pvc. Zudem schaut ob es klappt, den pod zu starten. Warum klappt es nicht? Was könnt ihr tun damit der Pod startet?

* Skaliert das Deployment auf zwei replicas. Was passiert jetzt, wenn ihr in einem Pod eine Datei anlegt. Ist sie im anderen Pod auch da? Was ist das Problem hier?

* Löscht das deployment und legt es wieder an.

* Löscht das deployment und das pvc und legt beides wieder an. Gibt es Probleme? Klar gibt es welche. Löscht mal das pv-test und legt es neu an.
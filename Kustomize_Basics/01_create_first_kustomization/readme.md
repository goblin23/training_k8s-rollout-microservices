# Aufgaben

* Erstmal soll wieder aus Kubernetes_Basics (06_configs, 08_ingress) folgende Dateien kopiert werden: 
    * deployment.yaml
    * configmap.yaml
    * secret.yaml
    * service.yaml
    * ingress.yaml

* Wir legen nun eine kustomization.yaml an. Dies wird mit dem Befehl im selben Verzeichnis wie die k8s Definitionen (deplyment.yaml, usw.) ausgeführt:
```
kustomize create --autodetect
```

* Führt nun einfach mal folgende Befehle aus:

```
kustomize build

kubectl kustomize
``` 

* Wir können nun Änderungen an der Ausgabe vornehmen. Noch machen diese Änderungen nur bedingt Sinn, aber nimmt das mal so hin. Es gibt folgende Dokumentation: https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/. 

In der Dokumentation gibt es auch veraltete kustomize Options. Hier sind folgende zu nennen:
    * patchesJson6902
    * patchesStrategicMerge
    * vars
Diese sollten nicht verwendet werden. Es gibt hierfür Nachfolger: 
    * patchesJson6902 => patches
    * patchesStrategicMerge => patches
    * vars => replacements


* Wir wollen den Namespace in diesem Beispiel von demo auf demo2 ändern. Das wird wie hier beschrieben vorgenommen: https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/namespace/

* Nun wollen wir in Ingress den die host url ändern. z.B. auf helloworld.127.0.0.1.nip.io. Kann man hier mit erledigen: https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/patches/#patch-using-inline-json6902

* Jetzt wollen wir die configmap mit einem ConfigMapGenerator ersetzen. https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/configmapgenerator/. Wir entfernen die configmap.yaml aus den Resources. Wie ändert sich der Name der ConfigMap? Was passiert mit dem Deployment und der Referenz auf die ConfigMap?

* Nun nehmen wir secret.yaml aus den Resources raus. Dafür fügen wir einen SecretGenerator mit dem Namen helloworld-secret hinzu. Wir fügen jedoch keine Werte hinzu. Wie sieht es nun mit dem Name aus und dem Referenzen im Deployment?

* Nun fügen wir die bestehende secret.yaml als Strategic Merge hinzu: https://kubectl.docs.kubernetes.io/references/kustomize/kustomization/patches/#patch-using-path-strategic-merge. Wie verhält es sich mir dem Inhalt des Secrets und dem Namen?



# Aufgaben

Wir haben hier zwei Varianten. 

1) Die variante01 wird später von der Struktur eher für FluxCD verwendet.
2) Die variante02 wird vorallem bei Software Repos verwendet. Also wenn in einem Code Repo auch das Deployment definiert werden soll.

Beide Varianten funktionieren gleich gut und sind entsprechend verbreitet.

Für die Aufgaben reicht es, wenn ihr eine Variante benutzt. 

* Füllt die base Verzeichnisse auf. Das heißt, legt dort ein deployment.yaml, service.yaml und ingress.yaml wie gehabt an. 

* Legt in der kustomization.yaml leere ConfigMapGenerator und SecretGenerator mit passenden Namen an.

* Geht nun ins Overlay und legt die passenden Patches an. Z.B.: für die configmap.yaml und secret.yaml. Prod sollte den namespace prod verwenden und dev natürlich dev. Legt die beiden Namespaces manuell an. Dev soll nun unter helloworld.dev.local.hr.jambit.space erreichbar sein und prod unter helloworld.prod.local.hr.jambit.space.


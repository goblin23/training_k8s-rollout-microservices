# Aufgabe Teil 1

* Lass dir alle Pods im Namespace demo anzeigen:

kubectl get pods -n demo

* jetzt installiere das Deployment

kubectl apply -f deployment.yaml

* Lass dir nochmal alle Pods im Namespace demo anzeigen:

kubectl get pods -n demo

* falls es noch den Pod aus Aufgabe 03_pod gibt:

kubectl delete pods -n demo helloworld

## Zusatzaufgaben für die Schnellen:

* Skaliere das Deployment (Achtung: setzte die Replicas nicht zu hoch - kann deinen Rechner schießen...):

kubectl scale -n demo --replicas=3 deployment helloworld

* Lass dir nun die Pods anzeigen:

kubectl get pods -n demo

* Just vor Fun - Versuche den anderen Pod zu löschen - du musst dazu den Namen kopieren

* Lass dir nochmal die Pods anzeigen....

* Man kann auch die Pods über die Labels selektieren. Schaue hier mal in das deployment.yaml. Beispiel fürs Löschen:

kubectl delete pods -n demo -l app=helloworld

# Aufgaben Teil 2

* Ändere den Image Tag im Deployment auf v0.2.0 ab und deploye dieses auf den K8S. Was passiert? Ist http://localhost:8080 noch erreichbar?

* Ändere den Image Tag wieder auf v0.1.0 ab und spiele es auf den K8S um wieder eine funktionieren Umgebung zu haben.

* Fügt eine Readiness Probe hinzu und probiere es aus: 
```
readinessProbe:
  httpGet:
    path: /
    port: 8080
```
Wegen der Einrückung kannst du hier nachsehen: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-tcp-liveness-probe

* Probiere das Deployment mit v0.2.0 nochmal aus. Was passiert jetzt? Ist http://localhost:8080 noch erreichbar?

* Image Tag wieder auf v0.1.0.

* füge den Resourcenbedarf hinzu:
(Ja, die Werte sind erstmal übertrieben hoch)
```
resources:
  limits:
    memory: 2G
    cpu: 1
  requests:
    memory: 1G
    cpu: 100m
```
Skaliere das Deployment nochmal auf 10 replicas. 
Was passiert nun? 
Welcher Wert löst das nun aus? 

## Zusatzaufgaben für die Schnellen:

* Füge mal einen livenessProbe hinzu und probiere diesen aus
* Überleg dir, warum es in der Regel keinen Sinn macht Liveness- und Readiness-Probe auf einen Endpunkt zu setzten?

# Aufgaben Teil 3

* Füge einen passenden security Context zum deployment hinzu. Es muss hier nur runAsUser und runAsGroup verwendet werden. Was sind passende Werte und warum?
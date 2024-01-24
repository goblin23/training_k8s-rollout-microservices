# Aufgabe

* Lege einen Namespace mit folgendem Befehl an:

kubectl apply -f namespace.yaml

* Nun lass dir alle Namespaces mit folgendem Befehl anzeigen:

kubectl get namespaces

* Es gibt einen Kurznamen für Namespace: ns

kubectl get ns

* Wir können auch einen Namespace direkt ohne yaml anlegen:

kubectl create ns test2

* Löschen geht mit diesem Befehl:

kubectl delete ns test2

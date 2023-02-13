# Aufgabe

* Damit wir auf den Pod zugreifen können, legen wir nun noch den Service an:

kubectl apply -f service.yaml

* Öffne nun im Browser http://localhost:8080

* Lass dir die Services im Namespace anzeigen:

kubectl get services -n demo

* Just for Fun - lass dir alle Services in allen Namespaces anzeigen. Wie heißt die Option?
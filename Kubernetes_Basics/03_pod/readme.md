# Aufgabe

* Lege den Pod mit folgendem Befehl an:

kubectl apply -f pod.yaml

* Lass dir die Pods im Namespace demo anzeigen:

kubectl get pods –n demo

* Just for Fun - Pods aus allen Namespaces:

kubectl get pods -A

* Status vom Pod

kubectl describe pod -n demo helloworld

Was passiert z.B. wenn ihr im pod.yaml das image auf eine falsche Version setzt und diese hochläd?
Was zeigt dann describe an? 

* Lösche den Pod:

kubectl delete pod -n demo helloworld

oder

kubectl delete -f pod.yaml

* Probiere das ganze mal in k9s aus 
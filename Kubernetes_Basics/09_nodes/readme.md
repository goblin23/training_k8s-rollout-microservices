# Aufgaben

* lass dir alle Nodes anzeigen. Was fällt auf?

* lass dir man `kubectl describe node k3d-develop-agent-0` anzeigen. Wie viel Speicher ist noch frei?

* mit k9s gehe auch den node mit dem meisten Pods. Lösche einen der Pods. Auf welcher Node wird der Pod wieder gestartet. Lösche ihn nochmal. Kommt der Pod immer wieder auf den selben Node?

* setze den Node auf "cordon". Das geht mit k9s oder `kubectl cordon NODENAME` und dann lösche den Pod noch mal. Was passiert nun?

* Der Node kann wieder in das Scheduling aufgenommen werden: `kubectl uncordon NODENAME`. Jetzt kann man den Pod nochmal löschen und er sollte wieder auf den Node ausgeführt werden.

* Wieviele Pod laufen auf k3d-develop-agent-0 ? Führ nun ein Drain aus. `kubectl drain k3d-develop-agent-0  --delete-emptydir-data=true --ignore-daemonsets=true`

* setzte wieder alle nodes auf uncordon. 

* öffnen ein Terminal und gehe dort auf k9s auf die Node Übersicht. In einem anderen Terminal führe folgendes aus:
  ```
  kubectl delete node k3d-develop-agent-0 && k3d node stop k3d-develop-agent-0
  ```       
  Warte mal 1 - 2 min und schaue auf k9s, wann die Pods auf einer anderen Maschine ausgerollt werden.

  ```
  k3d node start k3d-develop-agent-0
  ```
# Fleißaufgabe

* auf dem Node k3d-develop-agent-1 läuft kein Pod. Warum? 

* ändere das deployment so ab, das der Pod auf k3d-develop-agent-1 ausgeführt wird. Hier für muss eine Toleration gesetzt werden und zudem eine Node affinity:
  https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/
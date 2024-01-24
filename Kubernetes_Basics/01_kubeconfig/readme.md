# Aufgaben

* schaut euch die Kubernetes Config an:
    * `cat ~/.kube/config`
    * `kubectl config view` && `kubectl config view --raw`

* Was ist der aktuell Context?
    * `kubectl config get-contexts`

* Wie würde man den Context wechseln, wenn man mehrere hat?
    * `kubectl config use-context k3d-develop`

* Hole dir aus der KubeConfig die URL für den Cluster. Sie sieht in etwa so aus: https://0.0.0.0:53270. Nun versuche mit Curl auf diese 
  Address zuzugreifen.  

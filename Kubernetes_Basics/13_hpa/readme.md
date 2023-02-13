# Aufgaben

* Wir spielen zuerst die Manifests auf dem K8S ein:
  `kubectl apply -n demo -f deployment.yaml -f service.yaml -f ingress.yaml -f hpa.yaml`

* Wir führen mal einen Loadtest durch:
  `k6 run loadtest/k6_loadtest.js` 

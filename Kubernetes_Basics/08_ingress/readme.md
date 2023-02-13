# Aufgabe

Es wird zuerst ein Ingress Controller benötigt. Dieser ist in der Regel nicht vorinstalliert. Deshalb installieren wir den Nginx Ingress Controller nach:

```
./install-ingress.sh
```

* Es wird ein interne Service benötigt. Deshalb deployen wir folgendes:

kubectl apply -f service.yaml

* Vervollständige die ingress.yaml: 
  Orientiere dich hierbei an: https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource
  * Du kannst die Annotations erstmal weglassen
  * Der ingressClassName kann entweder weggelassen werden (weil ich einen default gesetzt habe) oder du findest den richtigen Namen mit `kubectl get ingressclass` heraus. Manchmal ist keine Default-Klasse gesetzt, deshalb empfiehlt es sich den ingressClassName zu setzen.
  * Du solltest übrigens auch noch "host"-Wert setzen. Beispiel ist weiter unten bei https://kubernetes.io/docs/concepts/services-networking/ingress/#hostname-wildcards zu sehen. Setze host auf: helloworld.demo.local.hr.jambit.space



* Öffne den Browser: http://helloworld.demo.local.hr.jambit.space und öffne http://helloworld.demo.local.hr.jambit.space:8080
    Ist identisch... 

* Öffne im Browser: http://helloworld2.demo.local.hr.jambit.space und öffne http://helloworld2.demo.local.hr.jambit.space:8080
    Warum bekomme ich bei dem einen einen 404 und dem anderen eine Ausgabe?

* Wie du siehst wird kein TLS verwendet. Lokal ist das zwar ok, aber wir wollen trotzdem TLS hinzufügen. Was wird hierfür benötigt? Lasst uns mal in die Doku schauen: https://www.google.com/search?q=kubectl+tls+ingress. 

Ihr solltet folgende Seite als ersten Treffer erhalten: 

https://kubernetes.io/docs/concepts/services-networking/ingress/

Lasst euch von der Fülle nicht abschrecken. Auf der Rechten Seite gibt es auch nochmal eine Leiste und hier findet ihr den Punkt TLS.
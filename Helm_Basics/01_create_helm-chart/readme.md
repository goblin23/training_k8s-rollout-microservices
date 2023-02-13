# Aufgaben

* Legt ein neues Chart Repo an. Am besten führt ihr den folgenden Befehl in einem extra Verzeichnis aus, weil dieses Chart wird Schritt für Schritt aufgebaut:

```
helm create hellochart
```

* Wir räumen jetzt erstmal auf. 
    * Das heißt wir löschen im templates Verzeichnis folgendes:
        * tests
        * deployment.yaml
        * hpa.yaml
        * ingress.yaml
        * service.yaml
        * serviceaccount.yaml
    * Wir leeren die values.yaml und lassen nur noch folgendes stehen:
        ```
        Default values for hellochart.
        # This is a YAML-formatted file.
        # Declare variables to be passed into your templates.

        replicaCount: 1

        image:
        repository: nginx
        tag: ""

        nameOverride: ""
        fullnameOverride: ""

        resources: {}
        # We usually recommend not to specify default resources and to leave this as a conscious
        # choice for the user. This also increases chances charts run on environments with little
        # resources, such as Minikube. If you do want to specify resources, uncomment the following
        # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
        # limits:
        #   cpu: 100m
        #   memory: 128Mi
        # requests:
        #   cpu: 100m
        #   memory: 128Mi

        ```
    * jetzt noch die NOTES.txt kürzen:
        ```
        1. Get the application URL by running these commands:
        ```

* Werfen wir noch einen Blick in Chart.yaml und passen die appVersion auf v0.1.0 an. 

* Testen ob alles soweit funktioniert: 
```
helm template hellochart .
# es sollte eine leere Zeile ausgegeben werden
```

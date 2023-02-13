# Aufgaben

* Kopiere aus den Kubernetes_Basics (06_configs, 08_ingress) in das template Verzeichnis deines Helm-Charts:
    * deployment.yaml
    * configmap.yaml
    * secret.yaml
    * service.yaml
    * ingress.yaml

    Und gleich testen ob noch alles funktioniert:

    ```
    # Auf der Ebene wie Chart.yaml
    helm template hellochart .
    ```

    Ihr solltet ein concatiniertes yaml angezeigt bekommmen.

    Im folgenden empfiehlt sich, nach jeder kleinen Änderung das hier zu testen. 

    * Entferne in jeder der kopierten Dateien `namespace: demo`

* Anpassen des image repos:

    * Tausche in der deployment.yaml  `image: k3d-registry.127.0.0.1.nip.io:5000/helloworld:v0.1.0` gegen `image: {{.Values.image.repository}}:{{.Values.image.tag | default .Chart.AppVersion}}`
      Was macht `default`? https://helm.sh/docs/chart_template_guide/function_list/#default

    * Nicht vergessen - Testen! Wie sieht nur das Image Repo aus?

    * Tausche in der values.yaml `repository: nginx` gegen `repository: k3d-registry.127.0.0.1.nip.io:5000/helloworld` - wieder testen. values.yaml setzt also default Werte. 

    * Jetzt wollen wir den Image Tag überschreiben... 
      ```
      helm template hellochart . --set image.tag=v0.2.0
      ```
      Default Values lassen sich also mit `--set` überschreiben.

* Anpassung von Ingress:

    * Wir wollen nun auch die URL unter der der Ingress erreichbar ist ändern:
      in der values.yaml legen wir folgendes an:
      ```
      ingress:
        url: helloworld.demo.local.hr.jambit.space
        path: "/"
        tlsSecretName: ""
      ```
      Wie wird die ingress.yaml angepasst? Das sollte ja analog zum repository gehen.
    * Wenn ein Name für ein tls-secret angegeben wird, soll auch TLS im Ingress konfiguriert werden. Interessant ist hier folgendes: 
      https://helm.sh/docs/chart_template_guide/control_structures/#ifelse 
      https://kubernetes.io/docs/concepts/services-networking/ingress/#tls

    * Fällt euch die Leerzeile beim Ingress auf? Warum ist die da und wie bekommt man sie weg? Was für Zeichen sehen vor dem "{{if" und nach dem "end}}" ?
      https://helm.sh/docs/chart_template_guide/control_structures/#controlling-whitespace
      Prinzipiell funktioniert so:
      {{- if .Values.ingress.tlsSecretName}} das Minus am Anfang ist wie Pacman der alle Whitespaces und Zeilenumbrüche bis zum nächsten nicht Whitespace/Zeilenumbruch Zeichen auffrisst.
      Am Ende wie z.B.: {{end -}} ist die Wirkung die selbe. Mit dem am Ende aufpassen - der zerstört auch Einrückungen.

* Anpassung der Namen:

    * Wir wollen nun die Namen, Labels und Selektoren anpassen. Diese sollen zum einen konfigurierbar sein, also auch vom Release Name abhängig sein. Der Release Name wird bei folgenden Befehl gesetzt:
      ```
      helm template RELEASENAME .
      ```
      Hier gibt in _helpers.tpl ein entsprechendes Template (wird hier wie eine Funktion benutzt). Zeile 13 - 24 definiert dieses Template. Es wird wie folgt aufgerufen: `{{include "hellochart.fullname" .}}`.
      Das heißt z.B. in deployment.yaml `helloworld` mit Suchen & Ersetzen gegen `{{include "hellochart.fullname" .}}` austauschen. Da hier auch die configmap und secret name geändert wird, soll auch hier das selbe gemacht werden.

* Anpassung ConfigMap und Secret:

    * Die Inhalte der ConfigMap und des Secret sollten anpassbar sein. Hier empfiehlt sich ein Key-Value Struktur (Dictonary). Folgende Funktionen können interessant sein (das heißt nicht, dass alle Funktionen benötigt werden):
      https://helm.sh/docs/chart_template_guide/function_list/#type-conversion-functions
      https://helm.sh/docs/chart_template_guide/function_list/#nindent
      https://helm.sh/docs/chart_template_guide/control_structures/#looping-with-the-range-action
      https://helm.sh/docs/chart_template_guide/control_structures/#ifelse

* Ausrollen des helm Charts:
    * Lege ein Datei (außerhalb des Charts) an. Sie hat z.B. den Name test-values.yaml. Diese Datei hat folgenden Inhalt:
      ```
      ingress:
        tlsSecretName: tls-secret
      ```
      Das kommt einen aus der values.yaml bekannt vor. Tatsächlich ist das eine andere Art zu dem vorher gezeigten `--set ingress.tlsSecretName=tls-secret`, spezifische Values zu setzen. 
      ```
      helm template hellochart ./hellochart -f test-values.yaml
      ```

      Das helm Release wird jetzt mit folgendem Befehl angelegt:
      ```
      helm install hellochart ./hellochart -f test-values.yaml -n demo --wait
      ```
      Diese Befehl kann nur einmal ausgeführt werden. Gibt es schon ein Release mit diesem Namen im Namespace, schlägt es fehl.

      So kannst du es wieder löschen:
      ```
      helm delete hellochart -n demo
      ```

      So kann man übrigens das Release Upgraden: 
      ```
      helm upgrade hellochart ./hellochart -f test-values.yaml -n demo --wait
      ```

* Verbesserungen

    * Anpassung des Deployments, damit dieses neu gestartet wird, falls sich Konfigurationen (configmap und secret) ändern:
      https://helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments
      
    * Passe die NOTES.txt noch so an, dass die korrekte URL bei install / upgrade angezeigt wird.
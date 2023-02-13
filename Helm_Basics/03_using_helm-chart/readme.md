# Aufgaben

* Erstellen eines Repos
  https://helm.sh/docs/topics/chart_repository/

    * Paketieren des Helm Chart:
      Am besten wird dieser Befehl in einem eigenen Direktory ausgeführt.
      ```
      helm package ../hellochart
      ```
      Es wird ein hellochart-0.1.0.tgz angelegt. 

    * Erstellen eines Index:
      ```
      helm repo index .
      ```
      Erstellt eine index.yaml

    * Hochladen des Repos auf den Webserver z.B. Storage Account 
      !Achtung - Ihr seid nicht berechtigt das zu tun!
      ```
      az storage azcopy blob sync -c helm --subscription 3fb32f2b-69f5-4766-936a-47170ba0537c  --account-name k8straining01 -s "."
      ```
* Benutzen des Repos

    * Hinzufügen eines Repos
      ```
      helm repo add hellochart-repo https://k8straining01.blob.core.windows.net/helm
      helm repo update 
      ```

    * Benutzen des Repos z.B. das Template ausgeben lassen
      ```
      # helm template RELEASE-NAME REPO/CHART
      helm template hellochart hellochart-repo/hellochart
      ```

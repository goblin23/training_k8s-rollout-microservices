# Aufgaben

* Über Zertifikate kann auch ein User angelegt werden. Hierfür habe ich euch ein script angelegt. 
    ```
    # ./create-user.sh USER GROUP
    ./create-user.sh $USER demo
    ```
* Es wurde nun ein neuer K8S Context angelegt. Mit `kc` kann dieser ausgewählt werden und sollte in etwa so lauten:
    mschreib@k3d-develop

    Dieser Befehl, scheitert nun wegen fehlenden Rechten:
    ```
    kubectl get pod
    ```
* Nun wollen wir ein ClusterRoleBinding für die Gruppe demo auf die ClusterRole view anlegen:
    https://kubernetes.io/docs/reference/access-authn-authz/rbac/#clusterrolebinding-example

    Natürlich muss der Context wieder auf k3d-develop zurückgestellt werden.

    Damit hat nun der User die Berechtigung, Resourcen anzusehen. Teste das mal. Secrets 

* Jetzt kann man noch eine RoleBinding für die Gruppe demo auf die ClusterRole edit im Namespace demo anlegen. Damit kann dann der User Resourcen im Namespace anlegen. 
#!/bin/bash

NAMESPACE=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)
TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)

curl -s https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT/api/v1/namespaces/$NAMESPACE/pods/ \
 --header "Authorization: Bearer $TOKEN" \
 --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
 
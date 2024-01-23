#!/bin/bash

jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< $(cat "/var/run/secrets/kubernetes.io/serviceaccount/token")
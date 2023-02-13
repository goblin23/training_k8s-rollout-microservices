#!/bin/bash

helm upgrade --install ingress-nginx ingress-nginx -n ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --create-namespace --set controller.ingressClassResource.default=true --set controller.watchIngressWithoutClass=true

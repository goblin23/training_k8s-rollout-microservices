#!/bin/bash

set -e

AKSNUMBER=$(( $1 ))

if [ "$AKSNUMBER" -gt "0" ] && [ "$AKSNUMBER" -lt "5" ]; then
	az aks get-credentials -n dev-westeurope-aks0$AKSNUMBER -g dev-westeurope-rg --subscription 3fb32f2b-69f5-4766-936a-47170ba0537c --context hrtraining0$AKSNUMBER
else
	echo "$0 NUMBER"
	echo "0 < NUMBER < 5"
	echo Falsche Eingabe
	exit
fi

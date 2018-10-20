#!/bin/bash

source config.sh

#READING RESOURCE GROUPS
echo "LOGGING: DELETING RESOURCE GROUPS WITH PREFIX $resGroupPrefix in name"

for purgable in $(az group list --output tsv | awk '{ print $4}' | grep "^$resGroupPrefix")
do
	echo "Ponerle locks a todos los RGs no borrables por favor. Te hubieses cepìllado el RG $purgable"
	 #az group delete --no-wait --name $purgable
done



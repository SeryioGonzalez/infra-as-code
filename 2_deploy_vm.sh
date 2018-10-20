#!/bin/bash

source config.sh

resGroupName=$resGroupPrefix$RANDOM

#CHECK TEMPLATE
echo "LOGGING: Checking template JSON"
cat $executorTemplateFile | python -m json.tool >> /dev/null  || echo "NOT valid JSON"

#CREATE EXECUTOR RESOURCE GROUP 
echo "LOGGING: Creating new resource group $resGroupName"
az group create -l $location -n $resGroupName

#DEPLOY INFRAESTRUCTURE
echo "LOGGING: Deploying infraestructure"
az group deployment create --resource-group $resGroupName --template-file "$executorTemplateFile" \
	--parameters dnsLabelPrefix=$allResPrefix



#!/bin/bash

source config.sh

resGroupName=$resGroupPrefix"_vm"$RANDOM

vmDeployment="seryio"

#CHECK TEMPLATE
echo "LOGGING: Checking template JSON"
cat $vmTemplateFile | python -m json.tool >> /dev/null  || echo "NOT valid JSON"

#CREATE EXECUTOR RESOURCE GROUP 
echo "LOGGING: Creating new resource group $resGroupName"
az group create -l $location -n $resGroupName

#DEPLOY INFRAESTRUCTURE
echo "LOGGING: Deploying infraestructure"
az group deployment create --debug --name $vmDeployment --resource-group $resGroupName --template-file "$vmTemplateFile" \
	--parameters deploymentName=$vmDeployment



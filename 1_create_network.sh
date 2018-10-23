#!/bin/bash

source config.sh

resGroupName=$resGroupPrefix"_vnet"

#CHECK TEMPLATE
echo "LOGGING: Checking template JSON"
cat $networkTemplateFile | python -m json.tool >> /dev/null  || echo "NOT valid JSON"

#CREATE EXECUTOR RESOURCE GROUP 
echo "LOGGING: Creating new resource group $resGroupName"
az group create -l $location -n $resGroupName

#DEPLOY INFRAESTRUCTURE
echo "LOGGING: Deploying network"

az group deployment create --resource-group $resGroupName --template-file "$networkTemplateFile" \
	--parameters "@${networkParameterFile}" \
	--parameters network_name=$networkName


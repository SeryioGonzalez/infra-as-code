#/bin/bash

source credentials.sh

az login --tenant $tenant
az account set --subscription $subscription



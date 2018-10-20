#/bin/bash

#az network vnet list --query "[].addressSpace.addressPrefixes"
#az network vnet list --query "[].name"
#az network vnet list --query "[].subnets[].name"
#az network vnet list --query "[].subnets[].ipConfigurations[].id"
#az network vnet list --query "[].subnets[].addressPrefix"

az network vnet list --query "[].{name: name, addressSpace: addressSpace.addressPrefixes, subnets: {name: subnets[].name}}" 

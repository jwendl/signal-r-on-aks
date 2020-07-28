#!/bin/bash

while getopts ":r:n:l:" arg; do
    case $arg in
        r) ResourceGroupName=$OPTARG;;
        n) Name=$OPTARG;;
        l) Location=$OPTARG;;
    esac
done

if [ $(az group exists --name $ResourceGroupName) = false ]; then
    az group create --name $ResourceGroupName --location $Location
fi

if [ $(az storage account check-name --name $Name --query nameAvailable) ]; then
    az storage account create --name $Name --resource-group $ResourceGroupName --location $Location --sku Standard_LRS --kind StorageV2

    storageKey=$(az storage account keys list --resource-group $ResourceGroupName --account-name $Name --query "[0].value" --output tsv)
    az storage container create --name terraform-state --account-name $Name --account-key $storageKey
fi

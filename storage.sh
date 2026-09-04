#!/bin/bash

set -e

# Create Resource Group
az group create \
  --name tfstate-rg \
  --location westeurope

# Create Storage Account
az storage account create \
  --name hugtfstorageezra2026 \
  --resource-group tfstate-rg \
  --location westeurope \
  --sku Standard_LRS

# Get the Storage Account ID
STORAGE_ID=$(az storage account show \
  --name hugtfstorageezra2026 \
  --resource-group tfstate-rg \
  --query id \
  --output tsv)

# Get the currently logged-in Azure user ID
USER_ID=$(az ad signed-in-user show \
  --query id \
  --output tsv)

az role assignment create \
  --assignee "$USER_ID" \
  --role "Storage Blob Data Contributor" \
  --scope "$STORAGE_ID"

echo "Waiting for RBAC permissions to propagate..."
sleep 30

az storage container create \
  --name hugtfcontainer \
  --account-name hugtfstorageezra2026 \
  --auth-mode login
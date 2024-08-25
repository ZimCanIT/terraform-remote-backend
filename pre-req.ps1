# variables 
$resource_group_name="remote-backendrg"
$deployment_location="uksouth"
# appends random 10-digit number to storage acconut name
$storage_account_name = "rmtbackend$((1..10 | ForEach-Object {Get-Random -Minimum 0 -Maximum 9}) -join '')"
$container_name="tfstate"
# path to the provider.tf file
$providerFilePath = "az-infra\provider.tf"

az login
# set subsctiption: az account set --subscription <subscription id>

az group create --name $resource_group_name --location $deployment_location
az storage account create --resource-group $resource_group_name --name $storage_account_name --sku Standard_LRS --encryption-services blob
$storage_account_key = az storage account keys list --resource-group $resource_group_name --account-name $storage_account_name --query "[0].value" -o tsv
az storage container create --name $container_name --account-name $storage_account_name --account-key $storage_account_key

# read the content of the provider.tf file, and set the storage account name in the backend block
$providerContent = Get-Content -Path $providerFilePath -Raw
$providerContent = $providerContent -replace 'storage_account_name\s*=\s*".*"', "storage_account_name = `"$storage_account_name`""
Set-Content -Path $providerFilePath -Value $providerContent
Write-Host "provider.tf file has been updated with the new values."
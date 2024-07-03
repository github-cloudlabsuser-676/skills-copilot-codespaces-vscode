# Variables
$resourceGroupName = "myResourceGroup"
$location = "East US"
$storageAccountName = "mystorageaccount$(Get-Random)"
$storageSkuName = "Standard_LRS"

# Create Resource Group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    New-AzResourceGroup -Name $resourceGroupName -Location $location
    Write-Host "Resource Group '$resourceGroupName' created."
} else {
    Write-Host "Resource Group '$resourceGroupName' already exists."
}

# Create Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName $storageSkuName `
                                       -Kind "StorageV2" `
                                       -AccessTier "Hot"
Write-Host "Storage Account '$storageAccountName' created."
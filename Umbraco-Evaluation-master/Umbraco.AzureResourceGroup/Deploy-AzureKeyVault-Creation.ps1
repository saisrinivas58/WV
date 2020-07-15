Param(
    [string] [Parameter(Mandatory=$true)] $resourceGroupName,
    [string] [Parameter(Mandatory=$true)] $location,
    [string] [Parameter(Mandatory=$true)] $keyVaultName
    
)


$vault=Get-azkeyvault -VaultName $keyVaultName -ResourceGroupName $resourceGroupName 
if(!$vault){
# Create the Key Vault (enabling it for Disk Encryption, Deployment and Template Deployment)
New-AzKeyVault -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -Location $location -EnabledForDiskEncryption -EnabledForDeployment -EnabledForTemplateDeployment
 
}
else{
  Write-Host "keyvault already exist" -ForegroundColor Gray
} 

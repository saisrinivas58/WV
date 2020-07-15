param (

 [Parameter(Mandatory=$true,ValueFromPipeline=$true)] [string] $resourcegroupName,
 [Parameter(Mandatory=$true,ValueFromPipeline=$true)] [string] $resourceName

)

#$resourcegroupName = 'UMB-CS-Staging-Blue-RG'
#$resourceName = 'umb-cs-staging-webapp-blue'

# Check the resource group
$isRGNameAvaialable = Get-AzResourceGroup $resourcegroupName -ErrorAction SilentlyContinue

if($isRGNameAvaialable){

   # Check if the resource is available 
   $isResourceAvailable = Get-AzResource -ResourceGroupName $resourcegroupName -ResourceName $resourceName -ErrorAction SilentlyContinue
   
   if($isResourceAvailable){
   		write-host "deleting the resource ""$resourceName"""  -ForegroundColor Red
   		Remove-AzResource -ResourceGroupName $resourcegroupName -ResourceName $resourceName -ResourceType Microsoft.Web/sites -Force
   }
}

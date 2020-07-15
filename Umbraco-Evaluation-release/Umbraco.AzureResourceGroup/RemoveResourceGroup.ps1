param (


 [Parameter(Mandatory=$true,ValueFromPipeline=$true)] [string] $resourcegroupName

)
#check the resource group
$rsg=Get-AzResourceGroup $resourcegroupName -ErrorAction SilentlyContinue
if($rsg){

    write-host "deleting the resource group ""$resourcegroupName"""  -ForegroundColor Red
    Remove-AzResourceGroup -Name $resourcegroupName -Force
   
}

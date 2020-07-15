
$RG_name="DEVOPS-TRAINING-RG"
$RS_type="Microsoft.Web/sites/config"
$ResourceName="restrictapp"


$webapp = Get-AzureRmResource -ResourceGroupName $RG_name -ResourceType $RS_type -ResourceName$ResourceName -ApiVersion 2016-08-01
$prop = $webapp.Properties
$prop.ipSecurityRestrictions = @()
Set-AzureRmResource -ResourceGroupName  $RG_name -ResourceType $RS_type -ResourceName $ResourceName -ApiVersion 2016-08-01 -PropertyObject $prop
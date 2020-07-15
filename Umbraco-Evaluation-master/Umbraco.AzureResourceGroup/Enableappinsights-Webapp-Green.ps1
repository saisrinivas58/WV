param(
	[string] [Parameter(Mandatory = $true)] $AppInsightsresourcegroupName,
	[string] [Parameter(Mandatory = $true)] $environment,
    [string] [Parameter(Mandatory = $true)] $WebappresourcegroupName
	
)

$appinisghtsname = $environment + '-appinsights'
$webappName =  $environment + '-webapp-green'
$instrumentationkey=(Get-AzApplicationInsights -ResourceGroupName $AppInsightsresourcegroupName -Name $appinisghtsname).InstrumentationKey

$app = Get-AzWebApp -ResourceGroupName $WebappresourcegroupName  -Name $webappName 
$oldsettings = $app.SiteConfig.AppSettings

$AppSettings = @{}
ForEach ($item in $oldsettings) {
$AppSettings[$item.Name] = $item.Value
}


 # case-insensitive hash map
$AppSettings["APPINSIGHTS_INSTRUMENTATIONKEY"] = "$instrumentationkey"; # set the Application Insights instrumentation key
$AppSettings["APPLICATIONINSIGHTS_CONNECTION_STRING"] = "InstrumentationKey=$instrumentationkey"; # set the Application Insights connection string
$AppSettings["ApplicationInsightsAgent_EXTENSION_VERSION"] = "~2"; # enable the ApplicationInsightsAgent
Set-AzWebApp -AppSettings $AppSettings -Name $webappName -ResourceGroupName $WebappresourcegroupName -verbose
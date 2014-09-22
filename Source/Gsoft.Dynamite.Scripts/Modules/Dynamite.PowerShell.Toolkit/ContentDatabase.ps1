#
# Module 'Dynamite.PowerShell.Toolkit'
# Generated by: GSoft, Team Dynamite.
# Generated on: 10/24/2013
# > GSoft & Dynamite : http://www.gsoft.com
# > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
# > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
#

<#
	.SYNOPSIS
		Method to create the Content Database if it does not exist

	.DESCRIPTION
		The method will check if the Content Database with the input name exist.
		If not, it will create it
    
    --------------------------------------------------------------------------------------
    Module 'Dynamite.PowerShell.Toolkit'
    by: GSoft, Team Dynamite.
    > GSoft & Dynamite : http://www.gsoft.com
    > Dynamite Github : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    > Documentation : https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    --------------------------------------------------------------------------------------

	.PARAMETER  ContentDatabaseName
		The name of the Content Database to create

	.PARAMETER  WebApplicationUrl
		The Url of the Web Application to create the database under

	.EXAMPLE
		PS C:\> New-DSPContentDatabase -ContentDatabaseName "WSS_Content_Site" -WebApplicationUrl http://myWebApp -Verbose

	.INPUTS
		System.String, System.String
    
  .LINK
    GSoft, Team Dynamite on Github
    > https://github.com/GSoft-SharePoint
    
    Dynamite PowerShell Toolkit on Github
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit
    
    Documentation
    > https://github.com/GSoft-SharePoint/Dynamite-PowerShell-Toolkit/wiki
    
#>
function New-DSPContentDatabase()
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory=$true, Position=0)]
		[string]$ContentDatabaseName,
		
		[Parameter(Mandatory=$true, Position=1)]
		[string]$WebApplicationUrl
	)
	
	# Create Dedicated Database
	if ((Get-SPContentDatabase -Identity $ContentDatabaseName -ErrorAction SilentlyContinue) -eq $null)
	{
		Write-Verbose ([string]::Format("[LOG] The database with name {0} is being created ...", $ContentDatabaseName))
		New-SPContentDatabase -Name $ContentDatabaseName -WebApplication $WebApplicationUrl
		Write-Verbose ([string]::Format("[LOG] The database with name {0} has successfully been created.", $ContentDatabaseName))
	}
}
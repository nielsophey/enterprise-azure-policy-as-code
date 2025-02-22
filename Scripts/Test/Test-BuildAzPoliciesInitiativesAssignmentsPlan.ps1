#Requires -PSEdition Core

[CmdletBinding()]
param (
    [parameter(Mandatory = $false, Position = 0)] [string] $environmentSelector = $null
)

$InformationPreference = "Continue"
. "$PSScriptRoot/../Config/Initialize-Environment.ps1"

$environment, $defaultSubscriptionId = Initialize-Environment $environmentSelector

. "$PSScriptRoot/../Deploy/Build-AzPoliciesInitiativesAssignmentsPlan.ps1" `
    -InformationAction Continue `
    -TenantId $environment["tenantID"] `
    -RootScope $environment["rootScope"] `
    -AssignmentSelector $environment["assignmentSelector"] `
    -PlanFile $environment["planFile"]

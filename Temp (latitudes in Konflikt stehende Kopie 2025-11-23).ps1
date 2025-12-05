<#
    .SYNOPSIS
    Does actually nothing useful

    .DESCRIPTION
    Just greeting the user

    .PARAMETER Name
    User name

    .EXAMPLE
    Temp -Name "Alice"
#>



    param(
    [string] $Name
    )
    
    Write-Host "Hello $Name"


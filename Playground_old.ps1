<#
    .SYNOPSIS
    Does nothing useful at the moment

    .DESCRIPTION
    Just returning a dummy text

    .PARAMETER Name
    No parameter needed so far

    .EXAMPLE
    Playground.ps1 [--help | -h]
#>



# foreach ($arg in $args) {
#     Write-Output "Argument: $arg"
# }

$date = Get-Date 



# If no arg is given or if it's "help", open up help
if ($args.Length -eq 0 -or $args[0] -eq "--help" -or $args[0] -eq "-h"){
    Write-Host "This might be some help text"
} 

Set-Content -Path "~\Log_PS-Playground.txt" -Value "$(Get-Date -Format '[hh:mm:ss dd-MM-yyyy]') Script started successfully..."
Write-Host $args[0]

$TestText = "Hello"

Write-Information "Info:" $TestText

Write-Warning $TestText
Pause
Write-Host $TestText -ForegroundColor Cyan

Add-Content -Path "~\Log_PS-Playground.txt" -Value "$(Get-Date -Format '[dd-MM-yyyy | hh:mm:ss]') Script finished successfully." 


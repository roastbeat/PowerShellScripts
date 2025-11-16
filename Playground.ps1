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

# If no arg is given or if it's "help", open up help
if ($args.Length -eq 0 -or $args[0] -eq "--help" -or $args[0] -eq "-h"){
    Write-Host "This might be some help text"
} 

# Write-Host $args[0]


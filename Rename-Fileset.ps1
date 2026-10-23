<#
    .SYNOPSIS
    Renames multiple files.

    .DESCRIPTION
    Renames multiple files of the given format type with the given name and increasing number.

    .PARAMETER Suffix
    Any kind of media format like .txt, .pdf, .jpg and so on.

    .PARAMETER BaseName
    The new name of the file(s).

    .EXAMPLE
    Rename-Files.ps1 -extension ".jpg" -BaseName "Vacation2023"
#>

param(
    [Parameter(Mandatory)]
    # Extension (like .txt or .pdf etc)
    [String]$Extension,  

    [Parameter(Mandatory)]
    # Base name for the new files (like image or doc etc.)
    [String]$BaseName 
)

$files = Get-ChildItem -Filter $Suffix -File -Path .
# $Extension = $Extension.Replace("*", "")
$Count = 0

foreach ($file in $files) {
    $Count = $Count + 1
    $newName = "{0}_{1}{2}" -f $BaseName, $Count, $Extension
    Rename-Item -NewName $newName -Path $file.FullName
}

Write-Host ("`n{0} files have been renamed.`n" -f $Count)

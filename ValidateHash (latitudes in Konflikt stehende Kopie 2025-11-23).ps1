# Execution: 
# powershell.exe ValidateHash.ps1 -Path "Path to file" -Algorithm "Algorithm" -ExpectedHash "Given hash"

# TODO:
# Add help page --> option --help     --> alias -h
# Add version   --> option --version  --> alias -v

param(#
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [String]$Path,  # Path
    [Parameter(Mandatory, HelpMessage = "Provide a hash algorithm, e. g. `"MD5`"")]
    [String]$Algorithm,  # Algorithm
    [Parameter(Mandatory)]
    [String]$SourceHash # Given hash 
)


# Font threepoint --> http://www.network-science.de/ascii/
function Title() {
"
\  / _ |. _| _ _|_ _   |_| _  _|_ 
 \/ (_|||(_|(_| | (/_  | |(_|_\| |
                              v0.3
"
}

# Returns object type
$FileHash = Get-FileHash $Path -Algorithm $Algorithm

function Print() {
    Clear-Host
    Title
    Write-Host "Calculated hash: " 
    Write-Host $FileHash.Hash.ToLower()
    Write-Host ("  ------------  ")
    Write-Host "Source hash: " 
    Write-Host $SourceHash.ToLower()
}

if ($FileHash.Hash -eq $SourceHash) {
    Print
    Write-Host ("+------------+") -ForegroundColor DarkGreen
    Write-Host ("| File valid |") -ForegroundColor DarkGreen
    Write-Host ("+------------+") -ForegroundColor DarkGreen
} else {
    Print
    Write-Host ("+---------------+") -ForegroundColor Red
    Write-Host ("| File corrupt! |") -ForegroundColor Red
    Write-Host ("+---------------+") -ForegroundColor Red
}
# Execution:
# powershell.exe Set-Hash.ps1 -path "Path to file" -algo "Algorithm"

param(
[Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
[String]$Path,
[Parameter(Mandatory, HelpMessage = "Provide a hash algorithm, e. g. `"MD5`"")]
[String]$Algorithm 
)

# Font threepoint --> http://www.network-science.de/ascii/
function Title() {
"
(~ _ _|_  |_| _  _|_ 
_)(/_ |   | |(_|_\| |
                 v0.3
"
}

Clear-Host
Title
$FileHash = Get-FileHash $Path -Algorithm $Algorithm
$FileHash | Format-List
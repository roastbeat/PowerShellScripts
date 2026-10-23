
function PrintHeader {
    # Font "big" --> http://www.network-science.de/ascii/
    Clear-Host
    Write-Host "__      __           _              _____ _               _             " -ForegroundColor Cyan           
    Write-Host "\ \    / /          (_)            / ____| |             | |            " -ForegroundColor Cyan
    Write-Host " \ \  / /__ _ __ ___ _  ___  _ __ | |    | |__   ___  ___| | _____ _ __ " -ForegroundColor DarkCyan
    Write-Host "  \ \/ / _ \ '__/ __| |/ _ \| '_ \| |    | '_ \ / _ \/ __| |/ / _ \ '__|" -ForegroundColor Blue
    Write-Host "   \  /  __/ |  \__ \ | (_) | | | | |____| | | |  __/ (__|   <  __/ |   " -ForegroundColor Blue
    Write-Host "    \/ \___|_|  |___/_|\___/|_| |_|\_____|_| |_|\___|\___|_|\_\___|_|   " -ForegroundColor DarkBlue
    Write-Host ""
}


PrintHeader

$apps = Get-Content ".\testdata.txt"

# Needs some check here if the path is valid or if there's any kind of problem to tell the user

# if (Test-Path $apps) { 
#     Write-Host "List is missing. Please put an apps list into the current directory." -ForegroundColor Red
#     return 
# } 

if ($null -eq $apps) {
    Write-Host "`nList is empty, set some paths there.`n" -ForegroundColor Red
    return
}
    
try {
    $report = foreach ($app in $apps) {
        $appInfo = Get-Item $app -ErrorAction Stop
        [PSCustomObject]@{
            "AppName" = $appInfo.VersionInfo.ProductName
            "Version" = $appInfo.VersionInfo.FileVersionRaw
            # "Path" = $appInfo.VersionInfo.FileName
        }
    }
    
    $report | Format-Table -AutoSize
}
catch {
    Write-Error "The script only works on Windows!`n`n" 
}

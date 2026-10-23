
function PrintHeader {
    # Font "big" --> http://www.network-science.de/ascii/
    Clear-Host
    Write-Output "__      __           _              _____ _               _             "             
    Write-Output "\ \    / /          (_)            / ____| |             | |            "
    Write-Output " \ \  / /__ _ __ ___ _  ___  _ __ | |    | |__   ___  ___| | _____ _ __ "
    Write-Output "  \ \/ / _ \ '__/ __| |/ _ \| '_ \| |    | '_ \ / _ \/ __| |/ / _ \ '__|"
    Write-Output "   \  /  __/ |  \__ \ | (_) | | | | |____| | | |  __/ (__|   <  __/ |   "
    Write-Output "    \/ \___|_|  |___/_|\___/|_| |_|\_____|_| |_|\___|\___|_|\_\___|_|   "
    Write-Output ""
}

PrintHeader

$apps = Get-Content ".\testdata.txt"

# Needs some check here if the path is valid

# if (Test-Path $apps) { 
#     Write-Host "List is missing. Please put an apps list into the current directory." -ForegroundColor Red
#     return 
# } 

if ($null -eq $apps) {
    Write-Host "`nList is empty, set some paths there.`n" -ForegroundColor Red
    return
}

$report = foreach ($app in $apps) {
    $appInfo = Get-Item $app
    [PSCustomObject]@{
        "App" = $appInfo.VersionInfo.ProductName
        "RAW-Version" = $appInfo.VersionInfo.FileVersionRaw
        # "Path" = $appInfo.VersionInfo.FileName
    }
}

$report | Format-Table -AutoSize

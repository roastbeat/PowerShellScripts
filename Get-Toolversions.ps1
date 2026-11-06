<#
Refactor Roadmap
- Create Shared Print-Header function in util module

- (Execution Policy Bypass for current user)
- Test-Path for path to tools list
- Test if list has content
- Test if list has valid content --> Test-Path every link

- Set key/value pairs to objects --> key = fullname of tool, value = path
- Get tool name and full version number inkl. minor nums in new object
- If script will run on server with updated tools, get last writing time of tool too 

- Do same logic with hash statements and run them with short delay between each

- Output everything in ordered list (object) and write all into temporary text file

Name        Version         LastEdit
-----       --------        ---------
Firefox     155.6.723.1     13.11.2026_8:22:43
MSEdge      101.2.98        13.11.2026_8:23:18


Name        Hash
-----       -----
Firefox     45FC23...
MSEdge      32CF54...
#>

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
    Write-Host "Error: $($_.Exception.Message)`n`n" -ForegroundColor Red 
}

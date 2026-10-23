function PrintHeader {
    Write-Host " _____ _____     _               _             "
    Write-Host "|_   _|  __ \   | |             | |            "
    Write-Host "  | | | |__) |__| |__   ___  ___| | _____ _ __ "
    Write-Host "  | | |  ___/ __| '_ \ / _ \/ __| |/ / _ \ '__|"
    Write-Host " _| |_| |  | (__| | | |  __/ (__|   <  __/ |   "
    Write-Host "|_____|_|   \___|_| |_|\___|\___|_|\_\___|_|   "
}    

Clear-Host

$exit = 'n'

PrintHeader

do {
    $target = Read-Host("`nType FQDN or IP")

    try {
        $isOnline = Test-Connection $target -Quiet

        # Clear-Host

        if ($isOnline) {
            Write-Host "`nTarget '$target' is online.`n" -ForegroundColor Green
        } else {
            Write-Host "`nTarget '$target' is offline.`n" -ForegroundColor Red
        } 
    }
    catch {
        Write-Host "`nNo FQDN or IP found`n" -ForegroundColor DarkYellow
    }

    $exit = Read-Host("Exit? [y]/[n]") 
    # Write-Host $exit

    
} while ($exit -eq 'n')

Clear-Host


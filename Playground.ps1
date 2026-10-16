
$target = $null

do {
    $target = Read-Host("Set FQDN or IP")
}while ($null -eq $target)

$isOnline = Test-Connection $connection -Quiet

cls

if ($isOnline -eq $true) {
    Write-Host "`nThe target '$target ' is online.`n" -ForegroundColor Green
} else {
    Write-Host "`nThe target '$target ' is offline.`n" -ForegroundColor Red
} 

Pause

cls
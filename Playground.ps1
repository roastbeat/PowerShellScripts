try {
    $data = Get-Content "./testdata.txt" -ErrorAction Stop
    
    # Just for debugging
    # $data.GetType().FullName

foreach ($ip in $data) {
    Test-Connection $ip 
    Write-Output "`n$('=' * 80)"
}
}
catch [System.IO.FileNotFoundException]{
    Write-Host "File missing!"
}
catch {
    Write-Host "`nUnexpected error: $($_.Exception.Message)`n" -ForegroundColor Red
}




try {
    $data = Get-Content "./testdata.txt" -ErrorAction Stop

    # Add check to test if file is empty or nullish!

    # Another comment for testing gfin and running some more context here
    
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




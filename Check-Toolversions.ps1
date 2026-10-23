
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


# Hier noch checken, ob eine App schon laeuft und ggf. direkt die Info auslesen
# Der Einfachheit halber werden die laufenden Prozesse der gleichen Art vor dem Check beendet

Write-Output "`nAlle bereits laufenden Tools werden geschlossen vor dem Check!`n"

Pause

PrintHeader

Stop-Process -Name firefox -ErrorAction SilentlyContinue
Stop-Process -Name msedge -ErrorAction SilentlyContinue
Stop-Process -Name soffice.bin -ErrorAction SilentlyContinue

# Create a hashtable here to access key / value pairs for further information
$processes = Get-Content "./testdata.txt"


# Is it really necessary to start the processes for the wanted infos??
foreach ($process in $processes){
    # Maybe the hashtable has to be created here, because now the paths are real processes where the infos live
    Start-Process $process
}

# Start-Process "C:\Program Files\Mozilla Firefox\firefox.exe" 
# Start-Process "C:\Program Files\LibreOffice\program\swriter.exe" 
# Start-Process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"


$foxInfo = Get-Process -Name firefox -FileVersionInfo
$writerInfo = Get-Process -Name swriter -FileVersionInfo
$edgeInfo = Get-Process -Name msedge -FileVersionInfo

$toolInfos = @($foxInfo, $writerInfo, $edgeInfo)

foreach ($toolInfo in $toolInfos) {
    Write-Output "", $toolInfo.FileDescription, $toolInfo.ProductVersion, ""
}


# Wait for opening all tools correctly
Start-Sleep 5

Stop-Process -Name firefox
Stop-Process -Name msedge
Stop-Process -Name soffice.bin
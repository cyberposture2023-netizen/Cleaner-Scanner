# Launch script for Cyber Posture Cleaner
Write-Host "`nLaunching Cyber Posture Cleaner..." -ForegroundColor Cyan
. .\Cleaner\Logic\Cleanup.ps1
. .\Scanner\Logic\Scan.ps1
. .\Admin\Logic\Admin.ps1
Clear-TempFiles
Scan-Network
Add-User "CyberAdmin"

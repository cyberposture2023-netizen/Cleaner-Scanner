Start-Job -ScriptBlock {
    powershell -ExecutionPolicy Bypass -File '.\MainUI\Logic\MainUI_Launch.ps1'
}
Start-Sleep -Seconds 3
Write-Host ' Cyber Posture Cleaner launched with full UI wiring.'

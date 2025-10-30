Start-Job -ScriptBlock {
    . .\Cleaner\Logic\Cleanup.ps1
    . .\Scanner\Logic\Scan.ps1
    . .\Admin\Logic\Admin.ps1
    . .\Admin\Logic\VoiceCommand.ps1
    . .\Admin\Logic\StartupOptimizer.ps1
    . .\Cleaner\Logic\PrivacyEraser.ps1
    . .\Scanner\Logic\USBMonitor.ps1
    . .\Admin\Logic\RestorePoint.ps1
    . .\Admin\Logic\Accessibility.ps1
    . .\Admin\Logic\HealthDashboard.ps1
    . .\Scanner\Logic\ExportScan.ps1

    Clear-TempFiles
    Scan-Network
    Show-SystemHealth
    Enable-Accessibility
    Listen-ForVoiceCommand
}
Start-Sleep -Seconds 3
Write-Host " Cyber Posture Cleaner launched with unified dashboard."

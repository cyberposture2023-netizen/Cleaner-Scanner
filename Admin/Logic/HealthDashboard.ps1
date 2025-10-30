function Show-SystemHealth {
    $disk = Get-PSDrive C | Select-Object Used,Free
    $mem = Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory,TotalVisibleMemorySize
    $lastCleanup = (Get-Item ".\Cleaner\Logic\Cleanup.ps1").LastWriteTime
    "$($disk.Used) used, $($disk.Free) free on C:`nMemory: $($mem.FreePhysicalMemory) KB free of $($mem.TotalVisibleMemorySize) KB`nLast Cleanup: $lastCleanup" | Out-File ".\Admin\health.txt"
}

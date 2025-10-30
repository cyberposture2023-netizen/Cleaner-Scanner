$taskName = "CyberPostureAutoCleanup"
$scriptPath = "$PWD\Cleaner\Logic\Cleanup.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Auto cleanup for Cyber Posture Cleaner" -Force

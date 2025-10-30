Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 5 WHERE TargetInstance ISA 'Win32_USBHub'" -Action {
    [System.Windows.MessageBox]::Show("New USB device detected!", "Cyber Posture Alert")
}

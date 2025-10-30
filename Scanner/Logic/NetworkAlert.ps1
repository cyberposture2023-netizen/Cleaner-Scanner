function Alert-OnNewDevices {
    $known = ".\Scanner\known_hosts.txt"
    $current = ".\Scanner\scan_results.txt"
    if (-not (Test-Path $known)) { Copy-Item $current $known }
    $new = Compare-Object (Get-Content $known) (Get-Content $current) | Where-Object { $_.SideIndicator -eq "=>" }
    if ($new) {
        [System.Windows.MessageBox]::Show("New device(s) detected on your network!", "Cyber Posture Alert")
    }
}

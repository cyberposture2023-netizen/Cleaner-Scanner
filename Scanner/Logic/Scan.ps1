function Scan-Network {
    $subnet = ($env:COMPUTERNAME, (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "169.*" -and $_.IPAddress -ne "127.0.0.1" })[0].IPAddress.Split(".")[0..2] -join ".") + "."
    $results = @()
    1..254 | ForEach-Object {
        $ip = "$subnet$_"
        if (Test-Connection -ComputerName $ip -Count 1 -Quiet -ErrorAction SilentlyContinue) {
            try {
                $hostname = [System.Net.Dns]::GetHostEntry($ip).HostName
            } catch {
                $hostname = "Unknown"
            }
            $results += "$ip`t$hostname"
        }
    }
    $results | Out-File -FilePath ".\Scanner\scan_results.txt" -Encoding UTF8
    return $results
}

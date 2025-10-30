function Export-ScanResults {
    $src = ".\Scanner\scan_results.txt"
    $dest = ".\Scanner\scan_export.csv"
    Get-Content $src | ForEach-Object {
        $parts = $_ -split "`t"
        "$($parts[0]),$($parts[1])"
    } | Set-Content $dest
}

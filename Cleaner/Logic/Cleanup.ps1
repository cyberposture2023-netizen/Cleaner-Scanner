function Clear-TempFiles {
    Get-ChildItem -Path $env:TEMP -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}

function Empty-RecycleBin {
    (New-Object -ComObject Shell.Application).NameSpace(10).Items() | ForEach-Object { Remove-Item $_.Path -Force -Recurse -ErrorAction SilentlyContinue }
}

function Clear-BrowserCache {
    $cachePath = Join-Path $env:LOCALAPPDATA 'Google\Chrome\User Data\Default\Cache'
    Get-ChildItem -Path $cachePath -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
}

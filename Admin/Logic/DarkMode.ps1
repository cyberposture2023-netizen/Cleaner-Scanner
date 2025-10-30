function Toggle-DarkMode {
    $themeFile = ".\Admin\settings.txt"
    if (-not (Test-Path $themeFile)) { Set-Content $themeFile "light" }
    $current = Get-Content $themeFile
    $new = if ($current -eq "light") { "dark" } else { "light" }
    Set-Content $themeFile $new
    Write-Host "Theme switched to $new mode."
}

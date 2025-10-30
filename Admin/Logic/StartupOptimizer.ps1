function List-StartupPrograms {
    Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location
}
function Disable-StartupProgram($name) {
    Get-CimInstance Win32_StartupCommand | Where-Object { $_.Name -eq $name } | Remove-CimInstance
}

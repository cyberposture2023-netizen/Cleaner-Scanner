Import-Module PresentationFramework

# Load XAML
[xml]$xaml = Get-Content ".\MainUI\MainUI.xaml"
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Bind buttons
$btnTemp      = $window.FindName("btnTemp")
$btnRecycle   = $window.FindName("btnRecycle")
$btnBrowser   = $window.FindName("btnBrowser")
$btnPrivacy   = $window.FindName("btnPrivacy")
$btnScan      = $window.FindName("btnScan")
$btnExport    = $window.FindName("btnExport")
$btnAddUser   = $window.FindName("btnAddUser")
$btnRemoveUser= $window.FindName("btnRemoveUser")
$btnRestore   = $window.FindName("btnRestore")
$btnTheme     = $window.FindName("btnTheme")
$btnRefresh   = $window.FindName("btnRefresh")
$lstScanResults = $window.FindName("lstScanResults")
$txtHealth    = $window.FindName("txtHealth")
$txtUsername  = $window.FindName("txtUsername")

# Load logic
. .\Cleaner\Logic\Cleanup.ps1
. .\Cleaner\Logic\PrivacyEraser.ps1
. .\Scanner\Logic\Scan.ps1
. .\Scanner\Logic\ExportScan.ps1
. .\Admin\Logic\Admin.ps1
. .\Admin\Logic\RestorePoint.ps1
. .\Admin\Logic\DarkMode.ps1
. .\Admin\Logic\HealthDashboard.ps1

# Wire events
$btnTemp.Add_Click({ Clear-TempFiles })
$btnRecycle.Add_Click({ Clear-RecycleBin })
$btnBrowser.Add_Click({ Clear-BrowserCache })
$btnPrivacy.Add_Click({ Erase-PrivacyData })

$btnScan.Add_Click({
    $results = Scan-Network
    $lstScanResults.Items.Clear()
    $results | ForEach-Object { $lstScanResults.Items.Add($_) }
})

$btnExport.Add_Click({ Export-ScanResults })

$btnAddUser.Add_Click({
    $user = $txtUsername.Text
    if ($user) { Add-User $user }
})

$btnRemoveUser.Add_Click({
    $user = $txtUsername.Text
    if ($user) { Remove-User $user }
})

$btnRestore.Add_Click({ Create-RestorePoint })
$btnTheme.Add_Click({ Toggle-DarkMode })

$btnRefresh.Add_Click({
    Show-SystemHealth
    $txtHealth.Text = Get-Content ".\Admin\health.txt" -Raw
})

# Show window
$window.ShowDialog() | Out-Null

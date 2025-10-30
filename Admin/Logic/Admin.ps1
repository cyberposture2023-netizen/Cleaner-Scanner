function Add-User($username) {
    Add-Content ".\Admin\users.txt" "$username"
}

function Remove-User($username) {
    (Get-Content ".\Admin\users.txt") | Where-Object { $_ -ne $username } | Set-Content ".\Admin\users.txt"
}

function View-AuditLogs {
    if (Test-Path ".\Admin\audit.log") {
        Get-Content ".\Admin\audit.log"
    } else {
        "No logs found."
    }
}

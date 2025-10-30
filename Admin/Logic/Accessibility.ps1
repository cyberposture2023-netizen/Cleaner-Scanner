function Enable-Accessibility {
    $settings = ".\Admin\accessibility.txt"
    Set-Content $settings "FontSize=16`nTooltips=Enabled`nShortcuts=Enabled"
}

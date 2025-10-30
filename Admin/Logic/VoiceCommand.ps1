Add-Type -AssemblyName System.Speech
function Listen-ForVoiceCommand {
    $recognizer = New-Object System.Speech.Recognition.SpeechRecognitionEngine
    $commands = New-Object System.Speech.Recognition.Choices
    $commands.Add("clean system")
    $commands.Add("scan network")
    $commands.Add("show dashboard")
    $grammar = New-Object System.Speech.Recognition.GrammarBuilder
    $grammar.Append($commands)
    $recognizer.LoadGrammar((New-Object System.Speech.Recognition.Grammar($grammar)))
    $recognizer.SetInputToDefaultAudioDevice()
    $result = $recognizer.Recognize()
    if ($result -and $result.Text) {
        switch ($result.Text) {
            "clean system" { Clear-TempFiles }
            "scan network" { Scan-Network }
            "show dashboard" { Show-SystemHealth }
        }
    } else {
        Write-Host "No voice input detected. Please try again." -ForegroundColor Yellow
    }
}

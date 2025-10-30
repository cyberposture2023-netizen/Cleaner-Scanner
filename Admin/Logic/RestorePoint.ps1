function Create-RestorePoint {
    Checkpoint-Computer -Description "CyberPosture Restore Point" -RestorePointType "MODIFY_SETTINGS"
}

# Product Requirements Document (PRD)

## Overview
Cleaner-Scanner is a desktop utility for system cleanup and network scanning, tailored for older users.

## Architecture
- Security-first, privacy-first
- Modular design: Cleaner, Scanner, Admin
- Open-source stack (Node.js, Python, .NET)
- GitHub-based CI/CD

## Branding
Cyber Posture LLC  
@ Privacy all rights reserved

## Initial Dependencies
- Node.js LTS
- Python 3.x
- .NET SDK
- Git

### Patch 3\n- Used single-quoted here-string to preserve PowerShell syntax.

## Phase 1.2\n- Scanner module with UI and subnet ping sweep.

## Phase 1.3\n- Admin module with tabs for users, settings, and logs.

## Phase 2.1\n- Executable packaging using ps2exe with Cyber Posture LLC branding.

## Phase 2.22.6\n- Auto-cleanup scheduler\n- Network alerting\n- Dark mode toggle\n- System health dashboard\n- Export scan results to CSV

### Patch\n- Added null check to prevent crash when no voice input is detected.

## Phase 4\n- Full app launch script\n- Background job\n- Browser auto-open to dashboard

## Phase 4.1\n- Dashboard tab added to AdminUI.xaml\n- Browser launch removed from launch_full.ps1

## Phase 4.2\n- Unified dashboard with tabs for Cleaner, Scanner, Admin, and Health.

## Phase 4.3\n- Full UI wiring for MainUI.xaml\n- Buttons trigger cleanup, scan, export, user actions, restore, theme, dashboard

## Phase 4.4\n- Corrected x:Name bindings\n- Verified button references\n- Updated launcher

## Phase 5\n- WPF host integration\n- Executable launcher\n- UI triggers PowerShell logic

## Phase 5.1\n- Fixed WPF initialization\n- Added error logging\n- Ensured UI stays open\n- Rebuilt CyberPostureCleaner.exe

## Phase 5.2\n- Updated .csproj to net9.0-windows\n- Removed version bindings\n- Rebuilt CyberPostureCleaner.exe

# Configure the Operating System

# Activate Dark theme
Write-Host "Activating Dark theme in Windows:" -ForegroundColor "Green";
Start-Process -Filepath "$env:WINDIR\Resources\Themes\dark.theme";
timeout /t 5;
taskkill /im "systemsettings.exe" /f;

# Disable "Let's finish setting up your device"
Write-Host "Disabling ""Let's finish setting up your device"" modal" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion";
if (-not (Test-Path -Path "$REG_PATH\UserProfileEngagement")) {
  New-Item -Path $REG_PATH -Name "UserProfileEngagement";
}
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "ScoobeSystemSettingEnabled")) {
  New-ItemProperty -Path $REG_PATH -Name "ScoobeSystemSettingEnabled" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "ScoobeSystemSettingEnabled" -Value 0;

# Disable Telemetry (Automatic Feedback)
Write-Host "Disabling Windows Telemetry" -ForegroundColor "Green";
$REG_PATH = "HKLM:\SOFTWARE\Policies\Microsoft\Windows";
if (-not (Test-Path -Path "$REG_PATH\DataCollection")) {
  New-Item -Path $REG_PATH -Name "DataCollection";
}
$REG_PATH = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "AllowTelemetry")) {
  New-ItemProperty -Path $REG_PATH -Name "AllowTelemetry" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "AllowTelemetry" -Value 0;

# Disable Disable Tailored Experiences
Write-Host "Disabling Tailored Experiences" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion";
if (-not (Test-Path -Path "$REG_PATH\Privacy")) {
  New-Item -Path $REG_PATH -Name "Privacy";
}
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "TailoredExperiencesWithDiagnosticDataEnabled")) {
  New-ItemProperty -Path $REG_PATH -Name "TailoredExperiencesWithDiagnosticDataEnabled" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0;

$REG_PATH = "HKCU:\Software\Policies\Microsoft\Windows";
if (-not (Test-Path -Path "$REG_PATH\CloudContent")) {
  New-Item -Path $REG_PATH -Name "CloudContent";
}
$REG_PATH = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "DisableTailoredExperiencesWithDiagnosticData")) {
  New-ItemProperty -Path $REG_PATH -Name "DisableTailoredExperiencesWithDiagnosticData" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "DisableTailoredExperiencesWithDiagnosticData" -Value 1;

# Configure Windows Explorer to show file extensions
Write-Host "Configuring Windows File Explorer to show file extensions:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
Set-ItemProperty -Path $REG_PATH -Name "HideFileExt" -Value 0;

# Configure Windows Explorer StartFolder
Write-Host "Configuring start folder of Windows File Explorer:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "LaunchTo")) {
  New-ItemProperty -Path $REG_PATH -Name "LaunchTo" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "LaunchTo" -Value 1; # [This PC: 1], [Quick access: 2], [Downloads: 3]

# Set Multitasking Configuration
Write-Host "Configuring Multitasking settings (Snap layouts):" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
# When I snap a window, show what I can snap next to it.
Set-ItemProperty -Path $REG_PATH -Name "SnapAssist" -Value 1;
# Show snap layouts that the app is part of when I hover over the taskbar buttons.
Set-ItemProperty -Path $REG_PATH -Name "EnableTaskGroups" -Value 0;
# When I resize a snapped window, simultaneously resize any adjacent snapped window.
Set-ItemProperty -Path $REG_PATH -Name "JointResize" -Value 1;
# Show snap layout when I hover over a window's maximize button.
Set-ItemProperty -Path $REG_PATH -Name "EnableSnapAssistFlyout" -Value 1;
# When I drag a window, let me snap it without dragging all the way to the screen edge.
Set-ItemProperty -Path $REG_PATH -Name "DITest" -Value 1;
# When I snap a window, automatically size it to fill available space.
Set-ItemProperty -Path $REG_PATH -Name "SnapFill" -Value 1;
Write-Host "Multitasking successfully updated." -ForegroundColor "Green";

# Disable Recently Opened Items From JumpList
Write-Host "Configuring Jump List to do not show the list of recently opened items:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "Start_TrackDocs")) {
  New-ItemProperty -Path $REG_PATH -Name "Start_TrackDocs" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "Start_TrackDocs" -Value 0;

# Set Power Configuration
Write-Host "Configuring power plan:" -ForegroundColor "Green";
# AC: Alternating Current (Wall socket).
# DC: Direct Current (Battery).
# Set turn off disk timeout (in minutes / 0: never)
powercfg -change "disk-timeout-ac" 0;
powercfg -change "disk-timeout-dc" 0;
# Set hibernate timeout (in minutes / 0: never)
powercfg -change "hibernate-timeout-ac" 0;
powercfg -change "hibernate-timeout-dc" 0;
# Set sleep timeout (in minutes / 0: never)
powercfg -change "standby-timeout-ac" 0;
powercfg -change "standby-timeout-dc" 0;
# Set turn off screen timeout (in minutes / 0: never)
powercfg -change "monitor-timeout-ac" 10;
powercfg -change "monitor-timeout-dc" 10;
# Set turn off screen timeout on lock screen (in seconds / 0: never)
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 5;
powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_VIDEO VIDEOCONLOCK 5;
# Disable Adaptive Brightness
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_VIDEO ADAPTBRIGHT 0;
powercfg /SETACTIVE SCHEME_CURRENT;
Write-Host "Power plan successfully updated." -ForegroundColor "Green";

# Set Custom Regional Format
Write-Host "Configuring Regional format:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Control Panel\International";
Set-ItemProperty -Path $REG_PATH -Name "iFirstDayOfWeek" -Value "0";
Set-ItemProperty -Path $REG_PATH -Name "sShortDate" -Value "yyyy-MM-dd";
Set-ItemProperty -Path $REG_PATH -Name "sLongDate" -Value "dddd, d MMMM, yyyy";
Set-ItemProperty -Path $REG_PATH -Name "sShortTime" -Value "HH:mm";
Set-ItemProperty -Path $REG_PATH -Name "sTimeFormat" -Value "HH:mm:ss";
Write-Host "Regional format successfully updated." -ForegroundColor "Green";

# Turn On Clipboard History
Write-Host "Turning On Clipboard History:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Clipboard";
Set-ItemProperty -Path $REG_PATH -Name "EnableClipboardHistory" -Value 1;

# Taskbar alignment to left
Write-Host "Changing Taskbar alignment to left:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "TaskbarAl")) {
  New-ItemProperty -Path $REG_PATH -Name "TaskbarAl" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "TaskbarAl" -Value "0";

# Hide the Widgets button from the Taskbar
Write-Host "Hiding the Widgets button from the Taskbar:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
Set-ItemProperty -Path $REG_PATH -Name "TaskbarDa" -Value "0";

# Hide the Chat button from the Taskbar
Write-Host "Hiding the Chat button from the Taskbar:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced";
Set-ItemProperty -Path $REG_PATH -Name "TaskbarMn" -Value "0";

# Hide the Search button from the Taskbar
Write-Host "Hiding the Search button from the Taskbar:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search";
Set-ItemProperty -Path $REG_PATH -Name "SearchboxTaskbarMode" -Value "0";

# Enable Recycle Bin on Removable Flash Drives
Write-Host "Enabling Recycle Bin on Removable Flash Drives:" -ForegroundColor "Green";
$REG_PATH = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion";
if (-not (Test-Path -Path "$REG_PATH\Policies")) {
  New-Item -Path $REG_PATH -Name "Policies";
}
$REG_PATH = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies";
if (-not (Test-Path -Path "$REG_PATH\Explorer")) {
  New-Item -Path $REG_PATH -Name "Explorer";
}
$REG_PATH = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer";
if (-not (Test-PathRegistryKey -Path $REG_PATH -Name "RecycleBinDrives")) {
  New-ItemProperty -Path $REG_PATH -Name "RecycleBinDrives" -PropertyType DWord;
}
Set-ItemProperty -Path $REG_PATH -Name "RecycleBinDrives" -Value "0xffffffff";

# Disable Windows Features
Write-Host "Disabling Windows Media Player:" -ForegroundColor "Green";
Disable-WindowsFeature "WindowsMediaPlayer";
Write-Host "Disabling Microsoft XPS Document Writer:" -ForegroundColor "Green";
Disable-WindowsFeature "Printing-XPSServices-Features";
Write-Host "Disabling WorkFolders-Client:" -ForegroundColor "Green";
Disable-WindowsFeature "WorkFolders-Client";

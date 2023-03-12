# Install & configure apps

Write-Host "Installing PSWebSearch module:" -ForegroundColor "Green";
Install-Module -Name "PSWebSearch" -Repository "PSGallery" -Scope "AllUsers";

Write-Host "Installing Winfetch script:" -ForegroundColor "Green";
Install-Script -Name "pwshfetch-test-1" -Repository "PSGallery" -Scope "AllUsers" -Force;

# Install Winget apps

## Install Oh My Posh
if (-not (Test-WingetApp -AppId "JanDeDobbeleer.OhMyPosh")) {
  Write-Host "Installing OhMyPosh:" -ForegroundColor "Green";
  Install-WingetApp -AppId "JanDeDobbeleer.OhMyPosh" -Source "winget";
}

## PowerShell
if (-not (Test-WingetApp -AppId "Microsoft.PowerShell")) {
  Write-Host "Installing PowerShell:" -ForegroundColor "Green";
  Install-WingetApp -AppId "Microsoft.PowerShell" -Source "winget";
}

$MY_DOCUMENTS_PATH = [environment]::getfolderpath("mydocuments");

If (-not (Test-Path -PathType "Container" -Path "$MY_DOCUMENTS_PATH\WindowsPowerShell")) {
  New-Item -Path "$MY_DOCUMENTS_PATH\WindowsPowerShell" -ItemType "Directory";
}
New-Item -ItemType "SymbolicLink" -Path "$MY_DOCUMENTS_PATH\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Target "$env:DOTFILES_PATH\Apps\powershell\profile.ps1" -Force;

If (-not (Test-Path -PathType "Container" -Path "$MY_DOCUMENTS_PATH\PowerShell")) {
  New-Item -Path "$MY_DOCUMENTS_PATH\PowerShell" -ItemType "Directory";
}
New-Item -ItemType "SymbolicLink" -Path "$MY_DOCUMENTS_PATH\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$env:DOTFILES_PATH\Apps\powershell\profile.ps1" -Force;

## Windows Terminal
New-Item -ItemType "SymbolicLink" -Path "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:DOTFILES_PATH\Apps\windows-terminal\settings.json" -Force;
Write-Host "Opening Windows Terminal for 15 seconds to load the profile, ignore any error in that terminal:" -ForegroundColor "Green";
wt new-tab PowerShell -c "Set-ExecutionPolicy Unrestricted;";
Start-Sleep -Seconds 15;
Write-Host "Closing Windows Terminal:" -ForegroundColor "Green";
Stop-Process -Name "WindowsTerminal" -Force;

## Install VLC
if (-not (Test-WingetApp -AppId "VideoLAN.VLC")) {
  Write-Host "Installing VLC:" -ForegroundColor "Green";
  Install-WingetApp -AppId "VideoLAN.VLC" -Source "winget";
}

## Install GIMP
if (-not (Test-WingetApp -AppId "GIMP.GIMP")) {
  Write-Host "Installing GIMP:" -ForegroundColor "Green";
  Install-WingetApp -AppId "GIMP.GIMP" -Source "winget";
}

## Install GnuPG
if (-not (Test-WingetApp -AppId "GnuPG.GnuPG")) {
  Write-Host "Installing GnuPG:" -ForegroundColor "Green";
  Install-WingetApp -AppId "GnuPG.GnuPG" -Source "winget";
}

## Install CrystalDiskInfo
if (-not (Test-WingetApp -AppId "CrystalDewWorld.CrystalDiskInfo")) {
  Write-Host "Installing CrystalDiskInfo:" -ForegroundColor "Green";
  Install-WingetApp -AppId "CrystalDewWorld.CrystalDiskInfo" -Source "winget";
}

## Install HWMonitor
if (-not (Test-WingetApp -AppId "CPUID.HWMonitor")) {
  Write-Host "Installing HWMonitor:" -ForegroundColor "Green";
  Install-WingetApp -AppId "CPUID.HWMonitor" -Source "winget";
}

## Install PowerToys
if (-not (Test-WingetApp -AppId "Microsoft.PowerToys")) {
  Write-Host "Installing Microsoft PowerToys:" -ForegroundColor "Green";
  Install-WingetApp -AppId "Microsoft.PowerToys" -Source "winget";
}

## Install Visual Studio Code
if (-not (Test-WingetApp -AppId "Microsoft.VisualStudioCode")) {
  Write-Host "Installing Visual Studio Code:" -ForegroundColor "Green";
  Install-WingetApp -AppId "Microsoft.VisualStudioCode" -Source "winget";
}
New-Item -ItemType "SymbolicLink" -Path "$env:APPDATA\Code\User\settings.json" -Target "$env:DOTFILES_PATH\Apps\vscode\settings.json" -Force;
New-Item -ItemType "SymbolicLink" -Path "$env:APPDATA\Code\User\keybindings.json" -Target "$env:DOTFILES_PATH\Apps\vscode\keybindings.json" -Force;

Write-Host "Refreshing the environment variables of the current powershell session:" -ForegroundColor "Green";
refreshenv;

## Install Visual Studio Code extensions
code --install-extension "ms-vscode-remote.remote-wsl";

# Install Microsoft Store apps

## Install FeedLab
if (-not (Test-WingetApp -AppId "9WZDNCRDKRQ3")) {
  Write-Host "Installing FeedLab:" -ForegroundColor "Green";
  Install-WingetApp -AppId "9WZDNCRDKRQ3" -Source "msstore";
}

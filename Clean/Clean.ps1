# Clean Dotfiles temp folder & clean the Operating System

# Remove Desktop Shortcuts
$USER_DESKTOP_PATH = [Environment]::GetFolderPath("Desktop");
$PUBLIC_DESKTOP_PATH = "${env:Public}\Desktop";
Write-Host "Deleting shorcuts in desktop:" -ForegroundColor "Green";
Get-ChildItem -Path "${USER_DESKTOP_PATH}\*" -Include "*.lnk", "*.url" -Recurse | Remove-Item;
Get-ChildItem -Path "${PUBLIC_DESKTOP_PATH}\*" -Include "*.lnk", "*.url" -Recurse | Remove-Item;
Write-Host "Shorcuts in desktop successfully deleted." -ForegroundColor "Green";

# Delete Dotfiles temp folder
if (Test-Path -Path "$HOME\dotfiles_temp") {
  Remove-Item -Path "$HOME\dotfiles_temp" -Recurse -Force;
}

# Uninstall App Packages
Uninstall-WindowsStoreApp "Clipchamp.Clipchamp";
Uninstall-WindowsStoreApp "Microsoft.BingWeather";
Uninstall-WindowsStoreApp "Microsoft.GetHelp";
Uninstall-WindowsStoreApp "Microsoft.Getstarted";
Uninstall-WindowsStoreApp "Microsoft.MicrosoftSolitaireCollection";
Uninstall-WindowsStoreApp "Microsoft.WindowsFeedbackHub";

# Uninstall useless apps
Write-Host "Uninstalling Disney+" -ForegroundColor "Green";
Uninstall-WingetApp -AppId "Disney.37853FC22B2CE_6rarf9sa4v8jt";
Write-Host "Uninstalling Elevoc Vocplus System" -ForegroundColor "Green";
Uninstall-WingetApp -AppId "ElevocTechnologyCo.Ltd.ElevocVocplusSystem_ttaqwwhyt5s6t";
Write-Host "Uninstalling Microsoft News" -ForegroundColor "Green";
Uninstall-WingetApp -AppId "Microsoft.BingNews_8wekyb3d8bbwe";
Write-Host "Uninstalling Power Automate" -ForegroundColor "Green";
Uninstall-WingetApp -AppId "Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe";

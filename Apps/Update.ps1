# Update & configure apps

Write-Host "Updating PSWebSearch module:" -ForegroundColor "Green";
Update-Module -Name "PSWebSearch";

Write-Host "Updating PSWindowsDotfiles module:" -ForegroundColor "Green";
Update-Module -Name "PSWindowsDotfiles";

Write-Host "Updating Winfetch script:" -ForegroundColor "Green";
Update-Script -Name "pwshfetch-test-1";

# Upgrade base packages

Write-Host "Updating Git:" -ForegroundColor "Green";
Update-WingetApp -AppId "Git.Git" -Source "winget";

# Upgrade langs packages

Write-Host "Updating Microsoft DotNet SDK 6:" -ForegroundColor "Green";
Update-WingetApp -AppId "Microsoft.DotNet.SDK.6" -Source "winget";

# Upgrade Winget apps

Write-Host "Updating OhMyPosh:" -ForegroundColor "Green";
Update-WingetApp -AppId "JanDeDobbeleer.OhMyPosh" -Source "winget";

Write-Host "Updating PowerShell:" -ForegroundColor "Green";
Update-WingetApp -AppId "Microsoft.PowerShell" -Source "winget";

Write-Host "Updating VLC:" -ForegroundColor "Green";
Update-WingetApp -AppId "VideoLAN.VLC" -Source "winget";

Write-Host "Updating GIMP:" -ForegroundColor "Green";
Update-WingetApp -AppId "GIMP.GIMP" -Source "winget";

Write-Host "Updating GnuPG:" -ForegroundColor "Green";
Update-WingetApp -AppId "GnuPG.GnuPG" -Source "winget";

Write-Host "Updating CrystalDiskInfo:" -ForegroundColor "Green";
Update-WingetApp -AppId "CrystalDewWorld.CrystalDiskInfo" -Source "winget";

Write-Host "Updating HWMonitor:" -ForegroundColor "Green";
Update-WingetApp -AppId "CPUID.HWMonitor" -Source "winget";

Write-Host "Updating PowerToys:" -ForegroundColor "Green";
Update-WingetApp -AppId "Microsoft.PowerToys" -Source "winget";

Write-Host "Updating Microsoft VisualStudio Code:" -ForegroundColor "Green";
Update-WingetApp -AppId "Microsoft.VisualStudioCode" -Source "winget";

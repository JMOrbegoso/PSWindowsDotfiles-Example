# Install & configure programming languages

## Install Microsoft dotnet SDK
if (-not (Test-WingetApp -AppId "Microsoft.DotNet.SDK.6")) {
  Write-Host "Installing Microsoft DotNet SDK 6:" -ForegroundColor "Green";
  Install-WingetApp -AppId "Microsoft.DotNet.SDK.6" -Source "winget";
}

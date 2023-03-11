# Install & configure base apps

# Install Git
## Configure the Git installation
## | Parameter                                        | Do                                                                  |
## | ------------------------------------------------ | ------------------------------------------------------------------- |
## | /SILENT /VERYSILENT /SUPPRESSMSGBOXES            | Silent installation                                                 |
## | /NORESTART                                       | No restart                                                          |
## | /o:CURLOption=WinSSL                             | Use the native Windows Secure Channel library                       |
## | /o:CRLFOption=CRLFCommitAsIs                     | Checkout as-is, commit as-is                                        |
## | /o:BashTerminalOption=ConHost                    | Use Windows default console window                                  |
## | /o:EditorOption=notepad                          | Use Windows Notepad as Git default editor                           |
## | /o:DefaultBranchOption=main                      | Override default brach name to "main"                               |
## | /o:PathOption=Cmd                                | Git from command line and also 3rd-party unified-software           |
## | /COMPONENTS='!ext, !ext\shellhere, !ext\guihere' | NO Windows Explorer integration (No Git Bash here, No Git GUI here) |
## | /COMPONENTS='!autoupdate'                        | Disable autoupdate                                                  |
## | /COMPONENTS='!consolefont'                       | Do not force OpenType fonts on Git Bash                             |
## | /COMPONENTS='!windowsterminal'                   | No add a Git Bash profile to Windows Terminal                       |
## | /COMPONENTS='!assoc_sh'                          | Do not associate sh files with Git                                  |
## | /COMPONENTS='assoc'                              | Associate Git files with Git                                        |
## | /COMPONENTS='gitlfs'                             | Enable Git LFS                                                      |
if (-not (Test-WingetApp -AppId "Git.Git")) {
  Write-Host "Installing Git:" -ForegroundColor "Green";
  Install-WingetApp -AppId "Git.Git" -Source "winget" -Parameters "/SILENT /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /o:CURLOption=WinSSL /o:CRLFOption=CRLFCommitAsIs /o:BashTerminalOption=ConHost /o:EditorOption=notepad /o:DefaultBranchOption=main /o:PathOption=Cmd /COMPONENTS='!ext, !ext\shellhere, !ext\guihere, !autoupdate, !consolefont, !windowsterminal, !assoc_sh, assoc, gitlfs'";
}
New-Item -ItemType "SymbolicLink" -Path "$env:USERPROFILE\.gitconfig" -Target "$env:DOTFILES_PATH\Base\git\.gitconfig" -Force;

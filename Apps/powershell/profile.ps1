# Export DOTFILES_PATH
$DOTFILES_PATH = "$env:USERPROFILE\.dotfiles";

# Load modules
Import-Module "PSWindowsDotfiles";

# Load exports
Get-ChildItem "$DOTFILES_PATH\Shell\exports" -Filter *.ps1 | Foreach-Object { . $_.FullName; }

# Load scripts
Get-ChildItem "$DOTFILES_PATH\Shell\scripts" -Filter *.ps1 | Foreach-Object { . $_.FullName; }

# Load functions
Get-ChildItem "$DOTFILES_PATH\Shell\functions" -Filter *.ps1 | Foreach-Object { . $_.FullName; }

# Load OhMyPosh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\agnoster.minimal.omp.json" | Invoke-Expression; # --config "$DOTFILES_PATH\Shell\themes\agnoster.omp.json"

# Winfetch
pwshfetch-test-1;

Set-PSReadlineOption -BellStyle "None";
Set-PSReadLineOption -PredictionSource "History";
Set-PSReadLineKeyHandler -Chord "Tab" -Function "MenuComplete";

Set-PSReadLineOption -Colors @{
  "InlinePrediction" = [ConsoleColor]::DarkGray;
}

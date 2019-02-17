if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

choco upgrade --allow-empty-checksums -y battle.net
choco upgrade -y firefox battle.net hyper vim steam git git-lfs firacode virtualbox itunes thunderbird goggalaxy slack virtualbox.extensionpack lastpass vcxsrv

if(!(Test-Path c:\windows\system32\bash.exe)) {
  Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
  Rename-Item ~/Ubuntu.appx Ubuntu.zip
  Expand-Archive ~/Ubuntu.zip ~/Ubuntu
  ~/Ubuntu/ubuntu1804.exe
}

Invoke-WebRequest -Uri https://raw.githubusercontent.com/tranchis/dotfiles/master/hyper.js -OutFile ~/.hyper.js -UseBasicParsing

Read-Host 'Press Enter to continue…' | Out-Null


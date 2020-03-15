if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

choco upgrade --allow-empty-checksums -y battle.net
choco upgrade -y firefox thunderbird pycharm dropbox battle.net hyper vim steam git git-lfs firacode itunes goggalaxy slack vcxsrv nodejs.install visualstudio2017buildtools
choco upgrade -y etcher autohotkey icloud virtualbox winrar virtualbox.extensionpack hwmonitor intelpowergadget adobereader cpu-z jdk8 rocketchat hwinfo intellijidea-ultimate
choco upgrade -y vlc cmake openssl vscode libreoffice-fresh
choco install -y mysql --version=5.7.18
choco install -y anaconda3 --params /AddToPath

if(!(Test-Path ~/Ubuntu/ubuntu1804.exe)) {
  Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile ~/Ubuntu.appx -UseBasicParsing
  Rename-Item ~/Ubuntu.appx Ubuntu.zip
  Expand-Archive ~/Ubuntu.zip ~/Ubuntu
  ~/Ubuntu/ubuntu1804.exe
}

if(!(Test-Path ~/DockerDesktop.exe)) {
  Invoke-WebRequest -Uri https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe -OutFile ~/DockerDesktop.exe -UseBasicParsing
  ~/DockerDesktop.exe
}

if(!(Test-Path ~/tridactyl.xpi)) {
  Invoke-WebRequest -Uri https://tridactyl.cmcaine.co.uk/betas/tridactyl-latest.xpi -OutFile ~/tridactyl.xpi -UseBasicParsing
  Start-Process firefox ~/tridactyl.xpi
}

Read-Host 'Press Enter to continue…' | Out-Null


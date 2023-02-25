if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

choco upgrade --allow-empty-checksums -y battle.net
choco upgrade -y firefox thunderbird pycharm rubymine intellijidea-ultimate whatsapp docker-desktop dropbox battle.net hyper vim steam git git-lfs firacode-ttf itunes goggalaxy slack vcxsrv nodejs.install visualstudio2017buildtools
choco upgrade -y etcher autohotkey icloud virtualbox winrar virtualbox.extensionpack hwmonitor intelpowergadget adobereader cpu-z jdk8 rocketchat hwinfo intellijidea-ultimate
choco upgrade -y vlc cmake openssl vscode libreoffice-fresh postman discord octave pyenv-win vagrant nextcloud-client lein razer-synapse-3 forticlientvpn wsl-ubuntu-2204 powertoys
choco install -y mysql --version=5.7.18
choco install -y anaconda3 --params '"/JustMe /AddToPath"'

irm get.scoop.sh | iex

scoop install neovim

Install-PackageProvider -Name NuGet -Confirm:$False
Install-Module -Name 'posh-git' -Scope 'CurrentUser' -Confirm:$False -Force
del $PROFILE
New-Item -Type File -Path $PROFILE -Force
Add-Content -Path $PROFILE -value "Import-Module 'posh-git'"

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

if(!(Test-Path ~/tridactyl.xpi)) {
  Invoke-WebRequest -Uri https://tridactyl.cmcaine.co.uk/betas/tridactyl-latest.xpi -OutFile ~/tridactyl.xpi -UseBasicParsing
  Start-Process firefox ~/tridactyl.xpi
}

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

Read-Host 'Press Enter to continue�' | Out-Null


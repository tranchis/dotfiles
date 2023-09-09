iwr -useb get.scoop.sh -outfile scoop.ps1
.\scoop.ps1
del scoop.ps1

scoop bucket add extras
scoop update
scoop install neovim cwrsync
winget install JanDeDobbeleer.OhMyPosh -s winget

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Install-PackageProvider -Name NuGet -Confirm:$False
Install-Module -Name 'posh-git' -Scope 'CurrentUser' -Confirm:$False -Force
del $PROFILE
New-Item -Type File -Path $PROFILE -Force
Add-Content -Path $PROFILE -value "Import-Module 'posh-git'"
Add-Content -Path $PROFILE -value "oh-my-posh init pwsh | Invoke-Expression"
Add-Content -Path $PROFILE -value "Import-Module PSReadLine"
Add-Content -Path $PROFILE -value "Set-PSReadLineOption -PredictionSource History"
Add-Content -Path $PROFILE -value "Set-PSReadLineOption -PredictionViewStyle ListView"
Add-Content -Path $PROFILE -value "Set-PSReadLineOption -EditMode Windows"
Get-PoshThemes
oh-my-posh font install FiraCode
Install-Module PowershellGet -Force
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

choco upgrade -y firefox thunderbird pycharm rubymine intellijidea-ultimate whatsapp docker-desktop dropbox hyper vim steam git git-lfs firacode-ttf itunes goggalaxy slack vcxsrv nodejs.install visualstudio2017buildtools
choco upgrade -y etcher icloud virtualbox winrar virtualbox.extensionpack hwmonitor intelpowergadget adobereader cpu-z jdk8 rocketchat hwinfo intellijidea-ultimate
choco upgrade -y vlc cmake openssl vscode libreoffice-fresh postman discord octave pyenv-win vagrant nextcloud-client lein razer-synapse-3 forticlientvpn wsl-ubuntu-2204 powertoys
choco install -y mysql --version=5.7.18
choco install -y anaconda3 --params '"/JustMe /AddToPath"'

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

if(!(Test-Path ~/tridactyl.xpi)) {
  Invoke-WebRequest -Uri https://tridactyl.cmcaine.co.uk/betas/tridactyl-latest.xpi -OutFile ~/tridactyl.xpi -UseBasicParsing
  Start-Process firefox ~/tridactyl.xpi
}

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

Read-Host 'Press Enter to continue�' | Out-Null


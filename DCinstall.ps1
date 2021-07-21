#!powershell

### helper functions =================================================================================================================

function Get-Loc($name){
    $pth = Get-content C:\temp\onlyfans\$name.txt
    cd $pth
    return $pth
}

function Store-Location($name){
    Get-Location| select path -ExpandProperty path| select path -ExpandProperty path | out-file C:\temp\onlyfans\$name.txt
}

function Test-Location($name){
    return Test-Path -Path C:\temp\onlyfans\$name.txt
}

function Install-Onlyfans{
    # clone digitalcriminal's scraper
    git clone https://github.com/DIGITALCRIMINAL/OnlyFans
    cd OnlyFans
    # # install pip packages
    pip install --user -r ./requirements.txt
    # # inital run script
    ./start_ofd.py
}

function Install-Packages {
    # install chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    # Clean up windows dumb shit that gets in the way
    Remove-Item $env:USERPROFILE\AppData\Local\Microsoft\WindowsApps\python*.exe
    refreshenv
    # install needed stuff
    choco install git python -y
}

### script ===========================================================================================================================

## initialization

if (!(Test-Path -Path C:\temp\onlyfans)){
    New-Item -Path C:\temp\onlyfans -ItemType directory
}

if (!(Test-Location("newenv"))){
    ## Are we admin?
    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
        {
        # Who are we?
        write-host "We are not admin. Elevating..."
        start-sleep -s 2
        Store-Location("cdir")
        Start-Process powershell.exe "-noexit -File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs -Wait
        if (Test-Location("pid")){
            remove-item -path C:\temp\onlyfans -Recurse
            stop-process -Id $PID
            }
        Start-Process powershell.exe "-noexit -File",('"{0}"' -f $MyInvocation.MyCommand.Path)
        stop-process -Id $PID
        }

    $pth = Get-loc("cdir")
    $rep = read-host "`n Everything will go in this folder:`n $pth\OnlyFans`n If you don't want to have anything go in this folder say 'n' if you're ok with this say 'y'.`n You will be able to change where all the content goes, this will only store the script requirements.`n Run from here (y/n)?"
    switch ( $rep )
    {
        "y" { Install-Packages
            # need to start a new powershell environment
            Store-Location("newenv")
            stop-process -Id $PID
            }
    default { write-host "Exiting..."
            $PID| out-file C:\temp\onlyfans\pid.txt
            stop-process -Id $PID
            }
    }
}
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
Install-OnlyFans
remove-item -path C:\temp\onlyfans -Recurse
stop-process -Id $PID
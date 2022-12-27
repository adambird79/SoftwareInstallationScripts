$installed = Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExampleSoftware' -ErrorAction SilentlyContinue

if ($installed -eq $null) {
    # Software is not installed, so install it
    Start-Process -FilePath 'msiexec.exe' -ArgumentList '/i C:\path\to\installer.msi' -Wait
}
else {
    # Software is already installed, so do nothing
}

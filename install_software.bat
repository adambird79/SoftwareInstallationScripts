reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExampleSoftware" /v DisplayName

if %errorlevel% == 1 (
    echo Software is not installed, installing now
    msiexec.exe /i "C:\path\to\installer.msi"
) else (
    echo Software is already installed, skipping installation
)

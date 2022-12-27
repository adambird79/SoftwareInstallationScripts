Dim objRegistry
Set objRegistry = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\default:StdRegProv")

Dim strKeyPath
strKeyPath = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ExampleSoftware"

Dim lngResult
objRegistry.GetStringValue HKEY_LOCAL_MACHINE, strKeyPath, "DisplayName", lngResult

If lngResult = "" Then
    ' Software is not installed, so install it
    Dim objShell
    Set objShell = CreateObject("WScript.Shell")

    objShell.Run "msiexec.exe /i C:\path\to\installer.msi", 0, True
Else
    ' Software is already installed, so do nothing
End If

@Echo OFF
set /a _Debug=0
::==========================================
:: Get Administrator Rights
set _Args=%*
if "%~1" NEQ "" (
  set _Args=%_Args:"=%
)
fltmc 1>nul 2>nul || (
  cd /d "%~dp0"
  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~dpnx0"" ""%_Args%""", "", "runas", 1 > "%temp%\GetAdmin.vbs"
  "%temp%\GetAdmin.vbs"
  del /f /q "%temp%\GetAdmin.vbs" 1>nul 2>nul
  exit
)
::==========================================
CLS
@Echo OFF
@Color 0b

if exist "%PROGRAMW6432%" (
REG Add "HKLM\SOFTWARE\WOW6432Node\Adobe\Adobe Acrobat\DC\Activation" /v "IsAMTEnforced" /t REG_DWORD /d "1" /F
) else (
REG Add "HKLM\SOFTWARE\Adobe\Adobe Acrobat\DC\Activation" /v "IsAMTEnforced" /t REG_DWORD /d "1" /F
)

@Exit


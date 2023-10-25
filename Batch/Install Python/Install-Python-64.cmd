@ECHO OFF

REM Downloads and installs Python. Modify PYTHON_VERSION, ARCH and install parameters to fit your needs.

SET PYTHON_VERSION=3.12.0
SET ARCH=amd64

REM Here is the install parameters. If %ALL_USERS% is set to 1, the script asks for admin privileges.

SET ALL_USERS=1
SET COMPILE_STD_LIB=1
SET ADD_TO_PATH=1

CD "%~dp0"

IF NOT EXIST %TEMP%\python-%PYTHON_VERSION%-%ARCH%.exe (
  ECHO Installer not found for version %PYTHON_VERSION%. Donwloading from python.org...

  powershell.exe -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-%ARCH%.exe' -OutFile '%TEMP%\python-%PYTHON_VERSION%-%ARCH%.exe'"
  TIMEOUT 1 /NOBREAK
)

ECHO Installing Python %PYTHON_VERSION%...
IF %ALL_USERS% EQU 1 (
  cscript.exe admin.js %TEMP%\python-%PYTHON_VERSION%-%ARCH%.exe /passive InstallAllUsers=%ALL_USERS% InstallLauncherAllUsers=%ALL_USERS% CompileAll=%COMPILE_STD_LIB% PrependPath=%ADD_TO_PATH%
) ELSE (
  %TEMP%\python-%PYTHON_VERSION%-%ARCH%.exe /passive InstallAllUsers=%ALL_USERS% InstallLauncherAllUsers=%ALL_USERS% CompileAll=%COMPILE_STD_LIB% PrependPath=%ADD_TO_PATH%
)


@ECHO OFF

REM Downloads and installs Python. Modify PYTHON_VERSION, ARCH and install parameters to fit your needs.

SET PYTHON_VERSION=3.9.6
SET ARCH=amd64

CD "%~dp0"

IF NOT EXIST python-%PYTHON_VERSION%-amd64.exe (
  ECHO Installer not found for version %PYTHON_VERSION%. Donwloading from python.org...

  powershell.exe -NoProfile -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-%ARCH%.exe' -OutFile 'python-%PYTHON_VERSION%-%ARCH%.exe'"
  TIMEOUT 1 /NOBREAK
)

ECHO Installing Python %PYTHON_VERSION%...
python-%PYTHON_VERSION%-%ARCH%.exe /passive InstallAllUsers=1 CompileAll=1 PrependPath=1 

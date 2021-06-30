@ECHO OFF
SET PYTHON_VERSION=3.9.6

CD "%~dp0"

IF NOT EXIST python-%PYTHON_VERSION%-amd64.exe (
  ECHO Installer not found for version %PYTHON_VERSION%. Donwloading from python.org...

  powershell.exe -NoProfile -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-amd64.exe' -OutFile 'python-%PYTHON_VERSION%-amd64.exe'"
  TIMEOUT 1 /NOBREAK
)

ECHO Installing Python %PYTHON_VERSION%...
python-%PYTHON_VERSION%-amd64.exe /passive InstallAllUsers=1 CompileAll=1 PrependPath=1 

<#
    Updates Install-Python-64.cmd, to download the latest version for Windows
#>

$ScriptFile = "$PSScriptRoot\Install-Python-64.cmd"

$Html = (Invoke-WebRequest "https://www.python.org/downloads/windows/" -ErrorAction Ignore).Content

if ($null -ne $Html) {

    $Match = [Regex]::Match($Html, "Latest Python 3 Release - Python (\d{1}\.\d{1}\.\d{1})")

    if ($Match.Groups[1].Success) {
    
        $ScriptContent = Get-Content $ScriptFile -Raw

        [Regex]::Replace($ScriptContent, "SET PYTHON_VERSION=\d{1}\.\d{1}\.\d{1}", "SET PYTHON_VERSION=" + $Match.Groups[1].Value) | Out-File $ScriptFile -Force

    }

} else {
    
    Write-Error "Error getting latest version number"

}

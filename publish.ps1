$publishModuleSplat = @{
    Path        = ".\ReleaseMe\GG"
    NuGetApiKey = $ENV:nugetapikey
    Verbose     = $true
    Force       = $true
    Repository  = "PSGallery"
    ErrorAction = 'Stop'
}

$scriptAnalyzerWarning = @"
Module needs to be cleaned before it can be pushed... 
Please run: Invoke-ScriptAnalyzer .\ReleaseMe\GG' -Recurse -Severity Warning
"@

"Powershell Version -- (needs to be v6?)"
$PSVersionTable

"Files in module output:"
Get-ChildItem ".\ReleaseMe\GG" -Recurse -File |
    Select-Object -Expand FullName

"Importing Module"
Import-Module $publishModuleSplat.Path

"Installing PSScriptAnalyzer Module"
Install-Module -Name PSScriptAnalyzer -Force

Invoke-ScriptAnalyzer ".\ReleaseMe\GG" -Recurse | ForEach-Object { 
    if ($_.Severity -eq "Warning") {
        "Error: Could not push"
        $_
        Throw $scriptAnalyzerWarning
    }
}

Publish-Module @publishModuleSplat
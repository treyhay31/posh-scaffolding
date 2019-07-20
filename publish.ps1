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

"splat path? - $($publishModuleSplat.Path)"

"Importing Module"
Import-Module ".\ReleaseMe\GG"

"Checking if the module already exists"
try {
    Find-Module -Repository PSGallery -Name GG2
}
catch {
    " The module does not exist!"    
}

"Installing PSScriptAnalyzer Module"
Install-Module -Name PSScriptAnalyzer -Force

"Checking for severe problems with the scripts"
Invoke-ScriptAnalyzer ".\ReleaseMe\GG" -Recurse | ForEach-Object { 
    if ($_.Severity -eq "Warning") {
        "Error: Could not push"
        $_
        Throw $scriptAnalyzerWarning
    }
}

Publish-Module @publishModuleSplat
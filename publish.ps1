$publishModuleSplat = @{
    Path        = ".\ReleaseMe\GG"
    NuGetApiKey = $ENV:nugetapikey
    Verbose     = $true
    Force       = $true
    Repository  = "PSGallery"
    ErrorAction = 'Stop'
}

"Powershell Version -- (needs to be v6?)"
$PSVersionTable

"Files in module output:"
Get-ChildItem ".\ReleaseMe\GG" -Recurse -File |
    Select-Object -Expand FullName

Publish-Module @publishModuleSplat
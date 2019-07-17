$publishModuleSplat = @{
    Name        = "GG"
    Path        = ".\ReleaseMe\GG"
    NuGetApiKey = $ENV:nugetapikey
    Verbose     = $true
    Force       = $true
    Repository  = "PSGallery"
    ErrorAction = 'Stop'
}

"Files in module output:"
Get-ChildItem ".\ReleaseMe\GG" -Recurse -File |
    Select-Object -Expand FullName

Publish-Module @publishModuleSplat
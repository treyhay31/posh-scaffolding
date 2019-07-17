function Get-ModulePath {
  (((Get-ChildItem ($env:PSModulePath -Split ";")[0])[0].Parent).Parent).FullName
}

$modulePathForUser = Get-ModulePath

mkdir @( 
  "$modulePathForUser\MetaModule",
  "$modulePathForUser\MetaFunction") -ErrorAction SilentlyContinue

$myMan = @{
  Path            = "$modulePathForUser\plasterManifest.xml" 
  TemplateName    = "MyMan" 
  TemplateType    = "Item" 
  Id              = (New-Guid).Guid 
  TemplateVersion = "0.0.1" 
  Title           = "TheFunOne" 
  Description     = "So fun" 
  Author          = "Me"
}

$myMan

New-PlasterManifest @myMan 

function New-Moddd {
  param(
    [Parameter(Mandatory=$true)]
    [string]$moduleName,
    [string]$moduleDesc="Great module...",
    [string]$version="0.0.1",
    [string]$author="Me"
  )
  $modulePathForUser = Get-ModulePath

  "METAAA: $PSScriptroot\MetaModule" 
  "modulePathForUser: $modulePathForUser"
  "moduleName: $moduleName"
  "moduleDesc: $moduleDesc"
  "version: $version"
  "author: $author"

  Invoke-Plaster -TemplatePath "$PSScriptRoot\MetaModule" `
    -DestinationPath "$modulePathForUser\$moduleName" `
    -ModuleName $moduleName `
    -ModuleDesc $moduleDesc `
    -ModuleVersion $version `
    -ModuleAuthor $author `
    -Force
}

New-Moddd "GG"

#Invoke-Pester "$modulePathForUser\GG"

function New-Funccc {
  param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern("[a-zA-Z]{3,}-[a-zA-Z]{3,}")] #function name must be abc-xyz
    [string]$functionName,
    [string]$path=""
  )
  $modulePathForUser = Get-ModulePath
  Invoke-Plaster -TemplatePath "$PSScriptRoot\MetaFunction" `
    -DestinationPath $modulePathForUser `
    -FunctionName $functionName `
    -FunctionLocation $modulePathForUser `
    -Force
}

New-Funccc "Say-NotSomething"

function New-FuncInMod {
  param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern("[a-zA-Z]{3,}-[a-zA-Z]{3,}")] #function name must be abc-xyz
    [string]$functionName,
    [Parameter(Mandatory=$true)]
    [string]$moduleName,
    [ValidateSet("Public", "Internal")]
    [string]$functionType="Public"
  )
  $modulePathForUser = Get-ModulePath
  $functionPath = "$modulePathForUser"

  if ($moduleName) {
    $functionPath = "$modulePathForUser\$moduleName\$functionType"
  } 

  Invoke-Plaster -TemplatePath "$PSScriptRoot\MetaFunction" `
    -DestinationPath $functionPath `
    -FunctionName $functionName `
    -FunctionLocation $functionPath `
    -Force
}

New-FuncInMod "Run-Something" "GG" "Internal"
$modulePathForUser = $PSHome

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

  Invoke-Plaster -TemplatePath "$modulePathForUser\MetaModule" `
    -DestinationPath "$modulePathForUser\$moduleName" `
    -ModuleName $moduleName `
    -ModuleDesc $moduleDesc `
    -ModuleVersion $version `
    -ModuleAuthor $author `
    -Force
}

#New-Moddd "GG"

#Invoke-Pester "$modulePathForUser\GG"

function New-Funccc {
  param(
    [Parameter(Mandatory=$true)]
    [ValidatePattern("[a-zA-Z]{3,}-[a-zA-Z]{3,}")] #function name must be abc-xyz
    [string]$functionName,
    [string]$path=""
  )

  Invoke-Plaster -TemplatePath "$modulePathForUser\MetaFunction" `
    -DestinationPath $modulePathForUser `
    -FunctionName $functionName `
    -FunctionLocation $modulePathForUser `
    -Force
}

#New-Funccc "Say-NotSomething"

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

  $functionPath = "$modulePathForUser"

  if ($moduleName) {
    $functionPath = "$modulePathForUser\$moduleName\$functionType"
  } 

  Invoke-Plaster -TemplatePath "$modulePathForUser\MetaFunction" `
    -DestinationPath $functionPath `
    -FunctionName $functionName `
    -FunctionLocation $functionPath `
    -Force
}

#New-FuncInMod "Run-Something" "GG" "Internal"